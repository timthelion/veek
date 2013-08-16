module Morphology.Adjectives where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The computer is a useful device.(\"The computer\" is a(n) _____ reference)"
  ,a=ls "generic"}
 ,{q="Eat the particles.(\"the particles\" is a(n) _______ situational direct definite reference)"
  ,a=ls "non-generic"}
 ,{q="Look up at the sky.(\"the sky\" is a non-generic ______ definite reference)"
  ,a=ls "situational"}
 ,{q="Veek was diving through a canyon deeper than hell.  The walls were hot pink.(\"the walls\" is a non-generic ______ indirect definite reference)"
  ,a=ls "anaphoric"}
 ,{q="Veek had a particle in his mouth. The letter was wrong.(\"the letter\" is a non-generic anaphoric ______ definite reference)"
  ,a=ls "direct"}
 ,{q="Sally ate a cake. The chocolate made her happy.  (\"the chocolate\" is a non-generic anaphoric _____ definite reference)"
  ,a=ls "indirect"}
 ,{q="The teeth of a cat had just sunk themselves into his neck.(\"the teeth\" is a non-generic ______ definite reference)"
  ,a=ls "cataphoric"}
 ,{q="The mouth of the river was overflowing.(\"the mouth\" is a non-generic cataphoric _____ reference)"
  ,a=ls "definite"}
 ,{q="Have a piece of pie!(\"a piece\" is a non-generic specific ______ reference.)"
  ,a=ls "indefinite"}
 ,{q="She ate an apple.(\"an apple\" is a non-generic _____ indefinite reference.)"
  ,a=ls "specific"}
 ,{q="I need a hammer.(\"a hammer\" is a non-generic ______ indefinite reference.)"
  ,a=ls "non-specific"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "NounsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
