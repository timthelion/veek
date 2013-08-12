module Intro where
{-
GPL 3.0 - Timothy Hobbs <timothyhobbs@seznam.cz>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, version 3 of the License.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
-}

import Window
import Time
import Graphics.Input as Input
import Keyboard
import Char
import Nav

eek = text $ bold $ toText "eek!"

textHeight = heightOf eek
veekHeight = round $ (toFloat textHeight)*1.5
veekWidth = textHeight

veekVertexes f =
 (if | f == 0    -> [] 
     | f == 1    -> [(0-(veekWidth `div` 4),0-(veekHeight `div` 2))]
     | otherwise -> [(0-(veekWidth `div` 4),0-(veekHeight `div` 2))
                    ]) -- ,(0,0-(textHeight `div` 2))])
 ++[(0-(veekWidth `div` 2),0-(textHeight `div` 2))
 ,(0,textHeight `div` 2)
 ,((veekWidth `div` 2),0-(textHeight `div` 2))]++
 (if | f == 0    -> []
     | f == 1    -> [(veekWidth `div` 4,0-(veekHeight `div` 2))]
     | otherwise -> [(veekWidth `div` 4,0-(veekHeight `div` 2))
                    ,(0,0-(textHeight `div` 3))])


veekOutline f = path (veekVertexes f)

veekV f =
 if | f < 3 -> traced (solid black) (veekOutline f)
    | otherwise -> filled red $ polygon (veekVertexes f)

v f = collage veekWidth veekHeight [veekV f]

veek f = flow right [v f,eek]
vs = plainText "    vs"
exams = plainText "The Comprehensive Exams"
usage = [markdown|

Welcome to Veek!  Veek! is an educational game made to prepare you for the Charles University KAJL Bachelors Comprehensive Exams.

Veek is a robot designed by the grand Über-European Educational Comittee for Progress Development Social Perfection Equality Democracy and Agricultural Fairness(ÜEECPDSPEDAF for short).  Veek's mission is to retreive particles of knowlege from the endless caverns of doom.

Every level you will take a journey with Veek through the cavern of doom.  You will be presented with a set of questions and you'll have to collect particles in order to answer them.

Here's an example question. "When discussing word formation 'lubritection' is a _ _ _ _ _".  The correct answer is "blend".

The game is a bit of a mixture of hangman and pacman.  Veek! needs to eat the correct particles(letters) and avoid ones that don't belong.

Navigation is simple, just use the arrow keys.

Good luck!

|]
levelLinks = [markdown|

## Levels

### Introduction to Language (ÚJAZ)

[Classification and History of Languages](UJAZ/LanguageClassification.html)

[Isolating vs Inflective](UJAZ/IsolatingInflectiveIntro.html)

[The semiotic triangle](UJAZ/SemioticTriangleIntro.html)

[Basic linguistic terms](UJAZ/LinguisticTermsIntro.html)

### Sounds - Phonetics and Phonology

Other resources: [Kevin Russell´s resources on phonetics](http://home.cc.umanitoba.ca/~krussll/phonetics/index.html)

Note: This unit focuses on US English not on RP!

[Phonemes found in the ten most frequent words](Phonetics/FirstTenWordsIntro.html)

[Plosives](Phonetics/PlosivesIntro.html)

[Approximants](Phonetics/ApproximantsIntro.html)

[Pure vowels](Phonetics/PureVowelsIntro.html)

[Fricatives](Phonetics/FricativesIntro.html)

[Affricates](Phonetics/AffricatesIntro.html)

[Diphthongs and triphtongs](Phonetics/DiphthongsIntro.html)

[Nasals](Phonetics/NasalsIntro.html)

[Laterals](Phonetics/LateralsIntro.html)

[Connected speech(linking, elision, juncture)](ConnectedIntro.html)

[Dentalization and darkness](Phonetics/DarklIntro.html)

[Word stress](Phonetics/WordStressIntro.html)

[Sentence stress](Phonetics/SentenceStressIntro.html)

[Weak forms](Phonetics/WeakFormsIntro.html)

[Intonation](Phonetics/IntonationIntro.html)

This information on Phonetics and Phonology is taken in part from the Longman Pronunciation Dictionary, 3rd Edition by J.C.Wells, in part from Wikipedia/Wiktionary and in part from Mgr. Kristýna Poesová, Ph.D.'s note's.

### Parts of words, origins of words - Lexicology

### Words and how they change in different places - Morphology

### Strings of words - Syntax

|]

animateIntro f
 = flow down <| [veek f] ++
 ( if | f <  4 -> []
      | f >= 4 -> [vs]) ++
 ( if | f <  5 -> []
      | f >= 5 -> [exams]) ++
 ( if | f <  8-> []
      | f >= 8-> [usage]) ++
 ( if | f <  10-> []
      | f >= 10-> [levelLinks]) ++
 ( if | f <  10-> []
      | f >= 10-> [Nav.footer])

frame = foldp (\_ f->f+1) 0 (every (0.7 * second))

main = animateIntro <~ frame
