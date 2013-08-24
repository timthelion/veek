module Lexicology.Lexicography where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Name the defining method: A cat is a small furry animal."
  ,a=ls "simplifying"}
 ,{q="Name the defining method: A balcony is an unroofed extension from the wall of a building."
  ,a=ls "analytical"}
 ,{q="Name the defining method: A mule is a hoofed mammal, smaller than a horse."
  ,a=ls "synthetic"}
 ,{q="Name the defining method: A hammer is a tool used for bashing things or inserting nails."
  ,a=ls "typifying"}
 ,{q="Name the defining method: Swine are pigs."
  ,a=ls "synonymy"}
 ,{q="Name the defining method: Good day is a greeting often used when meeting for a short time while walking."
  ,a=ls "rule-based"}
 ,{q="Name the defining method: Remove: to take out, the man removed the items from the jar and placed them on the table."
  ,a=ls "exemplifying"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "WordFormationIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
