module BritLit.FictionAndPoetry30s where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Brave New World?(No spaces or capitals)"
  ,a=ls "aldoushuxley"}
 ,{q="Who wrote Goodbye to Berlin?(No spaces or capitals)"
  ,a=ls "christopherisherwood"}
 ,{q="Who wrote Down and Out in Paris and London?(No spaces or capitals)"
  ,a=ls "georgeorwell"}
 ,{q="Who wrote Musée des Beaux Arts?(No spaces or capitals)"
  ,a=ls "wystanhughauden"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/Discuss_the_20th_century_British_writers_who_fucus_on_moral_concers(Joseph_Conrad,_Graham_Greene,_William_Golding,_Anthony_Burgess,_Iris_Murdoch)"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
