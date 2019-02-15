#!/usr/bin/env python
############################################################################
# Author: Anthony
# Date:10/3/18
#
# Create GUi for WATCHMAN
# This module uses a fixed IP address and port number that must match the
# IP address of the MICROZED.
###########################################################################

# Libraries
from tkinter import Tk, Toplevel, Label, Button, Menu, Entry, Text, Scrollbar, StringVar, FALSE, RIDGE, N, S, E, W, END
from tkinter import filedialog
from tkinter import messagebox
from tkinter import ttk
from functools import partial
from threading import Thread, Timer
import time
import sys
import socket
import optparse
import random
import gui_graphics

## This class create the main window 
class Watchman_main_window():
    ## Create a "Watchman_main_window" object wich is a GUI to communicate with a zynq through a UDP connection
    # @param self : The object pointer
    # @param master : The parent of the object
    def __init__(self, master):
        # Global variable
        ## Parent of every graphical object (object main window)
        self.master = master
        ## Contain the value to read from or write to the registers in the zynq
        self.regs = []
        self.regs_name_1_64 = 'VDLYTUNE '
        self.regs_name_65_92 = ['SSTOUTFB', 'SSPIN_LE', 'SSPIN_TE', 'WR_STRB2_LE', 'WR_STRB2_TE', 'WR2_ADDR_LE', 'WR2_ADDR_TE', 'WR_STRB1_LE', 'WR_STRB1_TE', 'WR1_ADDR_LE', 'WR1_ADDR_TE', 
                                'MONTIMING', 'VQBUFF', 'QBIAS', 'VTRIMT', 'VBIAS', 'VAPBUFF', 'VADJP', 'VANBUFF', 'VADJN', 'SBBIAS', 'VDISCH', 'ISEL', 'DBBIAS', 'CMPBIAS2', 'PUBIAS', 'CMPBIASIN', 'MISCDIG']
        self.regs_name_93_127 = 'unused'
        self.regs_name_128 = 'TPG'
        ## List of flags for every register value which indicates if the value is good or not (0 -> good value, 1 -> wrong value => sum of list should be 0)
        self.flag_data = []
        ## Contain the zynq's ip
        self.UDP_IP = '192.168.1.10'
        ## Contain the port number for UDP communication
        self.UDP_PORT_CMD = 7
        self.UDP_PORT_data = 8
        ## List of all the commands
        self.cmd = ['write_all_reg', 'read_all_reg', 'ping', 'start_stop_stream', 'stop_uC', 'settime', 'get_transfer_fct', 'get_20_windows', 'err_watchdog', 'err_function_prob', 'err_exception', 'err_assertion']
        ## Flag which indicates if the streaming is running
        self.stream_flag = False
        ## Flag which indicates that the user want to close the GUI (to avoid problem when accessing graphical object after "WM_DELETE_WINDOW" event)
        self.destroy_flag = False 
        ## Flag which indicates if the graphical window is open or not
        self.toplevel_flag = False
        ## Flag which indicates to the main thread if it needs to stop
        self.run_flag = False

        self.timer_thread_flag = False
        self.get_transfer_fct_flag = False
        self.get_20_windows_flag = False

        # initialization
        self.init_window()
        self.init_UDP_cmd()
        ## Thread object which run constantly and process the data received
        self.thread_cmd=Thread(target=self.thread_cmd_int, args=())
        self.run_flag = True
        self.thread_cmd.start()

    ## Method to initialize the windows and create its graphical objects
    # @param self : The object pointer
    def init_window(self):
        self.master.title("Watchman") # Change window's title
        self.master.protocol("WM_DELETE_WINDOW", self.exit_prog) # when use close window with the red cross
        self.__menu = Menu(self.master)
        self.master.config(menu=self.__menu)
        self.__filemenu = Menu(self.__menu)
        self.__menu.add_cascade(label='File', menu=self.__filemenu)
        self.__filemenu.add_command(label='Load sequence...',command=self.loadfile)
        self.__filemenu.add_command(label='Save sequence...',command=self.savefile)
        self.__filemenu.add_command(label='EXIT',command=self.exit_prog)
        self.__menu.add_cascade(label='HELP',command=self.help_callback)
        # Table for the registers
        count = 1
        for column in range(0,8,2):
            for row in range(32):
                if(count <= 64):
                    l = Label(self.master, relief=RIDGE,text= (str(count) + ") " + self.regs_name_1_64 + str(count)))
                if(count > 64) & (count <= 92):
                    l = Label(self.master, relief=RIDGE,text= (str(count) + ") " + self.regs_name_65_92[count-65]))
                if(count > 92) & (count <= 127):
                    l = Label(self.master, relief=RIDGE,text= (str(count) + ") " + self.regs_name_93_127))
                if(count == 128):
                    l = Label(self.master, relief=RIDGE,text= (str(count) + ") " + self.regs_name_128))
                l.grid(column=column, row=row, sticky=N+S+E+W)
                var = StringVar()
                var.trace('w', partial(self.entry_callback, (count-1), var))
                e = Entry(self.master, relief=RIDGE, textvariable=var)
                e.grid(column=(column+1), row=row, sticky=N+S+E+W)
                self.regs.append(e)
                self.flag_data.append(1)
                count += 1
        # Buttons
        self.__btn_write_all = Button(self.master,text="Write all reg.", command=partial(self.send_command, 0))
        self.__btn_write_all.grid(column=8, row=0, rowspan=2, padx=5, sticky=W+E)
        self.__btn_write_all.configure(state="disable")
        self.__btn_read_all = Button(self.master,text="Read all reg.", command=partial(self.send_command, 1))
        self.__btn_read_all.grid(column=8, row=2, rowspan=2, padx=5, sticky=W+E)
        self.__btn_ping = Button(self.master,text="Ping", command=partial(self.send_command, 2))
        self.__btn_ping.grid(column=8, row=4, rowspan=2, padx=5, sticky=W+E)
        self.__btn_stream = Button(self.master,text="Start stream.", command=partial(self.send_command, 3))
        self.__btn_stream.grid(column=8, row=6, rowspan=2, padx=5, sticky=W+E)
        self.__btn_stop = Button(self.master,text="Stop uC", command=partial(self.send_command, 4))
        self.__btn_stop.grid(column=8, row=8, rowspan=2, padx=5, sticky=W+E)
        self.__btn_settime = Button(self.master,text="Set time", command=partial(self.send_command, 5))
        self.__btn_settime.grid(column=8, row=10, rowspan=2, padx=5, sticky=W+E)
        self.__btn_transfer_fct = Button(self.master,text="Get transfer\nfunction", command=partial(self.send_command, 6))
        self.__btn_transfer_fct.grid(column=8, row=13, rowspan=2, padx=5, sticky=W+E)
        self.__btn_20_windows = Button(self.master,text="Get 20\nwindows", command=partial(self.send_command, 7))
        self.__btn_20_windows.grid(column=8, row=16, rowspan=2, padx=5, sticky=W+E)
        self.__btn_err_watchdog = Button(self.master,text="Err. watchdog", command=partial(self.send_command, 8))
        self.__btn_err_watchdog.grid(column=8, row=18, rowspan=2, padx=5, sticky=W+E)
        self.__btn_err_func_prob = Button(self.master,text="Err. function problem", command=partial(self.send_command, 9))
        self.__btn_err_func_prob.grid(column=8, row=20, rowspan=2, padx=5, sticky=W+E)
        self.__btn_err_exception = Button(self.master,text="Err. exception", command=partial(self.send_command, 10))
        self.__btn_err_exception.grid(column=8, row=22, rowspan=2, padx=5, sticky=W+E)
        self.__btn_err_assertion = Button(self.master,text="Err. assertion", command=partial(self.send_command, 11))
        self.__btn_err_assertion.grid(column=8, row=24, rowspan=2, padx=5, sticky=W+E)
        self.__btn_graph = Button(self.master,text="Open graph\nStore data", command=self.open_graph)
        self.__btn_graph.grid(column=8, row=29, rowspan=2, padx=5, sticky=W+E)
        # Listbox to show data transfert
        self.__text = Text(self.master, width=40)
        self.__text.grid(column=9, row=0, rowspan=32, pady=10, sticky=N+S)
        self.__scrlbar = Scrollbar(self.master)
        self.__scrlbar.grid(column=10, row=0, rowspan=32, pady=10, padx=5, sticky=N+S)
        self.__text.configure(yscrollcommand = self.__scrlbar.set)
        self.__scrlbar.configure(command=self.__text.yview)
        self.__text.insert(END, "List of command sent and received\n-------------------------")
        self.__text.configure(state="disable")

    ## Method to recover the register's value in a file
    # @param self : The object pointer
    def loadfile(self):
        file_path=filedialog.askopenfilename()
        if len(file_path) != 0:
            ff=open(file_path,'r')
            for reg in self.regs:
                reg.delete(0,END)
                reg.insert(END, str(ff.readline())[:-1])
            ff.close()

    ## Method to save the register's value in a file
    # @param self : The object pointer
    def savefile(self):
        if(sum(self.flag_data) == 0):
            file_path=filedialog.asksaveasfilename()
            if len(file_path) != 0:
                ff=open(file_path,'w')
                for reg in self.regs:
                    ff.write(str(reg.get())+"\n")
                ff.close()
        else:
            messagebox.showinfo("Warning", "Every register value must be in the right format!")

    ## Method callback for the "WM_DELETE_WINDOW" event and the EXIT menu button which quit the application
    # @param self : The object pointer
    def exit_prog(self):
        # If the graph window is open, first close it
        if(self.toplevel_flag): 
            self.close_graph()
            while(self.toplevel_flag):
                time.sleep(0.1)
        # If the zynq was streaming, stop it
        if(self.stream_flag):
            self.destroy_flag = True 
            self.send_command(3)
        count = 50
        while(self.stream_flag or (count > 0)):
            time.sleep(0.1)
            count -= 1
         # Stop the thread and wait on it to finish
        self.run_flag = False
        self.thread_cmd.join()
        if(self.get_transfer_fct_flag or self.get_20_windows_flag):
            self.thread_data.join()
        # Close the socket and destroy the main window
        self.sock.close()
        self.master.destroy()
        print("main destroy",  file=sys.stderr)

    ## Method callback for the HELP menu button
    # @param self : The object pointer
    def help_callback(self):
        print("help_callback")

    ## Method to determine if the string object is a number
    # @param self : The object pointer
    # @param s : String object
    # @return boolean : True or False
    def is_number(self, s):
        try:
            numb = int(s)
            if(numb >= 0):
                return True
            else:
                return False
        except ValueError:
            return False

    ## Method callback called when a caracter is written is one of the register entry
    # @param self : The object pointer
    # @param count : Register's number
    # @param var : Variable contained by the entry
    # @param *args : Unused
    def entry_callback(self, count, var, *args):
        # Get entry's contain
        s = var.get()
        # Test if it's a number that can stored in a 12bits register
        if(self.is_number(s) and (len(s) != 0)):
            if((int(s) < 4096) and (int(s) >= 0)):
                self.regs[count].configure(fg="black") # Ok
                self.flag_data[count] = 0
            else:
                self.regs[count].configure(fg="red") # Nok
                self.flag_data[count] = 1
        else:
            self.regs[count].configure(fg="red") # Nok
            self.flag_data[count] = 1
        # If there is a good value for every registers, the "Write all reg." is activated
        if(sum(self.flag_data) == 0):
            self.__btn_write_all.configure(state="normal")
        else:
            self.__btn_write_all.configure(state="disable")

    ## Method to write something in the main window's listbox
    # @param self : The object pointer
    # @param t : The text to write in the listbox
    def write_txt(self, t):
        self.__text.configure(state="normal") # activate activate the listbox
        self.__text.insert(END, ("\n" + t)) # add the text
        self.__text.see("end") # scroll to the last add-on
        self.__text.configure(state="disable") # disable the listbox, so the user can not change its content

    ## Method to initialize the UDP connection for the commands
    # @param self : The object pointer
    def init_UDP_cmd(self):
        ## Socket object used to established the UDP connection with the zynq
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.bind(('', self.UDP_PORT_CMD))
        self.sock.settimeout(0.1) # method sock.recvfrom return after maximum 0.1sec if no data are received

    ## Method to initialize the UDP connection for the data recovering
    # @param self : The object pointer
    def init_UDP_data(self):
        ## Socket object used to established the UDP connection with the zynq
        self.sock_data = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock_data.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 2097152) # change the size of the socket buffer
        self.sock_data.bind(('', self.UDP_PORT_data))
        self.sock_data.settimeout(0.1) # method sock.recvfrom return after maximum 0.1sec if no data are received
    
    ## Method to close the UDP connection for the data recovering
    # @param self : The object pointer
    def close_UDP_data(self):
        self.sock_data.shutdown(socket.SHUT_RDWR)
        self.sock_data.close()

    ## Method to send a command to the zynq
    # @param self : The object pointer
    # @param cmd : Command ID to send (a number)
    def send_command(self, cmd):
        # Build the frame
        payload = bytearray()
        payload.append(int("0x55", 0)) # frame's start code 0x55AA
        payload.append(int("0xAA", 0))
        payload.append(cmd)  # then then command ID
        payload.append(random.randrange(0,255)) # then a random number to put an "id" on every frame
        if(self.cmd[cmd] == 'write_all_reg'): # if the command is write register, add the register's value
            for reg in self.regs:
                numb = int(reg.get())
                payload.append(int(numb / 256))
                payload.append(int(numb % 256))
        if(self.cmd[cmd] == 'settime'): # if the command is set the time, add the time
            t = time.localtime() # Get the the UTC time with the time zone correction
            payload.append(t.tm_year - 2000)
            payload.append(t.tm_mon)
            payload.append(t.tm_mday)
            payload.append(t.tm_hour)
            payload.append(t.tm_min)
            payload.append(t.tm_sec)
        payload.append(int("0x33", 0)) # frame's end code 0x33CC
        payload.append(int("0xCC", 0))
        # show in the listbox the command to be send and send it
        if(self.cmd[cmd] == 'get_transfer_fct'):
            if(self.toplevel_flag):
                self.write_txt("To recover data, the graph window must be closed!")
                return
            else:
                self.__btn_graph.configure(state="disable")
                self.__btn_transfer_fct.configure(state="disable")
                self.__btn_20_windows.configure(state="disable")
                self.__btn_stream.configure(state="disable")
                self.init_UDP_data()
                ## Thread object which process the data received
                self.get_transfer_fct_flag = True
                self.thread_data=Thread(target=self.thread_data_int, args=())
                self.thread_timer=Timer(14, self.thread_timer_int)
                self.thread_data.start()
                self.thread_timer.start()
                print("transfer function")
        if(self.cmd[cmd] == 'get_20_windows'):
            if(self.toplevel_flag):
                self.write_txt("To get 20 windows, the graph window must be closed!")
                return
            else:
                self.__btn_graph.configure(state="disable")
                self.__btn_transfer_fct.configure(state="disable")
                self.__btn_20_windows.configure(state="disable")
                self.__btn_stream.configure(state="disable")
                self.init_UDP_data()
                ## Thread object which process the data received
                self.get_20_windows_flag = True
                self.thread_data=Thread(target=self.thread_data_int, args=())
                self.thread_timer=Timer(3, self.thread_timer_int)
                self.thread_data.start()
                self.thread_timer.start()
                print("20 windows")
        self.write_txt("Tx: " + self.cmd[cmd] + " rand=" + str(payload[3])) 
        self.sock.sendto(payload, (self.UDP_IP, self.UDP_PORT_CMD)) 

    ## Method to open the graph window
    # @param self : The object pointer
    def open_graph(self):
        # test if window already opened
        if(self.toplevel_flag == False): 
            # create 2nd window
            self.__toplevel = Toplevel(self.master) 
            ## Object of class Watchman_data (graphical window)
            self.window_data = gui_graphics.Watchman_graphic_window(self.__toplevel)
            self.toplevel_flag = True
            # attach the callback for the "WM_DELETE_WINDOW" event
            self.__toplevel.protocol("WM_DELETE_WINDOW", self.close_graph)

    ## Method to close the graph window
    # @param self : The object pointer
    def close_graph(self):
        self.window_data.exit_prog()
        self.toplevel_flag = False

    ## Method thread to process the data received by UDP
    # @param self : The object pointer
    def thread_data_int(self): 
        flag_error = False
        self.timer_thread_flag = False
        if(self.get_transfer_fct_flag == True):
            print("start of data thread for transfer function")
            file_data = open("get_transfer_function_test.bin", "wb")
            count = 5632
            size = 1031
        else:
            print("start of data thread for 20 windows")
            file_data = open("20_windows_test.bin", "wb")
            count = 20
            size = 1030
        cnt_data_recover = 0
        while((cnt_data_recover < count) and (self.timer_thread_flag == False) and (flag_error == False)):
            try:
                data = bytearray()
                data, adress = self.sock_data.recvfrom(size) # wait on data
                # process the data received
                if(adress[0] == self.UDP_IP): # test the emitter's ip
                    if((data[0] == int("0x55", 0)) and (data[1] == int("0xAA", 0))): # for every command look for start code
                        if((data[size-2] == int("0x33", 0)) and (data[size-1] == int("0xCC", 0))):
                            cnt_data_recover += 1
                            file_data.write(data)
                            if(self.get_transfer_fct_flag == True):
                                if(((data[3] + data[4]*256) == 0) or ((data[3] + data[4]*256) == 511)):
                                    print("Rx: vped = "+str(data[2]*0.25)+"V -> window = "+str(data[3] + data[4]*256))
                        else:
                            # error: no end code
                            self.write_txt("Rx: ERROR end of data")
                            flag_error = True
                    else:
                        # error: no start code
                        self.write_txt("Rx: ERROR start of data")
                        flag_error = True
                else:
                    # error: wrong emitter's ip
                    self.write_txt("Rx: ERROR ip of data")
                    flag_error = True
            # socket exception: no data for received before timeout
            except socket.timeout:
                time.sleep(0.1)
            # socket exception: problem during execution of socket.recvfrom
            except socket.error:
                dummy = 0 # dummy execution to catch the exception
        self.close_UDP_data()
        file_data.close()
        if((flag_error == False) and (self.timer_thread_flag == False)):
            if(self.get_transfer_fct_flag == True):
                self.write_txt("Get transfer function: passed!")
            else:
                self.write_txt("Get 20 windows: passed!")
        else:
            self.write_txt("Packet received = "+str(cnt_data_recover))
            if(self.get_transfer_fct_flag == True):
                self.write_txt("Get transfer function: failed!")
            else:
                self.write_txt("Get 20 windows: failed!")
        self.thread_timer.join()
        self.__btn_graph.configure(state="normal")
        self.__btn_transfer_fct.configure(state="normal")
        self.__btn_20_windows.configure(state="normal")
        self.__btn_stream.configure(state="normal")
        self.get_transfer_fct_flag = False
        self.get_20_windows_flag = False
        print("end of data thread", file=sys.stderr)

    ## Method thread to timeout the thread_get_20_wdo & thread_data
    # @param self : The object pointer
    def thread_timer_int(self):
        self.timer_thread_flag = True
        print("end of timer thread", file=sys.stderr)

    ## Method thread to process the command received by UDP (running all the time)
    # @param self : The object pointer
    def thread_cmd_int(self):
        while self.run_flag: # running flag
            try:
                data = bytearray()
                data, adress = self.sock.recvfrom(2*128+20) # wait on data
                # process the data received (echo command)
                if(adress[0] == self.UDP_IP): # test the emitter's ip
                    if((data[0] == int("0x55", 0)) and (data[1] == int("0xAA", 0))): # for every command look for start code
                        offset = 0
                        # stop/start command
                        if(self.cmd[data[2]] == 'start_stop_stream'):  
                            if(self.stream_flag): # stop streaming
                                if(self.destroy_flag == False):
                                    self.__btn_transfer_fct.configure(state="normal")
                                    self.__btn_20_windows.configure(state="normal")
                                    self.__btn_stream.configure(text="Start stream") # change the label of the stream button
                                    if(self.toplevel_flag): # if the 2nd window is open, print number of data received and lost
                                        self.write_txt("total of frame received =" + str(self.window_data.count))
                                        self.write_txt("LostCnt:"+str(self.window_data.lostcnt))
                                self.stream_flag = False
                            else: # start streaming
                                if(self.destroy_flag == False):
                                    self.__btn_transfer_fct.configure(state="disable")
                                    self.__btn_20_windows.configure(state="disable")
                                    self.__btn_stream.configure(text="Stop stream") # change the label of the stream button
                                    if(self.toplevel_flag): # if the 2nd window is open, reset number of data received and lost
                                        self.window_data.count = 0
                                        self.window_data.lostcnt = 0
                                self.stream_flag = True
                        # stop uC command
                        if(self.cmd[data[2]] == 'stop_uC'):
                            self.__btn_stream.configure(text="Start stream")
                            self.stream_flag = False
                        # read all registers command
                        if(self.cmd[data[2]] == 'read_all_reg'): # adapt index to find the frame's end code
                            offset = 128*2
                        # for every command look for the end code
                        if((data[4+offset] == int("0x33", 0)) and (data[5+offset] == int("0xCC", 0))):
                            if(self.destroy_flag == False):
                                self.write_txt("Rx: " + self.cmd[data[2]] + " rand=" + str(data[3]))
                                if(offset == 128*2): # in case of read all register command
                                    count = 4
                                    for reg in self.regs: # update the value registers value
                                        reg.delete(0,END)
                                        reg.insert(END, str(data[count]*256 + data[count+1]))
                                        count += 2
                        else:
                            # error: no end code
                            if(self.destroy_flag == False): 
                                self.write_txt("Rx: ERROR end of frame")
                    else:
                        # error: no start code
                        if(self.destroy_flag == False):
                            self.write_txt("Rx: ERROR start of frame")
                else:
                    # error: wrong emitter's ip
                    if(self.destroy_flag == False):
                        self.write_txt("Rx: ERROR ip of frame (" + adress[0] + ")")
            # socket exception: no data for received before timeout
            except socket.timeout:
                time.sleep(0.1)
            # socket exception: problem during execution of socket.recvfrom
            except socket.error:
                dummy = 0 # dummy execution to catch the exception
            #time.sleep(0.5)
        print("end of command thread", file=sys.stderr)

# create the main window
root = Tk()
root.resizable(width=FALSE, height=FALSE)

# create object Watchman_main_window
window_reg = Watchman_main_window(root)
# inifinity loop
root.mainloop()
