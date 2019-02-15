#!/usr/bin/env python
#0x404f5c29
import struct

a=struct.pack('!f',3.24)
print(a)
b=struct.unpack('!i',a)[0]
print(b)
c=bin(b)
print(c)
d=hex(int(c, 2))
print(d)
e=int(c,2)
print(e)
f=struct.pack('!i',e)
print(f)
g=struct.unpack('!f',f)[0]
print(g)