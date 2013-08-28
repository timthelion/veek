module Amlit.RomanticismII where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote The Scarlet Letter?(No spaces or capitals)"
  ,a=ls "nathanielhawthorne"}
 ,{q="Who wrote Self-Reliance?(No spaces or capitals)"
  ,a=ls "ralphwaldoemerson"}
 ,{q="Who wrote Civil Disobedience?(No spaces or capitals)"
  ,a=ls "henrydavidthoreau"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "RomanticismIIIIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
