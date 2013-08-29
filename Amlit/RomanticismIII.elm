module Amlit.RomanticismIII where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Moby-Dick?(No spaces or capitals)"
  ,a=ls "hermanmelville"}
 ,{q="Who wrote The adventures of Hucklebery Finn?(No spaces or capitals)"
  ,a=ls "marktwain"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "RealismIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
