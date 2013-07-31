{-Transcriptions from:
   wiktionary.org
   Longman Pronunciation Dictionary 3rd edition, by J. Wells -}

module Plosives where

import Veek
import JavaScript as JS

(redirect,game) = Veek.veekGame
 {alphabet = ["/","u","ə","ɪ","æ","aɪ","v","ð","n","w","j","d","t","b","p","g","k"]
 ,nextLevel = "PureVowelsIntro.html"
 ,home = "Intro.html"
 ,tasks =
   [{q="advocate (noun)",a=["/","æ","d","v","ə","k","ə","t","/"]}
   ,{q="bat",a=["/","b","æ","t","/"]}
   ,{q="cabinet",a=["/","k","æ","b","n","ə","t","/"]}
   ,{q="bug",a=["/","b","ə","g","/"]}
   ,{q="kid",a=["/","k","ɪ","d","/"]}
   ,{q="nut",a=["/","n","ə","t","/"]}
   ,{q="pick-up",a=["/","p","ɪ","k","ə","p","/"]}
   ,{q="tap",a=["/","t","æ","p","/"]}
   ,{q="uncut",a=["/","ə","n","k","ə","t","/"]}
   ,{q="van",a=["/","v","æ","n","/"]}
   ,{q="wag",a=["/","w","æ","g","/"]}]}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
