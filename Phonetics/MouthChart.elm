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

module Phonetics.MouthChart where

import Vectors

w=640
h=400
ptc (x,y) = (x-(w/2),(h/2)-y) -- Pixel location to cartesian.
upperLip = ptc (134,155)
lowerLip = ptc (134,204)
toungTip = ptc (209,227)
toungBlade = ptc (238,190)
toungBack = ptc (336,219)
toungBase = ptc (390,296)
upperTooth = ptc (197,169)
alveolarRidge = ptc (211,135)
palat = ptc (351,111)
palatoAlveolar = ptc (255,101)
velar = ptc (249,185)
glotus = ptc (456,294)

-- Get the normal vector for a given vector
normal (x,y) =
 let
  len = sqrt (x^2+y^2)
 in
  (x/len,y/len)

-- Shorten vector by distance
shortenBy (x,y) dist =
 let
  (normalX,normalY) = normal (x,y)
  (diffX,diffY) = (normalX*dist,normalY*dist)
 in
  (x-diffX,y-diffY)

fy (x,y) = (x,0-y) -- Flip y axis https://github.com/evancz/Elm/issues/193

shortArrow (x1,y1) (x2,y2) =
 let
  vector = (x2-x1,y2-y1)
  start = (x1,y1)
  end = (\(x2v,y2v)->(x2v+x1,y2v+y1)) <| shortenBy vector 10

  -- arrow mid x(the center of the base of the triangle at the end of the arrow)
  (amx,amy) =  (\(x2v,y2v)->(x2v+x1,y2v+y1)) <| shortenBy vector 20

  -- The perpendicular normal vector to our arrow.
  (npx,npy) =
   let
    (nx,ny) = normal vector
   in
    (0-ny,nx)

  -- the points at the corners of the two sides of the triangle at the end of the arrow.
  side1p = (amx+npx*5,amy+npy*5)
  side2p = (amx-npx*5,amy-npy*5)
 in
 group
  [traced (solid black) <| segment (fy start) (fy end)
  ,traced (solid black) <| path [(fy side1p),(fy end),(fy side2p)]]

articulation : {place : (Float, Float), organ : (Float,Float), result :String} -> Element
articulation sound =
 mouth
   [move sound.place <| toForm <| plainText sound.result
   ,Vectors.shortArrow sound.organ sound.place]

mouth : [Form] -> Element
mouth forms =
 let
  w=640
  h=400
 in
 layers [image w h "images/mouth.png",collage w h forms]

