#!/usr/bin/env python
############################################################################
#Author: Anthony
#Date:10/3/18
#
# Create GUi for WATCHMAN
###########################################################################
from tkinter import *
from functools import partial

window = Tk()
window.wm_title("Vivent")  # Window name

regs = []
count = 0

def is_number(s):
    try:
        numb = int(s)
        if(numb >= 0):
            return True
        else:
            return False
    except ValueError:
        return False

def write_reg():
    for reg in regs:
        print (reg.get())
btn_write = Button(text='Write Reg.', command=write_reg).grid(column=0, row=26, sticky=NW)

def read_reg():
    for reg in regs:
        print (reg.get())
btn_read = Button(text='Read Reg.', command=read_reg).grid(column=3, row=26, sticky=NE)

def callback(count, var, *args):
    s = var.get()
    print("Reg.", count, " | value =", s)
    if(is_number(s) or (len(s) == 0)):
        regs[count].configure(fg="black")
        btn_write.configure(state="normal")
    else:
        regs[count].configure(fg="red")
        btn_write.configure(state="disable")


for i in range(0,4,2):
    for j in range(25):
        l = Label(relief=RIDGE,text= ("Reg. " + str(count)))
        l.grid(column=i, row=j, sticky=NSEW)
        var = StringVar()
        var.trace('w', partial(callback, count, var))
        e = Entry(window, relief=RIDGE, textvariable=var)
        e.grid(column=(i+1), row=j, sticky=NSEW)
        #var.set(0)
        #e.insert(END, '0')#'%d.%d' % (i, j))
        regs.append(e)
        count += 1

window.mainloop()