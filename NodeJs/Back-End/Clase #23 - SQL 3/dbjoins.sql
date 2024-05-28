-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-05-2024 a las 03:25:02
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbjoins`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `legajo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_escuela` int(11) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`legajo`, `nombre`, `id_escuela`, `edad`) VALUES
(1001, 'Juan Perez', 2, 15),
(1002, 'Maria Garcia', 2, 14),
(1003, 'Carlos Sanchez', NULL, 16),
(1004, 'Ana Lopez', NULL, 17),
(1005, 'Luis Martinez', NULL, 13),
(1006, 'Sofia Rodriguez', 8, 18),
(1007, 'Miguel Fernandez', NULL, 15),
(1008, 'Lucia Gomez', 8, 14),
(1009, 'Javier Diaz', 8, 16),
(1010, 'Laura Alvarez', NULL, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuelas`
--

CREATE TABLE `escuelas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `capacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `escuelas`
--

INSERT INTO `escuelas` (`id`, `nombre`, `localidad`, `provincia`, `capacidad`) VALUES
(1, 'Escuela Primaria N°1', 'Buenos Aires', 'Buenos Aires', 300),
(2, 'Escuela Secundaria N°2', 'La Plata', 'Buenos Aires', 500),
(3, 'Escuela Técnica N°3', 'Rosario', 'Santa Fe', 400),
(4, 'Escuela Primaria N°4', 'Córdoba', 'Córdoba', 350),
(5, 'Escuela Secundaria N°5', 'Mendoza', 'Mendoza', 450),
(6, 'Escuela Técnica N°6', 'San Miguel de Tucumán', 'Tucumán', 300),
(7, 'Escuela Primaria N°7', 'Salta', 'Salta', 200),
(8, 'Escuela Secundaria N°8', 'Neuquén', 'Neuquén', 600),
(9, 'Escuela Técnica N°9', 'Posadas', 'Misiones', 250),
(10, 'Escuela Primaria N°10', 'San Juan', 'San Juan', 400);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`legajo`),
  ADD KEY `alumnos_ibfk_1` (`id_escuela`);

--
-- Indices de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`id_escuela`) REFERENCES `escuelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
