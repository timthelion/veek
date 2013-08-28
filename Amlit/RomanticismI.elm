module Amlit.RomanticismI where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Wieland?(No spaces or capitals)"
  ,a=ls "charlesbrockdenbrown"}
 ,{q="Who wrote The last of the Mohicans?(No spaces or capitals)"
  ,a=ls "jamesfenimorecooper"}
 ,{q="Who wrote The legend of Sleepy Hollow?(No spaces or capitals)"
  ,a=ls "washingtonirving"}
 ,{q="Who wrote The Black Cat?(No spaces or capitals)"
  ,a=ls "edgaralenpoe"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "RomanticismIIIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
