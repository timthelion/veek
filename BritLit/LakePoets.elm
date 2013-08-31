module BritLit.LakePoets where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/The_varied_conceptions_of_Romanticism_in_Byron,_Shelley_and_Keats"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
