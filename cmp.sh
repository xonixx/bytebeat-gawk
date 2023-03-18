
set -e

X=a3

cc -w $X.c -o $X

# endiannes: https://unix.stackexchange.com/a/55772/52083
./$X > c.out                ; hexdump -C c.out   > c.out.txt
gawk -f $X.awk -b > awk.out ; hexdump -C awk.out > awk.out.txt