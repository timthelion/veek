module Amlit.AfricanAmerican where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Which Slave Narratives author did we read?(No spaces or capitals)"
  ,a=ls "fredricdouglass"}
 ,{q="Which Harlem Renaissance was born in 1902?(No spaces or capitals)"
  ,a=ls "langstonhuges"}
 ,{q="Who wrote Another Country?(No spaces or capitals)"
  ,a=ls "jamesbaldwin"}
 ,{q="Who wrote The Invisible Man?(No spaces or capitals)"
  ,a=ls "ralphellison"}
 ,{q="Who wrote The color purple?(No spaces or capitals)"
  ,a=ls "alicewalker"}
 ,{q="Who wrote The Bluest Eye?(No spaces or capitals)"
  ,a=ls "tonimorrison"}
 ,{q="Who wrote Ceremony?(No spaces or capitals)"
  ,a=ls "lesliemarmonsilko"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "../Victory.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
