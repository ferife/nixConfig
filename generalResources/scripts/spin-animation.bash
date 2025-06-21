#!/usr/bin/env bash

# classic spin animation, iterating over a list of characters and escaping special chars
# echoing to print, -en and \r allow it to stay in one place on the line
# sleep .1 sets the speed; while true; do ... done makes it an infinite loop

# I got it from a Bread on Penguins video

while true; do
  for var in / - \\ \|; do
    echo -en "\r$var"
    sleep .1
  done
done
