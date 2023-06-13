-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2023 a las 20:59:52
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_scholar_website`
--
CREATE DATABASE IF NOT EXISTS `db_scholar_website` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `db_scholar_website`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--
-- Creación: 30-05-2023 a las 23:46:28
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `id` int(11) NOT NULL,
  `numero` varchar(8) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `horario` varchar(255) NOT NULL,
  `creado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONES PARA LA TABLA `grupos`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_materias`
--
-- Creación: 30-05-2023 a las 23:52:15
--

DROP TABLE IF EXISTS `grupos_materias`;
CREATE TABLE `grupos_materias` (
  `id` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONES PARA LA TABLA `grupos_materias`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lecciones`
--
-- Creación: 30-05-2023 a las 23:57:06
--

DROP TABLE IF EXISTS `lecciones`;
CREATE TABLE `lecciones` (
  `id` int(11) NOT NULL,
  `id_profesor` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `status` varchar(100) NOT NULL,
  `fecha_disponible` datetime NOT NULL,
  `creado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONES PARA LA TABLA `lecciones`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--
-- Creación: 30-05-2023 a las 23:48:03
--

DROP TABLE IF EXISTS `materias`;
CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `creado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONES PARA LA TABLA `materias`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias_profesores`
--
-- Creación: 30-05-2023 a las 23:53:19
--

DROP TABLE IF EXISTS `materias_profesores`;
CREATE TABLE `materias_profesores` (
  `id` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_profesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONES PARA LA TABLA `materias_profesores`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--
-- Creación: 30-05-2023 a las 22:49:53
-- Última actualización: 08-06-2023 a las 18:53:50
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `numero` varchar(8) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombre_completo` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `rol` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `creado` datetime NOT NULL,
  `actualizado` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- RELACIONES PARA LA TABLA `users`:
--

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `numero`, `nombres`, `apellidos`, `nombre_completo`, `email`, `password`, `telefono`, `hash`, `rol`, `status`, `creado`, `actualizado`) VALUES
(1, '123456', 'Bee', 'Default', 'Bee Default', 'jslocal@localhost.com', '$2y$10$R18ASm3k901n7SkPPa7kLObcRCY17SvIPCPtnKMawDhOT6wPXVxTS', '123456', '', '', '', '2023-06-07 17:23:54', '2023-06-08 18:53:50');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupos_materias`
--
ALTER TABLE `grupos_materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lecciones`
--
ALTER TABLE `lecciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materias_profesores`
--
ALTER TABLE `materias_profesores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupos_materias`
--
ALTER TABLE `grupos_materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lecciones`
--
ALTER TABLE `lecciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias_profesores`
--
ALTER TABLE `materias_profesores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


--
-- Metadatos
--
USE `phpmyadmin`;

--
-- Metadatos para la tabla grupos
--

--
-- Metadatos para la tabla grupos_materias
--

--
-- Metadatos para la tabla lecciones
--

--
-- Metadatos para la tabla materias
--

--
-- Metadatos para la tabla materias_profesores
--

--
-- Metadatos para la tabla users
--

--
-- Metadatos para la base de datos db_scholar_website
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
