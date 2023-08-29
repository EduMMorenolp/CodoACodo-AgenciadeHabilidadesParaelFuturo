# Crear una BBDD
CREATE DATABASE IF NOT EXISTS c23664
    DEFAULT CHARACTER SET utf8
    COLLATE utf8_spanish_ci;

#DROP DATABASE IF EXISTS c23664;

# Comandos para verificar BBDD y Tablas
SHOW DATABASES;

USE c23664;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS escuelas (
    id int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(45) DEFAULT NULL,
    localidad varchar(45) DEFAULT NULL,
    provincia varchar(45) DEFAULT NULL,
    capacidad int(11) DEFAULT NULL,
    PRIMARY KEY (id)
);

# Eliminar una tabla
# DROP TABLE escuelas;

DESCRIBE escuelas;

CREATE TABLE alumnos (
    id int(11) NOT NULL AUTO_INCREMENT,
    legajo int(11) DEFAULT NULL,
    nombre varchar(45) DEFAULT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE alumnos
    ADD nota decimal(10,0) DEFAULT NULL;

ALTER TABLE alumnos
    ADD grado int(11) DEFAULT NULL,
    ADD email varchar(45) NOT NULL;

ALTER TABLE alumnos
    ADD genero varchar(10);

ALTER TABLE alumnos
    DROP genero;

ALTER TABLE alumnos
    ADD id_escuela int(11) AFTER id,
    ADD FOREIGN KEY (id_escuela) REFERENCES escuelas(id); 

DESCRIBE alumnos;

ALTER TABLE alumnos
    MODIFY nota int;

ALTER TABLE alumnos
    CHANGE nota promedio int;

ALTER TABLE alumnos
    CHANGE promedio nota decimal(10,0);

