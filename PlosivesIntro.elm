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

module PlosivesIntro where
import MouthChart
import Vectors
import Nav

main : Element
main = flow down [Nav.nav, [markdown|

Plosives are sounds which are produced when the movement of air is stopped for a time and then suddenly released.  The plosives include three pairs of voiced and unvoiced consonants: /d/ /t/, /b/ /p/, and /g/ /k/.

### /d/ and /t/ voiced and unvoiced alveolar plosive
|]
 ,MouthChart.articulation
   {organ=MouthChart.toungTip
   ,place=MouthChart.alveolarRidge
   ,result="/d/ or /t/"}
 ,[markdown|

#### /d/ voiced alveolar plosive

/d/ - dad, dog, distrust, damage, undo, odd, admire, admit

#### /t/ unvoiced alveolar plosive

/t/ - tad, dot, teach, touch, untie, list, last, stripe

### /b/ and /p/ voiced and unvoiced bilabial plosive
|]
 ,MouthChart.articulation
   {organ=MouthChart.lowerLip
   ,place=MouthChart.upperLip
   ,result="/b/ or /p/"}
 ,[markdown|

#### /b/ voiced bilabial plosive

/b/ - Bob, bat, bad, bit, bond, belly, embed, abdicate, Alabama, lab, cab, grab

#### /p/ unvoiced bilabial plosive

/p/ - person, pet, piano, pat, pot, pitty, pink, imp, limp, lamp, amp, lap, gap, map, lip, moped, lepard

### /g/ /k/ voiced and unvoiced velar plosives
|]
 ,MouthChart.articulation
   {organ=MouthChart.toungBack
   ,place=MouthChart.velar
   ,result="/g/ or /k/"}
 ,[markdown|

#### /g/ voiced velar plosive

/g/ - great, get, gather, hag, lag, bag, bog, fog, log, pog, leg, Megan, Gregore, gag, gaga

#### /k/ unvoiced velar plosive

/k/ - cat, lack, sack, cracker, Katie, crispy, cot, smack

### [Aspiration](http://home.cc.umanitoba.ca/~krussll/phonetics/narrower/aspiration.html)

### Our alphabet so far

Vowels: /u/,/ə/,/ɪ/,/æ/

Diphthongs: /aɪ/

Fricatives: /v/,/ð/

Nasals: /n/

Approximants:/w/,/j/

Plosives: /d/,/t/,/b/,/p/,/g/,/k/

[Play level](Plosives.html)


|]
 ,Nav.footer]
