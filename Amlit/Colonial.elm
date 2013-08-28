module Amlit.Colonial where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote The Negro Christianized?(No spaces or capitals)"
  ,a=ls "cottonmather"}
 ,{q="Who wrote A Modell of Christian Charity?(No spaces or capitals)"
  ,a=ls "johnwinthrop"}
 ,{q="Who wrote Of Plymouth Plantation?(No spaces or capitals)"
  ,a=ls "williambradford"}
 ,{q="Who wrote The Generall Historie of Virginia?(No spaces or capitals)"
  ,a=ls "johnsmith"}
 ,{q="Who wrote Upon the Burning of Our House?(No spaces or capitals)"
  ,a=ls "annebradstreet"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "RomanticismIIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
