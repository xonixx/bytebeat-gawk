BEGIN {
  INTMASK=lshift(1,32)-1
  SIGNMASK=lshift(1,31)
  #  print hex(INTMASK)
  #  for (i=10;i>=-10;i--) {
  #    test(i)
  #  }

  #  print ixor(5,2)   # 7
  #  print ixor(5,-2)  # -5
  #  print ixor(-5,2)  # -7
  #  print ixor(-5,-2) # 5

  print idiv(4,2)  # 2
  print idiv(5,2)  # 2
  print idiv(2,4)  # 0
  print idiv(-2,4) # 0
  print idiv(-1,1) # -1
}

# https://stackoverflow.com/a/26195966/104522
function idiv(n,d) {
#  return (n-n%d)/d+(n<0)
  return (n-n%d)/d
}

function toint(v) {
  if (v >= 0) return and(v, INTMASK)
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

function ixor(a,b,   a1,b1,c1) {
  a1=toint(a)
  b1=toint(b)
  c1=xor(a1,b1)
  return fromint(c1)
}

# --- debug ---
function test(v,   n) {
  print v " -> " (n=toint(v)) ", " hex(n) ", " hex(compl(v >= 0 ? v : -v))
}
function hex(n) { return sprintf("%#x", n) "=" bits2str(n) }

function bits2str(bits,        data, mask)
{
  if (bits == 0)
    return "0"

  mask = 1
  for (; bits != 0; bits = rshift(bits, 1))
    data = (and(bits, mask) ? "1" : "0") data

  while ((length(data) % 8) != 0)
    data = "0" data

  return data
}