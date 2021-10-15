<?php 
	//require_once '../contenidoHtml/cabecera_Administrador.php'; //Esto es lo que ve el administrador
	//require_once '../contenidoHtml/cabecera_Vendedor.php'; //Esto es lo que ve el vendedor

require_once '../backend/controladores/destruirSesion.php';
if(!empty($_SESSION['usuario_logueado'])){	
	require_once '../contenidoHtml/cabecera_'.$_SESSION['usuario_logueado']['cabecera'].'.php';
?>
<!--======== INICIO DE FORMULARIO ==========-->
<div class="container justify-content-center">
	<div class="row">
		<div class="col col-md-12">
			<div class="well well-sm">
				<form class="form-horizontal justify-content-center" method="post">
					<fieldset>
						<legend class="text-center header">Registrar Ventas</legend>
												
						<div class="form-group">								
							<div class="col-md-8">
								<input id="codigo" name="name" type="text" placeholder="Codigo del producto" class="form-control">
							</div>
						</div>
						<div class="form-group">								
							<div class="col-md-8">
								<input id="cant" name="precioventa" type="text" placeholder="Cantidad de Productos" class="form-control">
							</div>
						</div>
						<br>
						<div class="form-group" id="btnregistro">
							<div class="col-md-12 text-center">
								<button type="button" class="btn btn-primary btn-lg" onclick="agregar()">Agregar</button>
							</div>							
						</div>
						
					</fieldset>
				</form>
			</div>
		</div>
		
		<!--Esta columna puede generalizar en un archivo php-->
		<div class="col col-md-12">
			<div class="well well-sm">
				<table class="table table-borderless factura">
				<thead>
					<tr>
						<th>Id</th>
						<th>Nombre</th>
						<th>Cantidad</th>
						<th>Total</th>
						<th>Comision</th>
						<th>Accion</th>
					</tr>
				</thead>
				<tbody id="contenedor_factura">						
				</tbody>

				</table>

				<form action="../controladores/controlador_factura.php" method="post">
					<div id="input_adicionales"></div>	

					<div class="input-group mb-3">						
						<div class="custom-prepend">
							<!--
							<input type="text" name="id" id="id" placeholder="Ingrese el id del cliente" class="form-control" required="required">
							<span class="input-group-text">Nombre encontrado</span>
							-->							
							<select class="form-select" name="cliente" id="cliente" required>
								<option value="">Elija un cliente</option>
								<option value="1">Anonimo</option>
								<option value="4">Fulano de tal</option>
								<option value="5">Jaiver Rodriguez</option>
								<option value="89">Farid Mendoza</option>
								<option value="90">Jose Anaya</option>
								<option value="100">Martin Medrano</option>
								<option value="200">Fulano 2</option>
								<option value="210">Tentation</option>
							</select>							

						</div>					
					</div>		
						
					<div class="form-group" id="btnregistro">
						<div class="col text-center">
							<button type="submit" class="btn btn-primary btn-lg">Guardar</button>
						</div>							
					</div>					
				</form>
			</div>
		</div>
		<!---->
	</div>
</div>

<script src="../js/manejar_factura.js"></script>

<?php 
	require_once '../contenidoHtml/pie_pagina.php';
}else{
	destruir();
}
?>