from tkinter import *
from tkinter import messagebox

root = Tk()
root.title('Login')
root.geometry('300x300')
root.config(padx=20, pady=20)

mi_frame = Frame(root)
mi_frame.pack(expand=TRUE)

def saludo_button():
    msg = f'Hola, {user_entry.get()}. Su clave es {passw_entry.get()}' 
    messagebox.showinfo(title='INFORMACIÓN', message=msg)
    user_entry.set('')
    passw_entry.set('')  

username = StringVar()
password = StringVar()

user_label = Label(mi_frame, text='Nombre de usuario:')
user_label.grid(row=1, column=0, sticky="w", padx=10)

user_entry =  Entry(mi_frame, textvariable = username)
user_entry.grid(row=2, column=0, padx=10)

passw_label = Label(mi_frame, text='Contraseña:')
passw_label.grid(row=3, column=0, sticky="w", padx=10)

passw_entry =  Entry(mi_frame, textvariable = password, show='*')
passw_entry.grid(row=4, column=0, padx=10)

saludo_button = Button(mi_frame, text='Saludar', command=saludo_button)
saludo_button.grid(row=5, column=0, padx=10, pady=10)

root.mainloop()