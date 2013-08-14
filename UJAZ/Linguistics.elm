module UJAZ.Linguistics where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' : [{q:String,a:[String]}]
tasks' =
 [{q="The founder of the PLC was"
  ,a=ls "mathesius"}
 ,{q="Mathesius was born in the year"
  ,a=ls "1882"}
 ,{q="Mathesius died in the year"
  ,a=ls "1945"}
 ,{q="The study of how language changes over time is "
  ,a=ls "diachronic"}
 ,{q="The prominent PLC member who studied phonemics was named "
  ,a=ls "trubetzkoy"}
 ,{q="Trubetzkoy was born in the year"
  ,a=ls "1890"}
 ,{q="Trubetzkoy died in the year"
  ,a=ls "1938"}
 ,{q="The study of language as a static structure is "
  ,a=ls "synchronic"}
 ,{q="The third PLC member mentioned in the intro was named"
  ,a=ls "jackobson"}
 ,{q="He was born in the year"
  ,a=ls "1896"}
 ,{q="He died in the year"
  ,a=ls "1982"}
 ]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "IsolatingInflectiveIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
