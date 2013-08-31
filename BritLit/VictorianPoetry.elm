module BritLit.VictorianPoetry where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote The Charge of the Light Brigade?(No spaces or capitals)"
  ,a=ls "tennyson"}
 ,{q="Who wrote Dover Beach(No spaces or capitals)"
  ,a=ls "matthewarnold"}
 ,{q="Who wrote The White Man's Burden?(No spaces or capitals)"
  ,a=ls "rudyardkipling"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/The_sensibility_of_Victorian_poetry_with_reference_to_at_least_one_specific_poem"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
