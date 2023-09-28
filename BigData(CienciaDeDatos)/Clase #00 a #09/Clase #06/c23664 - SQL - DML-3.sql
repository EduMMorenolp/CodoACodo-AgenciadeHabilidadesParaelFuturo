# DML- 3
# Consultas de LECTURA (Read)
# Comando SELECT
# SELECT campos FROM tabla [modificadores]

# Mostrar TODOS los campos y TODOS los registros de una tabla
SELECT * FROM alumnos;

# Mostrar algunos campos de una tabla
SELECT legajo, nombre FROM alumnos;

# Mostrar algunos campos con ALIAS de una tabla
SELECT legajo AS Leg, nombre AS Nombre FROM alumnos;

# Mostrar TODOS los campos y ALGUNOS registros
SELECT * FROM alumnos
    WHERE legajo < 1013;

SELECT * FROM alumnos
    WHERE legajo < 1013 and nota > 1;

SELECT * FROM alumnos
    WHERE legajo < 1013 and nota >= 2;

# Mostrar ALGUNOS campos y ALGUNOS registros
SELECT legajo, nombre FROM alumnos
    WHERE legajo IS NULL;

SELECT legajo, nombre FROM alumnos
    WHERE legajo IS NOT NULL;

# Ordenamiento
SELECT id, legajo, nombre, grado FROM alumnos
    ORDER BY grado ASC;

SELECT id, legajo, nombre, grado FROM alumnos
    ORDER BY grado DESC;

# Limitaciones
SELECT legajo, nombre, nota FROM alumnos
    ORDER BY nota DESC
    LIMIT 3;

# Filtros de texto
SELECT legajo, nombre FROM alumnos
    WHERE nombre LIKE 'Dalia Cuevas';

SELECT legajo, nombre FROM alumnos
    WHERE nombre LIKE 'A%';

SELECT legajo, nombre FROM alumnos
    WHERE nombre LIKE 'a%';

SELECT legajo, nombre FROM alumnos
    WHERE nombre LIKE '%z';

SELECT legajo, nombre FROM alumnos
    WHERE nombre LIKE '%o%';

SELECT legajo, nombre FROM alumnos
    WHERE email LIKE '%@gmail.com';

# Uso de rangos
SELECT legajo, nombre, nota FROM alumnos
    WHERE nota>=2 AND nota<=6;

SELECT legajo, nombre, nota FROM alumnos
    WHERE nota BETWEEN 2 AND 6;

SELECT legajo, nombre, nota FROM alumnos
    WHERE nota NOT BETWEEN 2 AND 6;

# Uso de conjuntos de datos
SELECT legajo, nombre, grado FROM alumnos
    WHERE grado = 2 OR grado = 4 OR grado = 6;

SELECT legajo, nombre, grado FROM alumnos
    WHERE grado IN (2,4,6);

# Persistir una respuesta de un SELECT usandola como
# Subconsulta de un CREATE TABLE
CREATE TABLE seg_cua_sex (
    SELECT legajo, nombre, grado FROM alumnos
    WHERE grado IN (2,4,6)
);

# Limpiar (eliminar) todos los registros de una tabla
TRUNCATE alumnos;
