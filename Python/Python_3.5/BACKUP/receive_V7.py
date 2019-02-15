#!/usr/bin/env python
############################################################################
#Author: Anthony Schluchin
#Date:9/21/18
# Main ETHERNET Module to Send and Recieve UDP DATAGRAMS to MICROZED
#
#This module uses a fixed IP address and port number that must match the
#IP address of the MICROZED. This module is restricted to only receive data
##############################################################################
from threading import Thread, Lock
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

## This classe the graphic window
class Watchman_graphic_window():
    ## Create a "Watchman_graphic_window" object wich is a window to show the data received in graphics
    # @param self : The object pointer
    # @param master : The parent of the object
    def __init__(self, master):
        # Global variable
        ## Parent of every graphical object (object main window)
        self.master = master
        ## Contain the zynq's ip
        self.UDP_IP = '192.168.1.10'
        ## Contain the port number for UDP communication
        self.UDP_PORT = 8
        ## Contain the number of hit for every channel, list ploted in hitmap graphic
        self.hit_per_ch = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ## Contain the 5 different amplitudes repartition for every channel, list plot in amplitude graphic
        self.amplitude = []
        for i in range(16):
            self.amplitude.append([0, 0, 0, 0, 0])
        ## Contain the 5 different times repartition for every channel, list plot in time graphic
        self.time = []
        for i in range(16):
            self.time.append([0, 0, 0, 0, 0])
        ## Contain every channel, used for the list box and to update the graphic's title
        self.combolist = ["CH0", "CH1", "CH2", "CH3", "CH4", "CH5", "CH6", "CH7", "CH8", "CH9", "CH10", "CH11", "CH12", "CH13", "CH14", "CH15"]
        ## Contain which channel is currently choosed by the user
        self.ch_selected = 0
        ## Contain the number of good frame received
        self.count = 0
        ## Contain the number of corrupted frame received
        self.lostcnt = 0
        ## Flag used to stop the threads
        self.run_flag = False
        ## Lock used to avoid problem between the process which access the data ploted in the graphics
        self.lock_graph = Lock()
        ## List that contain all the thread object created
        self.thread_list = []

        # initialization
        self.init_window()
        self.init_UDP_connection()
        self.open_file()
        self.run_flag = True

        t=Thread(target=self.recv_data, args=())
        t.start()
        self.thread_list.append(t)
        self.master.after(1000,self.plot_int)

    ## Method called every second which update the graphics with the new datas
    # and show the channel selected by the user
    # @param self : The object pointer
    def plot_int(self):
        if(self.run_flag): # test if the app need to end
            with self.lock_graph:   # acquire the lock to access the graphics object
                start = time.time()
                # update value of graph hitmap for every channels
                for k in range(len(self.hit_per_ch)):
                    self.__graph_hit.patches[k].set_height(self.hit_per_ch[k])
                self.__subplot_hit.set_ylim([0, max(max(self.hit_per_ch)*1.1,1)]) # update y scale
                # update value of graph amplitude for channel selected by the user
                for k in range(len(self.amplitude[self.ch_selected])):
                    self.__graph_amp.patches[k].set_height(self.amplitude[self.ch_selected][k])
                self.__subplot_amp.set_ylim([0, max(max(self.amplitude[self.ch_selected])*1.1,1)]) # update y scale
                self.__subplot_amp.set_title(self.combolist[self.ch_selected]) # change title in function of channel selected
                # update value of graph time for channel selected by the user
                for k in range(len(self.time[self.ch_selected])):
                    self.__graph_time.patches[k].set_height(self.time[self.ch_selected][k])
                self.__subplot_time.set_ylim([0, max(max(self.time[self.ch_selected])*1.1,1)]) # update y scale
                self.__subplot_time.set_title(self.combolist[self.ch_selected]) # change title in function of channel selected
                # draw all graphics
                self.__canvas.draw()
                self.__canvas.get_tk_widget().update_idletasks()
                end = time.time()
                # release the lock
            print("frame received : " + str(self.count)+" | thread engaged : " + str(len(self.thread_list)) + " | time : " + str(end-start))
            # check in the thread's list if some have ended and can be removed
            length=len(self.thread_list)
            k=0
            while(k<length):
                if(not self.thread_list[k].is_alive()):
                    del self.thread_list[k]
                    length -= 1
                else:
                    k += 1
            # build up the next call of this method
            self.master.after(1000,self.plot_int)
        else:
            print("end of plot int.", file=sys.stderr)

    ## Method thread to group the data received by UDP and prepare them for processing (running all the time)
    # @param self : The object pointer
    def recv_data(self):
        cnt_timer = 0
        count_recv = 0
        data = []
        adress = []
        while self.run_flag: # running flag
            d = bytearray()
            try:
                d, a = self.sock.recvfrom(4300) # wait on data
                # group of multiple frames 
                data.append(d)
                adress.append(a)
                count_recv += 1
                if(count_recv >= 100): # after 100 frames
                    # create a new thread to process a group of 100 frames
                    t = Thread(target=self.data_int, args=(data, adress))
                    t.start()
                    self.thread_list.append(t) # add it to the list
                    del data[:]
                    del adress[:]
                    count_recv = 0
                cnt_timer = 0
            # socket exception: no data for received before timeout
            except socket.timeout:
                time.sleep(0.1)
                cnt_timer += 1
            # socket exception: problem during execution of socket.recvfrom
            except socket.error:
                dummy = 0 # dummy execution to catch the exception
            # if no new data received for 0.2sec, but some, less than 100, received before, then process them
            if((cnt_timer >= 2) and (count_recv > 0)):
                t = Thread(target=self.data_int, args=(data, adress))
                t.start()
                self.thread_list.append(t)
                del data[:]
                del adress[:]
                count_recv = 0
        # if the user stop the app, process last received (less than 100)
        if(count_recv > 0):
            t = Thread(target=self.data_int, args=(data, adress))
            t.start()
            self.thread_list.append(t)
            del data[:]
            del adress[:]
            count_recv = 0

    ## Method thread to process the data grouped the first thread
    # @param self : The pointer object
    # @param *args : args[0] the data to process / args[1] their corresponding adress
    def data_int(self, *args):
        list_data=list(args[0])
        list_adress=list(args[1])
        # process every frame received
        for r in range(0, len(list_data)):
            data = list_data[r]
            adress = list_adress[r]
            if(adress[0] == self.UDP_IP): # test the emitter's ip
                if((len(data) >= 2) and (data[0] == int("0x55", 0)) and (data[1] == int("0xAA", 0))): # look for the start code
                    length = data[2]*256 + data[3] # length of the frame contained in the frame
                    if((length >= 4) and (length <= len(data))):
                        if((data[length-2] == int("0x33", 0)) and (data[length-1] == int("0xCC", 0))): # look for the end code
                            flag = True # flag if frame is uncorrupted
                            index = 4 # index to parse the data array
                            ch = 0 # index of the ch
                            amp = 0 # amplitude of pedestal
                            time = 0 # time of pedestal
                            data_type = 0 # type of data (0: no data / 1: pedestal / 2: full wave)
                            channel = 0 # channel id
                            while(ch<16 and flag): # for every channel since the frame is uncorrupted
                                channel = data[index] # get the channel number
                                index += 1
                                if(channel < 16):
                                    data_type = data[index] # get the type of data
                                    index += 1
                                    if(data_type == 0):    # payload=0, no hit (= no data) for this channel
                                            dummy = 0
                                    else:
                                        # update the data to be plot in the graphics
                                        # separate them in the different columns
                                        with self.lock_graph: 
                                            if(data_type == 1): # Pedestal
                                                self.hit_per_ch[channel] += 1 
                                                amp = data[index]*256 + data[index+1]
                                                self.amplitude[channel][amp//13108] += 1 #65535 / 5 = 13107 -> 13108
                                                index += 2
                                                time = data[index]*256 + data[index+1]
                                                self.time[channel][time//16384] += 1 #65535 / 4 = 16383.75 -> 16384
                                                index += 2
                                            else:
                                                if(data_type == 2): # Full Wave
                                                    self.hit_per_ch[channel] += 1 
                                                    self.time[channel][4] += 1
                                                    index += 256
                                                else:
                                                    # error: data type not normal, frame corrupted
                                                    flag = False 
                                else: 
                                    # error: channel id not normal, frame corrupted
                                    flag = False 
                                ch += 1 # process next channel
                            if(flag): # report if the frame was corrupted of not
                                self.__file.write(data)
                                self.count += 1
                            else:
                                self.lostcnt += 1
                        else:
                            # error: no end code
                            self.lostcnt += 1
                    else:
                        # error: mesured size of frame smaller than rel size of frame
                        self.lostcnt += 1
                else:
                    # error no start code
                    self.lostcnt += 1
        del list_data[:]
        del list_adress[:]

    ## Method to initialize the windows and create its graphical objects
    # @param self : The object pointer
    def init_window(self):
        self.master.title("Watchman - data") # change window's title
        self.master.resizable(width=FALSE, height=FALSE) # set up window's size and not resizable by the user
        self.master.geometry("1600x800+250+150")
        # create the combox the selected which channel is represented by the graphics
        self.__combo = ttk.Combobox(self.master, values=self.combolist) 
        self.__combo.bind("<<ComboboxSelected>>", self.combo_callback) # attach a callback when user change channel
        self.__combo.current(0) # on application start, selected first element of combolist
        self.__combo.pack()
        # create the figure which contains the three subplot
        self.__figure = plt.figure() 
        # create hitmap graphic
        self.__subplot_hit = self.__figure.add_subplot(122) 
        cat_grah_hitmap = ('CH0', 'CH1', 'CH2', 'CH3', 'CH4', 'CH5', 'CH6', 'CH7', 'CH8', 'CH9', 'CH10', 'CH11', 'CH12', 'CH13', 'CH14', 'CH15') # categories name
        y_pos_graph_hitmap = np.arange(len(cat_grah_hitmap)) # vector with a length egal to the number of categories
        self.__graph_hit = self.__subplot_hit.bar(y_pos_graph_hitmap, self.hit_per_ch, align='center', alpha=0.5) # type bar
        self.__subplot_hit.set_xticks(y_pos_graph_hitmap) # where to stick categories
        self.__subplot_hit.set_xticklabels(cat_grah_hitmap) # set the categories name
        self.__subplot_hit.set_ylabel('Hits') # set the y axe's label
        self.__subplot_hit.set_title('Hitmap') # set the graphic's title
        # create amplitude graphic
        self.__subplot_amp = self.__figure.add_subplot(221)
        cat_graph_ampl = ('1', '2', '3', '4', '5')
        y_pos_graph_ampl = np.arange(len(cat_graph_ampl))
        self.__graph_amp = self.__subplot_amp.bar(y_pos_graph_ampl, self.amplitude[0], align='center', alpha=0.5)
        self.__subplot_amp.set_xticks(y_pos_graph_ampl)
        self.__subplot_amp.set_xticklabels(cat_graph_ampl)
        self.__subplot_amp.set_xlabel('Amplitude [V]')
        self.__subplot_amp.set_title('CH0')
        # create time graphic
        self.__subplot_time = self.__figure.add_subplot(223)
        cat_graph_time = ('1', '2', '3', '4', 'to long')
        y_pos_graph_time = np.arange(len(cat_graph_time))
        self.__graph_time = self.__subplot_time.bar(y_pos_graph_time, self.time[0], align='center', alpha=0.5)
        self.__subplot_time.set_xticks(y_pos_graph_time)
        self.__subplot_time.set_xticklabels(cat_graph_time)
        self.__subplot_time.set_xlabel('Time [ns]')
        self.__subplot_time.set_title('CH0')
        plt.subplots_adjust(left=0.05, bottom=0.075, right=0.95, top=0.95, wspace=0.1, hspace=0.25)
        # create a canvas, used to update the graphics, without recreating the complete object
        self.__canvas = FigureCanvasTkAgg(self.__figure, master=self.master) 
        self.__canvas.draw()
        self.__canvas.get_tk_widget().pack(side=BOTTOM, fill=BOTH, expand=True)

    ## Method callback called when the user change the channel selected in the list box
    # @param self : The object pointer
    # @param event : Unused
    def combo_callback(self, event):
        self.ch_selected = self.__combo.current()

    ## Method to initialize the UDP connection
    # @param self : The object pointer
    def init_UDP_connection(self):
        ## Socket object used to established the UDP connection with the zynq
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        #self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 2097152)
        self.sock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 131072) # change the size of the socket buffer
        print("sock buz:", self.sock.getsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF))
        self.sock.bind(('', self.UDP_PORT))
        self.sock.settimeout(0.1) # method sock.recvfrom return after maximum 0.1sec if no data are received

    ## Method to open the binary file to save the received data in
    def open_file(self):
        self.__file = open("data.bin", "wb")

    ## Method callback for the "WM_DELETE_WINDOW" event which quit the application
    # @param self : The object pointer
    def exit_prog(self):
        # stop the threads and wait on them
        self.run_flag = False
        cnt_thread = len(self.thread_list)
        print("number of thread = "+str(cnt_thread), file=sys.stderr)
        for t in self.thread_list:
            t.join()
            print("STOP : ", t)
        # close the socket, the binary file and destroy the window
        self.sock.close()
        self.__file.close()
        self.master.destroy()
        print("toplevel destroy",  file=sys.stderr)
