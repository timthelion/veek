module Lexicology.SemanticClassificationOfPrefixes  where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="A- in amoral is a ____ prefix."
  ,a=ls "negative"}
 ,{q="DE- in defrost is a ____ prefix."
  ,a=ls "reversative"}
 ,{q="MIS- in miscarriage is a ____ prefix."
  ,a=ls "pejorative"}
 ,{q="CO- in co-worker is a prefix of degree and ____."
  ,a=ls "size"}
 ,{q="PRO- in pro-life is a prefix of ______ and attitude."
  ,a=ls "orientation"}
 ,{q="INTER- in international is a _____ prefix."
  ,a=ls "locative"}
 ,{q="EX- in ex-employer is a prefix of time and _____."
  ,a=ls "order"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "SemanticClassificationOfCompoundsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
