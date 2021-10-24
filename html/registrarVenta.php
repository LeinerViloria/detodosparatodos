<?php 
	//require_once '../contenidoHtml/cabecera_Administrador.php'; //Esto es lo que ve el administrador
	//require_once '../contenidoHtml/cabecera_Vendedor.php'; //Esto es lo que ve el vendedor

require_once '../backend/controladores/destruirSesion.php';
if(!empty($_SESSION['usuario_logueado'])){	
	if($_SESSION['usuario_logueado']['cabecera']=="Vendedor"){
	require_once '../contenidoHtml/cabecera_'.$_SESSION['usuario_logueado']['cabecera'].'.php';
	require_once '../backend/servicios/listando.php';
?>
<!--Caja de cantidades-->
<div class="container">
  <div class="row justify-content-md-center">
    <div class="col-md-auto" id="cantidades">
		<?php
			$total = obtener_total_clientes();	
			$numero_clientes = obtener_numero_clientes($_SESSION['usuario_logueado'][0]['id']);
			if(!empty($numero_clientes)){
				$numero_clientes=$numero_clientes[0]['numero'];				
			}else{
				$numero_clientes=0;
			}
		?>
		<p>Manejas <span class="numero"><?=$numero_clientes?></span> de <span class="numero"><?=$total[0]['total']?></span> clientes, sabiendo que el anonimo es para todos</p>
    </div>
  </div>
</div>
<br>
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
							<?php 
								$clientes = obtener_clientes($_SESSION['usuario_logueado'][0]['id']);								
							?>																	
								<?php
									if(!empty($clientes)):										
								?>
									<select class="form-select" name="cliente" id="cliente" required>
										<option value="">Elija un cliente</option>
										<?php foreach($clientes as $cliente):?>
											<option value="<?=$cliente['id']?>"><?=$cliente['cliente']?></option>
										<?php endforeach;?>
									</select>
								<?php
									else:
								?>
										<h3>No tienes clientes</h3>
								<?php
									endif;
								?>														
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
<button type="button" onclick="productos()" class="btn-flotante"><i class="fas fa-table"></i> - Ver productos</button> 
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../js/sweetalert.js"></script>
<script src="../js/manejar_factura.js"></script>
<?php
	$productos = productos();		
	$html="";
	if(empty($productos)){
		$html.="<strong>No hay registros</strong>";
	}else{
		$html.="<table class='table table-bordered'>";
			$html.="<thead>";
				$html.="<tr>";
					$html.="<th>Codigo</th>";									
					$html.="<th>Producto</th>";				
					$html.="<th>Familia</th>";				
					$html.="<th>Precio</th>";				
					$html.="<th>Stock</th>";													
				$html.="<tr>";
			$html.="</thead>";
			$html.="<tbody>";
			foreach($productos as $producto){									
				$html.="<tr>";
					$html.="<td>".$producto['id']."</td>";					
					$html.="<td>".$producto['Nombre del producto']."</td>";
					$html.="<td>".$producto['Nombre de familia']."</td>";
					$html.="<td>".$producto['precio']."</td>";
					$html.="<td>".$producto['stock']."</td>";					
				$html.="<tr>";
			}			
			$html.="</tbody>";
		$html.="</table>";
	}
?>
<script>
	function productos(){
		Swal.fire({
			title:'Productos',
			width:'1000px',
			showConfirmButton: false,
			html:"<?=$html?>",
			showClass:{
				popup: 'animate_animated animate__fadeInDown'
			},
			hideClass:{
				popup: 'animate_animated animate__fadeOutUp'
			},
			footer: 'Aqui estan todos los productos'
		})
	}
</script>

<?php 
	require_once '../contenidoHtml/pie_pagina.php';
	}else{
		header("location: ./home.php");
	}
}else{
	destruir();
}
?>