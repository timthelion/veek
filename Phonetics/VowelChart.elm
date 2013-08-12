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
module Phonetics.VowelChart where

import Vectors

vowelChart : Float -> {h : Int, frontClose : (Float,Float) , centralClose : (Float, Float), backClose : (Float,Float),frontHalfClose : (Float,Float),centralHalfClose : (Float,Float),backHalfClose : (Float,Float),frontHalfOpen : (Float,Float),centralHalfOpen : (Float,Float),backHalfOpen : (Float,Float),frontOpen : (Float,Float),centralOpen : (Float,Float),backOpen : (Float,Float),forms : [Form]}
vowelChart w =
 let
  closeLabel = plainText "Close"
  halfCloseLabel = plainText "Half-Close"
  halfOpenLabel = plainText "Half-Open"
  openLabel = plainText "Open"
  frontLabel = plainText "Front"
  centralLabel = plainText "Central"
  backLabel = plainText "Back"
  leftCText = 0-w/2
  leftTextMargin = (toFloat <| widthOf halfCloseLabel)+7
  chartWidth=w-leftTextMargin
  h = 2*chartWidth
  textTop = h/2 - ((toFloat <| heightOf frontLabel)/2)
  topLabelMargin = (toFloat <| heightOf frontLabel) + 10
  bottomMargin = 5
  chartHeight = h - topLabelMargin - bottomMargin
  top = h/2-topLabelMargin
  leftC = 0-w/2+leftTextMargin
  rightC = chartWidth/2
  bottomHOffset = chartWidth / 10

  seccondRowX = leftC + (bottomHOffset/3)
  thirdRowX   = leftC + ((2*bottomHOffset)/3)
  forthRowX   = leftC + bottomHOffset

  seccondRowY = top - (chartHeight/3)
  thirdRowY   = top - (2*chartHeight/3)
  forthRowY   = top - chartHeight
  tcg = traced (solid grey)
  fy (x,y) = (x,0-y) -- Flip y axis https://github.com/evancz/Elm/issues/193
  vc =
   {h = h
   ,frontClose=(leftC,top)
   ,centralClose=(0,top)
   ,backClose=(rightC,top)
   ,frontHalfClose=(seccondRowX,seccondRowY)
   ,centralHalfClose=(0,seccondRowY)
   ,backHalfClose=(rightC,seccondRowY)
   ,frontHalfOpen=(thirdRowX,thirdRowY)
   ,centralHalfOpen=(0,thirdRowY)
   ,backHalfOpen=(rightC,thirdRowY)
   ,frontOpen=(forthRowX,forthRowY)
   ,centralOpen=(0,forthRowY)
   ,backOpen=(rightC,forthRowY)
   }
 in
  {vc|forms =
   [move (leftCText+(toFloat <| widthOf closeLabel)/2,top) <| toForm closeLabel
   ,move (leftCText+(toFloat <| widthOf halfCloseLabel)/2,seccondRowY) <| toForm halfCloseLabel
   ,move (leftCText+(toFloat <| widthOf halfOpenLabel)/2,thirdRowY) <| toForm halfOpenLabel
   ,move (leftCText+(toFloat <| widthOf openLabel)/2,forthRowY+(toFloat <| heightOf openLabel)) <| toForm openLabel

   ,tcg <| segment (fy vc.frontClose) (fy vc.backClose)
   ,tcg <| segment (fy vc.frontHalfClose) (fy vc.backHalfClose)
   ,tcg <| segment (fy vc.frontHalfOpen) (fy vc.backHalfOpen)
   ,tcg <| segment (fy vc.frontOpen) (fy vc.backOpen)

   ,move (leftC ,textTop) <| toForm frontLabel
   ,move (0,textTop) <| toForm centralLabel
   ,move (rightC-(toFloat <| widthOf backLabel)/2,textTop) <| toForm backLabel

   ,tcg <| segment (fy vc.frontClose) (fy vc.frontOpen)
   ,tcg <| segment (fy vc.centralClose) (fy vc.centralOpen)
   ,tcg <| segment (fy vc.backClose) (fy vc.backOpen)]}

vc : {h : Int, frontClose : (Float,Float) , centralClose : (Float, Float), backClose : (Float,Float),frontHalfClose : (Float,Float),centralHalfClose : (Float,Float),backHalfClose : (Float,Float),frontHalfOpen : (Float,Float),centralHalfOpen : (Float,Float),backHalfOpen : (Float,Float),frontOpen : (Float,Float),centralOpen : (Float,Float),backOpen : (Float,Float),forms : [Form]}
vc = vowelChart 400

vowel : (Float,Float) -> String -> Element
vowel p v = vowels [{point=p,label=v}]

vowels : [{point:(Float,Float),label:String}] -> Element
vowels vs =
 collage
  400
  vc.h
  <| vc.forms
  ++ map (\{point,label}-> move point <| toForm <| plainText label) vs

diphthong : {start:(Float,Float),end:(Float,Float),symbol:String} -> Element
diphthong d =
 let
  (sx,sy) = d.start
  (ex,ey) = d.end
 in
 collage 400 vc.h <| vc.forms ++ [move d.start <| toForm <| plainText d.symbol, Vectors.shortArrow (sx,sy+20) (ex,ey)] -- TODO fix this, don't use shortArrow!

main : Element
main =
 let
  vc = vowelChart 400
 in
 flow down [plainText " ",plainText " ",flow right [plainText "            ",collage 400 vc.h vc.forms]]
