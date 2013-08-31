module BritLit.ElizabethanSensibility where

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
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/Shakespeare%27s_comedies_in_the_context_of_the_late_Reniassance_(the_Elizabethan_period)_and_from_the_point_of_view_of_modern_sensibility"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
