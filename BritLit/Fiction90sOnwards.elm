module BritLit.Fiction90sOnwards where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Atonement?(No spaces or capitals)"
  ,a=ls "ianmcewin"}
 ,{q="Who wrote Written on the Body?(No spaces or capitals)"
  ,a=ls "jeanettewinterson"}
 ,{q="Who wrote England,England?(No spaces or capitals)"
  ,a=ls "julianbarnes"}
 ,{q="Who wrote White Teeth?(No spaces or capitals)"
  ,a=ls "zadiesmith"}
 ,{q="Who wrote Bridget Jones's Diary?(No spaces or capitals)"
  ,a=ls "helenfielding"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/Multicultural_literature_in_contemporary_Britain"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
