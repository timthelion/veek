module UJAZ.WritingSystems where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The basic contrastive unit in writting is the _____."
  ,a=ls "grapheme"}
 ,{q="Variations of graphemes are called ______."
  ,a=ls "allographs"}
 ,{q="The actual marks on paper which represent graphemes are called ______."
  ,a=ls "graphs"}
 ,{q="If a writing system consists of pictures which represent real objects then it is ______."
  ,a=ls "pictographic"}
 ,{q="If a writing system uses pictures to represent things that may or may not be the real objects drawn in the pictures then it is ____."
  ,a=ls "ideographic"}
 ,{q="If a writing system uses symbols to represent groups of sounds then it is ____."
  ,a=ls "syllabic"}
 ]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "PhoneticTermsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
