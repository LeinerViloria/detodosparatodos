<?php 
	require_once '../contenidoHtml/cabecera_admin.php'; //Esto es lo que ve el administrador
	//require_once '../contenidoHtml/cabecera_vendedor.php'; //Esto es lo que ve el vendedor
?>

<h1>Registro de todas las ventas</h1>


<table class="tftable" style="border:'1'">
	<tr>
		<th>Fecha de la ventas</th>
		<th>Hora de la ventas</th>
		<th>Nombre del producto</th>
		<th>Precio de ventas</th>
		<th>Cantidad de Productos</th>
		<th>Empleado</th>
		<th>Comision</th>
		<th>Total de ventas</th>
	</tr>

	<tr>
		<td>01/02/1970</td>
		<td>10:30</td>
		<td>Laptop Hp</td>
		<td>2.000.000</td>
		<td>2</td>
		<td>Deff</td>
		<td>20%</td>
		<td>4.000.000</td>
	</tr>

	<tr>
		<td>01/02/1980</td><td>1:00</td><td>Laptop Toshiba</td><td>3.000.000</td><td>5</td><td>Shakira</td><td>40%</td><td>150.000.000</td>
	</tr>

	<tr>
		<td>01/02/1980</td><td>2:30</td><td>Samsung Galaxy </td><td>5.000.000</td><td>1</td><td>Homero</td><td>10%</td><td>5.000.000</td>
	</tr>

	<tr>
		<td>01/02/1980</td><td>3:00</td><td>iPhone 15</td><td>6.000.000</td><td>3</td><td>Deff</td><td>30%</td><td>9.000.000</td>
	</tr>
</table>
	  
<?php require_once '../contenidoHtml/pie_pagina.php'?>