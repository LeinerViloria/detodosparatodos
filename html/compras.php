<?php 
	//require_once '../contenidoHtml/cabecera_Administrador.php'; //Esto es lo que ve el administrador	
	require_once '../backend/controladores/destruirSesion.php';
	
if(!empty($_SESSION['usuario_logueado'])){	
	if($_SESSION['usuario_logueado']['cabecera']=="Administrador"){
		require_once '../contenidoHtml/cabecera_Administrador.php';
?>

<h1>Productos nuevos</h1>

<div class="contenidoCompras">
	<input type="radio" name="familiaOrigen" id="familiaNueva" onchange="familiaNueva()">
	<label for="familiaNueva"><strong>Ingresar una familia nueva</strong></label>
	<input type="radio" name="familiaOrigen" id="familiaExistente" onchange="familiaExistente()">
	<label for="familiaExistente"><strong>Elejir una familia existente</strong></label>

	<form action="#" method="POST">
		<div id="adicionar"></div>
		<label class="label" for="nombreProducto">Ingrese el codigo del producto: </label>
		<input type="text" name="codigoProducto" id="codigoProducto" placeholder="Ingrese el codigo">
		<br>
		<label class="label" for="nombreProducto">Ingrese el nombre del producto: </label>
		<input type="text" name="nombreProducto" id="nombreProducto" placeholder="Ingrese el nombre">				
		<br>
		<label class="label" for="cantProducto">Ingrese las cantidades compradas: </label>
		<input type="number" name="cantProducto" id="cantProducto" placeholder="Cantidad comprada" min="1">
		<br>
		<label class="label" for="precioProducto">Ingrese el precio del producto: </label>
		<input type="number" name="precioProducto" id="precioProducto" placeholder="Ingrese el precio" min="1">
		<br>
		<label class="label" for="precio_ventaProducto">Precio de venta del producto: </label>
		<input type="number" name="precio_ventaProducto" id="precio_ventaProducto" placeholder="Esto se autocalculará" readonly>
		<br>
		<textarea name="descripcionProducto" id="descripcionProducto" cols="30" rows="10" placeholder="Escriba la descricion del producto"></textarea>
		<div id="boton"></div>
	</form>
</div>

<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/script.js"></script>
<script src="../js/accionFamilia.js"></script> 
<script src="../js/calcularPrecioVenta.js"></script> 

<?php 
	require_once '../contenidoHtml/pie_pagina.php';
	}else{
		header("location: ./home.php");
	}
}else{
	destruir();
}
?>