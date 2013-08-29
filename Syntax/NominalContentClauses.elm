module Syntax.NominalContentClauses where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the semantic classification of the nominal content clause: I wish I was done with my exams."
  ,a=ls "optative"}
 ,{q="Determine the semantic classification of the nominal content clause: I know that you can pass."
  ,a=ls "declarative"}
 ,{q="Determine the semantic classification of the nominal content clause(what you will do once you're done with school) in: I want to know what you will do once you're done with school."
  ,a=ls "wh-interrogative"}
 ,{q="Determine the semantic classification of the nominal content clause: And I'm especially interested in whether you will continue with the masters program.(___/no-interrogative)"
  ,a=ls "yes"}
 ,{q="Determine the semantic classification of the nominal content clause: It is incredible how fast time flies."
  ,a=ls "exclamative"}
 ,{q="Determine the semantic classification of the nominal content clause: I think you should leave school and start a firm."
  ,a=ls "imperative"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "RelativeClausesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
