<?php 
	//require_once '../contenidoHtml/cabecera_admin.php'; //Esto es lo que ve el administrador
	require_once '../contenidoHtml/cabecera_vendedor.php'; //Esto es lo que ve el vendedor
?>
<!--======== INICIO DE FORMULARIO ==========-->
	<div class="container justify-content-center">
		<div class="row">
			<div class="col-md-12">
				<div class="well well-sm">
					<form class="form-horizontal justify-content-center" method="post">
						<fieldset>
							<legend class="text-center header">Registrar Ventas</legend>
							
	
							<div class="form-group">								
								<div class="col-md-8">
									<input id="codigo" name="name" type="text" placeholder="codigo" class="form-control">
								</div>
							</div>

							<div class="form-group">								
								<div class="col-md-8">
									<input id="nombre" name="name" type="text" placeholder="Nombre" class="form-control">
								</div>
							</div>

							<div class="form-group">								
								<div class="col-md-8">
									<input id="preciocompra" name="name" type="text" placeholder="Precio de Venta" class="form-control">
								</div>
							</div>
							
							<div class="form-group">								
								<div class="col-md-8">
									<input id="precioventa" name="precioventa" type="text" placeholder="Cantidad de Productos" class="form-control">
								</div>
							</div>
							
							<div class="form-group">								
								<div class="col-md-8">
									<input id="vendedor" name="vendedor" type="text" placeholder="Vendedor" class="form-control">
								</div>
							</div>

							<div class="form-group">								
								<div class="col-md-8">
									<input id="comision" name="comision" type="text" placeholder="Comision por venta" class="form-control">
								</div>
							</div>								
	
							<div class="form-group">								
								<div class="col-md-8">
									<input id="fecha" name="fecha" type="date" placeholder="Fecha de venta" class="form-control">
								</div>
							</div>

							<div class="form-group">								
								<div class="col-md-8">
									<input id="total" name="total" type="text" placeholder="Total de Venta" class="form-control">
								</div>
							</div>
	
							<div class="form-group" id="btnregistro">
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary btn-lg">GUARDAR</button>
								</div>
								
							</div>
							
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>


<?php require_once '../contenidoHtml/pie_pagina.php'?>