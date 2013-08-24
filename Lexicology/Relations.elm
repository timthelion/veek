module Lexicology.Relations where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="When two words sound the same but are written differently they are"
  ,a=ls "homophones"}
 ,{q="When two words are written the same but sound differently they are"
  ,a=ls "homographs"}
 ,{q="When two words both sound and are written the same way the are"
  ,a=ls "homonyms"}
 ,{q="When two words have the same meaning they are"
  ,a=ls "synonyms"}
 ,{q="When two words have the opposite meaning from one another they are"
  ,a=ls "antonyms"}
 ,{q="The words \"left\" and \"right\" are ____ opposites."
  ,a=ls "binary"}
 ,{q="The relative opposites such as \"fast\" and \"slow\" are _____ opposites."
  ,a=ls "non-binary"}
 ,{q="Words such as male and female where the negative of one denotes the other are called"
  ,a=ls "complementaries"}
 ,{q="Words such as lender and debtor where the one implies the other are called"
  ,a=ls "converses"}
  ]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "TransferIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
