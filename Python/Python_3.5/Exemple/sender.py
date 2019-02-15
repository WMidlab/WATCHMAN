#!/usr/bin/env python

import socket


UDP_IP = '168.105.228.79'
UDP_PORT = 5005
BUFFER = []
BUFFER.append("hello")
BUFFER.append("bonjour")
BUFFER.append("ciao")

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
for i in range(0,3):
    s.sendto(BUFFER[i].encode('utf-8'),(UDP_IP, UDP_PORT))
