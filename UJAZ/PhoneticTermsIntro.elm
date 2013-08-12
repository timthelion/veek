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

module UJAZ.PhoneticTermsIntro where
import Nav
main = flow down [Nav.nav,
 [markdown|

### Basic Phonetic terms

#### [Phonetics vs. Phonology](http://www.phon.ox.ac.uk/jcoleman/PHONOLOGY1.htm)

A _phoneme_ic alphabet is an alphabet of sounds where all sounds are phonemically distinct from each other.  We determine if two sounds are phonemically distinct using the rule of minimum phonemic pairs. The rule states, that if we can find two words which differ only in one place, than the two variations are phonemically distinct from each other.  Since /pæt/ and /mæt/ differ only in the beginning of the word we say that /p/ and /m/ are distinct from each other.  The words /pæt/ and /mæt/ are said to be a minimum phonetic pairing for the _phonemes_ /p/ and /m/.

Not all speakers say the phoneme /p/ the same way.  The variations of the _phoneme_ /p/ are called allophones.  Indeed, a better way of thinking about that, is that the phoneme /p/ is a group of allophones.

Even the symbols used to represent allophones are not precise representations of sound.  Phones are specific speech sounds.  So we get this kind of unsturdy hierarchy:  The set of all phones is the set of all possible sounds.  Each allophone is a set of phones.  Each phoneme is a set of allophones.

_Phonotactic_ rules determine which allophones can appear next to each other in speech.  Usually, this is determined by limitations in the human speech organs.

#### Types of transcription.

_Phonemic transcription_ is the transcription of contrastive phonemes.  Phonemic transcriptions are offset in forward slashes / /.

_Phonetic transcription_ is the transcription of allophones, to whatever precision needed.  Phonetic transcription is offset in brackets [ ].

_Orthographic transcription_ is transcription in the alphabet native to the language being transcribed. For example, English orthographic transcription is done using Latin script, Russian orthographic transcription using Cyrillic.  Orthographic transcriptions may be offset in chevrons ⟨ ⟩.

_Morphemic transcription_ when a single morpheme is transcribed it is usually surrounded by curly brackets { }, but may also be offset by pipes | |.

[Play level](PhoneticTerms.html)

|]]
