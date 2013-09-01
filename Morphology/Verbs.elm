module Morphology.Verbs where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the type of modality: You can do it!"
  ,a=ls "ability"}
 ,{q="Determine the type of modality: You can go now."
  ,a=ls "permission"}
 ,{q="Determine the type of modality: Maybe you can."
  ,a=ls "possibility"}
 ,{q="Determine the type of modality: May I have another ice-cream?"
  ,a=ls "permission"}
 ,{q="Determine the type of modality: She may arrive today."
  ,a=ls "possibility"}
 ,{q="Determine the type of modality: You must pass your exam."
  ,a=ls "obligation"}
 ,{q="Determine the type of modality: It must be very difficult for you."
  ,a=ls "necessity"}
 ,{q="Determine the type of modality: I will come as soon as possible."
  ,a=ls "volition"}
 ,{q="Determine the type of modality: It will be a fine day, me thinks."
  ,a=ls "prediction"}
 ,{q="Determine the type of modality: It should start raining any minute now."
  ,a=ls "prediction"}
 ,{q="Determine the type of modality: What shall we do?"
  ,a=ls "volition"}
 ,{q="Determine the type of modality: Cars should be banned!"
  ,a=ls "obligation"}
 ,{q="Determine the type of modality(tentative _____): The mountain should be erupting any minute now."
  ,a=ls "inference"}
 ,{q="Determine the type of modality: She ought not have spoken."
  ,a=ls "obligation"}
 ,{q="Determine the type of modality(_____ inference): The director ought to be here soon."
  ,a=ls "tentative"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "TenseIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
