{-Transcriptions from:
   wiktionary.org
   Longman Pronunciation Dictionary 3rd edition, by J. Wells -}

module Plosives where

import Veek
import JavaScript as JS

ls=Veek.letters

(redirect,game) = Veek.veekGame
 {alphabet = ["/","u","ə","ɪ","æ","aɪ","v","ð","n","w","j","d","t","b","p","g","k"]
 ,nextLevel = "PureVowelsIntro.html"
 ,home = "Intro.html"
 ,tasks =
   [{q="advocate (noun)",a=ls "/ædvəkət/"}
   ,{q="bat",a=ls "/bæt/"}
   ,{q="cabinet",a=ls "/kæbnət/"}
   ,{q="bug",a=ls "/bəg/"}
   ,{q="kid",a=ls "/kɪd/"}
   ,{q="nut",a=ls "/nət/"}
   ,{q="pick-up",a=ls "/pɪkəp/"}
   ,{q="tap",a=ls "/tæp/"}
   ,{q="uncut",a=ls "/ənkət/"}
   ,{q="van",a=ls "/væn/"}
   ,{q="wag",a=ls "/wæg/"}]}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
