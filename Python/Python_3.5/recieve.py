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
    sock.bind(("", UDP_PORT))

    recv_flag = 0
    f = open("testdata.txt", "w")
    f.write("begin\n")
    f.close()
#    while (recv_flag != -1):
    while (1):

        data, server = sock.recvfrom(8192)
        # if(data[-3:-1] == 'end'):
        #     recv_flag = -1;
        f = open("testdata.txt", "a")
        f.write("head/")
        if data.startswith('head'.encode('utf-8')):
            print ("head\n")
            dataFlag = 0
            while (dataFlag != 1):
                data, server = sock.recvfrom(8192)
                print ("received", data.decode('utf-8'))
            
                if data.startswith('endS'.encode('utf-8')):
                    dataFlag = 1
                    f.write("end\n")
                else:
                    f.write(data[0:(len(data))-4].decode('utf-8'))


"""
            if data[5:9]=='test':
                A=data[10:-3]
                B = [int(x) for x in A.split('/') if x.strip()]


        outfile = open('test3.txt', 'w')
        count=0
        for x in range(0,4):
            for y in range(0,4):
                for z in range(0,4):
                    print 'Outfile B[%d]= %d' % (count, B[count])
                    outfile.write("%d " % (B[count]))
                    count +=1
        outfile.close()
        recv_flag =-1
"""



main()
