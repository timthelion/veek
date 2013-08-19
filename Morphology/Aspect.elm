module Morphology.Aspect where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="He has been waiting for a long time(state present ______)."
  ,a=ls "perfect"}
 ,{q="She has just gotten divorced(____ present perfect)."
  ,a=ls "event"}
 ,{q="She has been a programmer her whole life(_____ present perfect."
  ,a=ls "state"}
 ,{q="She has released a new game every month for 10 years(_____ present perfect)."
  ,a=ls "habitual"}
 ,{q="She had ridden since dawn(____ perfect)."
  ,a=ls "past"}
 ,{q="I am eating some chips(event _____)."
  ,a=ls "progressive"}
 ,{q="She is trying out all sorts of new flavors for chips(_____ progressive)."
  ,a=ls "habitual"}
 ,{q="She has been programming since she learned to talk(perfect _____)."
  ,a=ls "progressive"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "MoodIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
