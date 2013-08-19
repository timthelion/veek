module Morphology.Prepositions where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="\"At\" in \"I will meet you at the store\" is a preposition of ____."
  ,a=ls "space"}
 ,{q="\"At\" in \"I will meet you at ten.\" is a preposition of _____."
  ,a=ls "time"}
 ,{q="\"For\" in \"We must meet for a short conversation.\" is a preposition of _____ and purpose."
  ,a=ls "cause"}
 ,{q="\"On\" in \"I will call you on my cell phone if we can't find each other.\" is a preposition of _____ to stimulus"
  ,a=ls "means"}
 ,{q="\"With\" in \"We meet with each other every other day.\" is a preposition of ______"
  ,a=ls "accompaniment"}
 ,{q="\"But\" in \"They met every week but Christmas.\" is a preposition of ______."
  ,a=ls "concession"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "ConjunctionsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
