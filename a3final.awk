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

function ixor(a,b) { return fromint(xor(toint(a),toint(b))) }
function ior (a,b) { return fromint( or(toint(a),toint(b))) }
function iand(a,b) { return fromint(and(toint(a),toint(b))) }
