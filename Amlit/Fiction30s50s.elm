module Amlit.Fiction30s50s where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Grapes of Wrath?(No spaces or capitals)"
  ,a=ls "johnsteinback"}
 ,{q="Who wrote The Catcher in the Rye?(No spaces or capitals)"
  ,a=ls "jeromedavidsalinger"}
 ,{q="Who wrote On the Road?(No spaces or capitals)"
  ,a=ls "jackkérouac"}
 ,{q="Who wrote Howl?(No spaces or capitals)"
  ,a=ls "allenginsberg"}
 ,{q="Who wrote Naked Lunch?(No spaces or capitals)"
  ,a=ls "williamburroughs"}
 ,{q="Who wrote Ham on Rye?(No spaces or capitals)"
  ,a=ls "charlesbukowski"}
 ,{q="Who wrote Wise Blood?(No spaces or capitals)"
  ,a=ls "flanneryo'connor"}
 ,{q="Who wrote The Heart Is a Lonely Hunter?(No spaces or capitals)"
  ,a=ls "carsonmccullers"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "Fiction60s80sIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
