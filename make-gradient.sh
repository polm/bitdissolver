#!/bin/bash

# make the gradient

function gradient-step() {
  left=$1
  right=$2
  width=$(( $3 * 256 ))
  convert \( -size 1x1 "xc:$left" "xc:$right" +append \) \
      -filter cubic -resize ${width}x1! grad.png
  if [ -e gradient.png ]; then 
      convert gradient.png grad.png +append tmp.png
      mv tmp.png gradient.png
      rm grad.png
  else
      mv grad.png gradient.png
  fi
}

function finalize-gradient() {
    convert gradient.png -resize 256x1! tmp.png
    mv tmp.png gradient.png
}

rm -f gradient.png

#gradient-step black orange 30
#gradient-step orange pink 30
#gradient-step pink white 10
#gradient-step white lime 10

#gradient-step black orange 30
#gradient-step orange pink 30
#gradient-step pink white 10
#gradient-step white lime 10

gradient-step black cyan 70
gradient-step cyan white 10
gradient-step white yellow 20
gradient-step yellow maroon1 10

#gradient-step black red 5
#gradient-step red black 2
#gradient-step black maroon1 70
#gradient-step maroon1 white 10
#gradient-step white cyan 15

finalize-gradient
