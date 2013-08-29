module Syntax.Subjects where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the semantic classification of the subject: Tuesday is the big ball."
  ,a=ls "temporal"}
 ,{q="Determine the semantic classification of the subject: The ball makes all the girls go crazy."
  ,a=ls "eventive"}
 ,{q="Determine the semantic classification of the subject: The hall in which the ball takes place dances 200 couples."
  ,a=ls "locative"}
 ,{q="Determine the semantic classification of the subject: The girls sit in the cafeteria to talk about the ball."
  ,a=ls "positioner"}
 ,{q="Determine the semantic classification of the subject: Marry is the queen of the prom."
  ,a=ls "identified"}
 ,{q="Determine the semantic classification of the subject: She is very sexy."
  ,a=ls "characterized"}
 ,{q="Determine the semantic classification of the subject: On the day of the prom, Marry felt sick."
  ,a=ls "affected"}
 ,{q="Determine the semantic classification of the subject: She enjoyed the dance anyways."
  ,a=ls "experiencer"}
 ,{q="Determine the semantic classification of the subject: She got a crown of flowers at the prom."
  ,a=ls "recipient"}
 ,{q="The flowers filled her room with fragrance."
  ,a=ls "causative"}
 ,{q="Determine the semantic classification of the subject: Marry watered them every day."
  ,a=ls "agentive"}
 ,{q="Determine the semantic classification of the subject: The water made the flowers grow."
  ,a=ls "instrument"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "ObjectsIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
