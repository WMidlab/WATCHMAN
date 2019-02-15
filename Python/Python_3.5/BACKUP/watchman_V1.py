#!/usr/bin/env python
############################################################################
#Author: Anthony
#Date:10/3/18
#
# Create GUi for WATCHMAN
###########################################################################
from tkinter import *
from functools import partial

root = Tk()
root.wm_title("Watchman")  # Window name

class GraphWindow(Frame):          
    def __init__(self):
        Frame.__init__(self)
        self.frame = Frame()
        self.frame.grid()
        #self.frame.update_idletasks()
        self.regs = []
        count = 0

        self.btn_write = Button(self.frame,text="Write Reg.")
        self.btn_write.grid(column=0, row=26, sticky=NW)
        self.btn_read = Button(self.frame,text="Read Reg.")
        self.btn_read.grid(column=3, row=26, sticky=NE)

        def entry_callback(count, var, *args):
            s = var.get()
            if(is_number(s) or (len(s) == 0)):
                self.regs[count].configure(fg="black")
                self.btn_write.configure(state="normal")
            else:
                self.regs[count].configure(fg="red")
                self.btn_write.configure(state="disable")

        for i in range(0,4,2):
            for j in range(25):
                l = Label(self.frame, relief=RIDGE,text= ("Reg. " + str(count)))
                l.grid(column=i, row=j, sticky=NSEW)
                var = StringVar()
                var.trace('w', partial(entry_callback, count, var))
                e = Entry(self.frame, relief=RIDGE, textvariable=var)
                e.grid(column=(i+1), row=j, sticky=NSEW)
                #var.set(0)
                #e.insert(END, '0')#'%d.%d' % (i, j))
                self.regs.append(e)
                count += 1

        def is_number(s):
            try:
                numb = int(s)
                if(numb >= 0):
                    return True
                else:
                    return False
            except ValueError:
                return False


        def write_reg_callback(arg):
            for reg in self.regs:
                print (reg.get())
        self.btn_write.bind("<Button-1>", write_reg_callback)

        def read_reg_callback(arg):
            for reg in self.regs:
                print (reg.get())
        self.btn_read.bind("<Button-1>", read_reg_callback)

GraphWindow().mainloop() 