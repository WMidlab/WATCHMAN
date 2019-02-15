#!/usr/bin/env python
############################################################################
# Author: Anthony
# Date:10/3/18
#
# Create GUi for WATCHMAN
# This module uses a fixed IP address and port number that must match the
# IP address of the MICROZED.
###########################################################################
from tkinter import *
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

class Window(Frame):          
    def __init__(self, master=None):
        Frame.__init__(self, master)
        # Global variable
        self.master = master
        self.regs = []
        self.flag_data = []
        self.UDP_IP = "192.168.1.10"
        self.UDP_PORT_ECHO = 7
        self.UDP_PORT_DATA = 8
        self.cmd = ['write_all_reg', 'read_all_reg', 'ping', 'start_strea', 'stop_uC']
        # Initialize the GUI
        self.init_window()
        self.init_UDP_connection()
        self.timer=Timer(0.5, self.timer_int, args=())
        self.timer_flag = True
        self.timer.start()

    def init_window(self):
        # Change window's title
        self.master.title("Watchman")
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
                l.grid(column=i, row=j, sticky=NSEW)
                var = StringVar()
                var.trace('w', partial(self.entry_callback, count, var))
                e = Entry(self.master, relief=RIDGE, textvariable=var)
                e.grid(column=(i+1), row=j, sticky=NSEW)
                #var.set(0)
                #e.insert(END, '0')#'%d.%d' % (i, j))
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
        self.timer_flag = False # stop the timer
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
        if(self.is_number(s) or (len(s) == 0)):
            self.regs[count].configure(fg="black")
            self.flag_data[count] = 0
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
        self.sock_7 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.sock_7.settimeout(0.1)
        #self.sock_8 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        #self.sock_8.bind(("", UDP_PORT_DATA))
        #self.sock_8.settimeout(0.1)

    def send_command(self, index):
        cmd = self.cmd[index]
        if(cmd == 'write_all_reg'):
            for reg in self.regs:
                cmd = cmd + '/' + str(reg.get())
        payload = 'head/' + str(random.randrange(0,1000)) + '/' + cmd + '/end/'
        self.write_txt("Tx: " + payload)
        self.sock_7.sendto(payload.encode('utf-8'), (self.UDP_IP, self.UDP_PORT_ECHO))

    def timer_int(self):
        while self.timer_flag:
            try:
                data = self.sock_7.recv(4300)
                self.write_txt("Rx: " + data.decode('utf-8'))
            except socket.timeout:
                dummy = 0 # dummy execution just to use try without trouble
            time.sleep(0.5)

root = Tk()
root.resizable(width=FALSE, height=FALSE)

app = Window(root)
root.mainloop() 