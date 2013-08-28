module Syntax.PredicateTypes where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the type of verbo-nominal predicate: Fred is a rockstar."
  ,a=ls "classifying"}
 ,{q="Determine the type of verbo-nominal predicate: There is a god."
  ,a=ls "existential"}
 ,{q="Determine the type of verbo-nominal predicate: The rock star is Fred."
  ,a=ls "identifying"}
 ,{q="Determine the type of verbo-nominal predicate: Fred sucks at playing guitar."
  ,a=ls "qualifying"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "WordOrderIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
