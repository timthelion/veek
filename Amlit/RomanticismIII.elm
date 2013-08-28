module Amlit.RomanticismIII where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote ?(No spaces or capitals)"
  ,a=ls ""}
 ,{q="Who wrote ?(No spaces or capitals)"
  ,a=ls ""}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "RealismIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
