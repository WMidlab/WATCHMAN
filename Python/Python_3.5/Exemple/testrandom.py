from threading import Thread
import time

flag = False
liste=[]

def thread_int(*args):
    global flag
    liste=list(args)
    print("1) liste/thread:",liste)
    del liste[:]
    print("2) liste/thread:",liste)
    for i in range(10,20):
        liste.append(i)
    print("3) liste/thread:",liste)
    flag=True
    while(flag):
        dummy=0
    print("4) liste/thread:",liste)

for i in range(0,10):
    liste.append(i)
print("1) liste/main:",liste)
t=Thread(target=thread_int, args=(liste))
t.start()
while(not flag):
    dummy = 0
print("2) liste/main:",liste)
del liste[:]
print("3) liste/main:",liste)
flag=False

