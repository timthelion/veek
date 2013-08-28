module Amlit.Realism where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote The portrait of a Lady?(No spaces or capitals)"
  ,a=ls "henryjames"}
 ,{q="Who wrote The Awakening?(No spaces or capitals)"
  ,a=ls "katechopin"}
 ,{q="Who wrote The Red Badge of Courage?(No spaces or capitals)"
  ,a=ls "stephencrane"}
 ,{q="Who wrote The Call of the Wild?(No spaces or capitals)"
  ,a=ls "jacklondon"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "Poetry19th20thIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
