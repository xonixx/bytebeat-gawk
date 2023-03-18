BEGIN {
  INTMASK=lshift(1,32)-1
  SIGNMASK=lshift(1,31)
split("36364689",M,//)
  for(;;t++)printf"%c",(and((t*and(M[1+and(rshift(t,13),7)]+47,15))/12,128))
  +(and(or((xxor(rshift(t,12),rshift(t,12)-2)%11*t)/4,rshift(t,13)),127))
#and((t*and(M[1+and(rshift(t,13),7)]+48,15))/12,128)
#(rshift(t,12)^rshift(t,12)-2)
#((xxor(rshift(t,12),rshift(t,12)-2)%11)*t)
#((xxor(rshift(t,12),rshift(t,12)-2)%11))
#((xor(rshift(t,12),pos(rshift(t,12)-2))%11))
#xor(rshift(t,12),pos(rshift(t,12)-2))
}
function toint(v) {
  if (v >= 0) return and(v, INTMASK)
#  print "v ", v
  return and(compl(-v), INTMASK)+1
}

function fromint(v) {
  if (and(SIGNMASK,v)>0) {
    #print "here ", v
    return -(and(compl(v), INTMASK)+1)
  } else {
    return v
  }
}

function xxor(a,b,   a1,b1,c1) {
  a1=toint(a)
  b1=toint(b)
  c1=xor(a1,b1)
  return fromint(c1)
}