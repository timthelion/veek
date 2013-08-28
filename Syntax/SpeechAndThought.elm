module Syntax.SpeechAndThought where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="\"Lets go!\" chimed Sally <- an example of _____ speech "
  ,a=ls "direct"}
 ,{q="Lets go! <- an example of _____ direct speech"
  ,a=ls "free"}
 ,{q="Sally invited the others to go to the club. <- an example of ____ speech."
  ,a=ls "indirect"}
 ,{q="What was he thinking? <- an example of free ____ thought"
  ,a=ls "indirect"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "AdverbialClausesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
