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

window = 0
channel = 0
sample = 0
x = np.linspace(0,2.5,11)
degree = 3
range_min = 3
range_max = 9

data_file = list()
y = list()
ax_1_25 = plt.subplot(2,1,1)
ax_1_25.set_title("vped@1.25V, wdo="+str(window)+" | ch="+str(channel)+" | sample="+str(sample))
y_ideal = np.linspace(0,2047,11)
ax_1_25.plot(x, y_ideal, ':', label='data ideal')
file_name = "data_vped1_25_amplifiershorted.bin"
data_of_file(file_name, data_file)
for j in range(0,11):
    y.append(data_file[j][window][channel][sample])
ax_1_25.plot(x, y, label=('data real'))

y_diff = y-y_ideal
ax_diff = plt.subplot(2,1,2)
ax_diff.plot(x, y_diff, ':', label='difference real')
p = np.polyfit(x[range_min:range_max], y_diff[range_min:range_max], degree)
f = np.poly1d(p)
ax_diff.plot(x, f(x), label="difference fit: degree="+str(degree))

y_corrected = y-f(x)
ax_1_25.plot(x, y_corrected, label=('data corrected'))
ax_diff.plot(x, y_corrected-y_ideal, label=('difference corrected'))

ax_1_25.grid(True)
ax_1_25.legend()
ax_diff.grid(True)
ax_diff.legend()
plt.show()
