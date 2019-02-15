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
data_file = list()
y = list()
x = np.linspace(0,2.5,11)
ax = plt.subplot(2,1,1)
ax.set_title("wdo="+str(window)+" | ch="+str(channel)+" | sample="+str(sample))
y_ideal = np.linspace(0,2047,11)
ax.plot(x, y_ideal, 'g-.', label='data ideal')

data_file.append(list())
file_name = "data_vped1_25_inputfloating.bin"
data_of_file(file_name, data_file[0])
y.append(list())
for voltage in range(0,11):
    y[0].append(data_file[0][voltage][window][channel][sample])
ax.plot(x, y[0], 'r--', label=('data with pedestal, vped@1.25V'))

data_file.append(list())
file_name = "data_vped1_25_inputfloating_nopedestal.bin"
data_of_file(file_name, data_file[1])
y.append(list())
for voltage in range(0,11):
    y[1].append(data_file[1][voltage][window][channel][sample])
ax.plot(x, y[1], 'r:', label=('data without pedestal, vped@1.25V'))

data_file.append(list())
file_name = "data_vped1_25_inputfloating_corrected.bin"
data_of_file(file_name, data_file[2])
y.append(list())
for voltage in range(0,11):
    y[2].append(data_file[2][voltage][window][channel][sample])
ax.plot(x, y[2], 'r', label=('data corrected, vped@1.25V'))

data_file.append(list())
file_name = "data_vped2_inputfloating.bin"
data_of_file(file_name, data_file[3])
y.append(list())
for voltage in range(0,11):
    y[3].append(data_file[3][voltage][window][channel][sample])
ax.plot(x, y[3], 'b--', label=('data with pedestal, vped@2V'))

data_file.append(list())
file_name = "data_vped2_inputfloating_nopedestal.bin"
data_of_file(file_name, data_file[4])
y.append(list())
for voltage in range(0,11):
    y[4].append(data_file[4][voltage][window][channel][sample])
ax.plot(x, y[4], 'b:', label=('data without pedestal, vped@2V'))

data_file.append(list())
file_name = "data_vped2_inputfloating_corrected.bin"
data_of_file(file_name, data_file[5])
y.append(list())
for voltage in range(0,11):
    y[5].append(data_file[5][voltage][window][channel][sample])
ax.plot(x, y[5], 'b', label=('data corrected, vped@2V'))

ax.grid(True)
ax.legend()

ax = plt.subplot(2,1,2)
ax.set_title('difference')
y_diff = list()
y_diff.append(list())
y_diff.append(list())
y_diff.append(list())
y_diff.append(list())

for voltage in range(0,11):
    y_diff[0].append(y[0][voltage]-y_ideal[voltage])
    y_diff[1].append(y[3][voltage]-y_ideal[voltage])
    y_diff[2].append(y[2][voltage]-y_ideal[voltage])
    y_diff[3].append(y[5][voltage]-y_ideal[voltage])

ax.plot(x, y_diff[0], 'r--', label='data with pedestal, vped@1.25V')
ax.plot(x, y_diff[1], 'b--', label='data with pedestal, vped@2V')
ax.plot(x, y_diff[2], 'r', label='data corrected, vped@1.25V')
ax.plot(x, y_diff[3], 'b', label='data corrected, vped@2V')
ax.grid(True)
ax.legend()

plt.show()
