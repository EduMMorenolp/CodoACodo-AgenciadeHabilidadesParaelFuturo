-- Consultas sobre las tablas :

-- Contar filas en una tabla
SELECT COUNT(*) AS cantidad_filas FROM content;
SELECT COUNT(*) AS cantidad_filas FROM production;

-- Obtener la cantidad de columnas en una tabla (para MySQL)
SELECT COUNT(*) AS cantidad_columnas
FROM information_schema.columns
WHERE table_schema = 'netflix'
  AND table_name = 'content';
  
  SELECT COUNT(*) AS cantidad_columnas
FROM information_schema.columns
WHERE table_schema = 'netflix'
  AND table_name = 'production';

/* Nombres de Columnas de content :
  id_content
  type
  title_content
  director
  cast
  country
  date_added
  release_year
  rating
  duration
  listed_in
  description
  */
  
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'netflix'
  AND TABLE_NAME = 'content';
  
-- Vacios, No Vacios, Nulos y Distintos :  

SELECT 
  columna,
  SUM(valor <> '') AS cantidad_no_vacios,
  SUM(valor = '') AS cantidad_vacios,
  SUM(valor IS NULL) AS cantidad_nulos,
  COUNT(DISTINCT valor) AS cantidad_distintos
FROM (
  SELECT 'id_content' AS columna, id_content AS valor FROM content UNION ALL
  SELECT 'type' AS columna, type AS valor FROM content UNION ALL
  SELECT 'title_content' AS columna, title_content AS valor FROM content UNION ALL
  SELECT 'director' AS columna, director AS valor FROM content UNION ALL
  SELECT 'cast' AS columna, cast AS valor FROM content UNION ALL
  SELECT 'country' AS columna, country AS valor FROM content UNION ALL
  SELECT 'date_added' AS columna, date_added AS valor FROM content UNION ALL
  SELECT 'release_year' AS columna, release_year AS valor FROM content UNION ALL
  SELECT 'rating' AS columna, rating AS valor FROM content UNION ALL
  SELECT 'duration' AS columna, duration AS valor FROM content UNION ALL
  SELECT 'listed_in' AS columna, listed_in AS valor FROM content UNION ALL
  SELECT 'description' AS columna, description AS valor FROM content
) AS columnas GROUP BY columna;

  /* Nombres de Columnas de production :
  id_production
  id_content
  title_production
  genre
  premiere
  runtime
  imdb_score
  language
  */
 
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'netflix'
  AND TABLE_NAME = 'production';
  
-- Vacios, No Vacios, Nulos y Distintos : 
  
SELECT 
  columna,
  SUM(valor <> '') AS cantidad_no_vacios,
  SUM(valor = '') AS cantidad_vacios,
  SUM(valor IS NULL) AS cantidad_nulos,
  COUNT(DISTINCT valor) AS cantidad_distintos
FROM (
  SELECT 'id_production' AS columna, id_production AS valor FROM production UNION ALL
  SELECT 'id_content' AS columna, id_content AS valor FROM production UNION ALL
  SELECT 'title_production' AS columna, title_production AS valor FROM production UNION ALL
  SELECT 'genre' AS columna, genre AS valor FROM production UNION ALL
  SELECT 'premiere' AS columna, premiere AS valor FROM production UNION ALL
  SELECT 'runtime' AS columna, runtime AS valor FROM production UNION ALL
  SELECT 'imdb_score' AS columna, imdb_score AS valor FROM production UNION ALL
  SELECT 'language' AS columna, language AS valor FROM production
) AS columnas GROUP BY columna;
  
-- Consultas sobre la tabla "content":

-- A. Listar todos los registros de la tabla, visualizando las columnas type, title_content, country, rating, duration, listed_in.

SELECT type as tipo, title_content as titulo_contenido , country as pais, rating as calificaciones, duration as duracion, listed_in as reproducido_en FROM content;

-- B. Mostrar todas las filas de la tabla, presentando las columnas id_content, title_production, genre, runtime, imdb_Score.

SELECT id_content as id_contenido , title_production as titulo_produccion, genre as genero, runtime as duracion, imdb_score as imdb_puntuacion FROM production;

-- C. Generar un listado de todas las películas en las que participe Argentina, mostrando las columnas id_content, type,
-- title_content, director, cast, rating, duration, listed_in.

SELECT c.id_content as id_contenido, c.type as tipo, c.title_content as titulo_contenido , c.director as director, c.cast as actores, c.rating as calificaciones, c.duration as duracion, c.listed_in as reproducido_en
FROM content c
WHERE c.country LIKE '%Argentina%';

-- D. Presentar un listado con las columnas id_production, title_production, genre, language, imdb_score de los registros de la tabla en las que el imdb_score sea superior a 7.5.

SELECT p.id_production as id_production, p.title_production as titulo_produccion, p.genre as genero, p.language as idioma, p.imdb_score as imdb_puntuacion
FROM production p
WHERE p.imdb_score > 7.5;

-- E. Mostrar las columnas id_content, type, title_content, listed_in de los registros en los que el rating sea "TV-PG" o "TV-G".

SELECT c.id_content as id_contenido, c.type as tipo, c.title_content as titulo_contenido, c.listed_in as reproducido_en
FROM content c
WHERE c.rating = 'TV-PG' OR c.rating = 'TV-G';

-- F. Obtener una lista con las columnas id_production, title_production, genre de los registros en que duration sea menor o igual a 105 minutos pero que además tenga una duración de al menos 60 minutos.

SELECT p.id_production as id_production, p.title_production as titulo_produccion, p.genre as genero
FROM production p
WHERE p.runtime <= 105 AND p.runtime >= 60;

-- G. Obtener la cantidad de registros discriminando por type y rating, ordenados alfabéticamente por rating y por type.

SELECT type as tipo, rating as calificaciones , COUNT(*) AS cantidad
FROM content
GROUP BY type, rating
ORDER BY rating, type;

-- H. Mostrar la cantidad de películas en los idiomas portugués, francés, alemán, italiano y español, ordenados por cantidad, de mayor a menor.

SELECT language as idioma, COUNT(*) AS cantidad
FROM production
WHERE language IN ('Portuguese', 'French', 'German', 'Italian', 'Spanish')
GROUP BY language
ORDER BY cantidad DESC;

