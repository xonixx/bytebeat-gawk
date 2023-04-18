#!/bin/sh

gawk -b 'BEGIN { for(;;t++)printf"%c",t*and(or(rshift(t,12),rshift(t,8)),63,rshift(t,4)) }' | aplay -f u8

gawk -b 'BEGIN { for(;;t++)printf"%c",( and(t,t%255)-(and(t*3,rshift(t,13),rshift(t,6))) ) }' | aplay -f u8

gawk -b 'BEGIN { for(;;t++)printf"%c",or(and(t*5,rshift(t,7)),and(t*3,rshift(t*4,10))) }' | aplay -f u8

gawk -b 'BEGIN { for(;;t++)printf"%c",(or(t,or(rshift(t,9),rshift(t,7)))*and(t,or(rshift(t,11),rshift(t,9))))}' | aplay -f u8

gawk -f a3final.awk -b | aplay -f u8 -r 44100