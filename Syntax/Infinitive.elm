module Syntax.Infinitive where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="In the sentence \"It depressed Jim to eat so much and feel so fat.\" we see _____ of the subject."
  ,a=ls "extraposition"}
 ,{q="In the sentence \"She found it easy to program computers.\" we see extraposition of the"
  ,a=ls "object"}
 ,{q="In the sentence \"She was known to be a genius.\" we see subject"
  ,a=ls "raising"}
 ,{q="In the sentence \"The word is impossible to save.\" we see ____ raising."
  ,a=ls "object"}
 ,{q="Another name for object raising is ____ movement."
  ,a=ls "tough"}
 ,{q="In the sentence \"She is quick to deny anything.\" we see a ____ subject because it is possible to rephrase this as \"Her denials are quick\"."
  ,a=ls "split"}
 ,{q="In the sentence \"Succeed they did.\" we see"
  ,a=ls "fronting"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "GerundAndParticipleIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
