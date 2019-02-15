#!/usr/bin/env python

import socket
import time
import sys


UDP_IP = '168.105.228.79'
UDP_PORT = 5005
BUFFER_SIZE = 200  # Normally 1024, but we want fast response

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 65536)
s.bind(('', UDP_PORT))
count = 0
while 1:
    print("count = "+str(count), file=sys.stderr)
    time.sleep(2)
    data, adress = s.recvfrom(4300)
    if not data: break
    print ("received data:", data.decode('utf-8'))
    print ("received adress:", adress)
    count += 1
