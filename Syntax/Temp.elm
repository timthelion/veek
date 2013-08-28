module Syntax. where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "Intro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
