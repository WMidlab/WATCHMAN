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
from tkinter import FALSE, Tk, BOTTOM, BOTH, ttk
import numpy as np
import matplotlib
matplotlib.use('Agg')
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
        self.category_1 = ('CH0', 'CH1', 'CH2', 'CH3', 'CH4', 'CH5', 'CH6', 'CH7', 'CH8', 'CH9', 'CH10', 'CH11', 'CH12', 'CH13', 'CH14', 'CH15')
        self.y_pos_1 = np.arange(len(self.category_1))
        self.nbr_hit = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        self.category_2 = ('1', '2', '3', '4', '5')
        self.y_pos_2 = np.arange(len(self.category_2))
        self.amplitude = []
        for i in range(16):
            self.amplitude.append([0, 0, 0, 0, 0])
        self.category_3 = ('1', '2', '3', '4', 'to long')
        self.y_pos_3 = np.arange(len(self.category_3))
        self.time = []
        for i in range(16):
            self.time.append([0, 0, 0, 0, 0])
        self.i = 0
        self.combolist = ["CH0", "CH1", "CH2", "CH3", "CH4", "CH5", "CH6", "CH7", "CH8", "CH9", "CH10", "CH11", "CH12", "CH13", "CH14", "CH15"]
        self.ch_selected = 0
        self.count = 0

        self.init_window()
        self.init_UDP_connection()
        self.open_file() 
        self.timer=Timer(0.5, self.timer_int, args=())
        self.run_flag = True
        self.end_flag = False
        self.timer.start()
        self.master.after(1000,self.update_graph)
    
    def init_window(self):
        self.master.title("Watchman - data")# when use close window with the red cross
        self.master.resizable(width=FALSE, height=FALSE)
        self.master.geometry("1600x800+250+150")
        self.figure = plt.figure()
        self.combo = ttk.Combobox(self.master, values=self.combolist)
        self.combo.bind("<<ComboboxSelected>>", self.combo_callback)
        self.combo.current(0)
        self.combo.pack()
        self.spt_hit = self.figure.add_subplot(122)
        self.graph_hit = self.spt_hit.bar(self.y_pos_1, self.nbr_hit, align='center', alpha=0.5)
        self.spt_hit.set_xticks(self.y_pos_1)
        self.spt_hit.set_xticklabels(self.category_1)
        self.spt_hit.set_ylabel('Hits')
        self.spt_hit.set_title('Hitmap')
        self.spt_amp = self.figure.add_subplot(221)
        self.graph_amp = self.spt_amp.bar(self.y_pos_2, self.amplitude[0], align='center', alpha=0.5)
        self.spt_amp.set_xticks(self.y_pos_2)
        self.spt_amp.set_xticklabels(self.category_2)
        self.spt_amp.set_xlabel('Amplitude [V]')
        self.spt_amp.set_title('CH0')
        self.spt_time = self.figure.add_subplot(223)
        self.graph_time = self.spt_time.bar(self.y_pos_3, self.time[0], align='center', alpha=0.5)
        self.spt_time.set_xticks(self.y_pos_3)
        self.spt_time.set_xticklabels(self.category_3)
        self.spt_time.set_xlabel('Time [ns]')
        self.spt_time.set_title('CH0')
        plt.subplots_adjust(left=0.05, bottom=0.075, right=0.95, top=0.95, wspace=0.1, hspace=0.25)
        self.canvas = FigureCanvasTkAgg(self.figure, master=self.master)
        self.canvas.show()
        self.canvas.get_tk_widget().pack(side=BOTTOM, fill=BOTH, expand=True)

    def combo_callback(self, event):
        self.ch_selected = self.combo.current()

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
        self.sock.close()
        self.file.close()
        self.master.destroy()
        print("toplevel destroy",  file=sys.stderr)

    def timer_int(self):
        while(self.run_flag):
            data = bytearray()
            try:
                data, adress = self.sock.recvfrom(4300)
                if(adress[0] == self.UDP_IP):
                    if((data[0] == int("0x55", 0)) and (data[1] == int("0xAA", 0))):
                        length = data[2]*256 + data[3]
                        if((data[length-2] == int("0x33", 0)) and (data[length-1] == int("0xCC", 0))):
                            flag = True
                            index = 4
                            i = 0
                            amp = 0
                            time = 0
                            frame_type = 0
                            channel = 0
                            while(i<16 and flag):
                                channel = data[index]
                                index += 1
                                if(channel < 16):
                                    frame_type = data[index]
                                    index += 1
                                    if(frame_type == 0):    # payload=0, no hit on this channel
                                         dummy = 0
                                    else:
                                        if(frame_type == 1):
                                            self.nbr_hit[channel] += 1 # Pedestal
                                            amp = data[index]*256 + data[index+1]
                                            self.amplitude[channel][amp//13108] += 1 #65535 / 5 = 13107 -> 13108
                                            index += 2
                                            time = data[index]*256 + data[index+1]
                                            self.time[channel][time//16384] += 1 #65535 / 4 = 16383.75 -> 16384
                                            index += 2
                                        else:
                                            if(frame_type == 2):
                                                self.nbr_hit[channel] += 1 # Full Wave
                                                self.time[channel][4] += 1 
                                                index += 256
                                            else:
                                                flag = False
                                                print("frame type fail -> "+str(frame_type), file=sys.stderr)
                                else:
                                    flag = False
                                    print("channel fail -> "+str(channel), file=sys.stderr)
                                i += 1
                            if(flag):
                                self.file.write(data)
                                self.count += 1
                        else:
                            print("end code not found", file=sys.stderr)
                    else:
                        print("start code not found", file=sys.stderr)
            except socket.timeout:
                dummy = 0 # dummy execution just to use try without trouble
            except socket.error:
                dummy = 0
        print("end of toplevel timer", file=sys.stderr)
        self.end_flag = True

    def update_graph(self):
        if(self.run_flag):
            for k in range(len(self.nbr_hit)):
                self.graph_hit.patches[k].set_height(self.nbr_hit[k])
            self.spt_hit.set_ylim([0, max(max(self.nbr_hit)*1.1,1)])
            for k in range(len(self.amplitude[self.ch_selected])):
                self.graph_amp.patches[k].set_height(self.amplitude[self.ch_selected][k])
            self.spt_amp.set_ylim([0, max(max(self.amplitude[self.ch_selected])*1.1,1)])
            self.spt_amp.set_title(self.combolist[self.ch_selected])
            for k in range(len(self.time[self.ch_selected])):
                self.graph_time.patches[k].set_height(self.time[self.ch_selected][k])
            self.spt_time.set_ylim([0, max(max(self.time[self.ch_selected])*1.1,1)])
            self.spt_time.set_title(self.combolist[self.ch_selected])
            self.canvas.draw()
            self.canvas.get_tk_widget().update_idletasks()
            print("count = " + str(self.count))
            self.master.after(1000,self.update_graph)

"""root = Tk()
root.resizable(width=FALSE, height=FALSE)

window_reg = Watchman_data(root)
root.mainloop()"""