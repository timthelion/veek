module Lexicology.Changes where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="When a word's meaning becomes more positive throughout history this is called"
  ,a=ls "amelioration"}
 ,{q="When a words meaning becomes more negative over time this is"
  ,a=ls "deterioration"}
 ,{q="When a word with a concrete meaning begins to have multiple loosely related meanings this is"
  ,a=ls "branching"}
 ,{q="When a word which denotes a class of items ends up denoting only some members of that class this is called"
  ,a=ls "restriction"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "RelationsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
