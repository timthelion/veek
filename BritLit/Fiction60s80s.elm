module BritLit.Fiction60s80s where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote The French Lieutenant's Woman?(No spaces or capitals)"
  ,a=ls "johnfowels"}
 ,{q="Who wrote The Remains of the Day?(No spaces or capitals)"
  ,a=ls "kazuoishiguro"}
 ,{q="Who wrote The Comfort of Strangers?(No spaces or capitals)"
  ,a=ls "ianmcewan"}
 ,{q="Who wrote Satanic Verses?(No spaces or capitals)"
  ,a=ls "salmanrushdie"}
 ,{q="Who wrote A Clockwork Orange?(No spaces or capitals)"
  ,a=ls "anthonyburgess"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/Major_tendencies_in_British_fiction_from_the_1990s_to_the_present"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
