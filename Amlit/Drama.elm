module Amlit.Drama where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Death of a Salesman?(No spaces or capitals)"
  ,a=ls "arthurmiller"}
 ,{q="Who wrote The Glass Menagerie?(No spaces or capitals)"
  ,a=ls "tennesseewilliams"}
 ,{q="Who wrote The Zoo Story?(No spaces or capitals)"
  ,a=ls "edwardalbee"}
 ,{q="Who wrote True West?(No spaces or capitals)"
  ,a=ls "samshepard"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "AfricanAmericanIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
