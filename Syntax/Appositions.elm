module Syntax.Appositions where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The apposition in this sentence demonstrates equivalence through: Plastics, or rather oil based materials, have been known to cause cancer."
  ,a=ls "reformulation"}
 ,{q="The apposition in this sentence demonstrates equivalence through: John, the president of the university, is coming."
  ,a=ls "identification"}
 ,{q="In the sentence \"Some frogs, such as the Pacific tree frog, do not live in water.\" we see non-restrictive apposition through"
  ,a=ls "exemplification"}
 ,{q="In the sentence \"House cats are usually fed meat from a can, in particular, throw away fish meat.\" we see non-restrictive apposition through"
  ,a=ls "particularization"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "ItIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
