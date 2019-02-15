#!/usr/bin/env python
############################################################################
#Author: Anthony Schluchin
#Date:9/21/18
# Main ETHERNET Module to Send and Recieve UDP DATAGRAMS to MICROZED
#
#This module uses a fixed IP address and port number that must match the
#IP address of the MICROZED. This module is restricted to only receive data
##############################################################################
from threading import Timer
from tkinter import FALSE
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import sys
import socket
import optparse
import time

class Watchman_data():
    def __init__(self, master):
        # Global variable
        self.master = master
        self.UDP_IP = '192.168.1.10'
        self.UDP_PORT = 8
        self.count = 0
        self.objects = ('CH0', 'CH1', 'CH2', 'CH3', 'CH4', 'CH5', 'CH6', 'CH7', 'CH8', 'CH9', 'CH10', 'CH11', 'CH12', 'CH13', 'CH14', 'CH15')
        self.y_pos = np.arange(len(self.objects))
        self.performance = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        self.i = 0

        self.init_window()
        self.init_UDP_connection()
        self.open_file()
        self.timer=Timer(0.5, self.timer_int, args=())
        self.run_flag = True
        self.end_flag = False
        self.timer.start()
        #self.master.after(1000,self.update_graph)
        
    """def update_graph(self):
        if(self.run_flag):
            for k in range(len(self.performance)):
                self.graph_bar.patches[k].set_height(self.performance[k])
            self.subplot.set_ylim([0, max(self.performance)+1])
            self.canvas.draw()
            self.canvas.get_tk_widget().update_idletasks()
            self.master.after(1000,self.update_graph)"""

    
    def init_window(self):
        self.master.title("Watchman - data")# when use close window with the red cross
        self.master.resizable(width=FALSE, height=FALSE)
        self.figure = plt.figure()
        self.figure.set_size_inches((12,6), forward=True)
        self.subplot = self.figure.add_subplot(111)
        self.graph_bar = self.subplot.bar(self.y_pos, self.performance, align='center', alpha=0.5)
        self.subplot.set_xticks(self.y_pos)
        self.subplot.set_xticklabels(self.objects)
        self.subplot.set_ylabel('Hits')
        self.subplot.set_title('Hitmap')
        self.canvas = FigureCanvasTkAgg(self.figure, master=self.master)
        self.canvas.show()
        self.canvas.get_tk_widget().pack()

    #Creates the socket
    def init_UDP_connection(self):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.bind(('', self.UDP_PORT))
        self.sock.settimeout(0.1)
    
    def open_file(self):
        self.file = open("data.bin", "wb")

    def exit_prog(self):
        self.run_flag = False 
        while(self.end_flag == False):
            time.sleep(0.1)
        print("1",  file=sys.stderr)
        self.sock.close()
        print("2 ",  file=sys.stderr)
        self.file.close()
        print("3 ", file=sys.stderr)
        self.master.destroy()
        print("4 ",  file=sys.stderr)

    def timer_int(self):
        while(self.run_flag):
            data = bytearray()
            try:
                data, adress = self.sock.recvfrom(4300)
                if(adress[0] == self.UDP_IP):
                    if((data[0] == int("0x55", 0)) and (data[1] == int("0xAA", 0))):
                        if((data[-2] == int("0x33", 0)) and (data[-1] == int("0xCC", 0))):
                            self.file.write(data)
                            self.count += 1
                            self.performance[self.i] = self.count
                            if(self.i < 15):
                                self.i += 1
                            else:
                                self.i = 0
                            #print("count = ", self.count, file=sys.stderr)
            except socket.timeout:
                dummy = 0 # dummy execution just to use try without trouble
            except socket.error:
                dummy = 0
        print("end of toplevel timer", file=sys.stderr)
        self.end_flag = True

    def __del__(self):
        print("toplevel died", file=sys.stderr)

