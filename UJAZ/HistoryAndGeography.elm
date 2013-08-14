module UJAZ.HistoryAndGeography where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="When two words in two different languages come from the same root and have similar meanings, they are"
  ,a=ls "cognates"}
 ,{q="When two similar words in a given language come from the same root they are"
  ,a=ls "doublets"}
 ,{q="The Old English period ends around the year"
  ,a=ls "1066"}
 ,{q="The Middle English period stars around the year"
  ,a=ls "1200"}
 ,{q="The Middle English period ends around the year"
  ,a=ls "1500"}
 ,{q="The transition from Early Modern English to Modern English is usually placed around the year"
  ,a="1800"}
 ]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "LinguisticsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
