module BritLit.ElizabethanAndMetaphysicalPoetry where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="John Donne was a ____ poet."
  ,a=ls "metaphysical"}
 ,{q="Who wrote Astrophil and Stella?(No spaces or capitals)"
  ,a=ls "sirphilipsidney"}
 ,{q="Who wrote Ocean`s Love to Cynthia?(No spaces or capitals)"
  ,a=ls "sirwalterralegh"}
 ,{q="Who wrote Amoretti?(No spaces or capitals)"
  ,a=ls "edmundspenser"}
 ,{q="Who wrote The Flea?(No spaces or capitals)"
  ,a=ls "johndonne"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/Paradise_Lost_as_the_major_poetic_work_of_the_17th_century"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
