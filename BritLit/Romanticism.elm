module BritLit.Romanticism where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Auld Lang Syne?(No spaces or capitals)"
  ,a=ls "robertburns"}
 ,{q="Who wrote songs of Innocence?(No spaces or capitals)"
  ,a=ls "williamblake"}
 ,{q="Who wrote I wandered lonely as a cloud?(No spaces or capitals)"
  ,a=ls "williamwordsworth"}
 ,{q="Who wrote Kubla Khan?(No spaces or capitals)"
  ,a=ls "samueltaylorcoleridge"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/The_different_contributions_of_the_Lake_Poets_to_Romanticism"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
