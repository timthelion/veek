module BritLit.BloomsburyGroup where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote A Room of Ones Own(No spaces, no capitals)."
  ,a=ls "virginiawoolf"}
 ,{q="Who wrote Howards End(No spaces, no capitals)."
  ,a=ls "e.m.forster"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/Ezra_Pound,_T.S._Elliot_and_British_Modernist_poetry"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
