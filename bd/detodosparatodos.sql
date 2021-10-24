-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-10-2021 a las 06:27:45
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `detodosparatodos`
--
CREATE DATABASE IF NOT EXISTS `detodosparatodos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `detodosparatodos`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `gestionar_cliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_cliente` (IN `p_operacion` INT, IN `p_id` VARCHAR(12), IN `p_idempleado` VARCHAR(12), IN `p_nombres` VARCHAR(35), IN `p_apellidos` VARCHAR(35))  BEGIN
	
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	
    	SELECT COUNT(1) INTO numeroregistros FROM clientes WHERE id = p_id;
        IF(numeroregistros = 0) THEN
            INSERT INTO clientes VALUES(p_id, p_idempleado, p_nombres, p_apellidos);
        ELSE 
            UPDATE clientes SET nombres=p_nombres, id_Empleado=p_idempleado, apellidos=p_apellidos WHERE id=p_id;
        END IF;	
    ELSE 
    	DELETE FROM clientes WHERE id = p_id;
    END IF;	
    

END$$

DROP PROCEDURE IF EXISTS `gestionar_comision`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_comision` (IN `p_operacion` INT, IN `p_codigo` VARCHAR(6), IN `p_volumen` FLOAT, IN `p_porcentaje` FLOAT, IN `p_anno` DATE)  BEGIN
	
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	
    	SELECT COUNT(1) INTO numeroregistros FROM comisiones WHERE codigo = p_codigo;
        IF(numeroregistros = 0) THEN
            INSERT INTO comisiones VALUES(p_codigo, p_volumen, p_porcentaje, p_anno);
        ELSE 
            UPDATE comisiones SET volumen_ventas=p_volumen, porcentaje=p_porcentaje, año=p_anno WHERE codigo=p_codigo;
        END IF;	
    ELSE 
    	DELETE FROM comisiones WHERE codigo=p_codigo;
    END IF;	
    

END$$

DROP PROCEDURE IF EXISTS `gestionar_compra`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_compra` (IN `p_operacion` INT, IN `p_id` VARCHAR(12), IN `p_idempleado` VARCHAR(12), IN `p_codigoproveedor` VARCHAR(8), IN `p_fecha` DATE, IN `p_total` FLOAT)  BEGIN
	
    DECLARE numeroregistros int;           
        
    
    IF(p_operacion=0) THEN
    	SELECT COUNT(1) INTO numeroregistros FROM compras WHERE id = p_id;
        IF(numeroregistros = 0) THEN
            INSERT INTO compras VALUES(p_id, p_idempleado, p_codigoproveedor, p_fecha, p_total);
        ELSE 
            UPDATE compras SET id_empleado=p_idempleado, codigo_provedor=p_codigoproveedor, fecha=p_fecha, total=p_total WHERE id = p_id;
        END IF;	
    ELSE 
    	DELETE FROM compras WHERE id = total;
    END IF;	
    

END$$

DROP PROCEDURE IF EXISTS `gestionar_detalles_compras`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_detalles_compras` (IN `p_operacion` INT, IN `p_idcompra` VARCHAR(12), IN `p_idproducto` VARCHAR(10), IN `p_cantidad` INT)  BEGIN
	
    DECLARE numeroregistros int;           
        
    
    IF(p_operacion=0) THEN
    	SELECT COUNT(1) INTO numeroregistros FROM detalles_compras WHERE id_compras = p_idcompra AND id_producto=p_idproducto;
        IF(numeroregistros = 0) THEN
            INSERT INTO detalles_compras VALUES(p_idcompra, p_idproducto, p_cantidad);
        ELSE 
            UPDATE detalles_compras SET cantidad=p_cantidad WHERE id_compras = p_idcompra AND id_producto=p_idproducto;
        END IF;	
    ELSE 
    	DELETE FROM detalles_compras WHERE id_compras = p_idcompra AND id_producto=p_idproducto;
    END IF;	
    

END$$

DROP PROCEDURE IF EXISTS `gestionar_detalles_ventas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_detalles_ventas` (IN `p_operacion` INT, IN `p_idventa` VARCHAR(8), IN `p_productoid` VARCHAR(10), IN `p_cantidad` INT)  BEGIN
	DECLARE numeroregistros INT;
   
	IF(p_operacion=0) THEN
        
        SELECT COUNT(1) INTO numeroregistros FROM detalles_ventas WHERE id_venta=p_idventa AND producto_id=p_productoid;
        IF(numeroregistros=0) THEN
        	INSERT INTO detalles_ventas VALUES(p_idventa, p_productoid, p_cantidad);
        ELSE 
        	UPDATE detalles_ventas SET cantidad=p_cantidad WHERE id_venta=p_idventa AND producto_id=p_productoid;
        END IF;
        
    ELSE 
    
    	DELETE FROM detalles_ventas WHERE id_venta=p_idventa AND producto_id=p_productoid;
    
    END IF;
    
END$$

DROP PROCEDURE IF EXISTS `gestionar_empleado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_empleado` (IN `p_operacion` INT, IN `p_id` VARCHAR(12), IN `p_perfilid` VARCHAR(12), IN `p_nombres` VARCHAR(35), IN `p_apellidos` VARCHAR(35), IN `p_telefono` VARCHAR(12))  BEGIN
	DECLARE numeroregistros INT;
   
	IF(p_operacion=0) THEN
        
        SELECT COUNT(1) INTO numeroregistros FROM empleados WHERE id=p_id;
        IF(numeroregistros=0) THEN
        	INSERT INTO empleados VALUES(p_id, p_perfilid, p_nombres, p_apellidos, p_telefono);
        ELSE 
        	UPDATE empleados SET perfil_id=p_perfilid, nombres=p_nombres, apellidos=p_apellidos, telefono=p_telefono WHERE id=p_id;
        END IF;
        
    ELSE 
    
    	DELETE FROM empleados WHERE id=p_id;
    
    END IF;
    
END$$

DROP PROCEDURE IF EXISTS `gestionar_familia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_familia` (IN `p_operacion` INT, IN `p_id` VARCHAR(6), IN `p_nombre` VARCHAR(30))  BEGIN
	
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	
    	SELECT COUNT(1) INTO numeroregistros FROM familias WHERE id = p_id;
        IF(numeroregistros = 0) THEN
            INSERT INTO familias VALUES(p_id, p_nombre);
        ELSE 
            UPDATE familias SET nombre=p_nombre WHERE id=p_id;
        END IF;	
    ELSE 
    	DELETE FROM familias WHERE id = p_id;
    END IF;	
    

END$$

DROP PROCEDURE IF EXISTS `gestionar_perfil`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_perfil` (IN `p_operacion` INT, IN `p_id` VARCHAR(12), IN `p_nombre` VARCHAR(30))  BEGIN
	
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	
    	SELECT COUNT(1) INTO numeroregistros FROM perfiles WHERE id = p_id;
        IF(numeroregistros = 0) THEN
            INSERT INTO perfiles VALUES(p_id, p_nombre);
        ELSE 
            UPDATE perfiles SET nombre=p_nombre WHERE id=p_id;
        END IF;	
    ELSE 
    	DELETE FROM perfiles WHERE id = p_id;
    END IF;	
    

END$$

DROP PROCEDURE IF EXISTS `gestionar_porcentaje_anual`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_porcentaje_anual` (IN `p_operacion` INT, IN `p_valor` FLOAT, IN `p_anno` YEAR, IN `p_time` TIME)  BEGIN
	
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	
    	SELECT COUNT(1) INTO numeroregistros FROM porcentaje_anual WHERE año = p_anno;
        IF(numeroregistros = 0) THEN
            INSERT INTO porcentaje_anual VALUES(p_valor, p_anno, p_time);
        ELSE 
            UPDATE porcentaje_anual SET valor=p_valor, momento_registro=p_time WHERE año=p_anno;
        END IF;	
    ELSE 
    	DELETE FROM porcentaje_anual WHERE año = p_anno;
    END IF;	
    

END$$

DROP PROCEDURE IF EXISTS `gestionar_proveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_proveedor` (IN `p_operacion` INT, IN `p_codigo` VARCHAR(8), IN `p_nombre` VARCHAR(40), IN `p_telefono` VARCHAR(12))  BEGIN
	
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	
    	SELECT COUNT(1) INTO numeroregistros FROM provedores WHERE codigo = p_codigo;
        IF(numeroregistros = 0) THEN
            INSERT INTO provedores VALUES(p_codigo, p_nombre, p_telefono);
        ELSE 
            UPDATE provedores SET nombre=p_nombre, telefono=p_telefono WHERE codigo=p_codigo;
        END IF;	
    ELSE 
    	DELETE FROM provedores WHERE codigo = p_codigo;
    END IF;	
    

END$$

DROP PROCEDURE IF EXISTS `gestionar_redsocial`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_redsocial` (IN `p_operacion` INT, IN `p_codigo` VARCHAR(8), IN `p_nombre` VARCHAR(40))  BEGIN
	DECLARE numeroregistros INT;
    
    IF(p_operacion=0) THEN
    	SELECT COUNT(1) INTO numeroregistros FROM redes_sociales WHERE codigo=p_codigo;
        
        IF(numeroregistros=0) THEN
        	INSERT INTO redes_sociales VALUES(p_codigo, p_nombre);
        ELSE
        	UPDATE redes_sociales SET nombre=p_nombre WHERE codigo=p_codigo;
        END IF;
        
    ELSE 
    	DELETE FROM redes_sociales WHERE codigo = p_codigo;
    END IF;

END$$

DROP PROCEDURE IF EXISTS `gestionar_redusuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_redusuario` (IN `p_operacion` INT, IN `p_codigored` VARCHAR(8), IN `p_idcliente` VARCHAR(12), IN `p_nombre` VARCHAR(40))  BEGIN
	DECLARE numeroregistros INT;
    
    IF(p_operacion=0) THEN
    	SELECT COUNT(1) INTO numeroregistros FROM redes_usuarios WHERE codigo_red=p_codigored AND id_Cliente=p_idcliente;
        
        IF(numeroregistros=0) THEN
        	INSERT INTO redes_usuarios VALUES(p_codigored, p_idcliente, p_nombre);
        ELSE
        	UPDATE redes_usuarios SET id_cliente=p_idcliente, nombre_usuario=p_nombre WHERE codigo_red=p_codigored AND id_Cliente=p_idcliente;
        END IF;
        
    ELSE 
    	DELETE FROM redes_usuarios WHERE codigo_red = p_codigored AND id_Cliente=p_idcliente;
    END IF;

END$$

DROP PROCEDURE IF EXISTS `gestionar_telefono`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_telefono` (IN `p_operacion` INT, IN `p_idcliente` VARCHAR(12), IN `p_numero` VARCHAR(12))  BEGIN
	DECLARE numeroregistros INT;
    
    IF(p_operacion=0) THEN
    	SELECT COUNT(1) INTO numeroregistros FROM telefonos WHERE id_cliente=p_idcliente AND numero=p_numero;
        
        IF(numeroregistros=0) THEN
        	INSERT INTO telefonos VALUES(p_idcliente, p_numero);
        ELSE
        	UPDATE telefonos SET numero=p_numero WHERE id_cliente=p_idcliente AND numero=p_numero;
        END IF;
        
    ELSE 
    	DELETE FROM telefonos WHERE id_cliente=p_idcliente AND numero=p_numero;
    END IF;

END$$

DROP PROCEDURE IF EXISTS `gestionar_usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_usuario` (IN `p_operacion` INT, IN `p_idempleado` VARCHAR(12), IN `p_correo` VARCHAR(60), IN `p_password` VARCHAR(100))  BEGIN
	DECLARE numeroregistros INT;
    
    IF(p_operacion=0) THEN
    	SELECT COUNT(1) INTO numeroregistros FROM usuarios WHERE id_empleado=p_idempleado;
        
        IF(numeroregistros=0) THEN
        	INSERT INTO usuarios VALUES(p_idempleado, p_correo, p_password);
        ELSE
        	UPDATE usuarios SET correo=p_correo, password=p_password WHERE id_empleado=p_idempleado;
        END IF;
        
    ELSE 
    	DELETE FROM usuarios WHERE correo=p_correo AND id_empleado=p_idempleado;
    END IF;

END$$

DROP PROCEDURE IF EXISTS `gestionar_ventas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_ventas` (IN `p_operacion` INT, IN `p_id` VARCHAR(8), IN `p_empleadoid` VARCHAR(12), IN `p_clienteid` VARCHAR(12), IN `p_fecha` DATE, IN `p_total` FLOAT)  BEGIN
	DECLARE numeroregistros INT;
    
    IF(p_operacion=0) THEN
    	SELECT COUNT(1) INTO numeroregistros FROM ventas WHERE id=p_id;
        
        IF(numeroregistros=0) THEN
        	INSERT INTO ventas VALUES(p_id, p_empleadoid, p_clienteid, p_fecha, p_total);
        ELSE
        	UPDATE ventas SET empleado_id=p_empleadoid, cliente_id=p_clienteid, fecha=p_fecha, total=p_total WHERE id=p_id;
        END IF;
        
    ELSE 
    	DELETE FROM ventas WHERE id = p_id;
    END IF;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `id_Empleado` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `nombres` varchar(35) COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(35) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `id_Empleado`, `nombres`, `apellidos`) VALUES
('1', '34', 'Anonimo', ''),
('12', '10', 'Periquito', 'Paternina'),
('24', '17', 'Moises', 'Genes'),
('45', '10', 'Karla', 'Opa'),
('9', '17', 'David', 'Guetta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisiones`
--
-- Creación: 22-10-2021 a las 00:35:18
--

DROP TABLE IF EXISTS `comisiones`;
CREATE TABLE `comisiones` (
  `codigo` int(11) NOT NULL,
  `Volumen_Ventas` float NOT NULL,
  `Porcentajes` float NOT NULL,
  `Año` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `comisiones`
--

INSERT INTO `comisiones` (`codigo`, `Volumen_Ventas`, `Porcentajes`, `Año`) VALUES
(1, 1000, 16, '2021-10-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--
-- Creación: 22-10-2021 a las 00:14:21
-- Última actualización: 24-10-2021 a las 04:22:04
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `id` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `id_Empleado` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `codigo_provedor` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `id_Empleado`, `codigo_provedor`, `fecha`, `total`) VALUES
('3JXCV63Q95O2', '34', '23', '2021-10-24 00:00:00', 76800),
('4L001360K34N', '34', '90', '2021-10-24 00:00:00', 86000),
('5H2WM5C2858Q', '34', '14', '2021-10-24 00:00:00', 51600),
('R6XW738HE28A', '34', '14', '2021-10-24 00:00:00', 462300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compras`
--
-- Creación: 22-10-2021 a las 00:14:21
-- Última actualización: 24-10-2021 a las 04:23:03
--

DROP TABLE IF EXISTS `detalles_compras`;
CREATE TABLE `detalles_compras` (
  `id_compras` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `id_producto` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `detalles_compras`
--

INSERT INTO `detalles_compras` (`id_compras`, `id_producto`, `cantidad`) VALUES
('3JXCV63Q95O2', '56P', 24),
('4L001360K34N', '089U', 2),
('5H2WM5C2858Q', '89BD', 8),
('5H2WM5C2858Q', '90C', 12),
('R6XW738HE28A', '089U', 67);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ventas`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `detalles_ventas`;
CREATE TABLE `detalles_ventas` (
  `id_venta` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `producto_id` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `id` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `perfil_id` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `nombres` varchar(35) COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(35) COLLATE latin1_spanish_ci NOT NULL,
  `telefono` varchar(12) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `perfil_id`, `nombres`, `apellidos`, `telefono`) VALUES
('10', 'A2', 'Mario', 'Paternina', '23435'),
('12', 'A1', 'Farid', 'Mendoza', NULL),
('17', 'A2', 'John', 'Doe', '3198780980'),
('24', 'A2', 'Cristiano', 'Ronaldo', NULL),
('34', 'A1', 'Leiner', 'Viloria', NULL),
('6', 'A1', 'Jaiver', 'Rodriguez', NULL),
('78', 'A2', 'Yjuyt', 'Ytuyg', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `familias`;
CREATE TABLE `familias` (
  `id` varchar(6) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `familias`
--

INSERT INTO `familias` (`id`, `nombre`) VALUES
('1', 'Ordenadores'),
('2', 'Laptops'),
('78', 'Smartphones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE `perfiles` (
  `id` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `nombre`) VALUES
('A1', 'Administrador'),
('A2', 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porcentaje_anual`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `porcentaje_anual`;
CREATE TABLE `porcentaje_anual` (
  `valor` float NOT NULL,
  `año` year(4) NOT NULL,
  `momento_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `porcentaje_anual`
--

INSERT INTO `porcentaje_anual` (`valor`, `año`, `momento_registro`) VALUES
(6, 2021, '2021-10-20 23:22:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--
-- Creación: 22-10-2021 a las 00:14:21
-- Última actualización: 24-10-2021 a las 04:23:02
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `familia_id` varchar(6) COLLATE latin1_spanish_ci NOT NULL,
  `imagen` blob NOT NULL,
  `nombre` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `precio_compra` float NOT NULL,
  `Precio_ventas` float NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(120) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `familia_id`, `imagen`, `nombre`, `precio_compra`, `Precio_ventas`, `stock`, `descripcion`) VALUES
('089U', '1', 0x5265736f75726365206964202338, 'Pc de escritorio', 6900, 7314, 67, 'Sigue siendo bueno'),
('56P', '78', 0xffd8ffe000104a46494600010100000100010000fffe003b43524541544f523a2067642d6a7065672076312e3020287573696e6720494a47204a50454720763632292c207175616c697479203d2039300affdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc200110801da017203012200021101031101ffc4001c0001000105010100000000000000000000000301020405070608ffc4001b01010002030101000000000000000000000002030104050607ffda000c03010002100310000001faa400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005bcef35f45711b2cd3ee2e1d53b8387d4edee1e3b8387d19ee2e1f53b7b81411bbe84701ae27df5c0b1cfa15f3a0fa2df3a50fa31f3a99fa29f3a8fa29c0a8c77e7008cfa11c57ad627b018980000000a56c638b6ebc075adff21645e638dc2dfa169f20fa18ecfd375e47ecedd0f4d168ef96aeca1d462cabdd781de723aba1e53a96f7d3763c8f84a7bcaeef07c1ddeeab89785afbcbb16f81bbdff12d3ed7afafaddbdbabcf2ee857e73ce6bd1aec59ce1d22b1b3e7793e85f9eb93ec7edb9bc5fb4e6fa804802815a54010cd0b1f3a755e55d4ba5e23e7bf15b1e5fa1ebe5bb71e7312df7d25f2e7d272d4bbd479cdd6c70eec6931add08f91f55e574f67b5c9597d97c462ba5bb328ae9ae85f1dd25f1d88eb7dd0becbaeae2da56fac6db2b7dd1bacba4ac762ce43d8f8f737d2761ea3cb7a970fdd86260000008a488f9d3a8f2dea1d2f0df2ee973f9f73fd863fb1f079d1d9f5beeb86fd977737e7def38d3dfc1b7165c6b34a1e5fd2f99d1d9eef3d26f5bf24b2ebee591dd7d6365b5beb1bacbafba37d95bef8dd1dd7d61b16dd75d0d8b2b7d617dbc73b371bd1ee75cea5cb7a9723d706260014aa855408a6898f9cba7f2ee9fd2f0df26780f73cab43d84db2d3a1b3b2fb33e26fb16fe37a2d26e3497f1f1f1a4c49ea47ce7a0780a7b3f40cd6cde9fe696564aa765f75d0becbafac362dadd742fb6ebab1d8b2b7d617db5bab0badbab742fb38c76ae2fa7d5eb5d4b96f52e77a2295c4c0a2a0001afd869f35fcfdd4b96f50e9788f92398754e51cef65e8b4db0c68df8df5b7c9bf596cf036d8b8f76c7171b124c5423f0fecbc6d3d9fa227b67f41e22cadf5c5b6d6fac362dadd585f4add58dd6d6eac2fb6b756175b5bb2ebdcc3aed2386cebf8b760e3155dd53af715ed5a1d40c5c0005054a15d3edf519abe7dea5cb7a7f4bc4729f983ed3d56b757e35afd7b48ed718ec1954d8e364eaf235d9a23c593198b3c8fa8f2d476be929ec9bb3e6edadf5c5d6d6e42ea56b585d4ad6b0ba95ad6375b4ac75fa3cdc8c2cbafd14904ab7cae838df75e215ddd13b5715ed3a32aa958de2855415028a8d3ee34f9abe7de9bccfa574bc479c82e82bca0ac595b8d241945893e2b10e34b8b9c45e737fa1a3b3f4ccd64bd1e6db756b8ba8b90b695bab0badad6b0b68ba28ee43752b1fa15f998596d79aeb6ebbc75bc27bcf08a68f79dab8af6ad3dc08dc050155054a15c3cb891f9b3a4f38e8fd2f0fe5219208596432c0c4504b8ec438b918d98c18d918f98e36877da2a3b3f4fcb64bb71b6b75636db5ad91b6ec2c5977987aeccd0f5f5b373bc3ea6f9f69bf8df51f3fee76d978b99a3bb7dd6d6ef1b7709eebc269d6e9fd6396f51d1e95462c2800ad2a14a86067e121f3d741f07ef3a5e2bc9432c15db1c3342c438d938e6363e563e58d8f95066189a0f49e6e8ebfd472db25bb456b8b2cf3591abeb4bd359acd7ec4e4f3b268f76a87492e92e8ddb3f29173b6beabdaf24ebbc3f46a96f9070aeebc2a88f53ea7cb3aa68f529531629514541415030f33010e0dee3c57b6e8790f210cd14670c391098f064c262c195098b065c261f98f5be4a9e97d4f35923aa2ec59ce60c2c0f4bb1b9c2d4ebe51d869b0b4d5c72f518b068424923c8d6bbd5fd41f28fd634efc7665c1b3e4a2e15dd784eb6d755ea7cafaa6a6e8a62ca80a0a942b4ad0433c2c704f67e4fd6ef795f21164451963c73c786343930e718d0e5c396245971987e37dcf86aba3f554b0c55fa1cca60478e8f3cf27d1b956f6e47a9c4d24b43335b8d76a69cf918d914dd91958b970e8fa0ef7c97a3d1dbf4bb4e7b8d8aba5708f71ce27cbecdd4797751bfccd546260015052a0866858e23ea7ce7a5dcf37e4a2c98632823c88d1c68b2a33122cc899c48f2e33139ff0048e6b5effd3ef138daff004df6585e3f1a1b9ea7996fadaafe4daae99e53563e6efd9c51a71a7ad2364b9183b6aaee95e9393ec25add5abe23d0ed6be6f33e9bce2fd1eddd4b96f52dbf1c189814545150a54219a1638e7a4d07a1dae07958b262c4b1ecc8b0c78f26c6312ccab18c58f3233139675ce490dded50fa79353ea9e2b1fddb16f3faf41c8c63c063f55c1853f3c79c93cef17b79b03321ad919d87958d6ca9229aed49765a94e3ec7cfe0e2edea7d29d4797752eaf8c52ac4e8a8a02a0010cd0b1c97d0e8bd06cf17cbc7951a58d664dac62db91698d664da6359956b189c73b6714af6bea696f9abf6588cb6278b24f7a31e26c5887ce9cff00eb9f01c7f43f3ed3a5e8b9fd0f293ef648c74f91bcddee68791db740f43bbabe1fcc772e3db5ccebdd4b96f52d9f3418981454000219a16397efb4bbdd8e579bb326cc671adc9b72c6b32adc31adc9a31896e65a6270befbc0637fd03b2e759fd2eb744ccf0366875fa3ddc8bcadba1f4453e55d24b53ebbc2f90ec9ebfd734f91a5aeefac5f337a0d7e877d9b8decb1b1d5ade59053b7d4f8cfa6f118a3b8752e5bd4a7e785313a9400a80043342c737de6a377773741664d863db91431edc8a18f6e4d0c6b72462fcf3f46fce78bb6d66ee0f77e1b4f16d706dd7f3189ebeb574bc757d5434d9e72bbac7ab1ae67568cebaddfdf4ec79ef6965bcdf43eb3130f335fad0e8765a9e8707e8aea3cbba970ba94ad2b8981405400219a163c06eb51bbb7434949ec661a4f690db3d082991420b720637cd3f4efcc69e4573a9f43f98e0d332b896153697c2ed4dd97815ee20c5c7a6ecf930722a96eb658d99cef7965d91271be8d1497594eee3e87d179da2afa1ba972dea53f98062605015014a8866858f0bbbd46eacd2d4c593467067d76d9986935188535085351887e5dfa9fe584fd25ba6afbdf9eec62c2b6cd7931adc5d6b64b61bf5af9e5c79766a9b270ae96769161cbabe82f964bf4bd2db93811a1b9d1c983a57fd23d4b96f51e366aa313aa950a0a80043342c78cdce9f7366a6be2c8b59f2de97cefa6c663a494ce234823a4b4622f94beb1f93f12cabb715fa0fcd74b5dcdb269ebb48e2c28b2224f16dca8c8ee5d053229246795b1d3dba3ea7d0cde4e2d2edfb1f2b8506be87d2bd4b96f52e275831300a0a800413c0c790dbea76f66be160e7da979df43718b1750a2a2d5c66df92feb5f92f18d85dafc2f7bf33dc6369add3d8d9c3854d7bb2698e8cf2e4c1ae63b2bb5b93b35645b7afaa28a5875adb2c5ba773231b2343b1f4f752e5bd4b93ea4a5713515280a80043346c78fdbea36d3d6c4a5d624052a0052a654f923eb8f9230c6c5d27b7f5be13414dd42a754d9d213d65db3bf38d55db6be58d5646752f8472322dae0aec72a8dfd1dbbd8357aba4c5c8f25ced8fb07a8f3fe81c6f401898000002db873ede6c3c44f5bd25be665cc3d03cf8f40f3f43d0bcf0f42f3f43d0fcf5d930b31f8464eeda84f943abd671e4f4eb346792dfd5eb1cf29756671ca5d5998f287561caaeea6c4b993a75b4eef1bf7fd07e85cebfb4d852b1b8190280a800014a8b57318b178b5732b570b570b5730b5719b2b70b5718b570b69799b570b178b697b2b2b730b6e32000028a8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffc400341000010303010507050002020301000000000102030405111206101330350714151631333620212223321734242526418050ffda0008010100010502ff00e2cc99ff00f0957057edad2c0e7ed7d5c8be6aad3cd55a79aab4f35d61e6bab3cd95679b6a8f37551e6fa93cdf5279c2a4a9dbd92906f6935332f9fee079fee279fae049da3d5c0bfe4e98ff00274c7f93a63fc9d31fe4d9d4ff0026541fe4ca83fc9752a79fae479fae479fae42f6855f196ded2e9aa1f455d05c20e6ede5e65cdaed30daa9b883aa91877e61df9877e68957a85aa16b05ad16bc5b81b597d9e2a4b547535f5316cbd4bd3ca8d3ca68794da7951a7955a79510f29a1e52453ca287941a79410f27b4f26b4f26b0f26305d8c443687672e96f8761769aa6d1718de923796bf62f0bc6da094bdde62b552ddebef11a26d2d7eba6bbdc9c966da05ab9b5e822a8d6f7fd95ca2a8aa5e26d6bb396d6daad1f460d260d26d5455cfbb5a9b51e1d83060c1831bb4957694b7dd3642afbeecff2e5fe2e5d72a570dda4ad56ed05f6feeac45a4489b154bedb2c9769a49ea27935473d44555af535ca394729744ffa967b660c18306931bf1f460c183060bd7cbbb38f8b72e4f6ee5d76abdbdb572b6f9a95b554f23dc55a231122d3492d5b68ee973aa8eaafcc5fc14728e2e5d1e34fd78306931bb1bb063763760c1831bef7f30ecdfe2bcb93f8b9f5dabf6f6c15a9b415b6e8a7865a7a889767ad31d6cbb491c14b36dec0be19b14c72dc19fcb94728e52e5d1e34fd7a4c183060c18dd83060c18dd831bb05f3e63d9bfc5b9727f173ebb57fc6dd3f45eb8b2c492d54e8f864aa58bf26bdf0c7514d4d434f4f07a0e515472972e8f127eac1831bd0c18dd831bb1f55fbe65d9bfc5b972fb773eb957fc6dfbf45f78cd7432bf5be9aad2364b2b649a076a64a888f93fb728e51ca5cba3c49fab7e0c183063763937ff99766ff0016e5c9fc5c5737bacfe3b44eb7be2f729a4c12bf324deeb94728e52e5d1e24fd583060c18dd8dd8fa3063e9bff00ccbb37f8b72ebe6eed495fd6ab7f8ed13adb1353e4a68deca86687c1f79986bd2f9d7f7394728e52e5d2214fd383060c18dd8df8fa31bb1bf683e65d99d423ec1cbbbf4caeeb359fc7688c5f1745c2b2a9ac5ac96391691355427d873bf2a8f75ca39472973e910a7eac18dd8df8fa31bd132369c4898849a50926c17a7abf6c3b2fe95cbbbf4cafeb3546d76cea5e28eaadd51472f05e24122aecbeccc8c98860fc645fbb94728aa5cfa445ed639b1993248848cfbde931b5fd97f4ae5ddfa657f58acf45525a464878744252471af0d0fc5a4932b91ca394728e52e7d222f68c7d18fa9cb8106aee41507b0bfa636cbb2fe93cbbbf4cafeb15a397eeaa2a8aa28aa39470aa39472972e8f17b5f5e37fa1ebb904dea86d27db6cfb2fe93cbbbf4cafeaf5be8f5fbaa8a28aa28e1c2a8e1c5cfa3c5ed72a45fb6e413726eda5f9a765fd2797550b2a29ebbab577a385dca28aa3851c387172e8f17b5f549571c63ee320fbb54344bfc8d23be53cca8e454104f4dfb4bf34ecda2626cdf2e5f6eb7aad7fa3851451451c28a28e2e5d1e24fd5f43ded8daae7d51dd91a92b0989947bf051dd64a2750d7c75f1209bfff005b4bf34ecdfe2bcbae4d5475cdd377aff477aa8a28e1451451452e5d1e2f6b1bd551a8e97bd4b161a92cc84f293c84cf2578f9705b6e6fa4a8a2a865641f46d2fcd3b36f8bf2eb3fd5af4ffb7aff00476f51451c28a28a5cfa3c5ed6fbb4fa1b03f071f092d412cc4b3134a4b2924a4727e5b1f70fdbf46d27cd3b36f8b72eb3fd5ad4ff00b4affe5c28a28a28a28a28a5cba3c5ed6fb94daebdb2e074e49392ce4b392cc4928ab919eb68a85a7a9f531bf697e69d9b7c5b975ae46d1d57e570affe5db945145414541505150b97488bdadf58eff94b30e9c92a096a096a47cd9339106a14bfd52b7348adc0a29b48bff9a766df17e5cc998e76e2aebfd1deaa2a0a28a2a0a86054150b97478bdadcaa8d2eccd1572498249896a096a723a4c8820830a08f5cd05eaa206b2f314832564a8a6d1fccfb37f8b72e5f6ea53fe5577a3bd7728a828a2a0a2a0a85cba3b5ed8e1ef4d515d338e0394bed22a4752fc134e4b38aecee4104186ced3716a1621d1b8fbb163bb4f0975aaef7b5dd9bfc5b972fb7509ff22bbf9720a82a18306054150c0a82a172e911ba26c6ead6347dcd1075d09abd2665d29958b50c5cb986911044104235cbadb2a52411d66a125c8bf71cdc956c466d5766ff0016e5cbedcc9fbab7f97faee54302a0a82a18302b4b9f4749d786e914748a2bd4579947a56db3492d2e0584e198dd929938436a9508ae0a853dc48aad1c23d14aff0096766ff16e5cbedc89f9d6ff002e4150c1815054306915a6934972e90d8bf5ba11d08b0a9c112023895a4d6864e57c0ca4924720f95a871752c5a506b904734cb46bda843588c23bb35a3aa12ab69bb37f8b72e5f6dc9f7ac4fc5c9f7543060543060c18302a172e91151feaee477169e1f19e1f10da2850640c6970768a7bb45c6ad5a41b48883634410688d341a4d260a06b9b7fecdfe2dcb97db52b3f972183060c183060c1a456973e910b7f4e8349a0d023046953024b1ed058dd14ae4d22ee451aa35e24a8311cf21b749294b66442ba1e06d5766ff16e5cbede3f1aa4fc5c860c183060c183060c172e910a7e9d269349a4c6ec64a9a264edafd948662a7645f18fb04f19e1332096a9865964520b094f684690d02346c0885f131b63d9bfc5b972fb6d4fd755fcaa7df060c1830693060c182e7d229f68589132ff0003865d6178dab8dc24a8711a715a71da83ebe260eba53a9dea290e07105b7a1dc188252310481a86844155ad16a2342f8f47ed8766ff0015e5cbedc69fa6a7d150c183060c183060c0a85cfa447654e1b2d10b06b29a11d75a2a727dad8a14a9dba9c9b6aee73925c6b2617538d0681b249190deeba021dadac690ed5d63c6ed1dc147ed0d6b44da4cac572e315ced5b57d9bfc57972fb70a7e8a9f453060c183060c183060ba749499fa56471ad473d712b1cabc3c18df93264c991b95750d1cda7bc31ac5a3e22629e218f493693b37f8af2e5f6e9ff00d69ff954dd8dd83060c183060ba748e250398e6d1a8aca61f4d4ce5eed4682b69d05443438752aa8b42a77178942f12dd12a25ad88474ce8c7d3bcb545f9d7f138bc27a94edd3b45d9bfc5b972fb74bfeace9f8aa183060c183069349a4c174e909fce4c99df830a2bdad16ae169dfa11b571388574aa3b5191146cae68ea991e6a22f92766ff16e5cbedd27fa737a2a18dd83060c183060542e9d25236e9e09c1121d4774543850b47f087b1ae1f4cf53b94aa25b9e3287410c8a8df51a8d53822538b060e1291a69da4ecdfe2dcb97dba2ff004a5f4c0efc538a99c6ec183060c182e9d25266e859da7786a0eaa7b8578b3220b39c7125c88e11e472222af0e41639631277a1de9c256604ad12b88e4e2ed1f66ff16e5cbedd0ffa32fa2a18228d5c860c18df814ba74845fc7728e451635384a7094488c60c6ec8c91cd12464a3a9105a57a1c171c27145f6da0ecdfe2dcb97dbb7ff00a127a607a3b184d383060c183060c174e90d4fc749a4e1a9c3382aa777720ac468af8d0e2c46b8cd519aa3191eb23a6411323633446839603ec9b4bd9bfc5b972fb76fe9f27a6ee3af1bebff00d5cfa4b238b47e8435c2871da877a543bdc8a3a4d46a43599431189c3124469de3077a53bd385a8516638e5b9faefdd9bfc5b972fb76ee9cff0042b3570199e27d6a5d3a4b5df86a165441d54d416ac5aa71c771c771c7512611d9dda8d62c8714e2299dd67eb9d9bfc5b9737b76ee9cff004fa71f55d3a4f174b5f3aa8aecf213ec3243d4d39163163534aefb3f5cecdfe2bcb97dbb6f4d7fa7294baf4944e2c2ad54e46048dca36011a60d269382aa7775169cb5e3cc1d9bfc5796f4cb6ddd3dfccbfb5612c375670d62169d05a53ba1dd54ee8777621c38d0cb10e221c538ae18aae122788daa51ddf505ef8a5c6e2eb6b767eb5ddef61a9bbaecdf2d473fc36ebab29cbed06d6b055494cf611d7544078b569e2d5a78b569e2b58789d5a8976ac69e2f5a78c569e315c78bd69e2f5a78bd69e2f5a36f55ed5f1fb90ebfdc9e88c96a5fb336a92b6b2869928e939972b74374a6736e76c1b7ea63c7290f1ba43c7290f1ca43c7290f1ba43c6e90f1ba43c6e90f1ba42b6badb70a6aad93d350eb1dc237783559e0d56783559e0d56783559e0f56783d59e0f56783d59e0f58783d61e0f58783d61e0f58783d61e115a50ec65dae6bb2bb1b4bb331f3f06399831cbc6fc1831ff00ca5fffc4003e110001030202060606080603000000000001000203041105121320213132511014223341611523718191a10643525392b1d1e12430426072c182f0f1ffda0008010301013f01fecb7bdac1772ebd0f35d7a1e6baec3cd75e879aebb0f35d761e69b3877085a4f22b49e4b49e4b49e4b3f92cfe4b3f92cfe450783fc8aa99d2caef250d0be5175e8c773525368ce5722cb2caa86012cbdaf058afd26a93318a8ce560f9af4fe27f7c7e4bd3d8a7df1431dc4fef8ac3ab712af97466a32ecf24fc5b118de5ba6bd90c6310fbd2862d881fad2862d5ff007a561388beb6f14dc43c534dc5f5e5ef5ca9f644d4c7b8b8b5c154b1af9636b956b1b14c58cddd18671b93d9db29b1a6c4832c8310620c4234d8960acb54fb93376bcddeb941dd37a2add91ec72ac717cc5c45ba30ce377b13a3ed9418b220c4d8d089363423423585b2d3dfc93376bcddeb9400189a88077ac45d97229ba30ce3722ced14234d8d08908d08d08d08d08d5036d3266ed690d984852778553f74d5b562fb98b366e8c2f8dcb45b4a11a11211a6c6846831474cf936b4214a46f503747365511bb75a4e02a4ef0a86b9d08ca45c2f4a0fb0aa257d4bf3396c1b074619c6e5a3da84684684684683161d8669bd6cbc3f9aa88835966a93b2e4c6b5c73a87875a4e02a5ef0f4d95ba30be372c9b50620c41883153d3e9a46b39a6b430068538ecaa9dea9dddab28b8758ee520f5875b0ce372c8831062cae3b939b2735054d4533f3b76fb550e24cab1622ce539b35541daa9bbc4cddacee129fc65596559559655870b3dc835062c8ac8b168953b746f0e55527614ceb954bde2670eb3b84a70daacacacacb2aa0167959106210f6568964595323558db5331ded4e6b9c6cd0a9e9e563b3b9b6099c3ac5483b5ad45c6532273f842651fdb2babf67b29ec2118dc5329ca8a9968617304728baf4743f546cb10a49208b33b7266ed77f12b2b2b7459518ed94ca316174da460420013a85b26d0bd1e9b4365a10c4f8afb57698b1290ba9ac53376bb86d56565656e8a5e34da86586d5d6988d6b0215e7376426d63edc174fa999fe16449f129d2b478a13339ac4b29a52404cddae42b2b2b2caaca9b8d35db16745e83c83754f5cd2dcaf40b5fb8a7457f14fa68fc518a26aae77a9b266ed723a6dd30f1a8462a4fac89807f92718a21799ed1ef4711a11ba4bfb13f17a36eeb95e9d806e614dfa44c1fd0998fc2f1b5d64cc5a090db3ed5a767895582f0dd3376b15656565656565171a929dc0ec99a7dff00aa6c42fda704258f7193e47f45a5a6f17fc969294ff59f87eeb3407eb3f351c71bcd84814187d3b9b67f6d57d5f50a40f6c77f25472e2b5074b50c2d8bd961e499bb58ab2b2b2b2b2b28f89170ba0e07720c726d346476e503e27fd214d4837cc84541b8ca56055f2d07aaa71a467f8381f8d8aebb15433d64047fc41ffbf0546d8fea6df86cb1f2f3427373099bb5c6ee83a8ce24ea994acce3e29ad1e2acc472f828de6178919bc26e2914e7f896969fb4c36f96efc953438c48cd2e1356646f2bd8fc0a7e3bf49e88e59c1f7b3f64cfa4788e23fc355b001ced6dc99bb5da36741d467122c37da47c559bf6ff003578f99f87eeb345c8fc47e8bb1c8fc7f65eafcd0d078977c961f8fbb0c16a7bfe16fee9df4eab88b06fcff401418b4988cf7999dae699bb58a6ee1ac38d084b8a14ed1bd08983c1646f2458d463b2d8865560b0ceff00dc99bb5dbb86b378d54b1d492963c213356958b4cd59dc785a5132725a391dff00a15351098da4247b05ff00da7e191463eb3f05bfdac3a94b24326df784cddaeeec7b1691bcd691bcd676f35a46f359dbcd17b7782b4b1482cf56a6e415a9b9040c037591eaeede02cb4df642cb4dc87c10eaed376808d693b0c9f359f3ec6a02db3fb93fffc4003211000201020306050206030100000000000001020311041231101320212241143032515233610515426091b17181f0a1ffda0008010201013f01fd9695cddc8dd48dd48dd48dd48dd48cb6d4b162c58b162c58b79114a311d4b1be14ae662e549d9186fc3e193355e6cf0387f89e070ff13c161fe26228d0a31be4b91c2d092be53c250f89e1687c4f0947e262b0ea8f5474f217a512d4695ae88bb45b4526e50bbd957422fa5172e5f65cb973318dfa63e35e944b5d90e69a21ca3b2ae845f4a2e5cb972e5ccc66316ef01f1af4a25abd94bb8b655d08be48b998b971b33198cc621f48f896a7625aeca3dcb6caba09f22e662e5c6cb8e56339593c971ebc4b51684a198dd7dc82515b6ae884f9171b2e5cb8e5b6bbe8b0f5e25a8b4e2add84f9172e662e5f82bfa47af1ad382fb2ae88cdc8b9ae8430f15f5194a8507fa496030d5345631384950fbadb5fd23e35a70dcaba172e6129da3bc664bbb90761d6b15ebe6563b88afe91ebc7db8aa685cb906b22466b12ac913c45cde19ba8524569c5ae4c7af1ad0becbeda9a6d8622cac4b124ab5cce3aa676f9a1cdf72324c7c6b4e29e8398e649b7a0eab5a9be1d7255c8e23b0aa2910f50fcd9e858cacc8c952525cc9c229ea742d04efd85093ec64a8bb18794f3d9a1f9b31f057c2393cd11d29c3b11cebf49095622a6f520acc7e4df8244d7e1f6e993fe0c99fe9c59e0ebf78d8580accfcbaa7b8ff0ea9ee3c0d45d8784ab1e794ca748fcd646a2f8b5fe8cff0061c56b9474e7fa7fb1c2bffcc6abfc09ef63cf23278aad4df25630b47c656ea918ca185a34ad4fd43f22e5cb972e3d051762cf6677da3fd12ab57b53ff00d46f317f0462a1beea9acaff00ca32e4d244e4bb9cbb0fcdec2844e4549cbb19ab1172ee4ba9599b9947d1fc3272c3a797114ec785c154f4ff00662b07468d3cf4d8fceba39fb16665d9d5f63afec56c2ef9f57f6cfcb29ad65ff7f262e8c68d1b4643f3a55e3044b1527a0ebd47dcde4bdc5566bb90ad7e4c77ec4f7849cbb989fa63f37b14f262a0a711e1e68dcd4f63713151f762a504668a2a5651d0f119bdbf931d562e1916a3e35ccb32ccb162ccb1d50f49bcadeecde56f7666abee67adeecde56f766f2b7bb33d57ab6657ec5adafee5ffc4004c100001020105080d09060407010000000001000203041121303105123241717392b1101320223435517291b2c1d1f03340424461627581931424748294a1235253e115255455636580b3ffda0008010100063f02ff00ca05b279a3e2bf2ebd67cb19f9053b62c38639049dee5c29bfa472e12dfd23d7091fa47ae123f48f5c247e91eb84b7f48f5c25bfa47ae12dfd23d7096fe91eb84b7f4af5c21bfa57a13ca60c5e51797b37ccafe0c936c1ff001c37bbb171744fa2e5c5d13e8b971744fa2e4044919873ff0034372f20341cbc80d072f20341cbc80d072f20341cb838d072e0e341ca8934e7d90dcb8ba27d172e2e89f45cb8ba27d1729dd20781ed82f5791e100eff0089d39d13314d8d278ad8b0ce36d732e6c9ccc1f444231fbbe3d89ad0d062cdbe79b762974cb0c2c20b095067dd093c98cd1a36f68b722daa410db1630c394c514372722fbcdd79439dc90a80b8c65ba6b8c65ba6b8ca5ba6b8ca5da6b8ce5da6b8ca5da6b8ce5da6b8ca5fa6b8ca5da61719cbb4d719cbb4d719cbb4c2e32976985c652ed30b8ce5da616f6eacb5a796f827463145d39336925cddfb54374ee7c8e33af1ed71c7de839a676913835b7389f4ddb674bb60933b9c4deb5adb5c7902111d11b270ef42109e6ca54ceba0f1d0839b741eee700e0849656c6c294913b1cdc18993daa8533b1ee6eaca3fa3084267b0bcf728108099ee17ef3ca4d4bef8bf6a987d9cb49987463526fb5708bc17f3f2d4dd991c2deb36a12c81ee914f7a91c4f766ac764571b34c44fb14106c830ef9b9495f6406f20b69885b6b8e20af9eebcc5436703e683d87e4305e1428cd37bb5b83da0293c280c0f944a1d7ac0e33345139253a4d2a6b045bcdb1af8582e13cca7dc5da3ff3c0eaa6734799bc72dce776a9378c42b1d915c6cd434ec8a8fe98d655f1a4075f15f67945fc691525b78707da9b0c537b3a1cb32b8d15eebd0d88effe6a03987d48cede4dfee6ed67e0755339a3ccddf0e776a9378c42b1d915c6cd434ec885fe0ed627fdd35cc75ec4182f162bd9b44d09bf6a22f5b4b618f48fb56d30c8313d303d15237533089491cd52a7ef9c36aa49cbb9bb39e81d54ce68f3377c39ddaa4de310ac764571b350d3b22e53b5b661d2a88ce64ffca37a8873e945cc8ce6b7191895ebede5e55b5c56362432d13b5c27054d2680204334de86cc8ee2ece7a0755339a3ccddf0e776a9378c42b1d915c6cd434ec8987918d3ad6d6637f0679ef26a42255e9739b88cd8c265e500513266409c0589f97717673d03aaa1f34799bbe1ceed526f188563b22b8d9a6276443363b770d4cf927a7e5dc5d9cf40eaa6734799bbe1aeed526f18856468b7a5f78d9e60ae366a1f623910cd8ed401b16d90c5e421cb49ca51a2f714c9a9a9c279fda9f977176b3f07aaa1f346af3377c35dda9906633b0349395b592acd9571b350fb11c89aec4583b761b34d95d89376b07de71c65300b6741122c4fcbb8bb59e81d550f9a2be92ac9f2aa1a361c7feb9dda9fcd87d5ac9566cab8d9a87d9b01d0c81199833e3459161398ee421609535e94d95ca99781b4b186d2760c47583172a3b8bb59e81d54ce68f3377c39dda9fcd87d5ac9566cab8d9a87d9b13298d23908580cd10a76b5a0fb02feeace92bd9b9bb59e81d550f9a35799bbe1aeed4fe6c3ead64ab3655c6cd43ecadbb59e81d550f9a35799bbe1aeed4fe6c3ead64ab3655c7cd33b2b6ed67a075543e68d5e66ef86bbb53f9b0fab59121c4687b1c29055c6cd32b6ed67a075543e68d5bb9a7be3c8d5bd860655633a16fe1b5d928403a7847de538a46eddf0d776a81103407b8004f2cc2b1d915c6cd33b2b6ed67a075543e68d5b9be75017f2b39375bc76f71b0d8af9869c6de4dd3be1aeed526f18856471ee1d4ae40e484cadbb59e81d550f9a356e093400a7f44608a86bda7fba645658772ef86bbb540f1885646e61572b36decadbb59e81d550f9a356e1b085aea4e4aafb3b8d0fb32ee5df0d776a93f8c42b22f34ab999b6f656ddacf40eaa87cd1ab711391bbdaa86f1e8ba7538b0ee1df0d776a93f8c42b2313400c3a95cc22cdadbd95b76b3d03aaa1f346adc46e71aa0a09f706adc3be1aeed503c62158ec8ae566595b76b3d07aaa1f346ad9a4cca2cd6133d53420c2d64468a390adfcf0cfeca763c3b26c3be1aeed526f188563b22b9599656ddacf40eaa865ce0d17a2dc8b78d73fe542b2f761b12dc451a9be36369584b1153805a795aa62e0f1ef273ef6f7fcb9e35a9378c42b1d915cbcc32b6ed67a075543345f5e8a77058ea4154609b0d400af719b55bb364ea24c26fb83fb549bc62158ec8ae666595b76f3d03aa9bcd1b9bd789daaf9bbe6728dddf1c2d9b765ff0f7f6a9378c42b1d915cccc32b6ede7a0f55339a377386969fd95e39cd0ee49d5a1610542c13d2b07f7583fbac1fdd58ee956bb61ef1fe81e35a9378c42b1d915cdcc33556ddbcf41eaa66fbd10b095a563562f26150c03e49ca2b8eeaddcc59c4df727db90a9378c42b1d915ceccb3556ddbcf41eaa87cd1bb21188c6a9acdc58ac562a1aac5484e68ff006f776a9378c42b1d915ceccb3556ddbcfc1eaa87cd1aaa37c27448132deac1582acd8a42b159b0ef873bb549bc62158ec8ae76619aab6ede7e0f55327743c10ad6f4ab55aad56ecd2f68cae5e5617d40b7b1211fce17a2722a42b159b34903e6b082716d3fe5ceed526f188563b22b9f9866aadbb99f83d54cfe23ac189527a56fa20e9541be5bd674a9a1302f2fb58f756fe5515df9952e2729d9de4473721544aa2cd9c2a994476fcdaed616f6570ddcf83dcbd59fd2d5bf9230e472df410c588279ff00af776a9378c42b1d9148330cd55b7733f07aa9bbe362b762d9952e9eab7b393ec53c57086df6abc6efd5f442181517cffd94499b7bf717ea2a4de310ac764520cc33556ddccf41eaa6ef62368162a22441f957947e8ff75e5237ec160457657ff65bd93b7f31255018dc90c2f2a4640179572f29fb2c30a9bd54bdcd3eca550f0ecab797adc854e5e4adf2a419958a2cff00e85fdaa4de310ac764520ccb7556ddccf41eaa192a29700b0d5a56129e6be0550766d531751b117f02fed526f188563b22906659aab6ee67e0f553726cd14adf4cdca5531745aa8bf3f39979367e6738aa0411f25e82a5cd1f258634506cee39152de90bfbec5b32c20562e9517f02fed526f188563b2290e65bab667d4a6bd7e8d4ddccfc1eaa6efe6a0590c2c288ef9cca8637e74a9afa8e4a8a45f2b4c32a8248e5056174ab02b3a0af482c32a219e7fb8bfb549bc62158ec8a43996eadc076d37f4e19754dddcfc1eaa192b68a14cf6d3caa833655cab04ac13d0a2fe09fa949bc62158ec8a43996ead9de101ded5b67f06fa7c0a679e7a9bbb9f83d54326ea9055242c30b0c2c30b0c2c30b7a675be69272ab3f754b8054bd4d6fe6994498347dc5f8267c4549bc62158ec8a43996eadc1feb9f46f2c33f754dddcfc1eaa6cf1710b18ad79e80bc99395ca884cd6a80d191a161954d2ac1b1823a16037a16005821583a362d56ab55aa2fe09fa949bc62158ec8a43996ead937b7d689ef2d9b1a2d3f69da67de8bdd66a6eee7e0f553720d8b762cd8b55b591bf06fd4a4de310ac764521ccb7556dddcf41eaa193cce37e0dfa949bc62158ec8a43996eaadbbd9e83d54c78b0b41aab37562c156294346291bf529378c42b085251fc8dbc3f2a2b6ef49cda4438a3e46f4a1268cebc2301c756c59b16ab55aa93b18fa16038fc97917f42f22e5817b955179d2b7ad69c932c07742c188bf8e5c1f8984d255d19644339fb3be9f69a149186d9a9ad7499f44194931603bdef499dbd35bf6d609daf690ef781c21dbd2a79af9989c14cc8cf6e42b8444e95c26274ae1113a570889d2b8444e9544a1e170989d2b84c4e95c26274ae1313a570989d2b84c4e95c26274a9c4aa2839570c8da4a632d8f373cab1d11c53248d17d3bc17818f91bdea141067bc6cd3f2d6981186f6d045ad388857b1a0ff00884116468343fe6dee5be64a98793692bd63e815eb1f40af58fa057ac7d02bd63e815eb1f40af58fa057ac7d02bd63e815eb1f40a7c08ec8f1213b16d051ff000fdb9c0e3dae6e969a14cf90c27fb5d09c1717c0d17f72e2f81a2fee5c5f0345fdcb8be068bfb9717c0d17f72e2f81a2fee5c5f0345fdcb8be068bfb9717c0d17f72e2f81a2fee5c5f0345fdcb8040d17f72e2f81a2fee5c5f0345fdcb8be068bfb95173e0683fb906ed4614336ccddadbdeaf9b34494bad89359ec1ff00a03fffc4002a10000201020503040301010100000000000001112131104151a1f0617191203081b1c1d1f1e14080ffda0008010100013f21ff00c4524924924924924e2492492492492492492492492493ff0002565b85d4464f4dd547d55f945d4e1d25b697b29b471db60801081ac175326cd05a4f4365fa296540eba2f313fddc52757822a4979d8e5df83977e0e3df839f7e0560fc61864c2486384986c68c402017756a26c98879c4989f87c125968eed9e8fdd6e06dcdd4dab3b764437dd336375a48d2cff005d09cc22d17733faa3ff00587a2f22cc62b8c431110d25233a85a1e54ab7a46a3dd584a7caa26ec96e7fa1793f96fd1fc67e85fe0848b789fa3f81fd13feb9fc58ac9dd93f42699fc01fcc7e8adc0f0718fc1ca3f0700fc093bd0c2c1274275d7e532f93b4593f28aab5b097914335ee3a49c9171b59d6c6d049b23c8d517ec1603ba0fd2dbbec27e57fd0d36e4b76321a90757aadd03925a1f42a777150bd153ff6fd07b510cb3cf253b2a63046050c121448b46b652615cce56b62e0bebaeeeb1138105e8048a93a26b34f3173500599b3ca0f7b9f8b2da3dcdd0485f3a0d5d93319856a1da927c2244105d83ba227311bb97347a85b869c37fc011ace491c8fdafef0661a24b21657cbddc94754d38132f37a00eaa02f03244662a8cf229ac0b50a2c814ab368412204b11623cb30f3dbf70de0e5ba1bd129683246741d812c2c48b87947731769d13b210cbca7b973a6756d924247ccaad6bf66f07201a8ce4349c03242f98abb0a474902a84b02118230a150841185fb55ee1be0dc6d0dc874acfc5542872b9865a3e830a47ce1229503f2c427cb966cd1f5e832b2eca268fa32802d4c38c29f8d86e7b621499cb6927e4510a8140b04133c481542f402581082c14bd3db5ee1be1c7741bcc2461488d472151199a9bbcfb8c02d5c08cad5e25dcd13993504a4148c11a0bb9cd6cf52f4d1fe312be72da49789442c44102604204108c090910410501f66bdc37039ee86f83ffb602a0610b499d083542b25d05745aa1653b2686724249a10b438413a3a2468e4b2f40fc769384648484881602282a88e98122084244091182470e8766bdc37c267ce83f983f073f413c848462e69a8f1c765e8238ed272cc960588423046082204a4581040911847b75ee175233926fc8dc0c86e471ba85b6433ab1b926d2eb762990849527294c3160f52546b0851d6554939392d163970e6749c0f208a0b10960812c1182c1021045300d0653736705bc7b9c4e8731a0de84da56a7f2209e84517850a5f87513d1129b9cf635325a091f21409b2f50d1f1bc24bd01735a4e0192c48c104082446281218d094b26cae8847f7064d07c0f6a5072b4f63c4e9f7389d0e0340f05de06a1743efaea2d7079227fd4429376196a8cfa06d64960a9957e59b2457266b2deb832148e2b48bc4c96082048488208122082206f21a30aa09115c71fd8f13a7dce27439ad03504f2d542ca1a01a1f12fa3ae024a7f442ab2f8e829a6b7c2d0451ba2c9284be3d285c5691797904ab8a315882081282c33c1131609113914e30781d3ee713a1c0681a1159e809f1d6f445c96913979082081611e93a0ba7071ed85c9d082fc0e9f7389d04e7e42942a301869c27186c2618e0b489c3c8461040909461184104351617968bd09f81d3ee38005593123974584f5186c71b09871b1392d2717a0812208c583917d4dc52ddd7230e3dc7746ea636180f229313acd5b0bf0909934c135b431dd111f7ee6e02cf2e980bde0b30523e072dc361c869381e4230440f6c80659e9f3ee64102948a94e2e45ab3d43f452c92f5c5e27fc20e89692935d1c30b41641784397abd65d985459392d2707a30460c2204b6f243e4d290469020bc4925d2f92ae44cdabac9346381a76d1e82bfa5bfafee5c4e849c1a0b65cc63145817020a20b2705a4e2f462912fa388e6440435b84b997aa4525ca924d709b11b3a0e7a544bd1cce87ea7b970fa133f8c0b05efd435c282097392d0270f2118de75127c10ae3753aa754bd53ae4999204841834340492ad41606b16fe87b939791b6f24235733d3f8160bd8f020980b88260735a4a397461025543139f2640479972a43995dd47bea22497814831d5dbdf861921e0901bedfb9a136934de8fb131e1084a44a84c04a08295b01d78a72fa04e1e420816ca93a8a61a5f47df030e64798ecc35cab196a395d658856692941751b477c53e4881af579c69fd7f70dc0938f4426d16a18d0980826026051671da0b85b6f1907e6c287914da3d0912e27575105031c45231c8c2bb7a3de43d05c9fd0fc9fe5212fe47cc102134696be45d684c2993b35ee1b8152e1084a3b1531061878b1e0689cf681d14d76abb22d8588d3653350c6eaa88248648a18a20c3945d8acad5e710095b8c82d21a27510d02685d86cd7b86e04cce5084a7b081aa8d603157064186281c9682f7fe087f33506b0693331f2ba8f4a0cb135ec4790e03893056e15c9573e98341dc4b8908ee2539ed0ecd7b86e056b8421282a60390f1232f00e431cde81fc8b21830d20dde437425a2cee9d98b5f46d487be8e3226e9e41ed51f22452935d06b726ac33986b013d5c19d8ec2ccaef51455cec4fec5e761b35ee1b81333840910acc065e01865965e1797d039bfc0e8577d837dc35e5f22d7beeccf8ee6c6415116590a9c4b625ba2321586ac60530a8b9de286a4dd936fa2148f7a7080d9af70de04bf9404a0a830c30c32cbf46383d071bc97a12c4af4aa343373d512249b75184f010b3310b3e1171078a6088175055395f63b35ee1bc0a4ee50261518c3c072c0cb2f05d2ce5741caf27a7282060c4901ac998d1c9b438cdf0372f1ed25e531c9a7e42329f02119491d3ecd7b86e04cee10104cc3c63358ea1965974d8e17408179245e3245024ec7202f92c2a3790e90eb0d09a9b3cc8fcb3fb4fa24e34d79049fc22c17b900b286e8c12d7ce37c87bbe9bc7d1371281692b8c398e030f1ecb344e4740db1b66d748ea5cfbd08e8569012506e84c80cb683ab2661b40397da9b8dbbe32235561dcb6eaa1fa93a21fc908bbf220a3e1153b8a7a7d34d8792c731d13eea8454995704f4fb0d8af70df89b9940856a32f019782f1ee9389d07436cfa0ddddfc8f589f4a61a1fc91b09a2589bc780d0682c65d00713ae1a952e5ab1ccea19923b5980f988951321b55ee1bc7d0b3cca05d8546358231dfa35d2ce0f40aac55a8d3b9be42bfc9fe36266dcb45fe82e03fc04d08bd7f263f3cb19c8dca9d92fc1f9190c5bcc693fba2754ebe51e1d7211cfb25afa104375a2fc1f9ca6492c96911a89950b31f9a0d519372d3b0fa7ee1bd7d0b3cfa090551e1bf45bc061d273da077f0be890dc912ca92116fdccb823ec7f00650a2faa6267ea0b2204cdd896641681d4a7f9722c95d8503cf068362bdc37efa1795904a4a83a88c1594970f19459cee81a8b4fd0e763e03da125d2a679f1c759751fdc0b9ff157e98b28de75d1b2fbfe49df8a43425ac9b351a5e88fa14d83ecfe0a0d9f398d5da7c4fd310dfdc98eb3e50f5bc03507e59c86cd7b86fdf455cfa052ea1ea137d92cee5c4ca30c15623c174b38cd0530fb2067be31364366fb5adb8aa4cb4288ebe1156876081d418b325694d1993da05d3d5487d9bb049bb7e07e887f785bc9ee8ef16fc0d9af70df8e1f40922a32e2fb06742dd6f040f03b0688c0946721a0f12fa25938181dc14500a2c08917506892410bc4a8b125d8c87f409ae82568be6c6cd7b86fdf4271f20a1869b4235942ab2b7824d244dc7560abd0d874bec729a097b2fa244f0262b453d876c97545a97c97634d34d3fe88bfdb10b4bb451ca07c06e42ee827f2122cdc34ad964eb78213afb4e40d9af70dfbe8e4f4151684886cc50a39a1898f21f4c208208206aaec731a04e41fd47723f03fd865b9bc921db6ef3f667d6103fde4fd82a345bc034d1781baedee86a78e2264fc16ef0091a8bf89a6e3e06dce6a7e708d131234e7f68dbaf70dfbe84e1e4c36417368826b59f03bb1545af96bc91390ef8c118a51f6c38cc3f90e914546613d87e5e6336843c3259b510ee27312c70c108da68366637799273fa8d9af70ddbe8e5f4603a918c12208c5d9f639ed034ecdf4599c0cb9c92493e84c6192c5083542416b0d190f0e3f51b5f70df3e8e2f46131fae2b858fb0dde25c2a4782f2882308208121337458218aac8509c90e77320cfe0798fe04e6e88afcabef3627857b875214144d97f2cedbe8b06bda89696a20a25a7421952b9346b513ab48f208ca4905fc82d4139f63166d3dc596f80d1ec84b2695fe19479f6445cb78cdf00e682ec826ada2489fb129db0d0b9dbbec116e3d61a5a4f26a9f8f74fa9c46df9d97be81e11faafe8a18b6d17953a759d02b8c8d5a62a85e8d8f4d667ebbe61da0992e677f5d07def7beaa6139526b770eee9b2093aba9b96c51677faf5f9eba12231954d9b37eeb4db6699c2b759343997907075b3ea185445da9126372997d55bdcf7bd72a5b4d5a8e8d68c88b3e94aecfcc774d762750d4fb27ff07366ad58bd7bf7ef1e3cf8f1e1de40ece19ac4111756e5be11051345224d1c96efdf6b12190c86432190432190c86460910c820820864320821922190c97fe543fffda000c03010002000300000010f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c000001b78cf318a678c71c74d35d4e00003000017aae616eba65bb8edd8a08df7ba8000ca00545e6a2e1bd94d507868e3ded5400000000030efec92f8a61428ffb99fc1fc120000090cc6b95e7ca9d4139ac67e9d1ea368080300001669e382c3895df51735583fa718800003047f9ed3c07f8fe0052feaf752bdf94810c0184d73db702f3a12c5436cd8ce48200003c3046ea835b1a6db130f39978f59b6c94033c4105ef3b35d4c63509f31def879dac6204003001e87714fa4a399d9e2abdd22e7800400c114d4d82a355ee8f6a6a125db694e250cf3c020556d8f5d31863ce041da4d4e0f8200030c10155b9baee1f159fb509d621b6c7e10c3c00005f0baa9a5babef6592e54b9507a00030000448bb5989ca42efd3c7308a563e20413c0000b7cdf7cbebaaccf34c460ad658e2803c00009b814330e39e4a41aa55071887a0003c0084eff65f3c978fef49ab6a9298bc30c20c0000ef12f72c45a1ac5d3d291d4aeba0000c00059ab09d49c0a93e3f04e46a8b6280863c0000eb1ebbef2497d58223ec8b7bdb0000000004314bed2e15962853afe9f540bca0003c30c30c3fff006d34fbaeff00f7aef9cbac30c33cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cffc4002911010002000307050101010100000000000100112131b14151617181a1c1102091d1f0f160e130ffda0008010301013f10ff00176aa888c7e15f73f4fec7f03ee0de881da3d27e44e6fc4e6fc4e6fc438ff12fbff139ff0013f6237467b9c3dec225c30128968df385fdd22ded3366709cd06e6314b9cd4b016985e2346e0eb0ff009df4837d07d46e7f01f51eb016b45788606179db8e43126ec4b2a9a6acc36c4e7dafa9ff0010fa960d03ea0b4eab06167d9de51adbee729839e434b84aa5d649889cf7ef3584858ae9701eaa0c708ef93e63b7ef758acde43d89b4251e8ba6512ad253a6f78993ef55ce230bf71e983774be09b858a73c308ee987f2ce058ef758f509a764b25d8541dd3764c0b9d4c993ee7298b9c4b5cd840686102877be23170df16a63e4f98dd4622184b485794dd9e8e35cb251b262dc1993ee4ce80e931bf13498f964313794ee5f11a1373f719d8c714ef670e6542323d849d6537ec88522e102ce9896bbdd5f776ee930f4749f33252468c17c90f520646e22010ad8c354ee359814c09b6af4b75326a154b80fccb59442836104040ccf3355d5f776ee9343a4a6531446d1c09d89ac254e12bf566176bb6d874d014425414a3bcb9aeeafb88a196734d081529f44950d72cd618fd0a31650c35c61b2709b14d82cf0f79ca5ad8f27c670921ae2ec60ac3c75f761e430df30d083af45a334984377996be836784c0512d663d90089405da4bc9a2cf36beeed18f779684bc592f09547b3bbcc317a1804228883398a25c4da563465c02f09665466ccaebafbb233150189e952a1f8fea29564db89c0c7f779436c130ca8ae511154b952a0c71e3143e0e67deb28a0d8c4fd7327dce50e28196f45108a395e487b13302174187a03873266ea19e88b14a68b5b0b264fb9ca5ce1e83e9054cfe5e485e1257bfe20193da55e17582361753ee60743c31fdf136e2662fbc738fce2c725988cc9f7394b99c32f2fe8ac14b9792287d28c0104129df3101839fba3315de6425c26a28b264fb9cbd0a9518a950d747920637ad597419c561c26b534c853e6abbcf020f2c57df24dbe3adcc607057f4ef28d3c178fc67da709e626a44a289665327dd919b1ee01ae875226e82cd045dcdd6f4b8303a1ba04b35e4fca432908c9039834196f7f9f212f4720806afc5445c4e062a39c4f44f38ef25bf3327dd91858256565656560ed7c4532a6002d88ccae686b093c1b13b53bcc807909a91680745f105cc58581c887c9001bade1ef4f6413966e6dee690e10ee3acc9f7393028818e308384ab955e9a6ea46104391320f86936f4ac844574188603d9c214e280bab6dd228fd6f4782f5f0b73200ee9ee79402c9c68d5f64c9f7393113ca6d877fa55ca20ed7521552e874b80e63a0b50d605b4e83cb4966dfa1e52de5f020b674f87ea0fa0fb4c0237e0af3514b36ea3f2e7118ac356540d98dbdc384c9f764676c4a256328944a2651c1d48a667880455b115b267083b44326c20ef78993ee7127644b972e5cb9917b9f130245b4ef3645ce34762dccc23a31f861e746b06601f8e32e04dc4f4ca8167888a12a051818bd5cbccc9f78dcfa4c1b8e0a70d3829c340202cca1501c93f13f967d4fe79f513b03a1f51e233a1f53f8a7d4fe3bea5510992009da0f6939a2f0b63b7674bcd8001ff854a952bd2bd6a57f93ffc400291100020102050401050101000000000000000111213110204161715191a1d181b1c1e1f0f13060ffda0008010201013f10ff008b634246d9b26c9b26c9b237b8735dce68e68e68e68e68e68e686caaff00c169ad45390e8352509a6098c6c5c8e54958e86c7cfb367e7d8fa1f3ec465acfab1169cf23e93cfb1f49e47fa98dd5d68350e33f803d6208cb8c2890bae16393b621965b8da771e035430d3f32ecfe01770421121273858e4ec8861861c4659750c7752ecf423619a884dab093896393b16061c47af0586189a3b976649442b78297c1658a30a50a7c2e4398f7108e7611732ba2455dd458ccb45912d33029fe042913383f70a2432944c61974d04d375112bf0cf5a2d1ad4a2139c15c8a5c8a21cc6aac3619619aa114e74ae52b995f20a813136d153221d4e8beec49557cd45975b319ccee7b129622d176657458598d29c891a437d05b15576e055a1050a21e528860b5c97332ba268113d725a2290fa4597d12222a1239a8c6eeecbd020a5b14d4ce4b99d8486e49124a1e88eb8b643b088b8dd63888436a53761ec2b97676d59ad1a231dca85c3480d753a0cd1169485645a32ece9d23092709c16e4c6f1af030aa50da750c7a209a8be05588b14e50cbb3a74ccd090cb429834a0943f0539966d3c06aca3e0bdf0cbb3cc135c09e09c152a95865febaa2b433f1ea45f78349f6bf82f50870d85e346348afe449278eb12bba2285070a64bb32be76853b8f253f11f66c6cacdda3eb03532cf2bd8c591cfa262f649feb646a19f0d0c89783ecc9db39a6358a25aefc0e4e4e6b597beb05d995c6e192c82455f2201c8e296c95a39e25fd068b8fb3eac468ff009fb035d577bf25135b0e5d9b43668f235ed79264bd767229b176643be67f510936884aa4236c933b0eaa4936db1a9526b9177bfd48787eb14ee849cb2f8fc87498d35aa772eccae3be0b23b0989427dbd9b1fc7b62e9aeff00825ab5dbf2888546bb3f64e8fa89e9ee7e8af47b9e2837260e17b62581a954fe50bb32b8ef99dbe44c4ee5b305c06e8eb812f6589a8320c3b8bdca2ecc89a924924e0c2b22b155d1ea582b845a8a0e8a572afe1fa23d67b3f420955f32bec292b4feba0890cab4ad3b22ecf42f536b0a7d099b426b3541274b7667f499fd26375dbbb12adde67f599fd2634a185cbff38208c904104104104611ff001dffc400291001000201030304030101010101000000010011213141511061718191a1f020b1c1d1f1e13080ffda0008010100013f10ff00f0d5cb972e5cb9716a35e9fbcfe4faf4d25278c3b7f39bc27874784f0e8f09e1d1e1f85fe5ebd779ebd18800555412a6853098402a3abda12f27ba24f7af6963adf7e27d2bf912d7e97694a5fd6ed30fd4f6882097db895badf6e272fdfed3fdc87f21b4fc7f9ca102e79ff52d49c4dfa66f61d896ee55d7b07d25c58de17f27d93f93bf78ff002864b9a4b1a6b774c4f70e8a524451575987fe33b07d388ed7d0ed0de69202d00565b88269f4c56c8f5a45c863cbfa52c4aebcc9b7f05f69b808741350d4344693727acf59eb3d7a7acf5fce52e12621114ce4a3a9a481c9a81a6d0761a030044aabe840ac2ec479ef4cad8b3b08b3fc93423b065f51211a63a62dab1eb0b77b459e0d9228576103b7a24fd08304ba80d8baa1a201660682b814a9e878836a9317e8cca7347d7698901da6a22ad5e2faed1ab1473ff8c32f2b59398b3735e47fca382cde2dfe429d5a9bfc1c02bb5d0101ab177818e2b80a7a517ef028f610dbf521ca0dc084762b11182fba3848f805913362162764fcaff2729ac8bda1500bb66b297b4f808e8def290b88b750f757d0330ac62f6e6b51df03896200d2e9c1c6d757dc27f0dc5540b3a8ee08cad7b4d067a3857b450bfa47cfdfb99661bad261799afacb1ab73172b853c3977a59c43074bf4332ec8036a797a6f146522c420cff00c961b33002585ebe21a9a8d60fdca82bd8a13039c0d168c543220d8eebee33717c6909c6f28c431ce7b4001896e23b78f788029880b05644dc749d8a8e100f03c1089997401ba0b4cfe459d7d3a5768a93e95076e17e275572bc84b58e78829d792a1eecd57a6c5197dccbbb7c470aedaa25ed106a1a4bb039d776f71cea334e8456a099dd4b18f8a6a90295b7cd64b413178322b90bc22a2223140ea4bf9fecb48ade2556de840ec57a57fd940060c24840d2ff0092cae3bc3d03a42c866f7da08aade25babb936813585da086f3c235303441c590df52ded354308b283a42871e210ac207bb12ef556867a5be9f85f9fcb59f4a667f7b12abebe188dee86a013f75e5b99f4fe4bfd119a5a81bb9c8d5eee22494148acc898bacf980ed071c587f4c01626e86a11ca87ac56cc42b492c34c1731ab9fa0e9d6c665ebd9fd46a97b90f18e5908dd385542a01be622bd13981b355673bc2a98a940a9974a67a200e9015462609bc0b5b5c3bede656ed0d2a9cc7bccd2f11af720a2acff001ea857d37972cfcbee38651f7b12ab27fcd98f8c6a69ad46b52c4d1cd3da35eeda398bb97d52af12f0f7e1d3ba701ae98824d25101b28d135d86b0d4cdcaee36b55788e640595cb45ba2c774a6bbdff128ccd5a6319367f5318c25bcdd32a6ab6cb532b6f1ae6c95006d7de1971306a5d4486de21774b865821ff72920ab04c8dccfb440b32a131fe3029742bfc2ff001a9f75c33d1ff29b9dc63f8974519372a26aa68541d02ba374259fa4708f731a4cd604c55a00597676c99b96355c10d96cddef7adef0f38c2a034ad730286399a9565cdf98a763fe111ba8798e7a18ade43a71df93ec413a9015a42a4212aa68cc44d218ff00b35313164f6851d1e9c3a6664ce3cc010b4bc183f63aa9575a9e9f33d3f11f436621fbd89616fdc80d0530746a4aa125f23af0174535a2e05d1d2b6051f0407c400696bb0e72398ee546cd1a17bbbaf78e4761f643528ee3a6f298e02440b198a9960c19090cd9b4ea4944f394ea400e2599d264e494688c8c0c66597883b35a8135706f79995572fd4953694a691281233996bd3d3afa47698e67af5fb8e1841ee7f120e7cff09474ff004897092ed8c8b0d35f101f9042d5642994bd88a935c41acc3a7c4082eb2008f18d8401c658f6542d5b413b406c4171307482481a86c448b3594e214c56216d0961988a7583cbfc215c8bd7f1aefd3799eab9d04610c82834e59ca6a67bc30a7e970b74aaf6d9c05e580251e0d95641b2b210c5e5806120e80d69e1d677c3f98804d535ab5a21328a049c7261866fe2dcb525f70687274c96608141a403b40661b1006d736614ae2062dccfff00180e332a882d86ec405691368764a2a8d254c7afea9a014919a8657832b37fcb3d71d2e57bff00dfd35370bae0f48cb4eed51bf7bca94bb0d732b81ad026eec0d11c971c8568969b00d0d288ba0a0655701eec0d4e2934e89e230a68c0add3d57d6648e9ef21f231dbad25374e6502997482eb9186d3a70c263a10bf1327467b658658077ef08aa96ed0a8d82c176a99d8b6226667cafbcdfc1ba31d945c08c6a786238a29f51e60fc3b7f1aebf7fce6aa4542c13718ce2d5141ab6ac141360ce195f4b284f8d93b96778681d834bbc06a638062a42ca9a8c83950c56a19a3e664e8d3c87a98be0bed2dcc548dcb6beadc5a73512c1886a1c54d348befc5ce3be156dcf685b422bae2537bc0bc4010be653ae61d846fbc28817472c160452c44665d9771ae651f95861ffc2abfc3eff9c173241398faab655e9130ddb04bc0d9f106321ff4076c42d55dcde10442b72a7b0fda1e2014203806097950d2ae5f836968ed88afa40816c039b80e95346204c205319f332338853462d0a99104529505396edb8a31e0de2cb09a5950da602afc641df4bf3d2a575fb7e71e795521994a778acace584e733bf2ab9659733eb35b24a86615be902f4d1807ba0b881ade036b95de1c6d80ad554f260212a64ae0ad66b372edc1c430e25e8cc0bb41b960677694bfa5748bae9fb95d2bbcae95d2a621bb5fbe6477c327e822f62e60d6559d656d711adce21372b676ee5469509bb6056b304263e962006ec94c2e411b457525295ce93b3329e195de546ab7c10518e9a51e3054c163a41dff00f09451bf5aa892b3f99d72bec6ae9232769f7307525af3bcaca98f2c517626be6e6be25f7cc63788932194066724156401d60c4c9987196b947132b50e1b10a1e747ccb47612efe2898353c5d80e6eeb2fe912cad5646fe383d6a0bb2b58a3913585d67a4309661110da21fad892725f681df16f7ebb75b95f8afa9b32c5acaf848e8a2b8a94ce22d0ed8aae13338cc60b5b74121dee80ac417a4beb095eeb75d80dd8c0a468b91dfbf8d26cba1a54240031d1bc016b6979ce23e585937e9eeee7cc318cc7e7fe9c3094c4b002189bcdd07deda7e012cf5ccccb67cccccf4a8eba29601461347bcc0391396812001ada5de498935b0619a99be6f9d886ef68f9a2324aae9132080da1421083a9a7065653250a76397bbff918d8ba84618774769ba6609aae50e515b44b13b05721cf20cb005c6d6ef2ee33180b8c7467d97122b2be7d3b9bcbeb7312fafdc73978e1a02f6b173e6434f986ae06664405cc07137a664f996e2e396a0900a801acabe65bae220927d1383d580da2733121a732b23841585457ed15ff00689b88aa9750a96ebac1df9a0ba0fe827a13040f5e8cc6322bf03b5d3d3ad75d1fdaf3b5d20d8768317781a87586c832c37d4db9877c745a285e2205796182a02cb61601e019f959c33d63af38b9b1ef3121aa57a9ef356d6667043e69ea094c3ef3c36cca400dd92cf86587388a6831d19f45c4bbfc975d71d494e89e04ac4fb47da22c3ed00b3ad4bbe681ba8684262be66b633390c309c42f494b35f1865b78a868640c1814c04ab06163b4daedf9c52e7013237798f56f94acdfce620d31452db788ed5f11324752897a9cc31db13bf425a1100d5cb2d562cf89c4f156fadb75af12ba57507c8a1625b0930325b570527ea58418a8e799896b11be257d92f16b329ed52dd1305274854ef0c1f12ad3acf76506f730be84a35d91612908adb997f65c72d4a4b845b7f7146be52db6e7bc6d610a257622220a0d3288048ed641414c383721c176df60ee419c0e7f48b2bacc9fe95387788a8eb52a54a952bafd370cb52692ee30ef9a1ac4d62a3a54aaea5ab8b97613328b126571326901c1b31d24bd1b6665e0bd660f81727ab5f485d02ea2a7df2fea0eba7aa2bdd9a5a2e834dc9736026f9111764534521d20ad532f65f4b82cc97494ecf7fd4716e7867f08963e6ff516ad3a667b998fe81ef1fa1f7b81a544216190f198ee0552bad4a7adbd7e93865bc08f62412f3bca7041b611e67130eeea64b87c437b406e52b1acafa74aa6d8acf24cb6b0b06c88f6b47acd30191db8604ef10126886ae5b599e63aa4652e4c4df0a9bfb4307305bb600218855732bb1e9fd80852d84ac3086b2768e14361701f23342e38f48b7e8cdff35f5367a3df54063c6f132da124c9986b61005531ce04cb9c43bd712ee58628d36f69cb2b4ca2354cc8c89712e5c83735abc3fcde3e2d0659e1e1ecc56358beb4dd40d71260889568131c0ba6e7fee51b6c66c8a79868f7986316f4a8a37b25316901dc0afa5f5f799e97d7d6ff0026584da30be29a54819c625baad211a04dc801750b59934c4c8bccdc040ce9a3b4cfc6c9cb9cc6cfc41dd0b0055bd7a00aea250a89d0ac3b91292cd227f92b386eed4e6ae34b4735ff0062cf66b2de3b94563d60b675a815f8826afd769baf752e88fae18441f5d22251f87f8874707397f91e9a1186a3ed7cc1522f4e9a4b9a4f4fcbefb86579b44ccf4a96ec665b64a378d7bcc90ea3047a81a56638ca47c30d14e5b6af8fef10b23e0cd513d80fe4bb27cdff009876d777652e576dfee041e208cd4d3c097d0ab98b047d25538b8a859457820d318957706119105097986ef68bff0084075c7ad8e8a28b15a93750ae5f45e9676fc34e9f4fc32d36260be2995b4a4ef32b647ad21c4ad2584cf5b46f1bcc4f87f5d1f068c272de26f48f64176a8566209acbcc5082d05503586811841533e0c4ac6883a37ed0bb7a2628558788c53af463433769909a6a9044a637a11fe316b2bb75aeb87dcc3d348a9e6bf910bb5b9619f98de48d26da2e9b94798f4b1748d359987387f5d235cf5032cf4e788080d10639d256adbbc15a2564805b84546b21a0e6232d48c92cf12a731e25505bed185ac15b281d8636484057da18862df887d98552a54a953d7f04e9f7dc337e18228db12f1b5cc575137a47395e6a366938931d540e259b4caec7f51d53a91b145cd67bd112d254157393ff00901b77a8c0ac43cc0209de4f823e58735166e38fd9b2e03d2d0e259e87ea18dd603d908b167895323da29807a4c204aed3234037a87b80e03fb1e16fb07f50ac88d9e20fb274b495d7d7e6574aeabea6e978202be3228a539e9a96659b4f463867599ed32684bf694bc6cfea61c900d18af3975a86139b83f6928a2b51fc2260c6d9feae22006ce0fb6bf136e9660fd6626103a28fbab162d350cf618f2b5cfed19b8aaf7628383da16d56319eccab2df58fe232886afb081f983ad78df70fea2a2b7713d161766711f960b63f461e58b60a88f5d12d88e302afc69fc6a61f4f0cbbb002bae90d666071f129748fae01a1996b98f39d89e112ca95670fea2a89654fdff09f3a569a1cab68474855f1109a755662a83ef0dd9702c618a628d99839976b537092c5620a69700acd7ea4fd52542b42cc5f69ad16aeff0010c12d8a5dfecd7499fde5be665f80598ccf1f92fbfba5ad3302e17c21d950534b8971551ac6da171f1950f1295a46f29ccf6c60a7da46736b09175d984f05f6b1961a7ee4ceeded32fd42b773b21f04aba1a34f649f130a4741b5ea14a809b03fc0998517826be2ca9bb0eeca1f1a520be54af900fccf046df7a2497b8715bf263541d5e5f99225ee161ae5084e08b232211df97bc7c8b21836be263e2ea99bcb98e7f2fabe52c0e9380bc4b5d64b9b0198f38344498acc6ee7313702e6aa943995bc6cc4d7b4c31fde912da58c2f52a5ac31b4ca568d42f21c0cb8f46dc6cc3786c2e86e312af0582b7b89a41f0a93d256e4fac45a1e0a81ed0e5fda5fc38503e21ad9eec0f32e922b3a5cbccb964be97d310fd3dd055a2c95755c1325a3594689da11cb48aece8d329631a623784ed6182caa03b25356ab6404b911467473703bdb62af896f05db47a6bf10a81bb8f9185641787e39be6203bcbbf05f13d9ebfb8c6b3039ff002436fc05a614ce29fd97e28a29f02bf7054ee1849ea88268e0ff00a7ee6407b1f2869adb701fa8fe03b53f90587e8778e817ac0f6535fd09eb72ff00255f6f281dccec03c4cdd21b83b0ad61ad2519c7ba975775a778e4c1ef88b43c4b5d54698425a554c223a1a3accb8c8816428c7dbbac438cad3e3bfa4b80bbaf989f119a06efc06222371716dd4bf041de6709a455b17bc7b362738fb665738d5b7ee9c5af57c2242f4d817d713dfaec7e98c65f721fc8b8c8762d7cc481fa7e186393550f4be7ff008627f1fbbe186f1691a96ab48bb5041d33112c18d0deb3631b768df87d233544bf12fc22dd542ba971caea2be2609a26affcd16de5889db134d66c3336916da546c9d62c044b0e35805768c97abce6c7d2304fa570faea442beda053df5979486e5fa65ec9bd9b3361ea82cd2618e7f884cc73f97d9f2967cdcaa3e205accbc32cc739b046545cae75c08d15ae9533b5d61489eea8dcef158de7841d1611c56fd7448abad7f5a769b83ed1b345f48e499a6f05ca0516ea7f200a2f0896f52bbc530deb2d6aaf328ef406cfef88ac39ca097a5960f641c2a9800ff6269aada9fa5ccf28ec51f3533886158f964b03498f9a05de39167f0a99fc1973e8f94168c6007899982b9bab971a54701f17226a5ba66e02dd9e65769525220313477e236da6ba516fd4162ef3137b906ce4c759e29184d491ba418ee092df24b4fadefb85cb8c07030f89696a9d536f982a0bd319fe696403dd7f22daa79a1fd4ca1e053fb315ea6ffb87958f27ea5390f10451c1e311bafaaa26afca5d1c8e0967001ffe0a2cfe2fe9ee96ad46d1832dc65e6b9819b5737966358dded40a3e8db569702655aedd12fa94ca6772ca60dbff001422d4ff008253c3c4b901e58be13ec8c7f72585bc247de7e8415cb4e1231d1e89a2119a5d9e2517444d8c5913645a8d7e3564c72ab8b37e698afadf5fa7e514bb4c86cc7fee16112cce63c332cdea5cef2c19e8885c37cf6fd4f6f337f5fe689a548d2a2ef3b6c96e6784b9799a44bcc55634c6745954d4bc116d34033575021a3015b9841325de92b97d2e692fa6ff00867f5f2872d4e450acd4d5f81ae6bab4c353694407ac9413a1d3d12fafb88114c91b371a11ccb7416d0897a4ad22f686611dd9569e846201c4a1750d698400e23f13531c7ec21350f1055be12543e4953f29f8dacaf1f977eaf711947268d88bde559f12cb8eb9e9a47a57e00534c209ddd17d594910ed25633366c8e8bcd450501d13232ccd5e48a5688838f7115ac1c723e931a48158f08605c2572c7f7d3153de292d9a3debfd8f0aeee81fa96faedfe84282a4d1983035f5bf30de017ea2e55a92db2ea3b996a1689d692f5007695a6482900cf78ae9898e95f832a0ba975db9142d9d9253b8045703b4b83386e274d3a5f3101040d65f7970b24cc68a0bf881eca3358098cb053f268f67242a078a81e91ffd34ff00a09ff6914ff5473de142a8ae72fbc499f3861c6d70c9de7d517ff64ffa89ff0051036fe442a2da0cc01535bc84b5534acf462d405da4f2ac3f0ae11eb66e64da2ddb28f91ca9032f75b7d6547f0a95d2ba574b0c699a58797644fd4dc82955f301e488eb4691dde54b55e9036c7efb439bcfff001886e7ebc47548fbf11575fafb4eff00d7da5bbbfbf11e5fafb4b775f7e27d4ff9295b23ea32aac0e44d212960d7f0514e79ded2a297f5309eccb4b6339bab2a50ee921a5095e9016ee419f4a06efc0183c6c3fcce92e0da41dd33d2b70538302fb90bb0af31cdb1fb16545b61955a0b768144a95d6a574aeb52a54b5d22a2b8f99da7de76be61c13b13b12eba4a8c13b52a9934f983dcf98ad8aea56e3e65b8f996e3e65b8f98f17cf4846d16edd63b5f33b5d0b6f35692a56254a95299529fff00257fffd9, 'Xioami xp', 3200, 3392, 24, 'Este celular es bueno'),
('89BD', '2', 0x5265736f75726365206964202338, 'Laptop', 1200, 1272, 8, 'Son buenas'),
('90C', '2', 0x5265736f7572636520696420233133, 'Portatil gamer', 3500, 3710, 12, 'Este gamer es bueno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedores`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `provedores`;
CREATE TABLE `provedores` (
  `codigo` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `telefono` varchar(12) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `provedores`
--

INSERT INTO `provedores` (`codigo`, `nombre`, `telefono`) VALUES
('14', 'Hp', '32940'),
('23', 'Xiaomi', NULL),
('90', 'Lenovo', '902394');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes_sociales`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `redes_sociales`;
CREATE TABLE `redes_sociales` (
  `codigo` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `redes_sociales`
--

INSERT INTO `redes_sociales` (`codigo`, `nombre`) VALUES
('1', 'Whatsapp'),
('2', 'Instagram'),
('3', 'Telegram'),
('4', 'Twitter');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes_usuarios`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `redes_usuarios`;
CREATE TABLE `redes_usuarios` (
  `codigo_Red` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `id_Cliente` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `Nombre_Usuario` varchar(40) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `redes_usuarios`
--

INSERT INTO `redes_usuarios` (`codigo_Red`, `id_Cliente`, `Nombre_Usuario`) VALUES
('1', '12', '839483'),
('1', '24', '32422'),
('1', '9', '2443434'),
('2', '24', 'kokq'),
('3', '24', 'ijdweo'),
('3', '45', 'etyjrt'),
('3', '9', '@guetta'),
('4', '24', '@kokd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--
-- Creación: 22-10-2021 a las 00:20:11
--

DROP TABLE IF EXISTS `telefonos`;
CREATE TABLE `telefonos` (
  `id_Cliente` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `numero` varchar(12) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_Cliente`, `numero`) VALUES
('12', '1232343'),
('24', '23424'),
('5', '236435'),
('17', '238722'),
('56', '32534645'),
('14', '346456'),
('98', '34646'),
('56', '3465457'),
('97', '3486534'),
('17', '3487634'),
('3', '3564'),
('98', '36346544'),
('4', '364'),
('56', '3754'),
('23', '38945'),
('97', '39845734'),
('3', '435546'),
('98', '4364'),
('4', '436465'),
('45', '46457'),
('45', '4757'),
('3', '475856'),
('5', '56745'),
('19', '56758'),
('56', '586758'),
('14', '654757'),
('19', '657568'),
('3', '69755'),
('28', '76523'),
('88', '76576'),
('97', '837534'),
('23', '839453'),
('45', '8545'),
('5', '857576'),
('28', '87232'),
('88', '875654'),
('9', '892384'),
('88', '8979'),
('9', '898239'),
('13', '92223'),
('23', '9384534'),
('97', '93854'),
('28', '984334'),
('17', '987324'),
('28', '98787');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_Empleado` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `Correo` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(100) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_Empleado`, `Correo`, `password`) VALUES
('24', 'cr7@gmail.com', '$2y$04$u/9iQapZjTNjefSby8nnc.ElIfQY9P7IYTIB3yQwNX2pUz9r0.a/K'),
('12', 'f@gmail.com', '$2y$04$RriFsbUbFH8G571I0K9qhu42hZE9RVfh49z68kNxfDSXbo6iQj2Bq'),
('6', 'j@gmail.com', '$2y$04$nUSTTYzdo4Z7aTeEpzr01.PglNw.wy3LX5JKpHJMUP7L2bUq4wi.m'),
('17', 'jd@gmail.com', '$2y$04$etDb2Y8PjcIXw505qZci6.r79mM3Qj6P9g/T5T8v2ojXgUGuLX5Si'),
('78', 'k@h.com', '$2y$04$n805/aszmR.IMjVbE/kvTeYBC1xxG0EzxQA0dPN7YaBi/zPJScr5y'),
('34', 'lv@gmail.com', '$2y$04$FzwuHzGeUQoUYP.IA3/cKemgw4W3XZ7TmzgATgetUPw89vantxTRG'),
('10', 'mario@gmail.com', '$2y$04$dIyaqfuWzx4pVqIWPJlDxu5NdinsfLZz/bnZW/MYKuegO0jvaQf0C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--
-- Creación: 22-10-2021 a las 00:14:21
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `empleado_id` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `cliente_id` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_empleados_fk` (`id_Empleado`);

--
-- Indices de la tabla `comisiones`
--
ALTER TABLE `comisiones`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compras_provedores_fk` (`codigo_provedor`),
  ADD KEY `compras_empleados_fk` (`id_Empleado`);

--
-- Indices de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD UNIQUE KEY `id_compras` (`id_compras`,`id_producto`),
  ADD KEY `detalles_compras_productos_fk` (`id_producto`);

--
-- Indices de la tabla `detalles_ventas`
--
ALTER TABLE `detalles_ventas`
  ADD UNIQUE KEY `id_venta` (`id_venta`,`producto_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empleados_perfiles_fk` (`perfil_id`);

--
-- Indices de la tabla `familias`
--
ALTER TABLE `familias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `porcentaje_anual`
--
ALTER TABLE `porcentaje_anual`
  ADD PRIMARY KEY (`año`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_familias_fk` (`familia_id`);

--
-- Indices de la tabla `provedores`
--
ALTER TABLE `provedores`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `redes_sociales`
--
ALTER TABLE `redes_sociales`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `redes_usuarios`
--
ALTER TABLE `redes_usuarios`
  ADD PRIMARY KEY (`codigo_Red`,`id_Cliente`),
  ADD KEY `redes_usuarios_clientes_fk` (`id_Cliente`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`numero`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Correo`),
  ADD UNIQUE KEY `id_Empleado` (`id_Empleado`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_empleados_fk` (`empleado_id`),
  ADD KEY `ventas_clientes_fk` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comisiones`
--
ALTER TABLE `comisiones`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_empleados_fk` FOREIGN KEY (`id_Empleado`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_empleados_fk` FOREIGN KEY (`id_Empleado`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `compras_provedores_fk` FOREIGN KEY (`codigo_provedor`) REFERENCES `provedores` (`codigo`);

--
-- Filtros para la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
  ADD CONSTRAINT `detalles_compras_compras_fk` FOREIGN KEY (`id_compras`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `detalles_compras_productos_fk` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_perfiles_fk` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_familias_fk` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`);

--
-- Filtros para la tabla `redes_usuarios`
--
ALTER TABLE `redes_usuarios`
  ADD CONSTRAINT `redes_usuarios_clientes_fk` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `redes_usuarios_redes_socia_fkles` FOREIGN KEY (`codigo_Red`) REFERENCES `redes_sociales` (`codigo`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario_empleado_fk` FOREIGN KEY (`id_Empleado`) REFERENCES `empleados` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_clientes_fk` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ventas_empleados_fk` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
