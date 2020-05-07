module Main where

import Prelude
import Graphics.Implicit
import Graphics.Implicit.Definitions
import Graphics.Implicit.Export

regularPolygon sides r = polygonR 0
  [ (r*cos θ, r*sin θ)
  | θ <- [2*pi*fromℕtoℝ n/fromℕtoℝ sides | n <- [0 .. sides - 1]]
  ]

-- main = writeSTL 0.3 "test.stl"$ union
main = writeSVGs 0.3 "test.svg"$
  [ translate (10, 10)$ regularPolygon 3 10
  , translate (15, 20)$ regularPolygon 3 10
  ]
  where
    extruded profile = extrudeRM
      0
      (Right$ \z -> 180/pi * (cos (asin'$ (z - halfHeight)/r) - 1))
      (Left 1)
      (Left (0, 0))
      profile
      (Left height)

    asin' x
      | x < -1 || x > 1 = 0
      | otherwise = asin x

    height = 5
    halfHeight = height / 2
    r = halfHeight / sin (35/180*pi)
