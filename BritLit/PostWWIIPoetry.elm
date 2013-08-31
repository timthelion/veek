module BritLit.PostWWIIPoetry where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Church Going?(No spaces or capitals)"
  ,a=ls "philiplarking"}
 ,{q="Philip Larking and Kingsley Amis belonged to The"
  ,a=ls "movement"}
 ,{q="Who wrote Punishment?(No spaces or capitals)"
  ,a=ls "seamusheaney"}
 ,{q="Who wrote Birthday Letters?(No spaces or capitals)"
  ,a=ls "tedhuges"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/British_fiction_from_the_1960s_to_1980s_and_the_philosophical_background_of_postmodernism"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
