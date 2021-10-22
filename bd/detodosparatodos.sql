-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2021 a las 18:23:40
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
	/*
    	Las variables se crean siempre despues del
        begin
    */
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	/*
            Se verifica si existe un registro de la
            tupla a procesar
        */
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
	/*
    	Las variables se crean siempre despues del
        begin
    */
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	/*
            Se verifica si existe un registro de la
            tupla a procesar
        */
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
	/*
    	Las variables se crean siempre despues del
        begin
    */
    DECLARE numeroregistros int;           
        
    /*
    	Se verifica si existe un registro de la
    	tupla a procesar
    */
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
	/*
    	Las variables se crean siempre despues del
        begin
    */
    DECLARE numeroregistros int;           
        
    /*
    	Se verifica si existe un registro de la
    	tupla a procesar
    */
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
        /*
        Se verifica si este registro ya existe
        */
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
        /*
        Se verifica si este registro ya existe
        */
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
	/*
    	Las variables se crean siempre despues del
        begin
    */
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	/*
            Se verifica si existe un registro de la
            tupla a procesar
        */
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
	/*
    	Las variables se crean siempre despues del
        begin
    */
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	/*
            Se verifica si existe un registro de la
            tupla a procesar
        */
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
	/*
    	Las variables se crean siempre despues del
        begin
    */
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	/*
            Se verifica si existe un registro de la
            tupla a procesar
        */
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

DROP PROCEDURE IF EXISTS `gestionar_producto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_producto` (IN `p_operacion` INT, IN `p_id` VARCHAR(10), IN `p_familiaid` VARCHAR(6), IN `nombre` VARCHAR(60), IN `p_preciocompra` FLOAT, IN `p_precioventa` FLOAT, IN `p_stock` INT, IN `p_descripcion` VARCHAR(120))  BEGIN
	/*
    	Las variables se crean siempre despues del
        begin
    */
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	/*
            Se verifica si existe un registro de la
            tupla a procesar
        */
    	SELECT COUNT(1) INTO numeroregistros FROM productos WHERE id = p_id;
        IF(numeroregistros = 0) THEN
            INSERT INTO productos VALUES(p_id, p_familiaid, p_nombre, p_preciocompra, p_precioventa, p_stock, p_descripcion);
        ELSE 
            UPDATE productos SET familia_id=p_familiaid, nombre=p_nombre, precio_compra=p_preciocompra, precio_ventas=p_precioventa, stock=p_stock, descipcion=p_descripcion WHERE id=p_id;
        END IF;	
    ELSE 
    	DELETE FROM productos WHERE id = p_id;
    END IF;	
    

END$$

DROP PROCEDURE IF EXISTS `gestionar_proveedor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gestionar_proveedor` (IN `p_operacion` INT, IN `p_codigo` VARCHAR(8), IN `p_nombre` VARCHAR(40), IN `p_telefono` VARCHAR(12))  BEGIN
	/*
    	Las variables se crean siempre despues del
        begin
    */
    DECLARE numeroregistros int;        
            
    IF(p_operacion=0) THEN
    	/*
            Se verifica si existe un registro de la
            tupla a procesar
        */
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
-- Creación: 18-10-2021 a las 20:38:53
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
('9', '17', 'David', 'Guetta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisiones`
--
-- Creación: 06-10-2021 a las 19:54:24
--

DROP TABLE IF EXISTS `comisiones`;
CREATE TABLE `comisiones` (
  `codigo` varchar(6) COLLATE latin1_spanish_ci NOT NULL,
  `Volumen_Ventas` float NOT NULL,
  `Porcentajes` float NOT NULL,
  `Año` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--
-- Creación: 06-10-2021 a las 19:54:24
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `id` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `id_Empleado` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `codigo_provedor` varchar(8) COLLATE latin1_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compras`
--
-- Creación: 06-10-2021 a las 19:54:24
--

DROP TABLE IF EXISTS `detalles_compras`;
CREATE TABLE `detalles_compras` (
  `id_compras` varchar(12) COLLATE latin1_spanish_ci NOT NULL,
  `id_producto` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ventas`
--
-- Creación: 06-10-2021 a las 19:54:24
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
-- Creación: 06-10-2021 a las 19:54:24
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
-- Creación: 06-10-2021 a las 19:54:24
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
('2', 'Laptops');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--
-- Creación: 06-10-2021 a las 19:54:24
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
-- Creación: 17-10-2021 a las 02:22:52
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
(56, 2018, '2018-10-18 22:21:58'),
(7, 2021, '2021-10-18 22:30:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--
-- Creación: 06-10-2021 a las 19:54:24
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `familia_id` varchar(6) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `precio_compra` float NOT NULL,
  `Precio_ventas` float NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(120) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedores`
--
-- Creación: 19-10-2021 a las 14:06:34
-- Última actualización: 19-10-2021 a las 15:31:40
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
('12', 'Yamaha', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes_sociales`
--
-- Creación: 06-10-2021 a las 19:54:24
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
-- Creación: 16-10-2021 a las 03:45:43
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
('3', '9', '@guetta'),
('4', '24', '@kokd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--
-- Creación: 15-10-2021 a las 22:53:12
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
('13', '92223'),
('14', '346456'),
('14', '654757'),
('17', '238722'),
('17', '3487634'),
('17', '987324'),
('19', '56758'),
('19', '657568'),
('23', '38945'),
('23', '839453'),
('23', '9384534'),
('24', '23424'),
('28', '76523'),
('28', '87232'),
('28', '984334'),
('28', '98787'),
('3', '3564'),
('3', '435546'),
('3', '475856'),
('3', '69755'),
('4', '364'),
('4', '436465'),
('5', '236435'),
('5', '56745'),
('5', '857576'),
('56', '32534645'),
('56', '3465457'),
('56', '3754'),
('56', '586758'),
('88', '76576'),
('88', '875654'),
('88', '8979'),
('9', '892384'),
('9', '898239'),
('97', '3486534'),
('97', '39845734'),
('97', '837534'),
('97', '93854'),
('98', '34646'),
('98', '36346544'),
('98', '4364');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Creación: 06-10-2021 a las 19:54:24
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
('6', 'j@gmail.com', '$2y$04$kjlsKymwRve4cGWpX1XuV.P.nVTObWWpx9md71jU5LX2gkP7wqSFe'),
('17', 'jd@gmail.com', '$2y$04$etDb2Y8PjcIXw505qZci6.r79mM3Qj6P9g/T5T8v2ojXgUGuLX5Si'),
('78', 'k@h.com', '$2y$04$n805/aszmR.IMjVbE/kvTeYBC1xxG0EzxQA0dPN7YaBi/zPJScr5y'),
('34', 'lv@gmail.com', '$2y$04$FzwuHzGeUQoUYP.IA3/cKemgw4W3XZ7TmzgATgetUPw89vantxTRG'),
('10', 'mario@gmail.com', '$2y$04$dIyaqfuWzx4pVqIWPJlDxu5NdinsfLZz/bnZW/MYKuegO0jvaQf0C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--
-- Creación: 06-10-2021 a las 19:54:24
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
  ADD PRIMARY KEY (`id_Cliente`,`numero`),
  ADD KEY `telefonos_clientes_fk` (`id_Cliente`);

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
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `telefonos_clientes_fk` FOREIGN KEY (`id_Cliente`) REFERENCES `clientes` (`id`);

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
