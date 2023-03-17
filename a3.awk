BEGIN {
split("36364689",M,//)
for(;;t++)printf"%c",(and((t*and(M[1+and(rshift(t,13),7)]+47,15))/12,128))
+(and(or(((rshift(t,12)^rshift(t,12)-2)%11*t)/4,rshift(t,13)),127))
}