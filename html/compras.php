<?php 
	//require_once '../contenidoHtml/cabecera_Administrador.php'; //Esto es lo que ve el administrador	
	require_once '../backend/controladores/destruirSesion.php';
	
if(!empty($_SESSION['usuario_logueado'])){	
	if($_SESSION['usuario_logueado']['cabecera']=="Administrador"){		
		require_once '../backend/servicios/listando.php';
		$valor = obtener_porcentaje_anual();
		if(empty($valor)){
			echo "<script>
					alert('Por favor actualice el porcentaje anual para el ".date('Y')."');
					location.href='./porcentaje.php';
				</script>";					
			die();
		}
		
		require_once '../contenidoHtml/cabecera_Administrador.php';
		$familias = !empty(familias()) ? familias() : null;		
?>

<h1>Productos nuevos</h1>

<div class="container p-4" id="contenedorCompras">
	<div class="row">
		<!--Contenedor del formulario-->
		<div class="col-md-4">
			<div class="contenidoCompras">
				<div class="opciones">
					<div class="opcion">
						<button onclick="document.getElementById('id01').style.display='block'" class="btn btn-primary">Nueva familia</button>								
					</div>
					<div class="opcion">					
						<input type="radio" name="familiaOrigen" id="familiaExistente" onchange="familiaExistente()">
						<label for="familiaExistente"><strong>Elejir una familia</strong></label>
					</div>
				</div>

				<form action="#" method="POST">
					<div class="form-group">
						<div class="form-group" id="adicionar"></div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="codigoProducto" id="codigoProducto" placeholder="Ingrese el codigo">
					</div>

					<div class="form-group">
						<input type="text" class="form-control" name="nombreProducto" id="nombreProducto" placeholder="Ingrese el nombre">				
					</div>

					<div class="form-group">
						<input type="number" class="form-control" name="cantProducto" id="cantProducto" placeholder="Cantidad comprada" min="1">
					</div>

					<div class="form-group">
						<input type="number" class="form-control" name="precioProducto" id="precioProducto" placeholder="Ingrese el precio" min="1">
					</div>

					<div class="form-group">
						<input type="number" class="form-control" name="precio_ventaProducto" id="precio_ventaProducto" placeholder="Esto se autocalculará" readonly>
					</div>

					<div class="form-group">
						<textarea name="descripcionProducto" class="form-control" id="descripcionProducto"  rows="3" placeholder="Escriba la descricion del producto"></textarea>
					</div>

                    <input type="submit" class="btn btn-primary btn-block" name="guardar" value="Guardar" id="boton">

				</form>
			</div>
		</div>
		<!--Fin Contenedor del formulario-->

		<!--Contenedor de los detalles de la compra-->
		<div class="col-md-8">
			<form  method="post">
				<h1>Datos de compra</h1>
				<div class="site-blocks-table">
					<table class="table table-bordered">					
					<thead>
						<tr>
							<th class="product-thumbnail">Codigo</th>
							<th class="product-name">Producto</th>
							<th class="product-price">Precio</th>
							<th class="product-quantity">Cantidad</th>
							<th class="product-total">Precio venta</th>
							<th class="product-remove">Familia</th>							
							<th class="product-remove">Remove</th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="product-thumbnail">
								<p>aqui va el codigo</p>
							</td>
							<td class="product-name">
								<h2 class="h5 text-black">Top Up T-Shirt</h2>
							</td>
							<td>$49.00</td>
							<td>
								<div class="input-group mb-3" style="max-width: 120px;">						
									<input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" readonly>						
								</div>
							</td>
							<td>$49.00</td>
							<td>familia</td>
							<td><a href="#" class="btn btn-primary btn-sm"><i class="fas fa-eraser"></i></a></td>
						</tr>

						<tr>
						<td class="product-thumbnail">
<p>codigo</p>						</td>
						<td class="product-name">
							<h2 class="h5 text-black">Polo Shirt</h2>
						</td>
						<td>$49.00</td>
						<td>
							<div class="input-group mb-3" style="max-width: 120px;">						
							<input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" readonly>						
							</div>

						</td>
						<td>$49.00</td>
						<td>Familia</td>
						<td><a href="#" class="btn btn-primary btn-sm"><i class="fas fa-eraser"></i></a></td>
						</tr>
					</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
</div>

<button type="button" onclick="productos()" class="btn-flotante"><i class="fas fa-table"></i></button>

<script src="../js/jquery-3.2.1.js"></script>
<script src="../js/script.js"></script>

<!--Script para autocalcular el precio de venta de un producto-->
<script>
	//setup before functions
	let typingTimer;                //timer identifier
	let doneTypingInterval = 500;  //time in ms (5 seconds)
	let myInput = document.getElementById('precioProducto');

	//on keyup, start the countdown
	myInput.addEventListener('keyup', () => {
		clearTimeout(typingTimer);
		if (myInput.value) {
			typingTimer = setTimeout(doneTyping, doneTypingInterval);
		}
	});

	//user is "finished typing," do something
	function doneTyping () {
		document.getElementById("precio_ventaProducto").value=0;    
		//El precio de venta se pondrá como el valor de compra más el 15%
		<?php
			echo "var ganancia='".$valor[0]['valor']."';";
		?>
		ganancia = parseFloat(ganancia)/100;		
		
		var valor=parseFloat(document.getElementById("precioProducto").value);
		
		var precioVenta=valor+valor*ganancia;    
		document.getElementById("precio_ventaProducto").value=precioVenta;    
	}
</script> 

<!--Script para agregar familia al seleccionar el radio button-->
<script>
	function familiaExistente(){
		formulario="<select class='form-control' name='familias' id='familias'>"+
						"<option selected>Seleccione una Familia</option>";
						<?php if(!empty($familias)): ?>							
							<?php foreach($familias as $id => $familia): ?>							
								formulario+="<option value='<?=$familia['id']?>'><?=$familia['nombre']?></option>";
							<?php endforeach;?>
						<?php endif;?>
		formulario+="</select>";
		nuevo(formulario);
	}

	function nuevo(etiqueta){
		document.getElementById("adicionar").innerHTML="";
		document.getElementById("boton").innerHTML="";
		document.getElementById("adicionar").innerHTML=etiqueta;       
		document.getElementById("boton").innerHTML="<input type='submit' value='Subir compra'>";    
	}
</script>

<!--Modal para el CRUD-->
<!--Modal de prueba-->

<?php
    require '../contenidoHtml/modal.php';    
    modal_familia();
	require_once '../backend/controladores/alertas.php';
?>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../js/sweetalert.js"></script>


<script>
	function productos(){
		Swal.fire({
			icon:"success"
		})
	}
</script>

<?php
        if(!empty($_SESSION['completado'])):
?>            
            <script>
                Toast.fire({
                    icon: 'success',
                    title: '<?=$_SESSION['completado']?>'
                });
            </script>
<?php        
            borrar_errores("completado");
        endif;
        if(!empty($_SESSION['errores'])):
            $texto="";
            foreach($_SESSION['errores'] as $error){
                $texto.="<p>".$error.".</p>";
            }
?>
            <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Errores',
                    html:'<?=$texto?>',
                    footer:'<strong>Por favor, ingrese los datos correctamente</strong>'
                });
            </script>
<?php   
			borrar_errores();
		endif; 					
	require_once '../contenidoHtml/pie_pagina.php';
	}else{
		header("location: ./home.php");
	}
}else{
	destruir();
}
?>