module Morphology.Pronouns where

import Veek
import JavaScript as JS

ls = Veek.letters

tasks' =
 [{q="Determine the type of pronoun(my): He stole my icecream!"
  ,a=ls "possessive"}
 ,{q="Determine the type of pronoun(himself): He got up all by himself."
  ,a=ls "reflexive"}
 ,{q="Determine the type of pronoun(one another): They looked at one another and winked."
  ,a=ls "reciprocal"}
 ,{q="Determine the type of pronoun(which): Which kind of chocolate coating would you like?"
  ,a=ls "interrogative"}
 ,{q="Determine the type of pronoun(which): He took the magazine which lay on the table."
  ,a=ls "relative"}
 ,{q="Determine the type of pronoun(every): Every child deserves to binge on mint chocolate chip icecream at least once in a while."
  ,a=ls "indefinite"}
 ,{q="Determine the type of quantifier(all): All men are evil."
  ,a=ls "universal"}
 ,{q="Determine the type of quantifier(something): Something smells of fish."
  ,a=ls "existential"}
 ,{q="Determine the type of quantifier(nothing): Nothing is better than vanilla icecream dipped in chocolate."
  ,a=ls "negative"}
 ,{q="Determine the type of indefinite(little):  Too little has been said of the evils of college degrees."
  ,a=ls "partitive"}
 ,{q="The word much in the sentence \"There was so much molten cheese on the pizza that it could have been used as a fondue pot.\" is a quantifier expressing ______."
  ,a=ls "quantity"}
 ,{q="Determine the type of indefinite(somebody): Somebody pass the pepper please!"
  ,a=ls"partitive"}
 ,{q="Determine the type of indefinite(everybody): Everybody clap their hands!"
  ,a=ls "universal"}
 ,{q="The word neither in the sentence \"Neither cotton candy nor marshmallows alone could satiate him.\" is a _______ universal indefinite."
  ,a=ls "negative"}
 ,{q="Determine the type of indefinite(either): Either will do."
  ,a=ls "partitive"}
 ,{q="Determine the type of quantifier(either): Either will do."
  ,a=ls "existential"}]

(redirect,game) = Veek.veekGame
 {alphabet = Veek.makeAlphabet tasks'
 ,nextLevel = "AdjectivesIntro.html"
 ,home = "../Intro.html"
 ,tasks = tasks'}

foreign export jsevent "redirect"
   redirect : Signal JSString

main = game
