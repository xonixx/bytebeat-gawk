
BEGIN {
  INTMASK=lshift(1,32)-1
  print hex(INTMASK)
#  test(2)
#  test(0)
#  test(-1)
#  test(-2)
#  test(-3)
#  test(-4)
#  test(-5)
#  test(-6)
#  test(-7)
#  test(-10)
  for (i=10;i>=-10;i--) {
    test(i)
  }
}

function test(v,   n) {
  print v " -> " (n=toint(v)) ", " hex(n) ", " hex(compl(v >= 0 ? v : -v))
}

function hex(n) { return sprintf("%#x", n) "=" bits2str(n) }

function toint(v) {
  if (v >= 0) return and(v, INTMASK)
  return and(compl(-v), INTMASK)+1
}

function xxor(a,b) {

}

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