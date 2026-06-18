const fs = require('fs');

const out = Buffer.allocUnsafe(1);

function putchar(byte) {
    out[0] = byte & 0xff;
    fs.writeSync(1, out, 0, 1);
}

for (let t=1000000;;t++) putchar(((t/(t>>9&15))&32)*(((-t>>16&t>>20|t>>21)&118518023>>(t>>11))&1)+((t/(t%152))&(-t>>7&t>>10&t>>17)&63)+(t*4/(3353657496>>(t>>18<<3)&255)&23)+(t*8/(3370500505>>(t>>18<<3)&255)&23)+(t*5/24&(-t>>9&13))+(t*5/32&(-t>>8&13))+((t/4-t/64*(-t>>17&1))&(-t/3>>8&13))
)

