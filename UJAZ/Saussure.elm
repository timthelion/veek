module UJAZ.Saussure where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The abstract system of language is referred to by Saussure as"
  ,a=ls "langue"}
 ,{q="The concrete manifestation of language is referred to by Saussure as"
  ,a=ls "parole"}
 ,{q="The inborn ability to understand linguistic systems is referred to by Chompsky as"
  ,a=ls "competence"}
 ,{q="The understanding and use of language is referred to by Chompsky as"
  ,a=ls "performance"}
 ]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "../Writing/BasicTermsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
