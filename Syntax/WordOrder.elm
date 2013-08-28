module Syntax.WordOrder where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Questions such as \"Is the fog gray?\" have ____ word order."
  ,a=ls "indirect"}
 ,{q="Statements such as \"The fog is grey.\" have ____ word order."
  ,a=ls "direct"}
 ,{q="Deferred prepositions such as \"to\" in \"Where did we get to last night?\" are examples of"
  ,a=ls "discontinuity"}
 ,{q="In the sentence \"Out the back ran the thief.\" we see ___ word order."
  ,a=ls "inverted"}
 ,{q="\"A dog yelped.\" is in ____ scale."
  ,a=ls "presentation"}
 ,{q="\"The cat mewed.\" is in ____ scale."
  ,a=ls "quality"}
 ,{q="The sentence \"It was Fred who killed and ate the pig.\" is a ____ sentence."
  ,a=ls "cleft"}
 ,{q="The sentence \"What Fred killed and ate was the pig.\" is a ____ cleft sentence."
  ,a=ls "pseudo"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "ClauseTypesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
