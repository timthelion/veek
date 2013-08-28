module Syntax.Objects where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the semantic classification of the direct object: Bob walked 1000 miles to see his love."
  ,a=ls "locative"}
 ,{q="Determine the semantic classification of the direct object: The trip marched him so he could march no more.(him)"
  ,a=ls "agentive"}
 ,{q="He enjoyed the trip."
  ,a=ls "eventive"}
 ,{q="Determine the semantic classification of the indirect object: When he arrived, his love gave him news that she had found another man."
  ,a=ls "recipient"}
 ,{q="Determine the semantic classification of the direct object: The news made him very depressed."
  ,a=ls "affected"}
 ,{q="Determine the semantic classification of the direct object: He cried bitter tears."
  ,a=ls "cognate"}
 ,{q="Determine the semantic classification of the direct object: He made a noose."
  ,a=ls "resultant"}
 ,{q="Determine the semantic classification of the indirect object: He taught himself to fly."
  ,a=ls "affected"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "AdverbialsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
