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

module Morphology.TenseIntro where
import Nav
main = flow down [Nav.nav,
 [markdown|

## Verb tense

#### Simple Present Tense

<img src="../images/ship.png" width="90%"/>

The ship is very large(**S**ate present). It sails the sea far and wide(**H**abitual present). And sinks suddenly(**I**nstantaneous present). And just as it's keel broke the surface, a giant bubble comes up and makes this hideous shreak(simple present tense for **P*ast)!

#### Simple Past Tense

<img src="../images/sheep.png" width="90%"/>

The sheep was tired(**S**tate past) as the sheep was tired every evening(**H**abitual past). The sheep walked to the barn(**E**vent **P**ast).

[Play level](Tense.html)

|]]
