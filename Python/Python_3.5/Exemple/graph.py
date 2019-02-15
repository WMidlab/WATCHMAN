import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from tkinter import Label, Tk, Frame, RIDGE
root = Tk()
frame = Frame(root)
frame.grid()
l=Label(frame,relief=RIDGE,text="dsfkdsafjlkskfdsalkj\nkajdaskjdh")
l.grid(row=1, column=0)
figure, axes=plt.subplots(1,1)
figure.suptitle("asdfgh")
axes.plot([1, 2, 3, 4])
canvas = FigureCanvasTkAgg(figure, master=frame)
canvas.get_tk_widget().grid(row=0, column=0)

root.mainloop()