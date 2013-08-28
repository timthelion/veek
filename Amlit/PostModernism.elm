module Amlit.PostModernism where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Sixty Stories?(No spaces or capitals)"
  ,a=ls "donaldbarthelme"}
 ,{q="Who wrote Lost in the Funhouse?(No spaces or capitals)"
  ,a=ls "johnbarth"}
 ,{q="Who wrote Will You Please Be Quiet, Please??(No spaces or capitals)"
  ,a=ls "raymondcarver"}
 ,{q="Who wrote Lolita?(No spaces or capitals)"
  ,a=ls "vladimirnabokov"}
 ,{q="Who wrote Cat's Cradle?(No spaces or capitals)"
  ,a=ls "kurtvonnegut"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "JewishLiteratureIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
