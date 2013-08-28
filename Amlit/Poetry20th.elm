module Amlit.Poetry20th where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote The Waste Land?(No spaces or capitals)"
  ,a=ls "t.s.eliot"}
 ,{q="Who wrote Cantos?(No spaces or capitals)"
  ,a=ls "ezrapound"}
 ,{q="Who wrote Stopping by the Woods on a Snowy Evening?(No spaces or capitals)"
  ,a=ls "robertfrost"}
 ,{q="Who wrote Howl?(No spaces or capitals)"
  ,a=ls "allenginsberg"}
 ,{q="Who wrote A Coney Island of the Mind?(No spaces or capitals)"
  ,a=ls "lawrenceferlinghetti"}
 ,{q="Who wrote Tulips and Chimneys?(No spaces or capitals)"
  ,a=ls "e.e.cummings"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "DramaIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
