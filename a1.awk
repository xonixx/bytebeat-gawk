BEGIN { for(;;t++)
  printf"%c",t*and(or(rshift(t,12),rshift(t,8)),63,rshift(t,4))
}