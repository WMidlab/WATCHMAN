#!/usr/bin/env python
############################################################################
#Author: Ky Ho, Jose Duron
#Date:7/18/19
# Main ETHERNET Module to Send and Recieve UDP DATAGRAMS to MICROZED
#
#This module uses a fixed IP address and port number that must match the
#IP address of the MICROZED. This module restricts the sent packages to be
#predefined commands: ping, read, rite, send, and exit.
##############################################################################
import sys
import socket
import optparse

#define the IP and port for the zynq
UDP_IP = "192.168.1.10"
UDP_PORT = 8

#Creates the socket
def setup_connection():
    #Display
    print ("UDP target IP:", UDP_IP)
    print ("UDP target port:", UDP_PORT)
    sock = socket.socket(socket.AF_INET, # Internet
                        socket.SOCK_DGRAM) # UDP
    return sock

def main():
    sock = setup_connection()

    #Send over the udp packet
#    sock.sendto(length_and_commands, (UDP_IP, UDP_PORT))

#    recv_flag = 0

#    while (recv_flag != -1):
    while (1):

        data, server = sock.recvfrom(8192)
        if(data == 'end'):
            recv_flag = -1
        print ("received", data.decode('utf-8'))

main()
#test
