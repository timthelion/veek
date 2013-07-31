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

module PureVowelsIntro where
import VowelChart
import Vectors
import Nav

vc : {h : Int, frontClose : (Float,Float) , centralClose : (Float, Float), backClose : (Float,Float),frontHalfClose : (Float,Float),centralHalfClose : (Float,Float),backHalfClose : (Float,Float),frontHalfOpen : (Float,Float),centralHalfOpen : (Float,Float),backHalfOpen : (Float,Float),frontOpen : (Float,Float),centralOpen : (Float,Float),backOpen : (Float,Float),forms : [Form]}
vc = VowelChart.vowelChart 400

main = flow down [Nav.nav,[markdown|

## The pure vowels

/i/,/ɪ/,/ɛ/,/æ/,/ɝ/,/ɑ/,/ɔ/,/ʊ/,/u/,/ə/

|]
 ,VowelChart.vowels
  [{point=(\(x,y)->(x+35,y-65)) vc.frontClose
   ,label="/ɪ/"}
  ,{point=vc.frontClose
   ,label="/i/"}
  ,{point=Vectors.average vc.frontHalfClose vc.frontHalfOpen
   ,label="/ɛ/"}
  ,{point=vc.frontOpen
   ,label="/æ/"}
  ,{point=vc.backOpen
   ,label="/ɑ/"}
  ,{point=vc.backHalfOpen
   ,label="/ɔ/"}
  ,{point=Vectors.average vc.centralHalfClose vc.backClose
   ,label="/ʊ/"}
  ,{point=vc.backClose
   ,label="/u/"}
  ,{point=Vectors.average vc.centralHalfClose vc.centralHalfOpen
   ,label="/ə/"}]
 ,[markdown|

#### /i/ [Close Front Unrounded Vowel](https://en.wikipedia.org/wiki/Close_front_unrounded_vowel)

/i/ - Eat, leap, feet, greet, beat, beet

|]
 ,VowelChart.vowels
  [{point=vc.frontClose
   ,label="/i/"}]
 ,[markdown|

#### /ɪ/ [Near-close Near-front unrounded vowel](https://en.wikipedia.org/wiki/Near-close_near-front_unrounded_vowel)

/ɪ/ - bit, lit, hit, mitt, zit, grit, Memphis, Mississippi

|]
 ,VowelChart.vowels
  [{point=(\(x,y)->(x+35,y-65)) vc.frontClose
   ,label="/ɪ/"}]
 ,[markdown|

####  /ɛ/ [Open-mid Front Unrounded Vowel](https://en.wikipedia.org/wiki/Open-mid_front_unrounded_vowel)

Note:  According to English phonetic tradition this phoneme is often transcribed with /e/. This is a non standard usage however.  In IPA /e/ is actually a [Close-mid Front unrounded Vowel](https://en.wikipedia.org/wiki/Close-mid_front_unrounded_vowel) and has a sound somewhat closer to /i/ than /ɛ/.

/ɛ/ - bet, let, set, get, hemp, rent, pent

|]
 ,VowelChart.vowels
  [{point=Vectors.average vc.frontHalfClose vc.frontHalfOpen
   ,label="/ɛ/"}]
 ,[markdown|

#### /æ/ [Near-open Front Unrounded Vowel](https://en.wikipedia.org/wiki/Near-open_front_unrounded_vowel)

/æ/ - bat, fat, cat, mat, sat, brat, flat, scat, zap, lap

|]
 ,VowelChart.vowels
  [{point=vc.frontOpen
   ,label="/æ/"}]
 ,[markdown|

#### /ɝ/ [R-colored Vowel](https://en.wikipedia.org/wiki/%C9%9D)

Note: /ɝ/ and /ɚ/ is another controversial pair of stressed and unstressed phonemes.  Like /ə/ and /ʌ/ they have essentially the same sound.  However, this time, I have chosen to always transcribe with /ɝ/ and not include /ɚ/in my alphabet.

Also note: /ɚ/ is transcribed as /ᵊr/ in Well's Longman Dictionary.

/ɝ/ - girl, curl, hurl, perl, father, brother, mother, driver, baby-sitter, derby

I did not include a chart as I cannot find any information on how closed or how far back this sound supposedly is.

#### /ɑ/ [Open Back Unrounded Vowel](https://en.wikipedia.org/wiki/Open_back_unrounded_vowel)

/ɑ/ - father, bother, garden, harden, lard, card, guard, yard, star, mob, god, cod, shoddy, crop, mop, Scott, brought, thought, hot,

Note: plot, hot, thought and other words containing the phoneme /ɑ/ are pronounced differently in British English.  Specifically, /ɑ/ is replaced with [/ɒ/](https://en.wikipedia.org/wiki/Open_back_rounded_vowel) or [/ɔ/](https://en.wikipedia.org/wiki/Open-mid_back_rounded_vowel)

In BrE plot is transcribed as /plɒt/, /ɒ/ being an [Open back rounded vowel](https://en.wikipedia.org/wiki/Open_back_rounded_vowel) where as in AmE plot is transcribed as /plɑt/.  /ɑ/ is replaced with /ɒ/ in hot and many other words as well.

In BrE thought is transcribed as /θɔt/, see the [Cot-caught merger](http://en.wikipedia.org/wiki/Phonological_history_of_English_low_back_vowels#Cot.E2.80.93caught_merger). |]
 ,VowelChart.vowels [{point=vc.backOpen
   ,label="/ɑ/"}]
 ,[markdown|

#### /ɔ/ [Open-mid Back Rounded Vowel](https://en.wikipedia.org/wiki/Open-mid_back_rounded_vowel)

/ɔ/ - court, course, horse, lord, port, abort
|]
 ,VowelChart.vowels
  [{point=vc.backHalfOpen
   ,label="/ɔ/"}]
 ,[markdown|

#### /ʊ/ [Near-close Near-back Rounded Vowel](https://en.wikipedia.org/wiki/Near-close_near-back_rounded_vowel)

/ʊ/ - put, soot, foot, hook, book, look, mistook, brook, cook

|]
 ,VowelChart.vowels
  [{point=Vectors.average vc.centralHalfClose vc.backClose
   ,label="/ʊ/"}]

 ,[markdown|

#### /u/ [Close Back Rounded Vowel](https://en.wikipedia.org/wiki/Close_back_rounded_vowel)

/u/ - Blue, clue, rude, glue, moon, soon, balloon, zoom, vroom

|]
 ,VowelChart.vowels
  [{point=vc.backClose
   ,label="/u/"}]
 ,[markdown|

#### /ə/ Schwa - [Mid-central Vowel](https://en.wikipedia.org/wiki/Mid-central_vowel)

Note: Controversies surrounding this phoneme are discussed in the [Ten Most Common Words](FirstTenWordsIntro.html) article.

/ə/ - What, but, hut, mutt, gut, luck, honey, money, banana

|]
 ,VowelChart.vowels
  [{point=Vectors.average vc.centralHalfClose vc.centralHalfOpen
   ,label="/ə/"}]

 ,[markdown|

### Our alphabet so far

Vowels: /i/,/ɪ/,/ɛ/,/æ/,/ɝ/,/ɑ/,/ɔ/,/ʊ/,/u/,/ə/

Diphthongs: /aɪ/

Fricatives: /v/,/ð/

Nasals: /n/

Approximants:/w/,/j/

Plosives: /d/,/t/,/b/,/p/,/g/,/k/


[Play level](PureVowels.html)



 |]
 ,Nav.footer]

