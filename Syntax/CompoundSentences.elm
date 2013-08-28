module Syntax.CompoundSentences where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The cat sat and licked it's tail."
  ,a=ls "copulative"}
 ,{q="The cat must clean himself or his stench will scare off the mice."
  ,a=ls "disjunctive"}
 ,{q="The mice didn't notice him coming for the cat was sleek and clean."
  ,a=ls "causative"}
 ,{q="The cat did not kill the mice and eat them, but played with them till they died of exhaustion."
  ,a=ls "adversative"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "../Amlit/ColonialIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
