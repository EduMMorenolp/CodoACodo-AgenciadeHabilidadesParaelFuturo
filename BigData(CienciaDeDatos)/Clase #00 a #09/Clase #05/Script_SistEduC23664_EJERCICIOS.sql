/* EJERCICIOS SQL
SINTAXIS BÁSICA: SELECT…FROM + USO DE WHERE, AND, OR, BETWEEN*/ 

-- 1) Seleccionar todos los datos de la tabla alumnos.

SELECT * from alumnos;

-- 2) Seleccionar solamente el legajo y el nombre de los alumnos.

SELECT legajo, nombre from alumnos;

-- 3) Mostrar todos los datos de aquellos alumnos aprobados (con notas mayores o iguales a 7).

SELECT * FROM alumnos WHERE nota >= 7;

-- 4) Mostrar el id y el nombre de aquellas escuelas cuya capacidad sea inferior a 200 (no mostrar la columna capacidad).

SELECT id, nombre FROM escuelas WHERE capacidad < 200;

-- 5) Mostrar el nombre y la nota de aquellos alumnos cuya nota se encuentre entre 7 y 10 (inclusive).

SELECT nombre, nota
FROM alumnos
WHERE nota >= 7 AND nota <= 10;

-- 6) Repetir el ejercicio anterior, utilizando BETWEEN.

SELECT nombre, nota
FROM alumnos
WHERE nota BETWEEN 7 AND 10;

-- 7) Mostrar el nombre, la localidad y la provincia de aquellas escuelas situadas en Buenos Aires o Jujuy.

SELECT nombre, localidad, provincia
FROM escuelas
WHERE provincia IN ('Buenos Aires', 'Jujuy');

/* SINTAXIS BÁSICA: SELECT…FROM + USO DE LIKE, NOT LIKE Y % */

-- 8) Mostrar todos los datos de los alumnos llamados Minna Klauber.

SELECT *
FROM alumnos
WHERE nombre = 'Minna Klauber';

-- 9) Repetir el ejercicio anterior, pero con aquellos que no se llamen Minna Klauber.

SELECT *
FROM alumnos
WHERE nombre != 'Minna Klauber';

-- 10) Mostrar todos los datos de los alumnos cuyo nombre comience con “Ma”. 

SELECT *
FROM alumnos
WHERE nombre LIKE 'Ma%';

-- 11) Mostrar todos los datos de los alumnos cuyo nombre termine con “er”.

SELECT *
FROM alumnos
WHERE nombre LIKE '%er';

-- 12) Mostrar todos los datos de los alumnos cuyo nombre contenga “tt”.

SELECT *
FROM alumnos
WHERE nombre LIKE '%tt%';


/* USOS DE JOIN Y ALIAS PARA TABLAS Y CAMPOS */

-- 13) Mostrar el legajo, el nombre del alumno y el nombre de la escuela de todos los alumnos.

SELECT alumnos.legajo, alumnos.nombre AS nombre_alumno, escuelas.nombre AS nombre_escuela
FROM alumnos
JOIN escuelas ON alumnos.id_escuela = escuelas.id;

-- 14) Modificar el ejercicio anterior utilizando alias de tablas y columnas.

SELECT a.legajo, a.nombre AS nombre_alumno, e.nombre AS nombre_escuela
FROM alumnos AS a
JOIN escuelas AS e ON a.id_escuela = e.id;

-- 15) Mostrar todos los alumnos, tengan o no escuela asignada.

SELECT *
FROM alumnos;


/* Big Data / Data Analytics */

-- 16) Mostrar todas las escuelas con el nombre de cada alumno (aunque no tengan escuela asignada). USO DE IS NULL / IS NOT NULL

SELECT e.nombre AS nombre_escuela, a.nombre AS nombre_alumno
FROM escuelas AS e
LEFT JOIN alumnos AS a ON e.id = a.id_escuela;

-- 17) Mostrar todos los datos de los alumnos que tengan notas.

SELECT *
FROM alumnos
WHERE nota IS NOT NULL;

-- 18) Mostrar todos los datos de los alumnos que no tengan notas.

SELECT *
FROM alumnos
WHERE nota IS NULL;

-- 19) Mostrar legajo, nombre y nota de los alumnos que no tengan escuela.

SELECT legajo, nombre, nota
FROM alumnos
WHERE id_escuela IS NULL;


/* ALTER TABLE */ 

/* 20a) Agregar a través de ALTER TABLE una columna en la tabla escuelas llamada “Partido”, a la derecha de
Localidad con una cadena vacía como valor por defecto (armar la sentencia a través de ALTER TABLE). */ 

ALTER TABLE escuelas
ADD COLUMN Partido varchar(45) DEFAULT '';

ALTER TABLE `sist_educ23664`.`escuelas` 
CHANGE COLUMN `Partido` `Partido` VARCHAR(45) NULL DEFAULT '' AFTER `localidad`;

/* 20b) Ejecutar una consulta donde se vean todos los campos para confirmar que se ha agregado el campo 
“partido”.*/

SELECT *
FROM escuelas;

-- 20c) Eliminar esa columna utilizando ALTER TABLE.

ALTER TABLE escuelas
DROP COLUMN Partido;

-- 21) Agregar una nueva escuela utilizando INSERT.

INSERT INTO escuelas (id, nombre, localidad, provincia, capacidad)
VALUES (11, 'Escuela Nueva', 'Nueva Ciudad', 'Nuevo Estado', 300);

-- 22) Utilizando CREATE, duplicar la tabla Alumnos.

CREATE TABLE alumnos_copia AS SELECT * FROM alumnos;


/* LIMIT Y ORDER BY */ 
-- 23) Obtener un ranking de las primeras 3 escuelas de mayor capacidad.

SELECT id, nombre, capacidad
FROM escuelas
ORDER BY capacidad DESC
LIMIT 3;

/* FUNCIONES DE AGREGACIÓN Y AGRUPAMIENTO / USO DE IN */ 

-- 24) Contar la cantidad de alumnos (filas) de la tabla homónima. Llamar a la columna “Cantidad de alumnos”.

SELECT COUNT(*) AS "Cantidad de alumnos"
FROM alumnos;

-- 25) Repetir la consulta anterior consultando solamente los alumnos cuya nota sea menor a 7.

SELECT COUNT(*) AS "Cantidad de alumnos"
FROM alumnos
WHERE nota < 7;

-- 25b) Repetir la consulta anterior consultando solamente los alumnos que no tengan nota.

SELECT COUNT(*) AS "Cantidad de alumnos"
FROM alumnos
WHERE nota IS NULL;

-- 25c) Contar los alumnos que tengan vacío ("") el campo email.

SELECT COUNT(*) AS "Cantidad de alumnos"
FROM alumnos
WHERE email = '';

-- 25d) Contar los alumnos que no tengan nota null.

SELECT COUNT(*) AS "Cantidad de alumnos"
FROM alumnos
WHERE nota IS NOT NULL;

-- 26) Obtener los nombres de las columnas de la tabla escuelas.

SHOW COLUMNS FROM escuelas;

-- 27) Obtener la cantidad de escuelas desde la tabla alumnos. Verificar con un SELECT en la tabla escuelas.

SELECT COUNT(DISTINCT id_escuela) AS "Cantidad de escuelas"
FROM alumnos;

SELECT COUNT(*) AS "Cantidad total de escuelas"
FROM escuelas;

-- 28) Obtener la capacidad total de las escuelas de la provincia de Buenos Aires.

SELECT SUM(capacidad) AS "Capacidad total"
FROM escuelas
WHERE provincia = 'Buenos Aires';

-- 29) Repetir el ejercicio anterior pero solamente con las escuelas de Córdoba y Jujuy.

SELECT SUM(capacidad) AS "Capacidad total"
FROM escuelas
WHERE provincia IN ('Córdoba', 'Jujuy');

/* Big Data / Data Analytics */

-- 30) Obtener el promedio de notas de los alumnos aprobados con más de 7.

SELECT AVG(nota) AS "Promedio de notas"
FROM alumnos
WHERE nota > 7;

-- 31) Obtener la capacidad máxima y la capacidad mínima de alumnos.

SELECT MAX(capacidad) AS "Capacidad máxima", MIN(capacidad) AS "Capacidad mínima"
FROM escuelas;

-- 32) Obtener el total de capacidad de las escuelas por provincia.

SELECT provincia, SUM(capacidad) AS "Total de capacidad"
FROM escuelas
GROUP BY provincia;

-- 33) Obtener la cantidad de alumnos por grado.

SELECT grado, COUNT(*) AS "Cantidad de alumnos"
FROM alumnos
GROUP BY grado;

/* DIFERENCIAS DE SINTAXIS ENTRE HAVING Y WHERE */ 

-- 34) Mostrar las escuelas y la nota máxima para cada una siempre y cuando sean mayores o iguales a 7. Utiliza HAVING y WHERE.

SELECT e.nombre AS "Nombre Escuela", MAX(a.nota) AS "Nota Máxima"
FROM escuelas e
LEFT JOIN alumnos a ON e.id = a.id_escuela
WHERE a.nota >= 7
GROUP BY e.id
HAVING MAX(a.nota) IS NOT NULL;

/* SUBCONSULTAS
35) Mostrar la información de las escuelas cuyos alumnos tengan una nota igual a 10, utilizando una 
subconsulta.*/

SELECT *
FROM escuelas
WHERE id IN (SELECT id_escuela FROM alumnos WHERE nota = 10);