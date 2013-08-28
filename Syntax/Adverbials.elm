module Syntax.Adverbials where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the semantic classification of the adjunct: He lives in Ohio."
  ,a=ls "position"}
 ,{q="Determine the semantic classification of the adjunct: He walks to the store."
  ,a=ls "direction"}
 ,{q="Determine the semantic classification of the adjunct: At ten he went to bed."
  ,a=ls "position"}
 ,{q="Determine the semantic classification of the adjunct: He slept for 8 hours."
  ,a=ls "duration"}
 ,{q="Determine the semantic classification of the adjunct: He sleeps every night."
  ,a=ls "frequency"}
 ,{q="Determine the semantic classification of the adjunct(before he got married): Before he got married, sometimes he would sleep till noon."
  ,a=ls "relationship"}
 ,{q="Determine the semantic classification of the adjunct: He ran silently."
  ,a=ls "manner"}
 ,{q="Determine the semantic classification of the adjunct: He fixed the wall with a hammer.(means and _____)"
  ,a=ls "instrument"}
 ,{q="Determine the semantic classification of the adjunct: He felled the trees without Henry's help.(_____ circumstances))"
  ,a=ls "accompanying"}
 ,{q="Determine the semantic classification of the adjunct: For a small boy, he eats mountains."
  ,a=ls "respect"}
 ,{q="Determine the semantic classification of the adjunct: The buzz grew to a roar."
  ,a=ls "result"}
 ,{q="Determine the semantic classification of the adjunct: The man fell because the wind knocked him."
  ,a=ls "cause"}
 ,{q="Determine the semantic classification of the adjunct(for the feast): He prepared for the feast by fasting."
  ,a=ls "purpose"}
 ,{q="Determine the semantic classification of the adjunct: He sang and laughed to Mrs. Filmore's satisfaction."
  ,a=ls "effect"}
 ,{q="Determine the semantic classification of the adjunct: These shoes are only used in the summer."
  ,a=ls "condition"}
 ,{q="Determine the semantic classification of the adjunct: Even though she smells I prefer her to Sally."
  ,a=ls "concession"}
 ,{q="Determine the semantic classification of the adjunct: It was bought by some millionaire from Paris."
  ,a=ls "agent"}
 ,{q="Determine the semantic classification of the adjunct: The city is built from stone."
  ,a=ls "origin"}
 ,{q="Determine the semantic classification of the adjunct(to the point of not fitting through the door): She has grown to the point of not fitting through the door."
  ,a=ls "degree"}
 ,{q="Determine the semantic classification of the adjunct: She wore a less expensive dress than Sally."
  ,a=ls "intensifier"}
 ,{q="The word \"only\" in \"Only she can make me happy.\" is a focusing"
  ,a=ls "subjunct"}
 ,{q="Honestly, take a walk! \"Honestly\" is a content"
  ,a=ls "disjunct"}
 ,{q="\"Probably\" in \"He is probably dead.\" is a _____ disjunct."
  ,a=ls "content"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "AppositionsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
