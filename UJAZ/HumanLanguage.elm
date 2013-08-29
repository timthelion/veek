module UJAZ.HumanLanguage where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="The emotional language function is:"
  ,a=ls "interaction"}
 ,{q="The communicative language function is:"
  ,a=ls "transaction"}
 ,{q="When two women in Prague speak about Paris, they demonstrate which human language feature?"
  ,a=ls "displacement"}
 ,{q="The fact that 10 years ago, the word \"blogosphere\" didn't exist is an example of language"
  ,a=ls "productivity"}
 ,{q="The fact that similar adjectives are distinct demonstrates language"
  ,a=ls "discreteness"}
 ,{q="The fact that I don't speak Czech well, despite having Czech blood is because language is passed on through _____ transmission"
  ,a=ls "cultural"}
 ,{q="The fact that we cannot understand Chinese(but can understand a dog's barking) without learning it is partly due to language"
  ,a=ls "arbitrariness"}
 ,{q="That the word \"cat\" reminds us of the animal, but the letter 'c' does not is due to"
  ,a=ls "duality"}
 ]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "HistoryAndGeographyIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
