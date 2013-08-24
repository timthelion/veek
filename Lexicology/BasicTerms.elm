module Lexicology.BasicTerms where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The basic word-like unit that linguists use is the"
  ,a=ls "lexeme"}
 ,{q="The smallest unit that caries meaning is the"
  ,a=ls "morpheme"}
 ,{q="A variation of a morpheme is a(n)"
  ,a=ls "allomorph"}
 ,{q="The semantic unit that is represented by a lexeme is a"
  ,a=ls "sememe"}
 ,{q="A more specific unit of meaning than a sememe is a"
  ,a=ls "seme"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "LexicographyIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
