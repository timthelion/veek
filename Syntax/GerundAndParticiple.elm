module Syntax.GerundAndParticiple where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="What is going on here: There was much rejoicing.(existential there + _____ subject)"
  ,a=ls "notional"}
 ,{q="What is going on here: It is hard getting up so early. (Anticipatory it + _____ of the subject)"
  ,a=ls "extraposition"}
 ,{q="What is going on here: I find it hard getting up so early. (_______ it + extraposition of the object)"
  ,a=ls "anticipatory"}
 ,{q="What is going on here: Having eaten all the cake, he moved on to the cookies."
  ,a=ls "transgressive"}
 ,{q="What is going on here: Broadly speaking, all cats are fluffy.(transgressive with ____ agent)"
  ,a=ls "general"}
 ,{q="What is going on here: Having worked all night, the meeting was a jumble of coffee eyes and snoring managers. (_____ participle)"
  ,a=ls "dangling"}
 ,{q="What is going on here: Fred ate like a maniac, the twisty rolls disappearing like dissidents.(____ participle)"
  ,a=ls "absolute"}
 ,{q="What is going on here: Fred eating all the cake in one sitting was a horrifying sight.(_____ participle)"
  ,a=ls "fused"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "NominalContentClausesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
