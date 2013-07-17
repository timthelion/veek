{-Transcriptions from wiktionary.org -}
module FirstTenWords where

import Veek
import JavaScript as JS

(redirect,game) = Veek.veekGame
 {alphabet = ["i","ɪ","u","ə","æ","ʌ","b","t","d","v","ð","n","h"]
 ,nextLevel = "Intro.html"
 ,home = "Intro.html"
 ,tasks =
  [{q="Transcribe the word 'the' (unstressed, US).", a = ["/","ð","ə","/"]}
  ,{q="Transcribe the word 'be' (US).", a= ["/","b","i","/"]}
  ,{q="Transcribe the word 'and' (stressed, US).", a= ["/","æ","n","d","/"]}
  ,{q="Transcribe the word 'and' (unstressed, US).", a= ["/","ə","n","d","/"]}
  ,{q="Transcribe the word 'of' (stressed, US).", a= ["/","ʌ","v","/"]}
  ,{q="Transcribe the word 'a' (unstressed).", a= ["/","ə","/"]}
  ,{q="Transcribe the word 'in'.", a= ["/","ɪ","n","/"]}
  ,{q="Transcribe the word 'to' (US).", a= ["/","t","u","/"]}
  ,{q="Transcribe the word 'have' (stressed, US).", a= ["/","h","æ","v","/"]}
  ,{q="Transcribe the word 'it'. (stressed)", a= ["/","ɪ","t","/"]}]}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
