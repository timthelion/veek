module UJAZ.PhoneticTerms where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
  [{q="____ studies how people produce sounds while speaking."
  ,a=ls "phonetics"}
 ,{q="____ studies the patterns of sounds in language."
  ,a=ls "phonology"}
 ,{q="The baic contrastive sound unit is the _____"
  ,a=ls "phoneme"}
 ,{q="Phonemes are not always pronounced exacly the same way. This is refered to as _____ variation."
  ,a=ls "allophonic"}
 ,{q="Concrete realizations of an allophone are called _____."
  ,a=ls "phones"}
 ,{q="The rules that determine which sounds can appear next to eachother in speech are ______." ,a=ls "phonotactic"}
 ,{q="A transcription surrounded by brackets [ ] is a ______ transcription."
  ,a=ls "phonetic"}
 ,{q="Forward slashes // mark ______ transcriptions."
  ,a=ls "phonemic"}
 ,{q="\"Normal\" written text is _____ transcription."
  ,a=ls "orthographic"}
 ]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "WritingSystemsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
