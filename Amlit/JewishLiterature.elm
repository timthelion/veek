module Amlit.JewishLiterature where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote The Family Moskat?(No spaces or capitals)"
  ,a=ls "isaacbashevissinger"}
 ,{q="Who wrote Seize the Day?(No spaces or capitals)"
  ,a=ls "saulbellow"}
 ,{q="Who wrote Armistice?(No spaces or capitals)"
  ,a=ls "bernardmalamud"}
 ,{q="Who wrote The Breast?(No spaces or capitals)"
  ,a=ls "philiproth"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "Poetry20thIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
