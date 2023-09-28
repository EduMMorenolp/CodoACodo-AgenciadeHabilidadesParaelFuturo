# DML - 2

SELECT * FROM alumnos;

# Agregamos algunos datos para procesar
INSERT INTO alumnos
	(legajo, nombre, nota, grado, email)
	VALUES
		(1010, "Juan Perez", 1, 7, "jperez@dominio.com"),
		(1011, "Ana Acosta", 2, 6, "aacosta@dominio.com"),
		(1012, "Carlos Lopez", 3, 5, "clopez@dominio.com"),
		(1013, "Silvia Gutierrez", 4, 4, "sgutierrez@dominio.com"),
		(1014, "Antonio Silva", 5, 3, "asilva@dominio.com"),
		(1015, "Dalia Cuevas", 6, 2, "dcuevas@dominio.com"),
		(1016, "Enrique Alonso", 7, 1, "ealonso@dominio.com");

# DELETE FROM alumnos;

# Actualizar 1 campo de 1 registro
UPDATE alumnos
    SET grado = 0
    WHERE id = 4;

# Actualizar varios campos de varios registros
UPDATE alumnos
	SET email = "-", legajo = 7777
	WHERE id > 5;
