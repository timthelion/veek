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

module Morphology.VoiceIntro where
import Nav
main = flow down [Nav.nav,
 [markdown|

## Voice

### Active voice

The cat jumped on the mouse.

### Passive voice

The mouse was jumped on by the cat.

[Next lesson](InfinitiveGerundParticipleIntro.html)

|],Nav.footer]
