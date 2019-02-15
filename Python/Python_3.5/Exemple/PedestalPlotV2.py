import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from tkinter import Label, Tk, Frame, FALSE, LEFT, RIGHT, RIDGE, N, S, W, E
import numpy as np
import re
import os

title = "Title of the frame"
comment = "comment lines\ncomment lines\n...."

root = Tk()
frame = Frame(root)
frame.grid()



path, dirs, files = next(os.walk("Data/"))
file_count = len(files)-1 #for the param file

file_list = list()

for i in range (0,file_count):
	filename = 'Data/%03d.txt' % i
	file_list.append(open(filename,"r"))


lines = 0
subplot = 321
subplots = 0

channel0 = []
channel1 = []
channel2 = []
channel3 = []
channel4 = []
channel5 = []
channel6 = []
channel7 = []
channel8 = []
channel9 = []
channel10 = []
channel11 = []
channel12 = []
channel13 = []
channel14 = []
channel15 = []


f, axarr = plt.subplots(1,file_count,sharey=True)

for tmp in file_list:
	f1 = tmp.readlines()

	channelx =[]
	channel0 = []
	channel1 = []
	channel2 = []
	channel3 = []
	channel4 = []
	channel5 = []
	channel6 = []
	channel7 = []
	channel8 = []
	channel9 = []
	channel10 = []
	channel11 = []
	channel12 = []
	channel13 = []
	channel14 = []
	channel15 = []
	y =[]

	for line in f1:
		line.split("\n")
		b1= line.split("\r")

		#if b1[1] == '\n':
		#	b2 = b1[0]
		#	b1 = b2

		for line in b1:

			b = line.split("\t")

			if len(b) == 16:
				c = [int(e) for e in b]

				channel0.append(c[0])
				channel1.append(c[1])
				channel2.append(c[2])
				channel3.append(c[3])

				channel4.append(c[4])
				channel5.append(c[5])
				channel6.append(c[6])
				channel7.append(c[7])

				channel8.append(c[8])
				channel9.append(c[9])
				channel10.append(c[10])
				channel11.append(c[11])

				channel12.append(c[12])
				channel13.append(c[13])
				channel14.append(c[14])
				channel15.append(c[15])

				for a in range(0, 16):
					channelx.append(a)

				for tmpc in c:
					y.append(tmpc)

		#plt.subplot(subplot)
		#plt.scatter(channelx,y)
		#subplot = subplot + 1

	#axarr[subplots].plot(channelx,y,'*')
	#axarr[subplots].plot(channelx,y,'*')

	# Channel 0
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(0)
		average = average + channel0[i]

	axarr[subplots].plot(0,average/32,'gs')
	axarr[subplots].plot(xaxis,channel0,'r*')
	labels = axarr[subplots].get_xticklabels()
	plt.setp(labels, rotation=45)

	# Channel 1
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(1)
		average = average + channel1[i]

	axarr[subplots].plot(1,average/32,'gs')
	axarr[subplots].plot(xaxis,channel1,'r*')


	# Channel 2
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(2)
		average = average + channel2[i]

	axarr[subplots].plot(2,average/32,'gs')
	axarr[subplots].plot(xaxis,channel2,'r*')


	# Channel 3
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(3)
		average = average + channel3[i]

	axarr[subplots].plot(3,average/32,'gs')
	axarr[subplots].plot(xaxis,channel3,'r*')


	# Channel 4
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(4)
		average = average + channel4[i]

	axarr[subplots].plot(4,average/32,'gs')
	axarr[subplots].plot(xaxis,channel4,'r*')


	# Channel 5
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(5)
		average = average + channel5[i]

	axarr[subplots].plot(5,average/32,'gs')
	axarr[subplots].plot(xaxis,channel5,'r*')


	# Channel 6
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(6)
		average = average + channel6[i]

	axarr[subplots].plot(6,average/32,'gs')
	axarr[subplots].plot(xaxis,channel6,'r*')


	# Channel 7
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(7)
		average = average + channel7[i]

	axarr[subplots].plot(7,average/32,'gs')
	axarr[subplots].plot(xaxis,channel7,'r*')


	# Channel 8
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(8)
		average = average + channel8[i]

	axarr[subplots].plot(8,average/32,'gs')
	axarr[subplots].plot(xaxis,channel8,'r*')


	# Channel 9
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(9)
		average = average + channel9[i]

	axarr[subplots].plot(9,average/32,'gs')
	axarr[subplots].plot(xaxis,channel9,'r*')


	# Channel 10
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(10)
		average = average + channel10[i]

	axarr[subplots].plot(10,average/32,'gs')
	axarr[subplots].plot(xaxis,channel10,'r*')


	# Channel 11
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(11)
		average = average + channel11[i]

	axarr[subplots].plot(11,average/32,'gs')
	axarr[subplots].plot(xaxis,channel11,'r*')


	# Channel 12
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(12)
		average = average + channel12[i]

	axarr[subplots].plot(12,average/32,'gs')
	axarr[subplots].plot(xaxis,channel12,'r*')


	# Channel 13
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(13)
		average = average + channel13[i]

	axarr[subplots].plot(13,average/32,'gs')
	axarr[subplots].plot(xaxis,channel13,'r*')


	# Channel 14
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(14)
		average = average + channel14[i]

	axarr[subplots].plot(14,average/32,'gs')
	axarr[subplots].plot(xaxis,channel14,'r*')


	# Channel 15
	xaxis = []
	average = 0
	for i in range(0,32):
		xaxis.append(15)
		average = average + channel15[i]

	axarr[subplots].plot(15,average/32,'gs')
	axarr[subplots].plot(xaxis,channel15,'r*')


	#axarr[subplots].plot([0,16],[subplots*0.25*4096/2.5,subplots*0.25*4096/2.5],'r')
	#axarr[subplots].plot([0,16],[1.25*4096/2.5,1.25*4096/2.5],'r')

	#axarr[subplots].set_xlabel("Vped = "+str(subplots*0.25))

	axarr[subplots].set_xlabel("Channels \nVped@"+str(subplots*0.25))
	axarr[subplots].set_xlim([0,15])

	subplots = subplots + 1

axarr[0].set_ylim([0,4096])	#shareY
axarr[0].set_ylabel("Readout from TARGETC\n ISEL@2300")

#axarr[0].set_ylim([2000,2096])	#shareY

root.title(title)
#f.suptitle("Vped VS Readout Samples")
f.set_size_inches(18,10)

canvas = FigureCanvasTkAgg(f, master=frame)
canvas.get_tk_widget().grid(row=0,column=0)

commenttitle = "Comment(s):"
l=Label(frame,text=commenttitle,anchor='w',justify=LEFT,font='Helvetica 12 bold')
l.grid(row=1,column=0,sticky=N+S+W+E)

l1=Label(frame,text=comment,anchor='w',justify=LEFT,font='Helvetica 11')
l1.grid(row=2,column=0,sticky=N+S+W+E)

#Read the parameter File
paramfile = open("Data/param.txt","r")
f1 = paramfile.readlines()
parameters = []
parameters.append("Parameter(s):\r\n")
for line in f1:
	parameters.append(line)
s = ''.join(parameters)

l1=Label(frame,text=s,anchor='n',justify=LEFT,font='Helvetica 11')
l1.grid(row=0,column=1,sticky=N+S+W+E)


root.resizable(width=FALSE,height=FALSE)

root.mainloop()
