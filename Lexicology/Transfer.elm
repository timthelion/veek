module Lexicology.Transfer where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="When you say \"the head of the spoon\" to refer to the part that holds fluid you are using a"
  ,a=ls "metaphor"}
 ,{q="When you say \"the beautiful\" to refer to people who look good you are using"
  ,a=ls "metonymy"}
 ,{q="When you are very hungry and say you could eat the table(to refer to all the food on the table) you are using"
  ,a=ls "synecdoche"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "SemanticClassificationOfPrefixesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
