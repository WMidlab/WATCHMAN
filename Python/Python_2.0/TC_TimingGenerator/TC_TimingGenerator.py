import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import step, show

# **************************************************************************
# Constant Parameters
#
# SSTOUFB & 58 \\
SSPIN_LE = 7
SSPIN_TE = 38
WR_STRB2_LE = 25
WR_STRB2_TE = 35
WR2_ADDR_LE = 5
WR2_ADDR_TE = 15
WR_STRB1_LE = 57
WR_STRB1_TE = 3
WR1_ADDR_LE = 37
WR1_ADDR_TE = 47
# **************************************************************************

def binary_data(data):
    return [1 if x in data else 0 for x in range(data[-1] + 1)]

data = []
xaxis = []
yaxis = []
for i in range(0,33):
    data.append(i)
for i in range(65,97):
    data.append(i)
for i in range(129,161):
    data.append(i)
for i in range(193,225):
    data.append(i)
for i in range(257,289):
    data.append(i)


print data
SSTIN = binary_data(data)

SSPIN = []
WR1_ADDR = []
WR2_ADDR = []
WR_STRB1 = []
WR_STRB2 = []

SSTIN_dly = []
for i in range(0, 65):
    SSTIN_dly.append(list())
    for j in range(0,len(SSTIN)):
        SSTIN_dly[i].append(SSTIN[j])

for i in range(0,65):
    for k in range(0,i):
        if k > 32 :
            SSTIN_dly[i].insert(0,1)
            SSTIN_dly[i].pop(-1)
        else:
            SSTIN_dly[i].insert(0,0)
            SSTIN_dly[i].pop(-1)




# SSPIN
SSPIN.append(0)
for i in range(1,len(SSTIN)):
    if SSTIN_dly[SSPIN_TE][i] == 1:
        SSPIN.append(0)
    elif SSTIN_dly[SSPIN_LE][i] == 1 and SSTIN_dly[SSPIN_LE][i-1] == 0:
        SSPIN.append(1)
    else:
        SSPIN.append(SSPIN[i-1])

WR_STRB2.append(0)
for i in range(1,len(SSTIN)):
    if SSTIN_dly[WR_STRB2_TE][i] == 1:
        WR_STRB2.append(0)
    elif SSTIN_dly[WR_STRB2_LE][i] == 1 and SSTIN_dly[WR_STRB2_LE][i-1] == 0:
        WR_STRB2.append(1)
    else:
        WR_STRB2.append(WR_STRB2[i-1])

WR_STRB1.append(0)
for i in range(1,len(SSTIN)):
    if SSTIN_dly[WR_STRB1_TE][i] == 1:
        WR_STRB1.append(0)
    elif SSTIN_dly[WR_STRB1_LE][i] == 1 and SSTIN_dly[WR_STRB1_LE][i-1] == 0:
        WR_STRB1.append(1)
    else:
        WR_STRB1.append(WR_STRB1[i-1])

WR1_ADDR.append(0)
for i in range(1,len(SSTIN)):
    if SSTIN_dly[WR1_ADDR_TE][i] == 1:
        WR1_ADDR.append(0)
    elif SSTIN_dly[WR1_ADDR_LE][i] == 1 and SSTIN_dly[WR1_ADDR_LE][i-1] == 0:
        WR1_ADDR.append(1)
    else:
        WR1_ADDR.append(WR1_ADDR[i-1])

WR2_ADDR.append(0)
for i in range(1,len(SSTIN)):
    if SSTIN_dly[WR2_ADDR_TE][i] == 1:
        WR2_ADDR.append(0)
    elif SSTIN_dly[WR2_ADDR_LE][i] == 1 and SSTIN_dly[WR2_ADDR_LE][i-1] == 0:
        WR2_ADDR.append(1)
    else:
        WR2_ADDR.append(WR2_ADDR[i-1])

# Removing first SSTIN Cycle (Initialization)
for i in range(0,64):
    SSTIN.pop(0)
    SSPIN.pop(0)
    WR1_ADDR.pop(0)
    WR2_ADDR.pop(0)
    WR_STRB1.pop(0)
    WR_STRB2.pop(0)



# Plot paramete
for i in range(0,len(SSTIN)):
    xaxis.append(i)

f, axarr = plt.subplots(6,1)
f.patch.set_facecolor('white')
f.suptitle("TARGETC Timing Generator (TC_TimingGen)", fontsize=22,fontweight='bold')
plt.subplots_adjust(left=0.125, bottom=0.1, right=0.9, top=0.9, wspace=0.2, hspace=0.9)
plt.style.use('classic')

axarr[0].step(xaxis,SSTIN,'g',linewidth=2.0)
axarr[1].step(xaxis,SSPIN,'g',linewidth=2.0)
axarr[2].step(xaxis,WR1_ADDR,'g',linewidth=2.0)
axarr[3].step(xaxis,WR_STRB1,'g',linewidth=2.0)
axarr[4].step(xaxis,WR2_ADDR,'g',linewidth=2.0)
axarr[5].step(xaxis,WR_STRB2,'g',linewidth=2.0)

axarr[0].text(-30,1,"SSTIN",fontsize=20,horizontalalignment='left',fontweight='bold')
axarr[1].text(-30,1,"SSPIN",fontsize=20,horizontalalignment='left',fontweight='bold')
axarr[1].text(-30,0.60,"LE : "+str(SSPIN_LE),fontsize=17,horizontalalignment='left')
axarr[1].text(-30,0.20,"TE : "+str(SSPIN_TE),fontsize=17,horizontalalignment='left')
axarr[2].text(-30,1,"WR1_ADDR",fontsize=20,horizontalalignment='left',fontweight='bold')
axarr[2].text(-30,0.60,"LE : "+str(WR1_ADDR_LE),fontsize=17,horizontalalignment='left')
axarr[2].text(-30,0.20,"TE : "+str(WR1_ADDR_TE),fontsize=17,horizontalalignment='left')
axarr[3].text(-30,1,"WR_STRB1",fontsize=20,horizontalalignment='left',fontweight='bold')
axarr[3].text(-30,0.60,"LE : "+str(WR_STRB1_LE),fontsize=17,horizontalalignment='left')
axarr[3].text(-30,0.20,"TE : "+str(WR_STRB1_TE),fontsize=17,horizontalalignment='left')
axarr[4].text(-30,1,"WR2_ADDR",fontsize=20,horizontalalignment='left',fontweight='bold')
axarr[4].text(-30,0.60,"LE : "+str(WR2_ADDR_LE),fontsize=17,horizontalalignment='left')
axarr[4].text(-30,0.20,"TE : "+str(WR2_ADDR_TE),fontsize=17,horizontalalignment='left')
axarr[5].text(-30,1,"WR_STRB2",fontsize=20,horizontalalignment='left',fontweight='bold')
axarr[5].text(-30,0.60,"LE : "+str(WR_STRB2_LE),fontsize=17,horizontalalignment='left')
axarr[5].text(-30,0.20,"TE : "+str(WR_STRB2_TE),fontsize=17,horizontalalignment='left')



for i in range(0,6):
    axarr[i].axhline(0, color='black', lw=2)
    axarr[i].axvline(0, color='black', lw=2)

    axarr[i].set_ylim(-0.1, 1.1)
    axarr[i].tick_params(axis='both',labelsize=17)
    axarr[i].grid(which='both')
    axarr[i].set_yticks([0,1])
    axarr[i].xaxis.set_ticks(np.arange(min(xaxis), max(xaxis)+1, 10.0))
    axarr[i].set_xlim(min(xaxis), max(xaxis)-10)
    axarr[i].set_xlabel("Time [ns]",fontsize = 17)

plt.show()
