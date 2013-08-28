module Syntax.QuestionTypes where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Is this a WH-question? No it is a ___ no question."
  ,a=ls "yes"}
 ,{q="What kind of question is this?  It is a __-question."
  ,a=ls "wh"}
 ,{q="Is this an exclamatory question or an echo question? Neither it is an ____ question."
  ,a=ls "alternative"}
 ,{q="This is a rhetorical question. Is it? (Maybe it's an ____ question instead."
  ,a=ls "elliptical"}
 ,{q="Isn't this a great exercise! What an ___ question!"
  ,a=ls "exclamatory"}
 ,{q="Do you want to fail the exam? An example of a ____ question."
  ,a=ls "rhetorical"}
 ,{q="This is the last question. This is the last question?  An example of an _____ question."
  ,a=ls "echo"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "ClauseStructureIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
