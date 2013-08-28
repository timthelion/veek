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

module Lexicology.WordFormationIntro where
import Nav
main = flow down [Nav.nav,
 [markdown|

## Terminology

_Lexeme_: is the set of all word forms which share, meaning, root, and word class.  For example, one lexeme is ⟨jump⟩ , ⟨jumps⟩ , ⟨jumping⟩ , ⟨jumped⟩.

_Lemma_: is the base form of the lexeme which is used as a "citation form".  It's the form that we use to refer to that lexeme.  If you look up the lexeme ⟨jump⟩ in the dictionary, you will find the lemma ⟨jump⟩ but not the other forms  ⟨jumps⟩ , ⟨jumping⟩ , and ⟨jumped⟩.

[_Morpheme_](http://davidbrett.uniss.it/morphology/intro.html): Is the shortest string of phonemes which holds meaning.  For example, we can cut the word ⟨blackish⟩ into {black} and {ish}.  I strongly suggest [this site](http://davidbrett.uniss.it/morphology/intro.html) for training your knowledge of morphemes.

 - _Free morpheme_:  A morpheme, which taken out of context and placed on it's own, is still a valid word:  {trance} in ⟨en-trance⟩

 - _Bound morpheme_: A morpheme, which taken out of context and paced on it's own, does not form a valid word: {en-} in ⟨en-trance⟩

_Allomorph_ = _Morph_: A specific variant of a morpheme.  For example, due to phonotactic rules, the morpheme [-s], which makes words plural has two allomorphs: /s/ and /z/. /kɑrdz/ vs /kæps/

_Sememe_: The semantic unit wich a lexeme represents.

_Seme_: A specific meaning of a sememe.

[Play level](BasicTerms.html)

|],Nav.footer]
