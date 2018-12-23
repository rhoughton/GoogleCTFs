#!/usr/bin/env python
x = """84 93 81 BC 93 B0 A8 98
 97 A6 B4 94 B0 A8 B5 83 BD 98 85 A2 B3
 B3 A2 B5 98 B3 AF F3 A9 98 F6 98 AC F8 BA"""

x = bytearray(x.replace(" ", "").replace("\n", "").decode('hex'))
flag = ""
for ch in x:
    flag += chr(ch ^ 0xc7)
print flag