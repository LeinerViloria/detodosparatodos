<?php
	session_start();
	session_destroy();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>Productos</title>	
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<link rel="stylesheet" href="css/estilos.css">
	<link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
	<script src="js/jquery-3.2.1.js"></script>
	<script src="js/script.js"></script>
	 <!-- debajo esta el codigo que me permite poner iconos de font awesome (recuerda buscar otra api para eso) -->
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></head>
<body> 
	<!--Menu de navegacion-->
	<nav id="menu">
		<!--Poner aqui un logo para la tienda-->
		<div id="logo">
			<a href="index.php"><img src="images/logo.PNG" alt="aqui va  el logo" > </a>
			<h2>Catalogo de productos</h2>			
			<!--para el inicio de sesion-->
			<i class="fa fa-user-o" id="inicio"><a href="vistas/login.php">Iniciar</a></i>			
		</div>				
	  </nav>	
	<?php 		
		require_once 'contenidoHtml/contenido_productos.php';		
		contenido(2);
	?>

</body>
</html>