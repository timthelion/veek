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

module UJAZ.InflectiveIsolatingIntro where
import Nav
main = flow down [Nav.nav,
 [markdown|

##### Language typology


Languages are classified morphologically based on how they package gramatical information.  Do they include this information within the word through inflection, or do they have sepparate words to describe tense, gender, case ect.

From an intra-linguistic standpoint we classify languages along a spectrum from _analytic_ to _synthetic_.

Analytic languages or isolating languages do not have inflections using words rather than suffixes to express grammatical details.  Chinese is an analytic language.  English is a relatively analytic language as well.

Synthetic languages are at the other extreme.  There are two types of synthetic languages:

 - _Inflectional languages_ such as Czech have many grammatically inflected word endings.  These languages often feature noun inflection or [case](http://en.wikipedia.org/wiki/Grammatical_case) which is a foreign concept to the speaker of an analytic language.

 - _Agglutinating languages_ such as Finish or Turkish


<img src="../images/isolatingvsinflective.png" width="90%"/>

[Play level](IsolatingInflective.html)

|]
