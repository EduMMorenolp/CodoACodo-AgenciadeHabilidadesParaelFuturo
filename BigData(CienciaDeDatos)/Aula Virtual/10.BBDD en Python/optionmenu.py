from tkinter import *
from tkinter import messagebox

root = Tk()
root.title('OptionMenu')
root.geometry('300x300')
root.config(padx=20, pady=20)

mi_frame = Frame(root)
mi_frame.pack(expand=TRUE)

def colorear(eleccion):    
    eleccion = mi_color.get()
    root.config(bg=eleccion)

def check(*args):
    messagebox.showinfo('¡CAMBIO DETECTADO!',f'La variable cambió a "{mi_color.get()}"')

colores = ['green', 'magenta', 'cyan', 'turquoise', 'pink', 'red', 'blue']

mi_color = StringVar()
mi_color.set(colores[2])
mi_color.trace('w', check) # w pide que detecte la escritura y dispare la fx 'check'

opt_menu = OptionMenu(mi_frame, mi_color, *colores, command=colorear)
opt_menu.config(state=DISABLED)
opt_menu.pack()

root.mainloop()




