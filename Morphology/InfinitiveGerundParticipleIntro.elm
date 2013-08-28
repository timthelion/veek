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

module Morphology.InfinitiveParticipleGerundIntro where
import Nav
main = flow down [Nav.nav,
 flow right [
 [markdown|

## Infinitive

to eat
to be eating
to have eaten
to have been eating

 |]

 ,[markdown|

## Participle

eating
having eaten
being eaten
having been eaten
eaten

|]
 ,[markdown|

## Gerund

eating
having eaten
being eaten
having been eaten

|]]
 ,[markdown|

### The infinitive

Infinitive as subject: To be a star was his greatest dream.

Infinitive as subject complement: His greatest dream was to be a star.

Infinitive as object: He learned to sing.

Infinitive as adverbial: He whent to school to learn to sing.

Many other uses.

### The Gerund

Noun like uses of `-ing` form.

### The participle

Attributive and adverbial uses of the `-ing` form.

[Play level](InfinitiveGerundParticiple.html)

|],Nav.footer]
