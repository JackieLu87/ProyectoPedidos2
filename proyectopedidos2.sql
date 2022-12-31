-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2022 at 06:47 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyectopedidos2`
--

-- --------------------------------------------------------

--
-- Table structure for table `localidades`
--

CREATE TABLE `localidades` (
  `IDlocalidad` int(11) NOT NULL,
  `NombreLocalidad` varchar(40) NOT NULL,
  `IDProvinciaLocalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `localidades`
--

INSERT INTO `localidades` (`IDlocalidad`, `NombreLocalidad`, `IDProvinciaLocalidad`) VALUES
(1, 'Berazategui', 3),
(2, 'San Pedro', 5),
(3, 'Cafayate', 2),
(4, 'San Pedro', 3),
(5, 'Yerba Buena', 1),
(6, 'Rosario', 6),
(7, 'San Rafael', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `IDPedido` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Apellido` varchar(40) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `LugarEntrega` varchar(80) NOT NULL,
  `Localidad` int(11) NOT NULL,
  `Provincia` int(11) NOT NULL,
  `CódigoPostal` varchar(9) NOT NULL,
  `FormaPago` varchar(1) NOT NULL,
  `TitularTarjeta` varchar(40) NOT NULL,
  `NúmeroTarjeta` int(16) NOT NULL,
  `VencimientoTarjeta` varchar(10) NOT NULL,
  `CódigoTarjeta` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--

CREATE TABLE `provincias` (
  `idprovincia` int(11) NOT NULL,
  `NombreProvincia` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `provincias`
--

INSERT INTO `provincias` (`idprovincia`, `NombreProvincia`) VALUES
(1, 'Tucumán'),
(2, 'Salta'),
(3, 'Buenos Aires'),
(4, 'Mendoza'),
(5, 'Jujuy'),
(6, 'Santa Fe');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Clave` varchar(20) NOT NULL,
  `Nombreyapellido` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `Usuario`, `Clave`, `Nombreyapellido`) VALUES
(1, 'Mama10@gmail.com', '201020', 'Silvia Aguero'),
(2, 'Papa10@yahoo.com', '478569', 'Juan Canossa'),
(3, 'Lety33@outlook.com', '5566', 'Leticia Canossa'),
(4, 'Lucas8@gmail.com', '2020', 'Lucas Acevedo'),
(5, 'Tato10@hotmail.com', 'Tato', 'Joaquin Canossa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`IDlocalidad`),
  ADD UNIQUE KEY `LocProvincia` (`IDlocalidad`),
  ADD KEY `IDProvinciaLocalidad` (`IDProvinciaLocalidad`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`IDPedido`);

--
-- Indexes for table `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idprovincia`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `localidades`
--
ALTER TABLE `localidades`
  MODIFY `IDlocalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `IDPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idprovincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`IDProvinciaLocalidad`) REFERENCES `provincias` (`idprovincia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
