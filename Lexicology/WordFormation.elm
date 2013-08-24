module Lexicology.WordFormation where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The word formation process in which we take words from another language is called"
  ,a=ls "borrowing"}
 ,{q="The word formation process in which we add affixes to words is called"
  ,a=ls "affixation"}
 ,{q="The word formation process in which we put two words together into one is called"
  ,a=ls "compounding"}
 ,{q="The word formation process in which we take a word from one word class and use it like a word from another is called"
  ,a=ls "conversion"}
 ,{q="The word formation process in which we shorten two words and put them together to form a new one is called"
  ,a=ls "blending"}
 ,{q="The word formation process in which we make a lexeme of the initials of a phrase is called"
  ,a=ls "acronymy"}
 ,{q="The word formation process in which we remove part of the word(usually the end) is called"
  ,a=ls "clipping"}
 ,{q="The word formation process in which we repeat a word is called"
  ,a=ls "reduplication"}
 ,{q="The word formation process in which we remove a part of a word in order to change it's meaning or word class is called."
  ,a=ls "back formation"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "ChangesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
