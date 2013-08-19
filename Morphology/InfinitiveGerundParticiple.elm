module Morphology.InfinitiveParticipleGerund where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="What is \"to get an ice-cream\" in: He went to get an ice-cream."
  ,a=ls "infinitive"}
 ,{q="What is \"getting ice-cream\" in: Getting ice-cream is fun."
  ,a=ls "gerund"}
 ,{q="What is \"going to get ice-cream\" in: Going to get ice-cream he slipped on a banana peal and died."
  ,a=ls "participle"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "PrepositionsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
