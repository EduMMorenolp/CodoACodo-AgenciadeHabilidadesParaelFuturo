/* 1.Revise el archivo oscar.csv compartido en este deepnote para identificar el tipo de dato de cada columna,
 y establezca los nombres apropiados para usar en el punto siguiente (atributos de la tabla):
	id_oscar
    id_inf 
    id_res 
    id_content 
    title_oscar 
    year_ceremony 
    category 
    name 
    winner 
    directed_by 
    based_on 
    starring 
    distributed_by 
    budget 
    budget_x_million 
    box_office 
    box_office_x_million 
    imdb 
    metascore 
    rotten_tomatoes 
*/

-- 2.Crear una tabla en la BBDD netflix seleccionada en la consigna #1, con las siguientes características:

CREATE TABLE `oscar` (
    `id_oscar` 			VARCHAR(255),
    `id_inf` 			int DEFAULT NULL,
    `id_res` 			int DEFAULT NULL,
    `id_content` 		int DEFAULT NULL,
    `title_oscar` 		varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `year_ceremony` 		int DEFAULT NULL,
    `category` 			varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `name` 			varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `winner` 			tinyint DEFAULT NULL,
    `directed_by` 		varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `based_on` 			varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `starring` 			varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `distributed_by` 		varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `budget` 			varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `budget_x_million` 		double DEFAULT NULL,
    `box_office` 		varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `box_office_x_million` 	double DEFAULT NULL,
    `imdb` 			double DEFAULT NULL,
    `metascore` 		int DEFAULT NULL,
    `rotten_tomatoes`		int DEFAULT NULL,
    PRIMARY KEY (`id_oscar`),
    FOREIGN KEY (`id_content`) REFERENCES  `content` (`id_content`));


-- 3.Importar el archivo oscar.csv en la tabla creada en el punto 2 de la BBDD netflix escogida en la consigna #2:

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\oscar.csv'
INTO TABLE oscar
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

-- 4.Construir y completar el cuadro siguiente para la tabla oscar luego del paso 3, según el siguiente modelo. 
-- Los textos en azul debes sustuirlos por los textos que correspondan:

SELECT 
  columna,
  SUM(valor <> '') AS cantidad_no_vacios,
  SUM(valor = '') AS cantidad_vacios,
  SUM(valor IS NULL) AS cantidad_nulos,
  COUNT(DISTINCT valor) AS cantidad_distintos
FROM (
  SELECT 'id_oscar' AS columna, id_oscar AS valor FROM oscar UNION ALL
  SELECT 'id_inf' AS columna, id_inf AS valor FROM oscar UNION ALL
  SELECT 'id_res' AS columna, id_res AS valor FROM oscar UNION ALL
  SELECT 'id_content' AS columna, id_content AS valor FROM oscar UNION ALL
  SELECT 'title_oscar' AS columna, title_oscar AS valor FROM oscar UNION ALL
  SELECT 'year_ceremony' AS columna, year_ceremony AS valor FROM oscar UNION ALL
  SELECT 'category' AS columna, category AS valor FROM oscar UNION ALL
  SELECT 'name' AS columna, name AS valor FROM oscar UNION ALL
  SELECT 'winner' AS columna, winner AS valor FROM oscar UNION ALL
  SELECT 'directed_by' AS columna, directed_by AS valor FROM oscar UNION ALL
  SELECT 'based_on' AS columna, based_on AS valor FROM oscar UNION ALL
  SELECT 'starring' AS columna, starring AS valor FROM oscar UNION ALL
  SELECT 'distributed_by' AS columna, distributed_by AS valor FROM oscar UNION ALL
  SELECT 'budget' AS columna, budget AS valor FROM oscar UNION ALL
  SELECT 'budget_x_million' AS columna, budget_x_million AS valor FROM oscar UNION ALL
  SELECT 'box_office' AS columna, box_office AS valor FROM oscar UNION ALL
  SELECT 'box_office_x_million' AS columna, box_office_x_million AS valor FROM oscar UNION ALL
  SELECT 'imdb' AS columna, imdb AS valor FROM oscar UNION ALL
  SELECT 'metascore' AS columna, metascore AS valor FROM oscar UNION ALL
  SELECT 'rotten_tomatoes' AS columna, rotten_tomatoes AS valor FROM oscar
) AS columnas GROUP BY columna;


-- 5.Realizar las siguientes consultas sobre el conjunto de tablas que sean necesarios. Los nombres de las columnas deben mostrarse en español:

-- A. Seleccionar los títulos con runtime superior a 90 y lenguaje Francés. Incluir el tipo de contenido. Ordenar los títulos de menor a mayor.

SELECT  p.title_production AS titulo_de_produccion, c.type AS tipo,p.runtime AS duracion
FROM content c
JOIN production p ON c.id_content = p.id_content
WHERE p.runtime > 90 AND p.language = 'French'
ORDER BY p.title_production ASC;

-- B. Seleccionar aquellos títulos que posean director y país de origen. Filtrar por aquellas que tengan un Runtime mayor a 70. Ordenar los títulos de manera ascendente.

SELECT c.title_content AS titulo_de_contenido, p.title_production AS titulo_de_produccion
FROM content AS c
JOIN production AS p ON c.id_content = p.id_content
WHERE c.director IS NOT NULL AND c.country IS NOT NULL AND p.runtime > 70
ORDER BY p.title_production ASC;

-- C. Sume el Runtime de las películas que tengan como único país de origen United States, India, Japan, Spain y Mexico, discriminando y ordenando por país. Incluya la columna género.

SELECT c.country AS pais_de_origen, p.genre AS genero, SUM(p.runtime) AS suma_runtime
FROM content AS c
JOIN production AS p ON c.id_content = p.id_content
WHERE c.country IN ('United States', 'India', 'Japan', 'Spain', 'Mexico')
GROUP BY c.country, p.genre
ORDER BY c.country ASC, p.genre ASC;

-- D. Mostrar las películas clasificadas como drama por netflix, que hayan ganado el Oscar entre 2010 y 2020 y que estén en esta plataforma

SELECT DISTINCT c.title_content AS titulo_de_pelicula, c.type AS tipo_de_contenido, c.date_added AS fecha_agregada_a_Netflix
FROM content AS c
JOIN oscar AS o ON c.id_content = o.id_content
WHERE c.type = 'Movie' 
  AND c.listed_in LIKE '%Drama%' 
  AND o.year_ceremony BETWEEN 2010 AND 2020 
  AND c.date_added IS NOT NULL
  AND o.winner = 1
  ORDER BY titulo_de_pelicula;

-- E. Seleccionar el título y el género de las películas puntuadas por IMDB entre 7 y 9. Obtener los títulos en idioma inglés.

SELECT c.title_content AS titulo_de_pelicula, p.genre AS genero
FROM content AS c
JOIN production AS p ON c.id_content = p.id_content
WHERE p.language = 'English'
  AND p.imdb_score >= 7 AND p.imdb_score <= 9;
  
 -- F. Cuente la cantidad de títulos de cada género de la tabla productions. Ordene de manera descendente por las cantidades y ascendente por el género. 

SELECT genre AS genero, COUNT(*) AS cantidad
FROM production
GROUP BY genre
ORDER BY cantidad DESC, genero ASC;

-- G. Analizar la relación entre Budget y Box Office. Calcular el ratio Budget/Box Office para las peliculas con un puntaje IMDB entre 7 y 9, sin mostrar nulos y no repetidos.

SELECT DISTINCT
    o.title_oscar AS titulo,
    IF(o.box_office_x_million / o.budget_x_million > 1,
        CONCAT('Supero el presupuesto en un ',
            ROUND((o.box_office_x_million / o.budget_x_million) * 100, 0), ' %'),
        'No alcanzo el presupuesto'
    ) AS presupuesto
FROM
    oscar o
WHERE
    o.imdb BETWEEN 7 AND 9
ORDER BY
    titulo ASC;
    
-- H. Obtener las películas que ganaron el Oscar a Best Picture, ordenadas de manera descendente por año ganador.

SELECT
    title_oscar AS Título_Película,
    year_ceremony AS Año_Ganador
FROM
    oscar
WHERE
    category = 'Best Picture' AND winner = 1
ORDER BY
    year_ceremony DESC;
    
-- I. Mostrar el título y el año de ceremonia de los oscar para las peliculas puntuadas por IMDB entre 7 y 9. Ordenarlos alfabéticamente por títulos y de mayor a menor por año de ceremonia.    
    
SELECT DISTINCT
    o.title_oscar AS Título_Película,
    o.year_ceremony AS Año_Ceremonia
FROM
    oscar o
WHERE
    o.imdb BETWEEN 7 AND 9
ORDER BY
    o.title_oscar ASC,
    o.year_ceremony DESC;
    
-- J. Mostrar una lista de las películas originales de netflix ganadoras del oscar (si las hubiera) mostrando las columnas title, category, genre runtime, el imdb_score, la premiere y el año de la ceremonia.  
    
    SELECT
    o.title_oscar AS Título,
    o.category AS Categoría,
    p.genre AS Género,
    p.runtime AS Duración,
    p.imdb_score AS Puntuación_IMDb,
    p.premiere AS Estreno,
    o.year_ceremony AS Año_Ceremonia
FROM
    oscar o
JOIN
    production p ON o.id_content = p.id_content
WHERE
    o.winner = 1
    AND o.distributed_by LIKE '%Netflix%';
    
-- K. Mostrar una lista de las nominaciones al oscar de películas originales de netflix (si las hubiera) que no fueron ganadoras del premio,mostrando las columnas título, category y año de la ceremonia.  
    
    SELECT
    o.title_oscar AS Título,
    o.category AS Categoría,
    o.year_ceremony AS Año_Ceremonia
FROM
    oscar o
INNER JOIN
    production p ON o.id_content = p.id_content
WHERE
    o.winner = 0 
    AND o.distributed_by LIKE '%Netflix%'
ORDER BY
    Año_Ceremonia DESC;
    
/*
7.DESAFIOS:
Realizar las siguientes consultas sobre el conjunto de tablas que sean necesarios. Los nombres de las columnas deben mostrarse en español:
*/

-- I. Cuente los tipos de contenido de la tabla “content”. Muestre la descripción de tipos en el resultado de la consulta.    

SELECT
    type AS Tipo_de_Contenido,
    COUNT(*) AS Cantidad
FROM
    content
GROUP BY
    type;
    
-- II. Seleccionar títulos con duración igual a 90 min, que provengan únicamente de United States. Mostrar listed_in. Ordenar los títulos de menor a mayor.

SELECT
    title_content AS Título,
    listed_in AS Categorías
FROM
    content
WHERE
    duration = '90 min'
    AND country = 'United States'
ORDER BY
    Título ASC;
    
-- III. Realizar una consulta similar a la anterior, en donde el campo ‘country’ contenga a United States o a UNITED STATES y el título listado contenga a ‘Horror Movie’ O HORROR MOVIE.

SELECT
    title_content AS Título,
    listed_in AS Categorías,
    country as Ciudad
FROM
    content
WHERE
    UPPER(country) = 'UNITED STATES'
    AND (UPPER(listed_in) LIKE '%HORROR MOVIE%')
ORDER BY
    Título ASC;
    
-- IV.  Mostar la lista de películas puntuadas 85 o más por Metascore que ganaron el Oscar.

SELECT
    o.title_oscar AS Título_Película,
    o.metascore AS Puntuación_Metascore
FROM
    oscar o
WHERE
    o.winner = 1
    AND o.metascore >= 85;


  
  










