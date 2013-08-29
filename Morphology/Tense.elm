module Morphology.Tense where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="I am a student(___ present)."
  ,a=ls "state"}
 ,{q="I study every day(____ present)."
  ,a=ls "habitual"}
 ,{q="I study(____ present)."
  ,a=ls "instantaneous"}
 ,{q="Just as I finish, I realise I have more to study.(simple present tense for _____)."
  ,a=ls "past"}
 ,{q="I ate a snack 3 minutes ago(____ past)."
  ,a=ls "event"}
 ,{q="I ate a snack every couple of minutes when I was a teenager(___ past)."
  ,a=ls "habitual"}
 ,{q="I used to eat constantly(____ past)."
  ,a=ls "state"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "AspectIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
