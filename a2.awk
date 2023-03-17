BEGIN { for(t=0;t<10000;t++)
#  printf"%c",rshift(t,4)
  printf"%c",rshift(t,12)
#  printf"%c",t*and(rshift(t,12),rshift(t,8),63,rshift(t,4))
}