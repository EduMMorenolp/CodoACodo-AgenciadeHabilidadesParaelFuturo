
# TkinTer - Tk Interface

#Importamos el modulo de tkinter
import tkinter as tk


# Creamos un objeto usando la clase Tk
ventana = tk.Tk()
# Modificamos el tamaño de la ventana(pixeles)
ventana.geometry ("600x400")
# Nombre de la Ventana
ventana.title("Hola Mundo")

# Ejecutamos el Main en loop. 
ventana.mainloop()