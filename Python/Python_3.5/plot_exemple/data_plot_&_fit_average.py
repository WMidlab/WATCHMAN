#!/usr/bin/env python
############################################################################
# Author: Anthony
# Date:10/3/18
#
# Plot the recovered data_1_25
###########################################################################

# Libraries
import sys
import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import interp1d

def data_of_file(file, data_list):
    print("file: "+file)
    f = open(file, "rb")
    start_code = list()
    header_vped = list()
    header_window = list()
    end_code = list()
    for k in range(0,11):
        window = list()
        for i in range(0,512):
            start_code.append(f.read(2))
            header_vped.append(int.from_bytes(f.read(1), byteorder='little', signed=False)*0.25)
            header_window.append(int.from_bytes(f.read(2), byteorder='little', signed=False))
            channel = list()
            for j in range(0,16):
                sample = list()
                for m in range(0,32):
                    sample.append(int.from_bytes(f.read(2), byteorder='little', signed=False))
                channel.append(sample)
            window.append(channel)
            end_code.append(f.read(2))
        data_list.append(window)
    f.close()
    general_flag=True
    flag=True
    for tmp in start_code:
        if(str(tmp.hex()) != "55aa"):
            #print("  - problem start code="+str(tmp.hex()))
            general_flag=False
            flag=False
    if(flag):
        print("  - start code are ok!")
    else:
        print("  - start code failed!")
    flag=True
    for i in range(0,11):
        vped = i*0.25
        for j in range(0,512):
            if(header_vped[i*512 + j] != vped):
                #print("  - problem header vped="+str(header_vped[i*512 + j])+" | vped="+str(vped))
                general_flag=False
                flag=False
    if(flag):
        print("  - header vped are ok!")
    else:
        print("  - header vped failed!")
    flag=True
    for i in range(0,11):
        for j in range(0,512):
            if(header_window[i*512 + j] != j):
                print("  - problem header window="+str(header_window[i*512 + j])+" | window="+str(j))
                general_flag=False
                flag=False
    if(flag):
        print("  - header window are ok!")
    else:
        print("  - header window failed!")
    flag=True
    for tmp in end_code:
        if(str(tmp.hex()) != "33cc"):
            print("  - problem end code="+str(tmp.hex()))
            general_flag=False
            flag=False
    if(flag):
        print("  - end code are ok!")
    else:
        print("  - end code failed!")
    if(general_flag == False):
        sys.exit()

x = np.linspace(0,2.5,11)
degree = 3
range_min = 3
range_max = 9
file_name = "data_vped1_25_inputfloating.bin"

data_file = list()
y_average = list()
ax = list()
suptitle_name = file_name+" | without ch12 | degree="+str(degree)+" | range("+str(range_min*0.25)+"V; "+str(range_max*0.25)+"V)"
fig, ax = plt.subplots(2,1)
fig.suptitle(suptitle_name)
y_ideal = np.linspace(0,2047,11)
ax[0].plot(x, y_ideal, ':', label='data ideal')
data_of_file(file_name, data_file)
for voltage in range(0,11):
    y_tmp = 0
    for window in range(0,512):
        for channel in range(0,16):
            for sample in range(0,32):
                if((channel != 12)):
                    y_tmp = y_tmp + data_file[voltage][window][channel][sample] 
    y_average.append(y_tmp/(512*15*32))
    #y_average.append(y_tmp/(512*16*32))
ax[0].plot(x, y_average, label=('data average'))
y_diff = y_average - y_ideal
ax[1].plot(x, y_diff, ':', label='difference average')
p = np.polyfit(x[range_min:range_max], y_diff[range_min:range_max], degree)
f = np.poly1d(p)
ax[1].plot(x, f(x), label="difference fit")
y_corrected = y_average-f(x)
ax[0].plot(x, y_corrected, label=('data corrected'))
ax[1].plot(x, y_corrected - y_ideal, label=('difference corrected'))
ax[0].grid(True)
ax[0].legend()
ax[1].grid(True)
ax[1].legend()
#mng = plt.get_current_fig_manager()
#mng.full_screen_toggle()

y_diff_hist = list()
suptitle_name = file_name+" | without ch12 | histogram of difference with average"
fig = plt.figure()
#fig, ax = plt.subplots(6,2)
fig.suptitle(suptitle_name)
ax = list()
window_l = list()
channel_l = list()
sample_l= list()
for voltage in range(0,11):
    ax.append(plt.subplot(6,2,voltage+1))
    y_diff_hist.append(list())
    for window in range(0,512):
        for channel in range(0,16):
            for sample in range(0,32):
                if((channel != 12)):
                    y_diff_hist[voltage].append(data_file[voltage][window][channel][sample] - y_average[voltage])
                    if((y_diff_hist[voltage][-1] < -150) or (y_diff_hist[voltage][-1] > 150)):
                        window_l.append(window)
                        channel_l.append(channel)
                        sample_l.append(sample)
    bins = np.linspace(min(y_diff_hist[voltage]),max(y_diff_hist[voltage]),max(y_diff_hist[voltage])-min(y_diff_hist[voltage]))
    plt.hist(y_diff_hist[voltage], bins)
    #ax[voltage].plt.hist(y_diff_hist[voltage], bins)
    ax[voltage].grid(True)
#mng = plt.get_current_fig_manager()
#mng.full_screen_toggle()

suptitle_name = file_name+" | histogram of value <-150 or >150 in histogram of difference with average"
fig = plt.figure()
fig.suptitle(suptitle_name)
ax = plt.subplot(3,1,1)
ax.set_title('window')
bins = np.linspace(0,512,513)
plt.hist(window_l, bins)
ax = plt.subplot(3,1,2)
ax.set_title('channel')
bins = np.linspace(0,16,17)
plt.hist(channel_l, bins)
ax = plt.subplot(3,1,3)
ax.set_title('sample')
bins = np.linspace(0,32,33)
plt.hist(sample_l, bins)

plt.show()
