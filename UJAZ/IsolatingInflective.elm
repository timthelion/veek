module UJAZ.IsolatingInflective where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Chinese is an _____ language."
  ,a=ls "isolating"}
 ,{q="The type of language which packs the most grammatical information into a single utterance is:"
  ,a=ls "poly-synthetic"}
 ,{q="Czech is an _____ language."
  ,a=ls "inflective"}
 ,{q="Another word for isolating languages is:"
  ,a=ls "analytic"}
 ,{q="On the same pole as synthetic languages lie ____ languages."
  ,a=ls "inflective"}
 ]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "SemioticTriangleIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
