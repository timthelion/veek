module Syntax.AdverbialClauses where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Before we go on, let me say one thing. Determine the semantic classification of the clause \"Before we go on\"."
  ,a=ls "time"}
 ,{q="Wherever we go, we sing and dance. Determine the semantic classification of the clause \"Wherever we go\"."
  ,a=ls "place"}
 ,{q="If you can't hear the music, listen harder! Determine the semantic classification of the clause \"If you can't hear the music\"."
  ,a=ls "conditional"}
 ,{q="Despite being a boy, he could still dress like a queen. Determine the semantic classification of the clause \"Despite being a boy\"."
  ,a=ls "concessive"}
 ,{q="Love your children, whoever they turn out to be. Determine the semantic classification of the clause \"whoever they turn out to be\"."
  ,a=ls "conditional-concessive"}
 ,{q="Many people study, while we play Veek! Determine the semantic classification of the clause \"while we play Veek!\"."
  ,a=ls "contrast"}
 ,{q="She would be beautiful, only she tries to hard. Determine the semantic classification of the clause \"only she tries to hard\"."
  ,a=ls "exception"}
 ,{q="She got old and ugly because she didn't die young. Determine the semantic classification of the clause \"because she didn't die young\"."
  ,a=ls "reason"}
 ,{q="He went to school to find a wife. Determine the semantic classification of the clause \"to find a husband\"."
  ,a=ls "purpose"}
 ,{q="The school was full of boys looking for wives, so there were no girls left for him. Determine the semantic classification of the clause \"so there were no girls left for him\"."
  ,a=ls "effect"}
 ,{q="He studied as thought grades were important to him. Determine the semantic classification of the clause \"as thought grades were important to him\"."
  ,a=ls "manner"}
 ,{q="The more he studied, the more the girls seemed to only fuck the jocks. Determine the semantic classification of the clause \"The more he studied\"."
  ,a=ls "proportion"}
 ,{q="Rather than be alone, he pretended to be gay. Determine the semantic classification of the clause \"Rather than be alone\"."
  ,a=ls "preference"}
 ,{q="As you see, the sky is the limit. Determine the semantic classification of the clause \"As you see\"."
  ,a=ls "comment"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "CompoundSentencesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
