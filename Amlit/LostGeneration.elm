module Amlit.LostGeneration where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote The great Gatsby?(No spaces or capitals)"
  ,a=ls "francisscottfitzgerald"}
 ,{q="Who wrote The Old man and the Sea?(No spaces or capitals)"
  ,a=ls "ernesthemingway"}
 ,{q="Who wrote The sound and the Fury?(No spaces or capitals)"
  ,a=ls "williamfaulkner"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "Fiction30s50sIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
