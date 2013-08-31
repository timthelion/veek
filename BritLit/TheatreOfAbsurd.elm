module BritLit.TheatreOfAbsurd where

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
  ,a=ls ""}
 ,{q=""
  ,a=ls ""}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/Movements_in_post_WWII_British_poetry"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
