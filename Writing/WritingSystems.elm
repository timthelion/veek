module Writing.WritingSystems where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="If a writing system consists of images which represent real objects then it is"
  ,a=ls "pictographic"}
 ,{q="If a writing system uses pictures to represent things that may or may not be the real objects drawn in the pictures then it is"
  ,a=ls "ideographic"}
 ,{q="If a writing system uses symbols to represent groups of sounds then it is"
  ,a=ls "syllabic"}
 ,{q="If a writing system uses symbols to represent sounds then it is"
  ,a=ls "alphabetic"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "../Phonetics/BasicTermsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
