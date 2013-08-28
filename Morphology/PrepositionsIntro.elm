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

module Morphology.PrepositionsIntro where
import Nav
main = flow down [Nav.nav,
 [markdown|

## Prepositions

Prepositions are words like at, for, in, on which proceed prepositional phrases.

#### Deferred prepositions

I have called _for_ a taxi.

A taxi has been called _for_.

#### Prepositional meanings

<img src="../images/prepositions.html" width="90%"/>

[Play level](Prepositions.html)

|],Nav.footer]
