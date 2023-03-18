BEGIN {
  INTMASK=lshift(1,32)-1
  SIGNMASK=lshift(1,31)
  split("36364689",M,//)
  for(;;t++)printf"%c",(\
  (and((t*and(M[1+and(rshift(t,13),7)]+48,15))/12,128))\
  +(iand(ior(idiv((ixor(rshift(t,12),rshift(t,12)-2)%11*t),4),rshift(t,13)),127)))
}

function idiv(n,d) { return (n-n%d)/d }
function toint(v) {
  if (v >= 0) return and(v, INTMASK)
  return and(compl(-v), INTMASK)+1
}

function fromint(v) {
  if (and(SIGNMASK,v)>0) {
    return -(and(compl(v), INTMASK)+1)
  } else {
    return v
  }
}

function ixor(a,b,   a1,b1,c1) {
  a1=toint(a)
  b1=toint(b)
  c1=xor(a1,b1)
  return fromint(c1)
}

function ior(a,b,   a1,b1,c1) {
  a1=toint(a)
  b1=toint(b)
  c1=or(a1,b1)
  return fromint(c1)
}

function iand(a,b,   a1,b1,c1) {
  a1=toint(a)
  b1=toint(b)
  c1=and(a1,b1)
  return fromint(c1)
}
