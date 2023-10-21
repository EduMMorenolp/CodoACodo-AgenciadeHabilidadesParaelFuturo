import sqlite3  as sq3
con = sq3.connect('mi_db.db')
cur = con.cursor()

cur.execute('''CREATE TABLE IF NOT EXISTS 
               alumnos (legajo VARCHAR(7) PRIMARY KEY, 
               nombre VARCHAR(30), 
               apellido VARCHAR(30), 
               nota DECIMAL(10,0))''')

cur.execute('INSERT INTO alumnos VALUES ("2154448", "Ana", "Pérez", 8.5)')

lista = [
    ("2154489", "Sebastián", "Álvarez", 7.75),
    ("2154563", "Analía", "Rovere", 8.75),
    ("2154896", "Jaime", "Felice", 8),
    ("2154492", "Rosa", "Medina", 9)
]
cur.executemany('INSERT INTO alumnos VALUES (?,?,?,?)', lista)

for registro in cur.execute('SELECT * FROM alumnos'):
    print(registro)

con.commit()
con.close()

