module UJAZ.SemioticTriangle where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The relationship between the CONCEPT and the REFERENT is that of:"
  ,a=ls "designation"}
 ,{q="The relationship between the SYMBOL and the CONCEPT is that of:"
  ,a=ls "signification"}
 ,{q="The relationship between the SYMBOL and the REFERENT is that of:"
  ,a=ls "denotation"}
 ]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "PhoneticTermsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
