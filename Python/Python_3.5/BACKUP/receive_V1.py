#!/usr/bin/env python
############################################################################
#Author: Anthony Schluchin
#Date:9/21/18
# Main ETHERNET Module to Send and Recieve UDP DATAGRAMS to MICROZED
#
#This module uses a fixed IP address and port number that must match the
#IP address of the MICROZED. This module is restricted to only receive data
##############################################################################
import sys
import socket
import optparse
import threading


#define the IP and port for the zynq
UDP_IP = "192.168.1.10"
UDP_PORT = 8
count = 0
test = True
array = []

#Creates the socket
def setup_connection():
    #Display
    print ("UDP target IP:", UDP_IP)
    print ("UDP target port:", UDP_PORT)
    sock = socket.socket(socket.AF_INET, # Internet
                        socket.SOCK_DGRAM) # UDP
    return sock
   
#Timer interrupt
def timer_int():
    print("*********START TIMER INT*********")
    global test
    nbr_data = len(array)
    print("ndr_data = ", nbr_data)
    count = 0
    count_cmp = 0
    while(count < nbr_data):
        if(count_cmp != array[count]):
            print("count_cmp = ", count_cmp, "array[", count, "] = ", array[count])
            if((array[count] - count_cmp) < 300):
                count_cmp = array[count]
        count += 1
        count_cmp += 1
    print("array[0] = ", array[0])
    print("array[", (nbr_data-1), "] = ", array[(nbr_data-1)])
    print("**********END TIMER INT**********")
    test = False

def main():
    print("---START---")
    global count
    global test
    sock = setup_connection()
    sock.bind(("", UDP_PORT))
    sock.settimeout(20)
    t=threading.Timer(17, timer_int)

    try:
        data = sock.recv(4300) #data = sock.recv(4099)
        if(len(data) > 3):
            array.append(data[2]*256 + data[3])
        print("len(data) =", len(data), " len(array) =", len(array))
    except socket.timeout:
        print("Timeout Error with 1st packet")

    t.start()

    while (test == True):
        try:
            data = sock.recv(4300) #data = sock.recv(4099)
            if(len(data) > 3):
                array.append(data[2]*256 + data[3])
            print("len(data) =", len(data), " len(array) =", len(array))
        except socket.timeout:
            print("Timeout Error in while loop")
    print("----END----")

main()