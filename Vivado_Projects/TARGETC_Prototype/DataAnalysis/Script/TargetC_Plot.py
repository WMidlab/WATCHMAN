import matplotlib.pyplot as plt
import numpy as np
import os.path as path



f = open("TestTargetC.txt","r")
x =[]
ch0 =[]
ch1 =[]
ch2 =[]
ch3 =[]
i = 0

f1 = f.readlines()
for line in f1:
    #print(x)
    line.rstrip("\n")
    b = line.split("\t")

    c = [int(e) for e in b]

    x.append(c[0])
    ch0.append(c[1]-0x00000000)
    ch1.append(c[2]-0x30000000)
    #ch2.append(c[3]-0x20000000)
    #ch3.append(c[4]-0x30000000)


# N = 100
# x = np.linspace(0, 10, N)
# y = np.random.randn(N)

plt.plot(x,ch0,'k')
plt.plot(x,ch1,'b')
#plt.plot(x,ch2,'g')
#plt.plot(x,ch3,'r')
#
# #Format Plot
plt.xlabel('X some numbers')
plt.ylabel('Y some numbers')
plt.title('Main Title')
plt.legend(['CH0', 'CH1', 'CH2', 'CH3'], loc='upper left')
plt.grid(True)
plt.savefig('Figure.png')
plt.show()
