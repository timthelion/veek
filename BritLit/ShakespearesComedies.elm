module BritLit.ShakespearesComedies where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="When was Shakespeare born?"
  ,a=ls "1564"}
 ,{q="Fill in the blank: Comedy of ________"
  ,a=ls "errors"}
 ,{q="Fill in the blank: The _____ of the Shrew"
  ,a=ls "taming"}
 ,{q="Fill in the blank: A Midsummer _____`s Dream."
  ,a=ls "night"}
 ,{q="Fill in the blank: _____ and Juliet"
  ,a=ls "romeo"}
 ,{q="Fill in the blank: King _____"
  ,a=ls "lear"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/The_Contrast_in_the_sensibility_of_Elizabethan_poetry_and_Metaphysical_poetry"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
