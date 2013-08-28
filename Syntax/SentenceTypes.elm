module Syntax.SentenceTypes where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the sentence type: The cat is running."
  ,a=ls "declarative"}
 ,{q="Determine the discourse function: The horse jumped."
  ,a=ls "statement"}
 ,{q="Determine the sentence type: Does life have a meaning?"
  ,a=ls "interrogative"}
 ,{q="Determine the discourse function: Are you happy?"
  ,a=ls "question"}
 ,{q="Determine the sentence type: Study."
  ,a=ls "imperative"}
 ,{q="Determine the discourse function: Get me some more milk!"
  ,a=ls "directive"}
 ,{q="Determine the sentence type: The sky is falling!"
  ,a=ls "exclamative"}
 ,{q="Determine the discourse function: You are a great student!"
  ,a=ls "exclamation"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "QuestionTypesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
