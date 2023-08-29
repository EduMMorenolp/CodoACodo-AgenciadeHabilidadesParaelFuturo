# Listar los campos de una tabla de una BBDD
# Se debe consultar la tabla COLUMNS de la BBDD INFORMATION_SCHEMA
SELECT column_name FROM information_schema.columns
    WHERE table_schema = 'c23664' and table_name = 'alumnos';

SELECT column_name FROM information_schema.columns
    WHERE table_schema = 'c23664' and table_name = 'escuelas';

# FUNCIONES DE AGREGACION COUNT, SUM y AVG
#SELECT count(column_name) AS 'Nº de campos de la tabla alumnos' FROM information_schema.columns
#    WHERE table_schema = 'c23665' and table_name = 'alumnos';
SELECT nombre, nota from alumnos
    WHERE nota >= 7;

# Contar los alumnos con nota >= 7
SELECT count(*) from alumnos
    WHERE nota >= 7;

# Da de menos (13) xq hay id_escuela NULOS
SELECT count(id_escuela) from alumnos
    WHERE nota >= 7;

# Ver el promedio de las notas
SELECT avg(nota) as Promedio from alumnos;
# Sumar las notas
SELECT sum(nota) as Suma from alumnos;
# Contar las notas
SELECT count(nota) as Cuenta from alumnos;
# Calcular el promedio de las notas y compararlo con AVG()
SELECT avg(nota) as Promedio, sum(nota) / count(nota) as Calculado  from alumnos;

# AGRUPACIONES
SELECT count(*) FROM alumnos;

# Mostrar la cantidad de alumnos agrupados x grado
SELECT grado, count(*) as Alumnos FROM alumnos
    GROUP BY grado;

# Mostrar el promedio de notas agrupados x grado
SELECT grado, avg(nota) as Promedio FROM alumnos
    GROUP BY grado;

# VALORES DISTINTOS
# Ver las distintas localidades (sin repetir)
SELECT distinct localidad FROM escuelas;

# Contar las distintas localidades
SELECT count(distinct localidad) FROM escuelas;

# Contar las distintas provincias
SELECT count(distinct provincia) as Provincias FROM escuelas;

# HAVING
# Agrupar promedios x grado, seleccionando que son >= 4
SELECT grado, avg(nota) as Promedio FROM alumnos
    # WHERE Promedio >=4 (incorrecto)
    GROUP BY grado
    HAVING Promedio >=4;

# Agrupar promedios x grado, seleccionando que son >= 4, ordenados descendentes
SELECT grado, avg(nota) as Promedio FROM alumnos
    GROUP BY grado
    HAVING Promedio >=4
    ORDER BY Promedio DESC;

# Agrupar promedios x grado, seleccionando que son >= 4, ordenados descendentes (los 1ros tres)
SELECT grado, avg(nota) as Promedio FROM alumnos
    GROUP BY grado
    HAVING Promedio >=4
    ORDER BY Promedio DESC
    LIMIT 3;

# JOINS
# Listar los alumnos, grado, escuela, localidad y provincia

# INNER JOIN (INTERSECCION)
SELECT a.nombre, a.grado, e.nombre as escuela, e.localidad, e.provincia
    FROM alumnos AS a INNER JOIN escuelas AS e
    ON a.id_escuela = e.id;

# LEFT JOIN (INTERSECCION + no coincidentes de la IZQUIERDA)
SELECT a.nombre, a.grado, e.nombre as escuela, e.localidad, e.provincia
    FROM alumnos AS a LEFT JOIN escuelas AS e
    ON a.id_escuela = e.id;

# RIGHT JOIN (INTERSECCION + no coincidentes de la DERECHA)
SELECT a.nombre, a.grado, e.nombre as escuela, e.localidad, e.provincia
    FROM alumnos AS a RIGHT JOIN escuelas AS e
    ON a.id_escuela = e.id;

# Full outer JOIN (UNION entre LEFT JOIN y RIGHT JOIN)
SELECT a.nombre, a.grado, e.nombre as escuela, e.localidad, e.provincia
    FROM alumnos AS a LEFT JOIN escuelas AS e
    ON a.id_escuela = e.id
UNION
SELECT a.nombre, a.grado, e.nombre as escuela, e.localidad, e.provincia
    FROM alumnos AS a RIGHT JOIN escuelas AS e
    ON a.id_escuela = e.id;
