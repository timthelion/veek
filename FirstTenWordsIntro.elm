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

module FirstTenWordsIntro where
import MouthChart
import VowelChart
import Vectors
import Nav

vc = VowelChart.vowelChart 400

main = flow down [Nav.nav, [markdown|

## The ten most common words in English

The most common words used varries greatly based on the text examined.  Obviously, the greatest variation will be between informal spoken English and formal written English.  In a formal written document we may see no personal pronouns whereas in spoken informal speech these will typically be the most common words.

Here is the list of the top ten words in the wikipedia article on [English phonology](http://en.wikipedia.org/wiki/English_phonology):

1)  the /ðə/
2)  in  /ɪn/
3)  of  /əv/ -- British English /ʌv/
4)  is  /ɪz/
5)  and /ænd/ or /ənd/
6)  a   /ə/ or /eɪ/
7)  as  /æz/
8)  to  /tu/  (tu and bi are lengthened to tu: and bi: in British English)
9)  be  /bi/
10) or  /ɔɹ/ (/ɔː(ɹ)/ in RP)

Here are the 15 most common words from [this transcript of Episode 16 Season 29 of Saturday Night Live](http://snltranscripts.jt.org/03/03papprentice.phtml).

1) you   /ju/ (or /juː/ in RP)
2) I     /aɪ/
3) to    /tu/
4) the   /ðə/
5) it    /ɪt/
6) a     /ə/
7) what  /wət/ (/ʍɒt/ in RP)
8) of    /əv/
9) Jimmy /ʤɪmi/
10) and  /ænd/ or /ənd/(unstressed)

We see here that you and I are now at the top of our list, when they previously didn't appear in the entire document even once!  We also have one name on the list.  Since phonetics is primarilly a study of spoken English, we will focus on the seccond list in this lesson, minus that one name of course(I'll replace it with in /ɪn/).


Phonemes introduced this lesson: /j/,/u/,/aɪ/,/t/,/u/,/ð/,/ə/,/ɪ/,/w/,/v/,/æ/

## The Vowels

/ɪ/,/u/,/ə/,/æ/,/aɪ/

/ɪ/ - in, it, pit, bit, fit, lit

#### /ɪ/ near-close near-front unrounded vowel

|]
 ,collage 400 vc.h <| vc.forms ++ [move ((\(x,y)->(x+15,y-15)) vc.frontClose) <| toForm <| plainText "/ɪ/"]
 ,[markdown|

#### /u/ close back rounded vowel

/u/ - you, to, boot, toot, loot.

Note: those same examples would be lengthened to /uː/ in RP.

|]
 ,collage 400 vc.h <| vc.forms ++ [move ((\(x,y)->(x-15,y-15)) vc.backClose) <| toForm <| plainText "/u/"]
 ,[markdown|

#### /ə/ and /ʌ/. /ə/ schwa.  mid central vowel.

/ə/ - but, what, cut, rut

A very common vowel sound, though a bit problematic.  You will see in most dictionaries of AmE some words being transcribed with /ʌ/ and others being transcribed with /ə/.  Speakers of AmE do not distinguish between /ʌ/ and /ə/. In this game I do not transcribe with /ʌ/ at all using /ə/ in all cases.  [According to some linguists](http://linguisticmystic.com/2012/10/17/whats-the-difference-between-schwa-and-wedge/) we should use /ʌ/ in stressed cases and /ə/ in unstressed cases.  It is also interesting to note, that words commonly transcribed with /ə/ often have a greater allaphonic variation than words commonly transcribed with /ʌ/.  For example the word banana, typically transcribed /bən'næn ə/ (or /bə'nɑːn ə/ in BrE) may also be pronounced /bɪn'næn ə/, /bɑ'næn ə/ or even something approaching /bæn'næn ə/.  However "what" can ONLY be pronounce /wət/(/wʌt/) in AmE.  We are of course speaking only of allaphonic variation within a given accent.  In BrE, the word "what" is pronounced as /ʍɒt/, and in Australian English it is pronounced as /wɔt/.

|]
 ,collage 400 vc.h <| vc.forms ++ [move ((\(x1,y1) (x2,y2)->(x1,y1+(y2-y1)/2)) vc.centralHalfClose vc.centralHalfOpen) <| toForm <| plainText "/ə/"]
 ,[markdown|

#### /æ/ near-open front unrounded vowel

/æ/ - have, sad, lad, glad, mad

This is the sound of a healthy babies cry.  When you change a babies diaper it should say /æ/!

|]
-- ,collage 400 vc.h <| vc.forms ++ [move ((\(x1,y1) (x2,y2)->(x1+(x2-x1)/2,y1+(y2-y1)/2)) vc.frontOpen vc.frontHalfOpen) <| toForm <| plainText "/æ/"]
 ,[markdown|

#### /aɪ/ - closing diphthong

/aɪ/ -
     I, ride, file, file, pie
OR   rice, price, ice

 Note: Due to prefortis shortening the latter examples have a slightly different pronunciation.  I, and ride are pronounced with [aɪ] where as rice is pronounce with [əɪ]

|]
 ,collage 400 vc.h <| vc.forms ++ ((\(x1,y1) (x2,y2) (x3,y3) (x4,y4)->(\(sx,sy) (ex,ey) ->[move (sx,sy+10) <| toForm <| plainText "/aɪ/", Vectors.shortArrow (sx,sy+20) (ex,ey)])(x1+(x2-x1)/2,y1+(y2-y1)/2) (x3+(x4-x3)/2,y3+(y4-y3)/2)) vc.frontOpen vc.centerOpen vc.frontHalfClose vc.centerHalfClose)
 ,[markdown|

## The Consonants

/j/,/t/,/v/,/ð/,/w/

#### /j/ palatal approximant

/j/ - you, yes, yesterday, canyon, yard

|]
 ,MouthChart.mouth
   [move MouthChart.placesOfArticulation.palat <| toForm <| plainText "j"
   ,Vectors.shortArrow MouthChart.placesOfArticulation.toungBack MouthChart.placesOfArticulation.palat]
 ,[markdown|

#### /t/ voiceless alveolar plosive

/t/ time, talk, teach, touch, tangle, too, tooth, tit for tat

|]

 ,MouthChart.mouth
   [move MouthChart.placesOfArticulation.alveolarRidge <| toForm <| plainText "t"
   ,Vectors.shortArrow MouthChart.placesOfArticulation.toungTip MouthChart.placesOfArticulation.alveolarRidge]

 ,[markdown|

#### /v/ voiced labiodental fricative

/v/ very, verbose, every, even, eve, ever, average

|]
 ,MouthChart.mouth
   [move MouthChart.placesOfArticulation.alveolarRidge <| toForm <| plainText "v"
   ,Vectors.shortArrow MouthChart.placesOfArticulation.toungTip MouthChart.placesOfArticulation.alveolarRidge]
 ,[markdown|

#### /ð/ voiced dental non-sibilant fricative

/ð/ - the, that, father, lather, bathe, gather

|]
 ,MouthChart.mouth
   [move MouthChart.placesOfArticulation.upperTooth <| toForm <| plainText "ð"
   ,Vectors.shortArrow MouthChart.placesOfArticulation.toungTip MouthChart.placesOfArticulation.upperTooth]
 ,[markdown|
[Play level](FirstTenWords.html)
|]]
