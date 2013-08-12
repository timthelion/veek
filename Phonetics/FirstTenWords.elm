{-Transcriptions from wiktionary.org and perhaps Longman Pronunciation Dictionary 3rd edition, by J. Wells -}

module Phonetics.FirstTenWords where

import Veek
import JavaScript as JS

ls = Veek.letters

(redirect,game) = Veek.veekGame
 {alphabet = ["j","u","aɪ","t","u","ð","ə","ɪ","w","v","æ","/","n"]
 ,nextLevel = "PlosivesIntro.html"
 ,home = "../Intro.html"
 ,tasks =
   [{q="Transcribe 'you'.",a=Veek.letters "/ju/"}
   ,{q="Transcribe 'I'.",a=["/","aɪ","/"]}
   ,{q="Transcribe 'to'.",a=ls "/tu/"}
   ,{q="Transcribe 'the' (unstressed).",a=ls "/ðə/"}
   ,{q="Transcribe 'it'.",a=ls "/ɪt/"}
   ,{q="Transcribe 'a' (unstressed).",a= ls "/ə/"}
   ,{q="Transcribe 'what'.",a= ls "/wət/"}
   ,{q="Transcribe 'of'.",a= ls "/əv/"}
   ,{q="Transcribe 'in'.",a= ls "/ɪn/"}
   ,{q="Transcribe 'and' (stressed).",a=ls "/ænd/"}
   ,{q="Transcribe 'and' (unstressed).",a= ls ["/ənd/"}]}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
