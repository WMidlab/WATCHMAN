from threading import Thread
import time

flag = False
liste1=[]
liste2=[]
liste_tot=[]

def thread_int(*args1):
    global flag
    liste1=list(args1[0])
    liste2=list(args1[1])
    """liste1=liste_tot[0]
    liste2=liste_tot[1]"""
    print("liste1/thread:",liste1)
    print("liste2/thread:",liste2)
    del liste1[:]
    del liste2[:]
    print("liste1/thread:",liste1)
    print("liste2/thread:",liste2)
    for i in range(10,20):
        liste1.append(i)
    for i in range(110,120):
        liste2.append(i)
    print("liste1/thread:",liste1)
    print("liste2/thread:",liste2)
    flag=True
    while(flag):
        dummy=0
    print("liste1/thread:",liste1)
    print("liste2/thread:",liste2)

for i in range(0,10):
    liste1.append(i)
for i in range(100,110):
    liste2.append(i)
print("liste1/main:",liste1)
print("liste2/main:",liste2)
liste_tot.append(liste1)
liste_tot.append(liste2)
t=Thread(target=thread_int, args=(liste1,liste2))
t.start()
while(not flag):
    dummy = 0
print("liste1/main:",liste1)
print("liste2/main:",liste2)
del liste1[:]
del liste2[:]
print("liste1/main:",liste1)
print("liste2/main:",liste2)
flag=False

