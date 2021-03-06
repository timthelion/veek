{-Transcriptions from:
   wiktionary.org
   Longman Pronunciation Dictionary 3rd edition, by J. Wells -}

module Plosives where

import Veek
import JavaScript as JS

ls=Veek.letters

(redirect,game) = Veek.veekGame
 {alphabet = ["/","i","ɪ","ɛ","æ","ɝ","ɑ","ɔ","ʊ","u","ə","aɪ","v","ð","n","w","j","d","t","b","p","g","k"]
 ,nextLevel = "Victory.html"
 ,home = "Intro.html"
 ,tasks =
   [{q="aquiver",a=ls "/əkwɪvɝ/"
   ,{q="bookie",a="/bʊki/"
   ,
   "i","ɪ","ɛ","æ","ɝ","ɑ","ɔ","ʊ","u","ə"]}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
