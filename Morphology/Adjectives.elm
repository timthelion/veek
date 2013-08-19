module Morphology.Adjectives where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the type of intensifying adjective(ideal): She was an ideal wife. "
  ,a=ls "emphasizer"}
 ,{q="Determine the type of intensifying adjective(perfect): It was a perfect storm."
  ,a=ls "amplifier"}
 ,{q="Determine the type of intensifying adjective(weak): It was a weak response."
  ,a=ls "downtoner"}
 ,{q="The adjective \"green\" in the sentence \"The grass was green.\" is ____ whereas \"cheerful\" in \"Shut up and be cheerful!\" is dynamic."
  ,a=ls "stative"}
 ,{q="The adjective \"fluffy\" in the sentence \"The mold is fluffy.\" is stative whereas \"mournful\" in \"Stop being so mournful all the time.\" is ________."
  ,a=ls "dynamic"}
 ,{q="The adjective \"fat\" is gradable whereas the adjective \"germanic\" in \"germanic languages\" is __________"
  ,a=ls "non-gradable"}
 ,{q="The adjective \"skinny\" is ______ whereas the adjective \"Latin\" in \"Latin text\" is non-gradable"
  ,a=ls "gradable"}
 ,{q="The adjective \"electric\" as in \"electric lamp\" is _______ whereas the same adjective in \"electric smile\" is noninherent."
  ,a=ls "inherent"}
 ,{q="The adjective \"philosophic\" as in \"philosophic text\" is inherent whereas the same adjective in \"philosophic grin\" is _________."
  ,a=ls "noninherent"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "AdverbsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
