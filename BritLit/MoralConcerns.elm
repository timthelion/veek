module BritLit.MoralConcerns where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote ?(No spaces or capitals)"
  ,a=ls ""}
 ,{q="Who wrote ?(No spaces or capitals)"
  ,a=ls ""}
 ,{q="Who wrote ?(No spaces or capitals)"
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
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/Theatre_of_the_absurd,_with_reference_to_Waiting_for_Godot"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
