module Syntax.ClauseStructure where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the clause structure: The boy is running."
  ,a=ls "SV"}
 ,{q="Determine the clause structure: The boy is running by the river."
  ,a=ls "SV"}
 ,{q="Determine the clause structure: The boy got a cat."
  ,a=ls "SVO"}
 ,{q="Determine the clause structure: The boy got a black cat."
  ,a=ls "SVO"}
 ,{q="Determine the clause structure: The cat isblack."
  ,a=ls "SVC"}
 ,{q="Determine the clause structure: The cat is on the roof."
  ,a=ls "SVA"}
 ,{q="Determine the clause structure: I brought Fred an ice-cream."
  ,a=ls "SVOO"}
 ,{q="Determine the clause structure: The ice-cream made him sick."
  ,a=ls "SVOC"}
 ,{q="Determine the clause structure: Bob is pushing the cat through the hole."
  ,a=ls "SVOA"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "SubjectsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
