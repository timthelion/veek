module Amlit.Realist20th where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Sister Carrie?(No spaces or capitals)"
  ,a=ls "theodoredreiser"}
 ,{q="Who wrote Babbitt?(No spaces or capitals)"
  ,a=ls "sinclairlewis"}
 ,{q="Who wrote The age of Innocence?(No spaces or capitals)"
  ,a=ls "edithwharton"}
 ,{q="Who wrote One of Ours?(No spaces or capitals)"
  ,a=ls "willacather"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "LostGenerationIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
