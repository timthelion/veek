{-
GPL 3.0 - Timothy Hobbs <timothyhobbs@seznam.cz>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, version 3 of the License.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

Notes about elm:

I wrote this program using the elm-0.8 compiler.

Elm, at this point, demonstrates a great deal of imaturity.  Imaturity of both its code base and it's author.  The type checker is practically non-functional, the need to order values by their use leads this file to be very messy.  Some of the problems with the elm compiler, the extremely slow compile time(at this point, the compiler is so slow, that in chromium, the page times out, leading one to prefer to compile from the command line rather than through the web server.), the value ordering ect, will clearly be improved.  The fact that far too many errors are reported at runtime by java script sugests an imaturity of the author which cannot be excused by the youth of the code.   ctrl-shift-j becomes one's most used hotkey(at least in firefox) as it is used for displaying error messages when you compile and end up with a blank screen.  I often found myself stepping through the runtime with chromiums debugger, something I never thought I'd do with a declarative language.

Other bugs I found were that creating a collage the size of the screen often causes firefox to go into an infinite loop of creating and destroying scroll bars, so in this program we create our collage 1 pixel smaller than it should be.

Evan's work is highly pragmatic, and he understands that technical language is mostly a tool for comunicating and not a tool for demonstrating how smart you are.  His thesis is one of the most understandable works on FRP I have ever read.

The actor network model of FRP, with the "no change" messages is usefull only for small networks for two reasons:

All nodes are kept in memory at all times, waiting to hear a message, and they are constantly sent no change signals, thus making it so that networks have a small performance drag increasing linearly with size, no mater the triviality of the signal change.  This is really of no consiquence, the choice of EMCAscript as the backend takes care of any performance concerns for us.

The seccond problem, is noted in Evan's thesis, and we have to accept this as a choice.  There are no first class signals, nor is there a way to create a "duplicatable subnetwork".  In our particles signal, we would really like to make this Signal a list of Signals.  This is implicitly impossible.

-}
import Window
import Keyboard

framerate = 10

speed = 7

numRays = 30

alphabet = "abcd"

-- hop is the coefficient used to determin the length of each hop while tracing a ray outwards.
hop=2

-- returns True if the point is inside the cavern
inCavern point =
 let
  near (cy,clearance) = point.y > cy-clearance && point.y < cy+ clearance
  addClearance cy = (cy,abs $ (50*(tan (point.x / 200)))+20)
  curvesY =
   [4*cos (point.x / 50)-5*cos (point.x/30.7)
   ,0
   ,point.x^2- 302*(tan (point.x / 100))] 
 in
 any near $ map addClearance $ curvesY

-- list of angles at which rays are tested.
slices =
 let
  slices' n = ((2*pi*(numRays-n))/numRays) :: cont n
  cont n = if n <= 0 then [] else slices' (n-1)
 in
 slices' numRays

distance p1 p2 = sqrt $ ((p1.x-p2.x)^2) + ((p1.y-p2.y)^2)

-- traceRaysFrom : {x : number, y : number} -> ({x:number,y:number}->Bool)  -> number -> [[(number,number)]]
traceRaysFrom start collisionTest lineOfSight =
 let
  lineOfSightTest point = (distance point start) > lineOfSight
  makeRay angle =
   let
    rise = (sin angle)
    run = (cos angle)
   in
   {x=start.x,y=start.y,rise=rise,run=run}
  rays = map makeRay slices
  hits = map (traceRay start collisionTest lineOfSightTest) rays
  unJust (Just v) = v
  unJustifyList l =  map unJust l
  groupsOfJust list = filter (\l->l /= []) $ split [Nothing] list
  groupByJust list = map unJustifyList $ groupsOfJust list
 in
 groupByJust hits

-- traceRay : ({x:number,y:number} -> Bool) -> ({x:number,y:number}->Bool)-> {rise : number, run : number, x : number, y:number }-> Maybe (number,number)
traceRay center collisionTest lineOfSightTest ray =
 let
  nextPoint = {ray| x    <- ray.x+ray.run*hop
                   ,y    <- ray.y+ray.rise*hop}
                   --,rise <- ray.rise
                   --,run  <- ray.run}
 in
 if lineOfSightTest nextPoint
 then Nothing
 else (if collisionTest nextPoint
        then Just (nextPoint.x-center.x,0-(nextPoint.y-center.y))
        else traceRay center collisionTest lineOfSightTest nextPoint )

cavernWalls veekV lineOfSight = traceRaysFrom {x=veekV.xp,y=veekV.yp} (not . inCavern) lineOfSight


drawCavernWalls cavernWallsV = map (\points-> traced (solid black) $ path points) cavernWallsV 

-- Helper to come up with a vector of length one describing the direction which veek should move. Not to be confused with veekDirection(the way veek is facing.
getDirection arrs =
 let coeff d = if | abs d == 1 -> 1/(sqrt 2)
                  | otherwise  -> 1 in
 {x= round $ (toFloat arrs.x)*speed*(coeff (toFloat arrs.y))
 ,y= round $ (toFloat arrs.y)*speed*(coeff (toFloat arrs.x))}

veekSpeed = lift getDirection Keyboard.arrows

defaultPos = {x=0,y=0}

frames = fps framerate

speedingEveryFrame = lift2 (\a _ -> a) veekSpeed frames

updatePos speed oldPos =
 let
  newPos = {x=oldPos.x+speed.x,y=oldPos.y+speed.y}
  checkPoint1 = {x=newPos.x+10,y=newPos.y+10} -- some rather arbitrarilly sized bounding box
  checkPoint2 = {x=newPos.x-10,y=newPos.y-10}
  checkPoint3 = {x=newPos.x+10,y=newPos.y-10}
  checkPoint4 = {x=newPos.x-10,y=newPos.y+10}
 in
 if inCavern checkPoint1 && inCavern checkPoint2 && inCavern checkPoint3 && inCavern checkPoint4 -- I'd like to listen to veek's direction, and use the 3 points of veek to determine if he's hit a wall. Too lazy to figure this out right now. 
 then newPos
 else oldPos

veekPos = foldp updatePos defaultPos speedingEveryFrame

maintainDirection dir oldDir =
 if | dir == {x=0,y=0} -> oldDir
    | otherwise -> dir

veekDirection = foldp maintainDirection {x=0,y=1} Keyboard.arrows

combineVeekDims {x,y} speed direction =
 {xp = x
 ,yp = y
 ,xv=speed.x
 ,yv=speed.y
 ,yd=direction.y
 ,xd=direction.x}

veek = lift3 combineVeekDims veekPos veekSpeed veekDirection

veekOutline = path
 [(0-10,0-10)
 ,(0,20)
 ,(10,0-10)]

veekAngle veekV =
 if | veekV.xd ==  1  && veekV.yd ==  0  -> (pi*3)/2
    | veekV.xd ==  1  && veekV.yd ==  1  -> (pi*7)/4
    | veekV.xd ==  1  && veekV.yd == 0-1 -> (pi*5)/4
    | veekV.xd ==  0  && veekV.yd ==  1  -> 0 
    | veekV.xd ==  0  && veekV.yd == 0-1 -> pi
    | veekV.xd == 0-1 && veekV.yd ==  0  -> pi/2
    | veekV.xd == 0-1 && veekV.yd ==  1  -> pi/4
    | veekV.xd == 0-1 && veekV.yd == 0-1 -> (pi*3)/4

veekForm veekV
 = rotate (veekAngle veekV)
 $ traced (solid red) veekOutline

background w h = filled black $ rect w h

view lineOfSight =
 filled white $ circle lineOfSight

particles acc cavernWalls =
 let
  newParticle =
   case cavernWalls of
    (((x,y)::_)::_) -> {xp=x,yp=y-10,letter="ce"}
    _ ->  {xp=30,yp=30,letter="a"} -- TODO
  updateParticle particle =
   let
    updatedParticle = {particle|yp<-particle.yp-2}
   in
   if inCavern {x=updatedParticle.xp,y=updatedParticle.yp}
   then Just updatedParticle
   else Nothing
  updateParticles particle (updatedParticles,particleCreated) = 
   let updatedParticleM = updateParticle particle in
   if updatedParticleM == Nothing
   then {xp=30,yp=30,letter="destroyed"} -- (if particleCreated then updatedParticles else (if inCavern {x=newParticle.xp,y=newParticle.yp} then newParticle :: updatedParticles else updatedParticles), True)
   else
    case updatedParticleM of
     Just particle' -> ([particle'],True) -- (particle'::updatedParticles,particleCreated)
 in
 case acc of
  []   -> [newParticle]
  _    -> fst $ foldl updateParticles ([],False) acc
 -- [{xp=30,yp=30,letter="a"}]

drawParticle veekV particle = move (particle.xp-veekV.xp,particle.yp-veekV.yp) $ toForm $ plainText (particle.letter++ show veekV.xp) --veekV.xp should change when veek moves.

drawParticles veekV particlesV =
 case particlesV of
  [] ->  [drawParticle veekV {xp=30,yp=30,letter="No particles"}]
  _ -> map (drawParticle veekV)  particlesV

drawGameView (w,h) veekV lineOfSight cavernWallsV particlesV = collage (w-1) (h-1) $ [background w h,view lineOfSight]++drawCavernWalls cavernWallsV++[veekForm veekV] ++ drawParticles veekV particlesV

drawInfoView veekV =  
  --let
  -- makeElems items = map asText items
  -- addSep elementList = plainText "------" :: elementList
  --in
  flow right $
   [plainText "Veek!"
   ,plainText "("
   ,asText veekV.xp
   ,plainText ","
   ,asText veekV.yp
   ,plainText ")"] -- ++ (concat $ map addSep $ map makeElems $ cavernWalls veekV 400)

infoView = drawInfoView <~ veek

gameViewSize = (\(w,h) ive->(w,h-heightOf ive)) <~ Window.dimensions ~ infoView

lineOfSightS = (\(w,h)->(min w h) `div` 2) <~ gameViewSize

cavernWallsS = cavernWalls <~ veek ~ lineOfSightS

particlesS = foldp particles [] cavernWallsS

gameView = drawGameView <~ gameViewSize ~ veek ~ lineOfSightS ~ cavernWallsS ~ particlesS

main = (\infoV gameV ->flow down [gameV,infoV]) <~ infoView ~ gameView
