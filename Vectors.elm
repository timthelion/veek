module Vectors where

-- Get the average of two vectors
average : (Float,Float) -> (Float,Float) -> (Float,Float)
average (x1,y1) (x2,y2) = (x1+(x2-x1)/2,y1+(y2-y1)/2)

-- Add two vectors
add : (number,number)->(number,number)->(number,number)
add (x1,y1) (x2,y2) = (x1+x2,y1+y2)

-- Get the normal vector for a given vector
normal (x,y) =
 let
  len = sqrt (x^2+y^2)
 in
  (x/len,y/len)

-- Shorten vector by distance
shortenBy : (number,number) -> number -> (number,number)
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


