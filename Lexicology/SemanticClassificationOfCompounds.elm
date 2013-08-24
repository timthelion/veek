module Lexicology.SemanticClassificationOfCompounds  where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The word \"lawnmower\" is an _____ compound."
  ,a=ls "endocentric"}
 ,{q="The word \"redneck\" is an _____ compound."
  ,a=ls "exocentric"}
 ,{q="The Sanskrit term for exocentric compounds is"
  ,a=ls "bahuvrihi"}
 ,{q="The word \"bittersweet\" is a _____ compound."
  ,a=ls "copulative"}
 ,{q="The word \"entertainer-chief\" is a ____ compound."
  ,a=ls "appositional"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "../Morphology/ArticlesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
