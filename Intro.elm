import Window
import Time
import Graphics.Input as Input
import Keyboard
import Char

eek = text $ bold $ toText "eek!"

textHeight = heightOf eek
veekHeight = round $ (toFloat textHeight)*1.5
veekWidth = textHeight

veekVertexes f =
 (if | f == 0    -> [] 
     | f == 1    -> [(0-(veekWidth `div` 4),0-(veekHeight `div` 2))]
     | otherwise -> [(0-(veekWidth `div` 4),0-(veekHeight `div` 2))
                    ]) -- ,(0,0-(textHeight `div` 2))])
 ++[(0-(veekWidth `div` 2),0-(textHeight `div` 2))
 ,(0,textHeight `div` 2)
 ,((veekWidth `div` 2),0-(textHeight `div` 2))]++
 (if | f == 0    -> []
     | f == 1    -> [(veekWidth `div` 4,0-(veekHeight `div` 2))]
     | otherwise -> [(veekWidth `div` 4,0-(veekHeight `div` 2))
                    ,(0,0-(textHeight `div` 3))])
 

veekOutline f = path (veekVertexes f)

veekV f =
 if | f < 3 -> traced (solid black) (veekOutline f)
    | otherwise -> filled red $ polygon (veekVertexes f)

v f = collage veekWidth veekHeight [veekV f]

veek f = flow right [v f,eek]
vs = plainText "vs"
exams = plainText "the Comprehensive Exams"
dots = foldp (\_ v -> not v) True (every $ 1 * second)
codePromptText = foldp (\v _-> if v then "Enter level code" else "Enter level code...") "Enter level code" dots
heads l = case l of
           [] -> []
           list -> reverse $ tail $ reverse list
concatPresses keycode inputed =
 let letter = Char.fromCode keycode in
 if | keycode == 8 -> heads inputed -- backspace
    | Char.isLower letter -> inputed ++ [letter]
    | otherwise -> inputed

inputedCode = foldp concatPresses "" Keyboard.lastPressed
codeField = lift2 drawCode inputedCode codePromptText
drawCode inputedCode text = if inputedCode == "" then plainText text else plainText $ map (\_->'*') inputedCode
firstLevel = plainText "Hint... His first name is Peter and he likes to do phonetics."

sumHeights elems = case elems of
                     (e::es) -> heightOf e + sumHeights es
                     [] -> 0

animateIntro code (w,h) f 
 = collage (w-1) (h-1) $ [moveY (toFloat $ sumHeights [vs,exams]) $ toForm $ veek f] ++
 ( if | f <  4 -> []
      | f >= 4 -> [moveY (toFloat $ sumHeights [exams]) $ toForm $ vs]) ++
 ( if | f <  5 -> []
      | f >= 5 -> [toForm $ exams]) ++
 ( if | f <  8 -> []
      | f >= 8 -> [moveY (0-(toFloat $ sumHeights [exams])) $ toForm $ code]) ++
 ( if | f <  10-> []
      | f >= 10-> [moveY (0-(toFloat $ sumHeights [exams, code])) $ toForm $ firstLevel])

frame = foldp (\_ f->f+1) 0 (every (0.7 * second))

main = lift3 animateIntro codeField Window.dimensions frame
