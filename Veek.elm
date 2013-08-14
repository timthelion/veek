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

Notes about Veek!

Veek! started out as a project to help me study(distract me from studying) for my comprehensive university exams.  It should, however, demonstrate Elm as a capable programming language and also demonstrate two design choices:

Infinite worlds:
inCavern : {x:Float,y:Float} -> Bool
defines our infinite world.  Veek!'s game engine can be seen as a simple raytracing graphing calculator.  In fact, you can use it as such.  For example, just set inCavern = point.y > cos x and defaultPos = {x=0,y=(cos 0)+15} to explore the cosine curve from above.  In order for the game to work, caverns must have a top and a bottom, and Veek! is rather larger than 2pi, so if you would like to create a cosine shaped level of Veek! you would need something like inCavern = point.y > 30*cos (x/50) && point.y < 30*cos (x/50) + 100

No random:
Particles are created parametrically, based on the location of the walls.  Variation is created by examination of past particles.  There is no random used to generate new particles.

Currently unsolved bugs:
particle stamping, the particles sometimes get stamped onto the screen and move along with Veek.  This seems to be a bug in elm according to the google group.

Veek! can see all particles, even ones that are arround a corner.

Notes about elm:

I wrote this program using the elm-0.8 compiler.

Elm, at this point, demonstrates a great deal of imaturity.  Imaturity of both its code base and it's author.  The type checker is practically non-functional, the need to order values by their use leads this file to be very messy.  Some of the problems with the elm compiler, the extremely slow compile time(at this point, the compiler is so slow, that in chromium, the page times out, leading one to prefer to compile from the command line rather than through the web server.), the value ordering ect, will clearly be improved.  The fact that far too many errors are reported at runtime by java script sugests an imaturity of the author which cannot be excused by the youth of the code.   ctrl-shift-j becomes one's most used hotkey(at least in firefox) as it is used for displaying error messages when you compile and end up with a blank screen.  I often found myself stepping through the runtime with chromiums debugger, something I never thought I'd do with a declarative language.

Other bugs I found were that creating a collage the size of the screen often causes firefox to go into an infinite loop of creating and destroying scroll bars, so in this program we create our collage 1 pixel smaller than it should be.

Evan's work is highly pragmatic, and he understands that technical language is mostly a tool for comunicating and not a tool for demonstrating how smart you are.  His thesis is one of the most understandable works on FRP I have ever read.

The actor network model of FRP, with the "no change" messages is usefull only for small networks for two reasons:

All nodes are kept in memory at all times, waiting to hear a message, and they are constantly sent no change signals, thus making it so that networks have a small performance drag increasing linearly with size, no mater the triviality of the signal change.  This is really of no consiquence, the choice of EMCAscript as the backend takes care of any performance concerns for us.

The seccond problem, is noted in Evan's thesis, and we have to accept this as a choice.  There are no first class signals, nor is there a way to create a "duplicatable subnetwork".  In our particles signal, we would really like to make this Signal a list of Signals.  This is implicitly impossible.

The third problem is the law of mutual dependency, which states that any time two signals rely mutually on eachothers values, they must be combined into one.  This is seen in the cases of cavernWallsAndVeekS, eatenParticlesAttemptsLivesAndTaskS, and particlesWithChangesS.  This is an unavoidable code ick with FRP(when using non-cyclic graphs) and seems to get worse with the complexity of an application.

-}
module Veek where

import Window
import Keyboard
import JavaScript as JS

data ParticleUpdate particle =
    Updated particle
  | Eaten particle
  | Destroyed

letters : String -> [String]
letters = map (\x->x::[])

type Alphabet = [String]

type Task = {q:String,a:Alphabet}

makeAlphabet : [Task] -> Alphabet
makeAlphabet tasks =
 let
  addIfNotDup : String -> [String] -> [String]
  addIfNotDup e acc =
   if any (\e'->e'==e) acc
    then acc
    else e::acc
  removeDups : [String] -> [String]
  removeDups list =
   foldl addIfNotDup [] list
 in
 removeDups <| concat <| map (\task->task.a) tasks

{- alphabet = ["a","b","c","d"]
   tasks = [{q="What are the first three letters of the alphabet?",a=["a","b","c"]}
            ,{q="What is the male parent?",a=["d","a","d"]}]
   nextLevel = "Foo.html"
   home = "Intro.html" -}
veekGame : {alphabet : Alphabet, tasks :[{q:String,a:[String]}],nextLevel:String,home:String} -> (Signal JS.JSString, Signal Element)
veekGame inits =
 let
  alphabet=inits.alphabet
  tasks= inits.tasks
  nextLevel=inits.nextLevel
  home=inits.home
  framerate = 10
  speed = 7
  numRays = 30
  maxParticles = 10
  particleSpeed = 3
  attemptsPerQuestion = 5
  startingLives = 3
  numTasks = length tasks
  -- hop is the coefficient used to determin the length of each hop while tracing a ray outwards.
  hop=2

  -- returns True if the point is inside the cavern
  inCavern point =
   ((((round point.y) `div` 100) `rem` 2)==0)
                       &&
   (cos ((distance {x=0,y=0} point)/110) > 0)
                       ||
   (((((round point.y) `div` 100) `rem` 2)==1)
                       &&
   (cos ((distance {x=0,y=0} point)/110) < 0.5))

  -- list of angles at which rays are tested.
  slices =
   let
    slices' n = ((2*pi*(numRays-n))/numRays) :: cont n
    cont n = if n <= 0 then [] else slices' (n-1)
   in
   slices' numRays

  distance p1 p2 = sqrt <| ((p1.x-p2.x)^2) + ((p1.y-p2.y)^2)

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
    groupsOfJust list = filter (\l->l /= []) <| split [Nothing] list
    groupByJust list = map unJustifyList <| groupsOfJust list
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
          then Just (nextPoint.x,nextPoint.y)
          else traceRay center collisionTest lineOfSightTest nextPoint )

  cavernWalls veekV lineOfSight =
   traceRaysFrom
    {x=veekV.xp,y=veekV.yp}
    (not . inCavern)
    (toFloat lineOfSight)

  drawCavernWalls cavernWallsV veekV =
   let
    toLines points =
     traced (solid black)
      <| path
      <| map
         (\(x,y)->(x-veekV.xp,y-veekV.yp))
         points
   in
   map
    toLines
    cavernWallsV

  -- Helper to come up with a vector of length one describing the direction which veek should move. Not to be confused with veekDirection(the way veek is facing).
  getDirection : {x:Int,y:Int} -> {x:Float,y:Float}
  getDirection arrs =
   let
    coeff : Float -> Float
    coeff d = if | abs d == 1 -> 1/(sqrt 2)
                 | otherwise  -> 1
    x:Float
    x = (toFloat arrs.x)
      * speed
      * (coeff (toFloat arrs.y))
    y:Float
    y = (toFloat arrs.y)
      * speed
      * (coeff (toFloat arrs.x))
   in
   {x=x
   ,y=y}

  paused = (\c->(rem (div c 2) 2)==1) <~ count (dropRepeats Keyboard.space)

  pausable = dropWhen paused

  veekSpeed = getDirection <~ pausable {x=0,y=0} Keyboard.arrows

  defaultPos = {x=0,y=0}

  frames = pausable 0 <| fps framerate

  speedingEveryFrame : Signal {x:Float,y:Float}
  speedingEveryFrame = sampleOn frames veekSpeed

  updatePos speed oldPos =
   let
    newPos = {x=oldPos.x+speed.x,y=oldPos.y+speed.y}
    checkPoint1 = {x=newPos.x+10,y=newPos.y+10} -- some rather arbitrarilly sized bounding box
    checkPoint2 = {x=newPos.x-10,y=newPos.y-10}
    checkPoint3 = {x=newPos.x+10,y=newPos.y-10}
    checkPoint4 = {x=newPos.x-10,y=newPos.y+10}
    veekIsInCavern = -- I'd like to listen to veek's direction, and use the 3 points of veek to determine if he's hit a wall. Too lazy to figure this out right now.
     inCavern checkPoint1
              &&
     inCavern checkPoint2
              &&
     inCavern checkPoint3
              &&
     inCavern checkPoint4
   in
   if veekIsInCavern
   then newPos
   else oldPos

  veekPos : Signal {x:Float,y:Float}
  veekPos = foldp updatePos defaultPos speedingEveryFrame

  maintainDirection dir oldDir =
   if | dir == {x=0,y=0} -> oldDir
      | otherwise -> dir

  veekDirection =
   foldp
    maintainDirection
    {x=0,y=1}
    <| pausable {x=0,y=0} Keyboard.arrows

  combineVeekDims {x,y} speed direction =
   {xp = x
   ,yp = y
   ,xv=speed.x
   ,yv=speed.y
   ,yd=direction.y
   ,xd=direction.x}

  veek = combineVeekDims <~ veekPos ~ veekSpeed ~ veekDirection

  veekOutline = path
   [(0-10,0-10)
   ,(0,20)
   ,(10,0-10)]

  veekAngle veekV =
   if | veekV.xd ==  1  && veekV.yd ==  0  -> pi/2
      | veekV.xd ==  1  && veekV.yd ==  1  -> (pi*3)/4
      | veekV.xd ==  1  && veekV.yd == 0-1 -> pi/4
      | veekV.xd ==  0  && veekV.yd ==  1  -> pi
      | veekV.xd ==  0  && veekV.yd == 0-1 -> 0
      | veekV.xd == 0-1 && veekV.yd ==  0  -> (pi*3)/2
      | veekV.xd == 0-1 && veekV.yd ==  1  -> (pi*5)/4
      | veekV.xd == 0-1 && veekV.yd == 0-1 -> (pi*7)/4

  veekForm veekV
   = rotate (veekAngle veekV)
   <| traced (solid red) veekOutline

  background w h = filled black <| rect w h

  view lineOfSight =
   filled white <| circle <| toFloat lineOfSight

  l !! i = head <| drop i l

  -- YICK !!!!!!!!!!!!!
  particlesWithChanges (cavernWalls,veekV) pwc =
   let
    accParticles = pwc.particles
    numParticles = length accParticles
    newParticlesFromWall (x,y) =
     if inCavern {x=x,y=y-1}
      then
       Just
        {xp     = x
        ,yp     = y-1
        ,letter = alphabet !! ((round x) `mod`  (length alphabet))}
      else Nothing
    newParticle pointsToAvoid = -- {xp=0,yp=0,letter="a"}
      let
       tryParticle particle acc prevDist =
        let
         dist
          = minimum
          <| map
             (distance {x=particle.xp,y=particle.yp})
             <| {x=veekV.xp,y=veekV.yp} :: pointsToAvoid
        in
        if dist > prevDist
         then ([particle],dist)
         else (acc,prevDist)
      in
      fst <| foldr (\p (acc,prevDist)-> 
              case p of
                Just particle -> tryParticle particle acc prevDist
                Nothing -> (acc,prevDist))
       ([],0)
       <| map newParticlesFromWall <| concat <| cavernWalls

    updateParticle particle =
     let
      updatedParticle = {particle|yp<-particle.yp-particleSpeed}
      updatedPoint = {x=updatedParticle.xp,y=updatedParticle.yp}
     in
     if | distance updatedPoint {x=veekV.xp,y=veekV.yp} < 20 -> Eaten particle
        | inCavern updatedPoint -> Updated updatedParticle
        | otherwise -> Destroyed
    updateParticles particle (updatedParticles,particleCreated,particlesEaten) = 
     let
      withNewParticles eaten =
       let
        particleToPoint particle = {x=particle.xp,y=particle.yp}
        newParticleA = newParticle <| map particleToPoint accParticles
        newParticleB = newParticle ((map particleToPoint newParticleA) ++ (map particleToPoint accParticles))
        particleListInCavern pl  = any (\p -> inCavern <| particleToPoint p) pl
       in
       (if particleCreated
        then updatedParticles
        else
         (if particleListInCavern newParticleA
          then
           (if numParticles < maxParticles && particleListInCavern newParticleB
            then (\pl -> newParticleB ++ pl)
            else (\pl -> pl)) (newParticleA ++ updatedParticles)
          else updatedParticles), True, eaten)

     in
     case updateParticle particle of
      Updated particle' -> (particle'::updatedParticles,particleCreated,particlesEaten)
      Eaten etParticle -> withNewParticles <| etParticle :: particlesEaten
      Destroyed -> withNewParticles particlesEaten
    (particles,_,eaten) = foldl updateParticles ([],False,[]) accParticles
   in
   case accParticles of
    []   -> {particles=newParticle [],eaten=[]}
    _    -> {particles=particles,eaten=eaten}

  drawParticle veekV particle = move (particle.xp-veekV.xp,particle.yp-veekV.yp) <| toForm <| plainText particle.letter

  drawParticles veekV particlesV =
   case particlesV of
    [] ->  []
    _ -> (map (drawParticle veekV)  particlesV) -- ++ [toForm <| asText particlesV]

  drawGameView (w,h) veekV lineOfSight cavernWallsV particlesV paused = collage (w-1) (h-1) <| [background (toFloat w) (toFloat h),view lineOfSight]++drawCavernWalls cavernWallsV veekV++[veekForm veekV] ++ drawParticles veekV particlesV

  drawInfoView veekV eatenParticles task taskId attempts lives (w,h) =
    flow down
     [flow right
      [plainText "Veek!"
      ,plainText "("
      ,asText veekV.xp
      ,plainText ","
      ,asText veekV.yp
      ,plainText ")  "]
     ,flow right
      [plainText "Attempts: "
      ,asText attempts
      ,plainText " Lives: "
      ,asText lives]
     ,flow right
      [flow down <|
       (if | taskId > 0 -> (\c->
                         [flow down <| [plainText "Previous question: ",text <| toText (tasks !! (taskId - 1)).q,flow right <| (map plainText (tasks !! (taskId - 1)).a)]] ++ c )
           | otherwise -> id)
     [flow down <| [
      plainText "Current question: "
     ,text <| toText task.q
     ,flow right <| map (\la->if any (\le->le == la) eatenParticles then plainText la else plainText "_ ") task.a ]]]]

  gameViewSize : Signal (Int,Int)
  gameViewSize = (\(w,h)->(w,min (h-{-heightOf infoView-} 250) 350)) <~ Window.dimensions -- I'd like to rely on the hight of info view, but cannot figure out how to do so without creating cyclicity in the graph.

  lineOfSightS : Signal Int
  lineOfSightS = (\(w,h)->(min w h) `div` 2) <~ gameViewSize

  cavernWallsS = cavernWalls <~ veek ~ lineOfSightS

  cavernWallsAndVeekS = (\cavernWalls veekV->(cavernWalls,veekV)) <~ cavernWallsS ~ veek

  particlesWithChangesS = foldp particlesWithChanges {particles=[],eaten=[]} cavernWallsAndVeekS

  particlesS = (\pwc->pwc.particles) <~ particlesWithChangesS

  countAttempts eaten task =
    let
     difference et acc = acc -
             (if any (\la->la==et) task.a
               then 0
               else 1)  -- I hereby declare a new word "parethesary" which means "these parentheses are needed!"
    in
    foldr difference attemptsPerQuestion eaten

  compileEaten newlyEaten eat =
   let
    task = tasks !! eat.taskId
    eaten = eat.eaten++(map (\e->e.letter) newlyEaten.eaten)
    attempts = countAttempts eat.eaten task
   in
   if | all (\l->any (\e->e==l) eaten) task.a -> {eaten=[],taskId=eat.taskId+1,attempts=attemptsPerQuestion,lives=eat.lives}
      | attempts == 0 -> {eaten=[],taskId=eat.taskId+1,attempts=attemptsPerQuestion,lives=eat.lives-1}
      | otherwise -> {eaten=eaten,taskId=eat.taskId,attempts=attempts,lives=eat.lives}

  eatenParticlesAttemptsLivesAndTaskS = foldp compileEaten {eaten=[],taskId=0,attempts=attemptsPerQuestion,lives=startingLives} particlesWithChangesS

  taskIdS = .taskId <~ eatenParticlesAttemptsLivesAndTaskS

  taskS = (\taskId->tasks !! taskId) <~ keepIf (\tid->tid<numTasks) 0 taskIdS

  eatenParticlesS = .eaten <~ eatenParticlesAttemptsLivesAndTaskS

  attemptsS = .attempts <~ eatenParticlesAttemptsLivesAndTaskS

  livesS = .lives <~ eatenParticlesAttemptsLivesAndTaskS

  infoView = drawInfoView <~ veek ~ eatenParticlesS ~ taskS ~ taskIdS ~ attemptsS ~ livesS ~ Window.dimensions

  gameView = drawGameView <~ gameViewSize ~ veek ~ lineOfSightS ~ cavernWallsS ~ particlesS ~ paused

  redirectS = (\l tid ->
   if | l == 0 -> home
      | tid == numTasks -> nextLevel
      | otherwise -> "" ) <~ livesS ~ taskIdS

  redirect = JS.fromString <~ dropIf (\r->r=="") "" redirectS

 in
 (redirect, (\infoV gameV ->flow down [gameV,infoV]) <~ infoView ~ gameView)
