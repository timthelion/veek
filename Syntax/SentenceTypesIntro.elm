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

module Syntax.SentenceTypesIntro where
import Nav
main = flow down [Nav.nav,
 [markdown|

## Sentence Types

### Statements

<img src="../images/statement.png" width="100%"/>

### Questions

<img src="../images/question.png" width="100%"/>

### Directives

<img src="../images/directive.png" width="100%"/>

### Exclamation

<img src="../images/exclamation.png" width="100%"/>

[Play level](SentenceTypes.html)
|],Nav.footer]
