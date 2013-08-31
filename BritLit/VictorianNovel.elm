module BritLit.VictorianNovel where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Who wrote Wuthering Heights?(no spaces or capitals)"
  ,a=ls "emilybronte"}
 ,{q="Who wrote Oliver Twist?(no spaces or capitals)"
  ,a=ls "charlesdickens"}
 ,{q="Who wrote Vanity Fair?(no spaces or capitals)"
  ,a=ls "williammakepeacethackeray"}
 ,{q="Who wrote Jude the Obscure?(no spaces or capitals)"
  ,a=ls "thomashardy"}
 ,{q="Who wrote The Picture of Dorian Gray?(No spaces or capitals)"
  ,a=ls "oscarwilde"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "http://britlitbernie2012.wikia.com/wiki/The_philosophical_and_Socio-historical_background_of_Victorianism"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
