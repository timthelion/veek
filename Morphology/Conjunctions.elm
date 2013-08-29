module Morphology.Conjunctions where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The conjunction \"and\" in \"bread and butter\" is a"
  ,a=ls "coordinator"}
 ,{q="\"Either\" and \"or\" in \"Either ketchup or tartar sauce will do.\" are"
  ,a=ls "correlatives"}
 ,{q="The conjunction \"after\" in \"After I do my performance we should go to a restaurant.\" is a"
  ,a=ls "subordinator"}
 ,{q="The word \"after\" in \"After my performance we should go to a restaurant.\" is not a conjunction but a"
  ,a=ls "preposition"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "../Syntax/SentenceTypesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
