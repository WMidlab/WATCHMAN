#!/usr/bin/env python
############################################################################
#Author: Anthony
#Date:10/3/18
#
# Create GUi for WATCHMAN
###########################################################################
from tkinter import *
from tkinter import filedialog
from tkinter import messagebox
from tkinter import ttk
from functools import partial

class Window(Frame):          
    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.master = master
        self.regs = []
        self.flag_data = []
        self.init_window()

    def init_window(self):
        self.master.title("Watchman")

        # Tab
        self.tab = ttk.Notebook(self.master)
        self.tab.grid()
        # Adds tab 1 of the notebook
        self.tab_reg = ttk.Frame(self.tab)
        self.tab.add(self.tab_reg, text='Registers')
        # Adds tab 2 of the notebook
        self.tab_cmd = ttk.Frame(self.tab)
        self.tab.add(self.tab_cmd, text='Commands')

        # Menu bar        
        self.menu = Menu(self.master)
        self.master.config(menu=self.menu)
        self.submenu = Menu(self.menu)
        self.menu.add_cascade(label='Menu', menu=self.submenu)
        self.submenu.add_command(label='Load sequence...',command=self.openfile)
        self.submenu.add_command(label='Save sequence...',command=self.savefile)
        self.submenu.add_command(label='EXIT',command=self.exit_prog)
        self.menu.add_cascade(label='HELP',command=self.help_callback)

        # TAB1 ****************************************************
        # Table for the registers
        count = 0
        for i in range(0,4,2):
            for j in range(25):
                l = Label(self.tab_reg, relief=RIDGE,text= ("    Reg. " + str(count) + "   "))
                l.grid(column=i, row=j, sticky=NSEW)
                var = StringVar()
                var.trace('w', partial(self.entry_callback, count, var))
                e = Entry(self.tab_reg, relief=RIDGE, textvariable=var)
                e.grid(column=(i+1), row=j, sticky=NSEW)
                #var.set(0)
                #e.insert(END, '0')#'%d.%d' % (i, j))
                self.regs.append(e)
                self.flag_data.append(1)
                count += 1

        # Buttons for the registers
        self.btn_write_all = Button(self.tab_reg,text="Write all reg.", command=self.write_all_reg)
        self.btn_write_all.grid(column=0, row=26, sticky=NW)
        self.btn_write_all.configure(state="disable")
        self.btn_read_all = Button(self.tab_reg,text="Read all reg.", command=self.read_all_reg)
        self.btn_read_all.grid(column=3, row=26, sticky=NE)

        # TAB1 ****************************************************
        # Button to send commands
        self.btn_ping = Button(self.tab_cmd,text="Ping", command=self.send_ping)
        self.btn_ping.grid(column=0, row=0, padx=5, sticky=W+E)
        self.btn_read = Button(self.tab_cmd,text="Read Reg.", command=self.read_reg)
        self.btn_read.grid(column=0, row=1, padx=5, sticky=W+E)
        self.btn_write = Button(self.tab_cmd,text="Write Reg.", command=self.read_reg)
        self.btn_write.grid(column=0, row=2, padx=5, sticky=W+E)

        # Listbox to show data transfert
        self.text = Text(self.tab_cmd, width=40, height=33)
        self.text.grid(column=1, row=0, rowspan=3, pady=10)
        self.scrlbar = Scrollbar(self.tab_cmd)
        self.scrlbar.grid(column=2, row=0, rowspan=3, pady=10, sticky=N+S)
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
        self.master.destroy()

    def help_callback(self):
        print("help_callback")

    def write_all_reg(self):
        print("write_all_reg")
        for reg in self.regs:
            print (reg.get())
    
    def read_all_reg(self):
        print("read_reg")
        for reg in self.regs:
            print (reg.get())

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
    
    def send_ping(self):
        self.write_txt("Command ping sent")
    
    def write_reg(self):
        print("write_reg")
        for reg in self.regs:
            print (reg.get())
    
    def read_reg(self):
        print("read_reg")
        for reg in self.regs:
            print (reg.get())

    def write_txt(self, text):
        self.text.configure(state="normal")
        self.text.insert(END, ("\n" + text))
        self.text.configure(state="disable")


root = Tk()
root.resizable(width=FALSE, height=FALSE)

app = Window(root)
root.mainloop() 