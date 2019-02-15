#!/usr/bin/env python
############################################################################
# Author: Anthony
# Date:10/3/18
#
# Create GUi for WATCHMAN
# This module uses a fixed IP address and port number that must match the
# IP address of the MICROZED.
###########################################################################
from tkinter import Tk, Toplevel, Label, Button, Menu, Entry, Text, Scrollbar, StringVar, FALSE, RIDGE, N, S, E, W, END
from tkinter import filedialog
from tkinter import messagebox
from tkinter import ttk
from functools import partial
from threading import Timer
import time
import sys
import socket
import optparse
import random
import receive_V2

#class Watchman_reg(Frame):
class Watchman_reg():          
    #def __init__(self, master=None):
    def __init__(self, master):
        #Frame.__init__(self, master)
        # Global variable
        self.master = master
        self.regs = []
        self.flag_data = []
        self.UDP_IP = '192.168.1.10'
        self.UDP_PORT = 7
        self.cmd = ['write_all_reg', 'read_all_reg', 'ping', 'start_stop_stream', 'stop_uC']
        self.stopstart = 0
        # Initialize the GUI
        self.init_window()
        self.init_UDP_connection()
        self.timer=Timer(0.5, self.timer_int, args=())
        self.run_flag = True
        self.end_flag = False
        self.toplevel_flag = False
        self.timer.start()

    def init_window(self):
        # Change window's title
        self.master.title("Watchman - registers")
        self.master.protocol("WM_DELETE_WINDOW", self.exit_prog) # when use close window with the red cross
        # Menu bar        
        self.menu = Menu(self.master)
        self.master.config(menu=self.menu)
        self.submenu = Menu(self.menu)
        self.menu.add_cascade(label='Menu', menu=self.submenu)
        self.submenu.add_command(label='Load sequence...',command=self.openfile)
        self.submenu.add_command(label='Save sequence...',command=self.savefile)
        self.submenu.add_command(label='EXIT',command=self.exit_prog)
        self.menu.add_cascade(label='HELP',command=self.help_callback)
        # Table for the registers
        count = 0
        for i in range(0,4,2):
            for j in range(25):
                l = Label(self.master, relief=RIDGE,text= ("    Reg. " + str(count) + "   "))
                l.grid(column=i, row=j, sticky=N+S+E+W)
                var = StringVar()
                var.trace('w', partial(self.entry_callback, count, var))
                e = Entry(self.master, relief=RIDGE, textvariable=var)
                e.grid(column=(i+1), row=j, sticky=N+S+E+W)
                self.regs.append(e)
                self.flag_data.append(1)
                count += 1
        # Buttons
        self.btn_write_all = Button(self.master,text="Write all reg.", command=partial(self.send_command, 0))
        self.btn_write_all.grid(column=4, row=0, rowspan=2, padx=5, sticky=W+E)
        self.btn_write_all.configure(state="disable")
        self.btn_read_all = Button(self.master,text="Read all reg.", command=partial(self.send_command, 1))
        self.btn_read_all.grid(column=4, row=2, rowspan=2, padx=5, sticky=W+E)
        self.btn_ping = Button(self.master,text="Ping", command=partial(self.send_command, 2))
        self.btn_ping.grid(column=4, row=4, rowspan=2, padx=5, sticky=W+E)
        self.btn_stream = Button(self.master,text="Start stream.", command=partial(self.send_command, 3))
        self.btn_stream.grid(column=4, row=6, rowspan=2, padx=5, sticky=W+E)
        self.btn_stop = Button(self.master,text="Stop uC", command=partial(self.send_command, 4))
        self.btn_stop.grid(column=4, row=8, rowspan=2, padx=5, sticky=W+E)
        # Listbox to show data transfert
        self.text = Text(self.master, width=40)
        self.text.grid(column=5, row=0, rowspan=25, pady=10, sticky=N+S)
        self.scrlbar = Scrollbar(self.master)
        self.scrlbar.grid(column=6, row=0, rowspan=25, pady=10, padx=5, sticky=N+S)
        self.text.configure(yscrollcommand = self.scrlbar.set)
        self.scrlbar.configure(command=self.text.yview)
        self.text.insert(END, "List of command sent and received\n-------------------------")
        self.text.configure(state="disable")

    def openfile(self):
        file_path=filedialog.askopenfilename()
        if len(file_path) != 0:
            ff=open(file_path,'r')
            for reg in self.regs:
                reg.delete(0,END)
                reg.insert(END, str(ff.readline())[:-1])
            ff.close()
    
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
    
    def exit_prog(self):
        if(self.toplevel_flag):
            print("test1 ",  file=sys.stderr)
            self.toplevel_quit()
            while(self.toplevel_flag):
                time.sleep(0.1)
            #self.window_data.exit_prog()
            print("tests2 ",  file=sys.stderr)
        self.run_flag = False # stop the timer
        while(self.end_flag == False):
            time.sleep(0.1)
        self.sock.close()
        self.master.destroy()

    def help_callback(self):
        print("help_callback")

    def is_number(self, s):
        try:
            numb = int(s)
            if(numb >= 0):
                return True
            else:
                return False
        except ValueError:
            return False

    def entry_callback(self, count, var, *args):
        s = var.get()
        if(self.is_number(s) and (len(s) != 0)):
            if((int(s) < 4096) and (int(s) >= 0)):
                self.regs[count].configure(fg="black")
                self.flag_data[count] = 0
            else:
                self.regs[count].configure(fg="red")
                self.flag_data[count] = 1
        else:
            self.regs[count].configure(fg="red")
            self.flag_data[count] = 1        
        if(sum(self.flag_data) == 0):
            self.btn_write_all.configure(state="normal")
        else:
            self.btn_write_all.configure(state="disable")
    
    def write_txt(self, text):
        self.text.configure(state="normal")
        self.text.insert(END, ("\n" + text))
        self.text.see("end")
        self.text.configure(state="disable")

    def init_UDP_connection(self):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock.bind(('', self.UDP_PORT))
        self.sock.settimeout(0.1)

    def send_command(self, cmd):
        payload = bytearray()
        payload.append(int("0x55", 0))
        payload.append(int("0xAA", 0))
        payload.append(cmd)
        payload.append(random.randrange(0,255))
        if(self.cmd[cmd] == 'write_all_reg'):
            for reg in self.regs:
                numb = int(reg.get())
                payload.append(int(numb / 256))
                payload.append(int(numb % 256))
        payload.append(int("0x33", 0))
        payload.append(int("0xCC", 0))
        self.write_txt("Tx: " + self.cmd[cmd] + " rand=" + str(payload[3]))
        self.sock.sendto(payload, (self.UDP_IP, self.UDP_PORT))

    def timer_int(self):
        while self.run_flag:
            try:
                data = bytearray()
                data, adress = self.sock.recvfrom(200)
                if(adress[0] == self.UDP_IP):
                    if((data[0] == int("0x55", 0)) and (data[1] == int("0xAA", 0))):
                        if(self.cmd[data[2]] == 'start_stop_stream'): 
                            if(self.stopstart == 0):
                                self.btn_stream.configure(text="Stop stream")
                                self.toplevel = Toplevel(self.master)
                                self.window_data = receive_V2.Watchman_data(self.toplevel)
                                self.toplevel.protocol("WM_DELETE_WINDOW", self.toplevel_quit)
                                self.toplevel_flag = True
                                self.stopstart = 1
                            else:
                                print("end stream received", file=sys.stderr)
                                #self.btn_stream.configure(text="Start stream")
                                #print("btn canged", file=sys.stderr)
                                self.window_data.exit_prog()
                                print("exite toplevel done", file=sys.stderr)
                                self.toplevel_flag = False
                                self.stopstart = 0
                        if(self.cmd[data[2]] == 'stop_uC'):
                            self.btn_stream.configure(text="Start stream") 
                            self.stopstart = 0     
                        if(self.cmd[data[2]] == 'read_all_reg'):
                            offset = 100
                        else:
                            offset = 0
                        if((data[4+offset] == int("0x33", 0)) and (data[5+offset] == int("0xCC", 0))):
                            self.write_txt("Rx: " + self.cmd[data[2]] + " rand=" + str(data[3]))
                            if(offset != 0):
                                count = 4
                                for reg in self.regs:
                                    reg.delete(0,END)
                                    reg.insert(END, str(data[count]*256 + data[count+1]))
                                    count += 2
                        else:
                            self.write_txt("Rx: ERROR end of frame")
                    else:
                        self.write_txt("Rx: ERROR start of frame")
                else:
                    self.write_txt("Rx: ERROR ip of frame (" + adress[0] + ")")                    
            except socket.timeout:
                dummy = 0 # dummy execution just to use try without trouble
            except socket.error:
                dummy = 0
            #time.sleep(0.5)
        print("end of main timer", file=sys.stderr)
        self.end_flag = True
            
    def toplevel_quit(self):
        print("close toplevel", file=sys.stderr)
        self.send_command(3) # command stop stream

    def __del__(self):
        print("main died", file=sys.stderr)


root = Tk()
root.resizable(width=FALSE, height=FALSE)

window_reg = Watchman_reg(root)
root.mainloop() 