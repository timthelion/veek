module Amlit.Fiction60s80s where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote The Executioner's Song?(No spaces or capitals)"
  ,a=ls "normanmailer"}
 ,{q="Who wrote The Centuar?(No spaces or capitals)"
  ,a=ls "johnupdike"}
 ,{q="Who wrote Catch XXII?(No spaces or capitals)"
  ,a=ls "josephheller"}
 ,{q="Who wrote Sophie's Choice?(No spaces or capitals)"
  ,a=ls "williamstyron"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "PostModernismIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
