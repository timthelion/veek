module BritLit.Novel18th where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Robinson Crusoe?(No spaces or capitals)"
  ,a=ls "danieldefoe"}
 ,{q="Who wrote Pamela; or Virtue Rewarded?(No spaces or capitals)"
  ,a=ls "samuelrichardson"}
 ,{q="Who wrote Shamela?(No spaces or capitals)"
  ,a=ls "henryfielding"}
 ,{q="Who wrote The Life and Opinions of Tristram Shandy, Gentleman?(No spaces or capitals)"
  ,a=ls "laurencesterne"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/Sterne%27s_Tristram_Shandy_as_the_18th_Century_anti-novel_and_as_a_forerunner_of_the_postmodern_novel"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
