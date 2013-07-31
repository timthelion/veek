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

module LanguageClassification where
import Nav
main = flow down [Nav.nav,
 [markdown|
## Overview of linguistic terms

### Language Functions

Language has two main functions:

1) Interaction

 The social/emotional function of language

2) Transaction

 The exchange of information

### Human vs Animal

Human language has 6 unique features which distinguish it from the language of Animals.

1) Displacement

 We use language to discuss events, actualities, or objects which are displaced in space and time.  For example, if I say that "the chair is in the next room", I am speaking about an object that is not here and is thus displaced from me.

2) Arbitrariness

The formation of words is arbitrary or abstract.  There are many onomatopoeic words such as 'moo', 'bang', and 'blub'.  Most words, however, are not onomatopoeic.  They have an entirely arbitrary form.  For example, what relationship do the letters/sounds 't', 'a', 'b', 'l', 'e' have to the piece of furniture upon which my computer now rests?

3) Productivity

New words can be created to refer to new concepts, thus providing us with an unlimited capacity to describe the world.

4) Cultural transmission

The ability to communicate in a given language is not instinctual or genetic.  It is transmitted through learning from other speakers of the language.  Children learn to speak a language by listening to those around them.

5) Discreteness

Sounds and words can be clearly distinguished from one another.  So when a person says the word 'cat' they are either understood, or not understood, however the listener never interprets a mispronunciation of the word 'cat' to mean "somewhat catlike".

6) Duality or double articulation

Any stream of speech is made up of several layers of meaningful units: sentences, words. Those meaningful units can then be broken down into meaningless units: letters or phonemes.

### Cognates

Different languages often have similar words.  When these words are similar because the two languages diverged from one proto-language then we say that the words are _cognates_.

Cognates _ARE_: Two words in two related languages that sound the same and came from the same source word in those two languages proto-language.

Example: The word "hound" in English refers to a hunting dog, whereas in German "Hund" refers to a dog.

Cognates are _NOT_: Borrowings, Unrelated words with similar sound

[Doublets](http://en.wikipedia.org/wiki/Doublet_%28linguistics%29) (or possibly _triplets_ are cognates within a single language.  For example: frail and fragile both have the same root and similar form and meaning.  Their corresponding Latin root is/was "fragilis".

### [Diachronic and synchronic](http://faculty.washington.edu/cbehler/glossary/diachron.html) standpoints

_Diachronic study_ focuses on the development of language over time.

_Synchronic study_ focuses on a given state(usually the present state), of language: It's grammar, lexicon, phonetics.

### Basic Phonetic terms

#### [Phonetics vs. Phonology](http://www.phon.ox.ac.uk/jcoleman/PHONOLOGY1.htm)

A _phoneme_ic alphabet is an alphabet of speech sounds where all sounds are phonemically distinct from each other.  We determine if two sounds are phonemically distinct using the rule of minimum phonemic pairs. The rule states, that if we can find two words which differ only in one place, than the two variations are phonemically distinct from each other.  Since /pæt/ and /mæt/ differ only in the beginning of the word we say that /p/ and /m/ are distinct from each other.  The words /pæt/ and /mæt/ are said to be a minimum phonetic pairing for the _phonemes_ /p/ and /m/.

Not all speakers say the phoneme /p/ the same way.  The variations of the _phoneme_ /p/ are called allophones.  Indeed, a better way of thinking about that, is that /p/ is a group of allophones.

Even the symbols used to represent allophones are not precise representations of sound.  Phones are specific speech sounds.  So we get this kind of unsturdy hierarchy:  The set of all phones is the set of all possible sounds.  Each allophone is a set of phones.  Each phoneme is a set of allophones.

_Phonotactic_ rules determine which allophones can appear next to each other in speech.  Usually, this is determined by limitations in the human speech organs.

#### Types of transcription.

_Phonemic transcription_ is the transcription of contrastive phonemes.  Phonemic transcriptions are offset in forward slashes / /.

_Phonetic transcription_ is the transcription of allophones, to whatever precision needed.  Phonetic transcription is offset in brackets [ ].

_Orthographic transcription_ is transcription in the alphabet native to the language being transcribed. For example, English orthographic transcription is done using Latin script, Russian orthographic transcription using Cyrillic.  Orthographic transcriptions may be offset in chevrons ⟨ ⟩.

_Morphemic transcription_ when a single morpheme is transcribed it is usually surrounded by curly brackets { }, but may also be offset by pipes | |.

### Written language

_Grapheme_: What we would normally refer to as a letter.

_Allograph_:  A specific style of writing a grapheme.

_Graph_: A specific instance of an allograph.

### Morphologic terminology

_Lexeme_: is the set of all word forms which share, meaning, root, and word class.  For example, one lexeme is ⟨jump⟩ , ⟨jumps⟩ , ⟨jumping⟩ , ⟨jumped⟩.

_Lemma_: is the base form of the lexeme which is used as a "citation form".  It's the form that we use to refer to that lexeme.  If you look up the lexeme ⟨jump⟩ in the dictionary, you will find the lemma ⟨jump⟩ but not the other forms  ⟨jumps⟩ , ⟨jumping⟩ , and ⟨jumped⟩.

[_Morpheme_](http://davidbrett.uniss.it/morphology/intro.html): Is the shortest string of phonemes which holds meaning.  For example, we can cut the word ⟨blackish⟩ into {black} and {ish}.  I strongly suggest [this site](http://davidbrett.uniss.it/morphology/intro.html) for training your knowledge of morphemes.

 - _Free morpheme_:  A morpheme, which taken out of context and placed on it's own, is still a valid word:  {trance} in ⟨en-trance⟩

 - _Bound morpheme_: A morpheme, which taken out of context and paced on it's own, does not form a valid word: {en-} in ⟨en-trance⟩

_Allomorph_:

_Morph_:

_Sememe_:

_Seme_:

### Saussure and Chomsky

_Saussure_

 - Langue

 The abstract language system, grammar

 - Parole

 The concrete manifestation of language

_Chomsky_

 - Competence

 Inborn ability to understand language patterns

 - Performance

 The use of speech by an individual person

 |]
