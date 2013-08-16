module Morphology.GenitiveNouns where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the grammatical status of the genitive: We're going to Mary's house."
  ,a=ls "determiner"}
 ,{q="Determine the grammatical status of the genitive: He founded a men's club in Paris."
  ,a=ls "modifier"}
 ,{q="Determine the genitive meaning: Amy's dress is gorgeous."
  ,a=ls "possessive"}
 ,{q="Determine the genitive meaning: I'm waiting for Sally's graduation."
  ,a=ls "subjective"}
 ,{q="Determine the genitive meaning: David's murder was a huge shock to them all."
  ,a=ls "objective"}
 ,{q="Determine the genitive meaning: I'm enjoying some of Morocco's best chocolate."
  ,a=ls "origin"}
 ,{q="Determine the genitive meaning: He stepped on Mary's toe."
  ,a=ls "partitive"}
 ,{q="Determine the genitive meaning: He was looking fabulous in a women's dress."
  ,a=ls "descriptive"}
 ,{q="Determine the genitive meaning: He had found Emily's greatest weakness."
  ,a=ls "attribute"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "PronounsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
