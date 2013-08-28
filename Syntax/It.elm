module Syntax.It where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the type of it being used: In a room with a box and two men one asks \"Is it your cat?\""
  ,a=ls "deictic"}
 ,{q="Determine the type of it being used: We her a rumbling sound, someone asks \"Is it a train?\""
  ,a=ls "situational"}
 ,{q="Determine the type of it being used: It's snowing."
  ,a=ls "formal"}
 ,{q="Determine the type of it being used: It aint easy being green."
  ,a=ls "anticipatory"}
 ,{q="Determine the type of it being used: Watch out for the Baggerwasher, it'll eat you if it catches you."
  ,a=ls "anaphoric"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "PredicateTypesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
