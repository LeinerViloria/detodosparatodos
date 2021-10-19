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

<div class="container" id="contenedorCompras">
	<div class="row mb-5">
		<!--Contenedor del producto de la compra-->
		<div class="col-md-12">
			<div class="contenidoCompras">
				<div class="opciones">
					<div class="opcion">
						<button onclick="document.getElementById('id01').style.display='block'" class="btn btn-primary">Nueva familia</button>								
					</div>
					<div class="opcion">					
						<input type="radio" name="familiaOrigen" id="familiaExistente" onchange="familiaExistente()">
						<label for="familiaExistente"><strong>Elejir una familia existente</strong></label>
					</div>
				</div>

				<form action="#" method="POST">
					<div id="adicionar"></div>
					<label class="label" for="codigoProducto">Ingrese el codigo del producto: </label>
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
		</div>
		<!--Contenedor de los detalles de la compra-->
		<form class="col-md-12" method="post">
			<h1>Nombre del proveedor</h1>
			<div class="site-blocks-table">
				<table class="table table-bordered">					
				<thead>
					<tr>
					<th class="product-thumbnail">Imagen</th>
					<th class="product-name">Producto</th>
					<th class="product-price">Precio</th>
					<th class="product-quantity">Cantidad</th>
					<th class="product-total">Precio venta</th>
					<th class="product-remove">Remove</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td class="product-thumbnail">
						<img src="../images/iphone.jpg" alt="Image" class="img-fluid">
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
					<td><a href="#" class="btn btn-primary btn-sm"><i class="fas fa-eraser"></i></a></td>
					</tr>

					<tr>
					<td class="product-thumbnail">
						<img src="../images/laptop_hp.jpg" alt="Image" class="img-fluid">
					</td>
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
					<td><a href="#" class="btn btn-primary btn-sm"><i class="fas fa-eraser"></i></a></td>
					</tr>
				</tbody>
				</table>
			</div>
		</form>
	</div>
</div>

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
		formulario="<label class='label' for='familias'>Elija la familia:</label>"+
					"<select name='familias' id='familias'>"+
						"<option>Seleccione aqui</option>";
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