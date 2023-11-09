import sqlite3 as sq3
import tkinter as tk
from tkinter import messagebox, ttk

'''
************************************
          FUNCIONES VARIAS
************************************
'''
# FUNCIONES VARIAS INTERFAZ GRÁFICA:
#   Configuración y grid etiquetas
def config_label(mi_label, fila):
    espaciado_labels = {'column': 0, 'sticky': 'e', 'padx': 10, 'pady': 10}
    color_labels = {'bg': color_fondo, 'fg': color_letra}
    mi_label.grid(row=fila, **espaciado_labels)
    mi_label.config(**color_labels)

#   Configuración y grid botones
def config_boton(mi_boton, columna):
    espaciado_botones = {'row': 0, 'padx': 35, 'pady': 10, 'ipadx': 7}
    color_botones = {'bg': color_fondo_boton, 'fg': color_texto_boton}
    mi_boton.config(**color_botones)
    mi_boton.grid(column=columna, **espaciado_botones)

#   Limpiar la interfaz gráfica
def limpiar():
    type.set('Seleccione...')
    title_content.set('')
    director.set('Seleccione...')
    country.set('Seleccione...')
    release_year.set(1895)
    rating.set('Seleccione...')
    duration.set('Seleccione...')
    listed_in.set('Seleccione...')

#   Generar una lista para tener una referencia rapida de datos
def listar_asc():
    lista('ASC')

def listar_desc():
    lista('DESC')

def lista(orden):
    class Table():
        def __init__(self, root2):
            nombre_cols = ['type', 'title_content', 'director', 'country',
                           'release_year', 'rating', 'duration', 'listed_in']
            for i in range(cant_cols):
                self.e = tk.Entry(frameppal)
                self.e.config(bg='black', fg='white')
                self.e.grid(row=0, column=i)
                self.e.insert(tk.END, nombre_cols[i])

            for fila in range(cant_filas):
                for col in range(cant_cols):
                    self.e = tk.Entry(frameppal)
                    self.e.grid(row=fila+1, column=col)
                    if resultado[fila][col] is not None:
                        self.e.insert(tk.END, resultado[fila][col])
                    else:
                        self.e.insert(tk.END, '')
                    self.e.config(state='readonly')

    root2 = tk.Tk()
    root2.title('Listado peliculas/series TV')
    frameppal = tk.Frame(root2)
    frameppal.pack(fill='both')

    framecerrar = tk.Frame(root2)
    framecerrar.config(bg=color_texto_boton)
    framecerrar.pack(fill='both')

    boton_cerrar = tk.Button(framecerrar, text='CERRAR', command=root2.destroy)
    boton_cerrar.config(bg=color_fondo_boton,
                        fg=color_texto_boton, pady=10, padx=0)
    boton_cerrar.pack(fill='both')

    # obtengo los datos
    conn = sq3.connect('netflix_oscar.db')
    cur = conn.cursor()
    query1 = f'''
            SELECT content.type, content.title_content, content.director, content.country, content.release_year, 
            content.rating, content.duration, content.listed_in
            FROM content
            ORDER BY id_content {orden} LIMIT 40
            '''
    cur.execute(query1)
    resultado = cur.fetchall()
    # la cantidad de registros para saber cuántas filas
    cant_filas = len(resultado)
    cant_cols = len(resultado[0])  # obtengo la cantidad de columnas

    tabla = Table(frameppal)
    conn.close()
    root2.mainloop()

#   Licencia...
def mostrar_licencia():
    # CREATIVE COMMONS GNU GPL https://www.gnu.org/licenses/gpl-3.0.txt
    msg = '''
    Demo de un sistema CRUD en Python para gestión 
    de netflix
    Copyright (C) 2023 - Codo a codo
    \n=======================================
    This program is free software: you can redistribute it 
    and/or modify it under the terms of the GNU General Public 
    License as published by the Free Software Foundation, 
    either version 3 of the License, or (at your option) any 
    later version.
    This program is distributed in the hope that it will be 
    useful, but WITHOUT ANY WARRANTY; without even the 
    implied warranty of MERCHANTABILITY or FITNESS FOR A 
    PARTICULAR PURPOSE.  See the GNU General Public License 
    for more details.
    You should have received a copy of the GNU General Public 
    License along with this program.  
    If not, see <https://www.gnu.org/licenses/>.'''
    messagebox.showinfo('LICENCIA', msg)

#   Acerca de...
def mostrar_acercade():
    messagebox.showinfo(
        'ACERCA DE...', 'Creado para Codo a Codo 4.0 - \nBig Data/Data analytics\n 2023')

# FUNCIONES MENSAJES VARIOS:
#   Mensaje no conectado a la BBDD (mensaje_noconectado)
def mensaje_noconectado():
    respuesta = messagebox.askquestion(
        'IMPORTANTE', 'No estas conectado a la base de datos ¿Deseas conectarte a la base de datos?')
    if respuesta == 'yes':
        conectar()

#   Mensaje campo obligatorio (mensaje_campo_obligatorio)
def mensaje_campo_obligatorio(campo):
    messagebox.showwarning('STATUS', f'Es obligatorio el campo {campo}')

#   Mensaje no existe/ existe (mensaje_no_existe)
def mensaje_campo_existe_o_no(dato, campo, confirm):
    messagebox.showwarning(
        'ERROR', f'Ese {dato} en el {campo} {confirm} existe')

#   Mensaje registro agregado REVISAR
def mensaje_registro(*campo):
    match campo[-1].upper():
        case 'AGREGADO':
            messagebox.showinfo(
                f'REGISTRO {campo[-1].upper()}', f'Registro {campo[-1]} "{campo[0][0]}" con el titulo "{campo[0][1]}" en la base de datos')
        case _:
            messagebox.showinfo(
                f'REGISTRO {campo[-1].upper()}', f'Registro {campo[-1]} con el titulo  "{campo[0]}" en la base de datos')

'''
************************************
   CONEXIÓN/DESCONEXIÓN A LA BBDD
************************************
'''
# *********** MENU **************
#   BBDD
#       Conexión
# is_check_conn variable que indica cuando la BBDD está conectada (True) o cuando no (False)
global is_check_conn
is_check_conn = False

def conectar():
    global conn
    global cur
    global is_check_conn
    pass
  
#       Desconexión
def desconectar():
    global is_check_conn
    is_check_conn = False
    pass

'''
*********************************
        PARTE FUNCIONAL
*********************************
'''
# # FUNCIONES VARIAS
# Chequear un campo
def chequear_campo(campo_int, column_bbdd):
    query_buscar = f'SELECT type, title_content, director, country, release_year, rating, duration, listed_in FROM content WHERE {column_bbdd} = "{campo_int}" AND see_content LIKE TRUE'
    cur.execute(query_buscar)
    resultado = cur.fetchall()
    return resultado

# Leer un campo
def leer_campo(campo, campo_str, column_bbdd):
    if campo == '' or campo == 'Seleccione...':
        mensaje_campo_obligatorio(campo_str)
    else:
        return chequear_campo(campo, column_bbdd)

# Rellenar campos
def rellenar_campos(resultado):
    for elemento in resultado:
        type.set(elemento[0])
        director.set(elemento[2])
        country.set(elemento[3])
        release_year.set(elemento[4])
        rating.set(elemento[5])
        duration.set(elemento[6])
        listed_in.set(elemento[7])

# Listas ordenadas de director, type, country, listed_in, rating
def list_campo(campo):
    conn_temporal = sq3.connect('netflix_oscar.db')
    cur_temporal = conn_temporal.cursor()
    query_buscar = f'SELECT {campo} FROM content ORDER BY {campo} ASC'
    cur_temporal.execute(query_buscar)
    resultado = cur_temporal.fetchall()
    campo_set = set()
    campo_list = []
    for elemento in resultado:
        if elemento[0] != None:
            campo_set.add(*elemento)
    campo_list = list(campo_set)
    campo_list.sort()
    cur_temporal.close()
    conn_temporal.close()
    return campo_list

# # MENU CRUD ( Create - read - update - delete)
# #   CREATE
def crear():
    pass

# #   READ
def leer_general():
    pass

# #   UPDATE
def actualizar():
    pass

# #   DELETE
def borrar():
    pass

'''
*********************************
       INTERFAZ GRÁFICA
*********************************
'''
# framebotones
global fondo_framebotones
fondo_framebotones = 'gray26'
global color_fondo_boton
color_fondo_boton = 'light steel blue'
global color_texto_boton
color_texto_boton = 'black'

# framecampos
color_fondo = 'light steel blue'  # frame & labels
color_letra = 'black'  # labels

root = tk.Tk()
root.title('GUI - Comisiones Big Data- Data Analytics')

# BARRAMENU
barramenu = tk.Menu(root)
root.config(menu=barramenu)

# Menú BBDD
bbddmenu = tk.Menu(barramenu, tearoff=0)

# Botón conectar
bbddmenu.add_command(label='Conectar a la BBDD', command=conectar)

# Botón Listado de alumnos
menu_lista = tk.Menu(barramenu, tearoff=0)
menu_lista.add_command(label='Ascendente', command=listar_asc)
menu_lista.add_command(label='Descendente', command=listar_desc)

bbddmenu.add_cascade(label='Listado de 40 pelis y series', menu=menu_lista)
# Botón Salir
bbddmenu.add_command(label='Desconectar', command=desconectar)  # type: ignore

# Menú Limpiar
limpiarmenu = tk.Menu(barramenu, tearoff=0)
limpiarmenu.add_command(label='Limpiar campos', command=limpiar)

# Menú Acerca de...
ayudamenu = tk.Menu(barramenu, tearoff=0)
ayudamenu.add_command(label='Licencia', command=mostrar_licencia)
ayudamenu.add_command(label='Acerca de...', command=mostrar_acercade)

barramenu.add_cascade(label='BBDD', menu=bbddmenu)
barramenu.add_cascade(label='Limpiar', menu=limpiarmenu)
barramenu.add_cascade(label='Acerca de...', menu=ayudamenu)

# ------ FRAME CAMPOS ------------
framecampos = tk.Frame(root)
framecampos.config(bg=color_fondo)
framecampos.pack(fill='both')

# Crea variables de control de los campos de entrada
type = tk.StringVar()
title_content = tk.StringVar()
director = tk.StringVar()
country = tk.StringVar()
release_year = tk.IntVar()
rating = tk.StringVar()
duration = tk.StringVar()
listed_in = tk.StringVar()

'''
entero = IntVar()  # Declara variable de tipo entera
flotante = DoubleVar()  # Declara variable de tipo flotante
cadena = StringVar()  # Declara variable de tipo cadena
booleano = BooleanVar()  # Declara variable de tipo booleana
'''
list_type = list_campo('type')
list_director = list_campo('director')
list_country = list_campo('country')
list_rating = list_campo('rating')
list_duration = list_campo('duration')
list_listed_in = list_campo('listed_in')

# ENTRY
type.set('Seleccione...')
type_option = ttk.Combobox(
    framecampos, width=10, values=list_type, textvariable=type, state='active')
type_option.grid(row=0, column=1, padx=10, pady=10)

title_content_input = tk.Entry(framecampos, textvariable=title_content)
title_content_input.grid(row=1, column=1, padx=10, pady=10)
title_content_input.config(width=105)

director.set('Seleccione...')
director_option = ttk.Combobox(
    framecampos, width=55, values=list_director, textvariable=director, state='active')
director_option.grid(row=2, column=1, padx=10, pady=10)

country.set('Seleccione...')
country_option = ttk.Combobox(
    framecampos, width=105, values=list_country, textvariable=country, state='active')
country_option.grid(row=3, column=1, padx=10, pady=10)

release_year = tk.Scale(
    framecampos, from_=1895, to=2023, length=200, orient='horizontal')
release_year.grid(row=5, column=1, padx=10, pady=10)
release_year.config(state='active')

rating.set('Seleccione...')
rating_option = ttk.Combobox(
    framecampos, width=10, values=list_rating, textvariable=rating, state='active')
rating_option.grid(row=6, column=1, padx=10, pady=10)

duration.set('Seleccione...')
duration_option = ttk.Combobox(
    framecampos, width=15, values=list_duration, textvariable=duration, state='active')
duration_option.grid(row=7, column=1, padx=10, pady=10)

listed_in.set('Seleccione...')
listed_in_option = ttk.Combobox(
    framecampos, width=75, values=list_listed_in, textvariable=listed_in, state='active')
listed_in_option.grid(row=8, column=1, padx=10, pady=10)


# LABEL
type_label = tk.Label(framecampos, text='Tipo de...')
config_label(type_label, 0)

title_content_label = tk.Label(framecampos, text='Titulo')
config_label(title_content_label, 1)

director_label = tk.Label(framecampos, text='Director')
config_label(director_label, 2)

country_label = tk.Label(framecampos, text='País')
config_label(country_label, 3)

release_year_label = tk.Label(framecampos, text='Año de lanzamiento')
config_label(release_year_label, 5)

rating_label = tk.Label(framecampos, text='Clasificación')
config_label(rating_label, 6)

duration_label = tk.Label(framecampos, text='Duración')
config_label(duration_label, 7)

listed_in_label = tk.Label(framecampos, text='Género')
config_label(listed_in_label, 8)

# FRAME BOTONES -> FUNCIONES CRUD (Create, read, update, delete)
framebotones = tk.Frame(root)
framebotones.config(bg=fondo_framebotones)
framebotones.pack(fill='both')

boton_crear = tk.Button(framebotones, text='Crear', command=crear)
config_boton(boton_crear, 0)

boton_buscar = tk.Button(framebotones, text='Buscar', command=leer_general)
config_boton(boton_buscar, 1)

boton_actualizar = tk.Button(
    framebotones, text='Actualizar', command=actualizar)
config_boton(boton_actualizar, 2)

boton_borrar = tk.Button(framebotones, text='Eliminar', command=borrar)
config_boton(boton_borrar, 3)

# FRAME DEL PIE
framecopy = tk.Frame(root)
framecopy.config(bg='gray86')
framecopy.pack(fill='both')

copylabel = tk.Label(
    framecopy, text='2023 para CaC 4.0 - Data analitycs')
copylabel.config(bg='gray86', fg='black',)
copylabel.grid(row=0, column=0, padx=10, pady=10)

root.mainloop()
