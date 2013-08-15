module Writing.BasicTerms where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The basic contrastive unit in writting is the"
  ,a=ls "grapheme"}
 ,{q="Variations of graphemes are called"
  ,a=ls "allographs"}
 ,{q="The actual marks on paper which represent graphemes are called"
  ,a=ls "graphs"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "WritingSystemsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
