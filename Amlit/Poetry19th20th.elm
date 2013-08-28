module Amlit.Poetry19th20th where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who used a lot of dashes in her poems?(No spaces or capitals)"
  ,a=ls "emilydickinson"}
 ,{q="Who wrote Leaves of Grass?(No spaces or capitals)"
  ,a=ls "waltwhitman"}
 ,{q="Who wrote Rootabaga Stories?(No spaces or capitals)"
  ,a=ls "carlsandburg"}]


(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "Realist20thIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
