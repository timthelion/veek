module Syntax.RelativeClauses where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="In the sentence \"She killed what she could.\", \"what she could\" is a _____ relative clause."
  ,a=ls "nominal"}
 ,{q="In the sentence \"She killed everything that moved.\", \"that moved\" is a _____ relative clause."
  ,a=ls "adnominal"}
 ,{q="In the sentence \"She killed what she saw.\", \"what she saw\" is a _____ relative clause."
  ,a=ls "specific"}
 ,{q="In the sentence \"She killed whatever made a noise.\", \"whatever made a noise\" is a _____ relative clause."
  ,a=ls "non-specific"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "SpeechAndThoughtIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
