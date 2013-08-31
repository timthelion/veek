module BritLit.NeoClassicism where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote the Rape of the Lock?(No spaces or capitals)"
  ,a=ls "alexanderpope"}
 ,{q="Who wrote A Modest Proposal(No spaces or capitals)"
  ,a=ls "johnathanswift"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/The_rise_and_forms(types)_of_the_18th_century_English_Novel"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
