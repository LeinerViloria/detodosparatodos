<?php 
function contenido($ruta, $ruta_origen="./", $rutaImagenes="images/"){
	require_once ''.$ruta_origen.'backend/servicios/listando.php';
	$categorias = !empty(familias($ruta)) ? familias($ruta) : null;

?>
<div class="wrap">
		<h1>Catalogo de productos</h1>
		<div class="store-wrapper">
			<div class="category_list">
				<a href="#" class="category_item" category="all">Todo</a>
				<?php foreach($categorias as $id => $categoria):?>					
					<a href="#" class="category_item" category="<?=$categoria['nombre']?>"><?=$categoria['nombre']?></a>	
				<?php endforeach;?>								
			</div>
			<section class="products-list">
				<div class="product-item" category="Laptops">
					<img src="<?php echo $rutaImagenes?>laptop_hp.jpg" alt="" >
					<a href="#">Laptop Hp</a>
					<table class="table">
						<tbody>
						  <tr>
							<td>Marca</td>
							<td>Lenovoo</td>
						  </tr>
						  <tr>
							<td>Modelo</td>
							<td>H-3000</td>
						  </tr>
						   <tr>
							<td>Precio</td>
							<td>un poco</td>
						  </tr>					 
						</tbody>
					</table>
				</div>
				<div class="product-item" category="Laptops">
					<img src="<?php echo $rutaImagenes?>laptop_toshiba.jpg" alt="" >
					<a href="#">Laptop Toshiba</a>
					<table class="table">
						<tbody>
						  <tr>
							<td>Marca</td>
							<td>Lenovoo</td>
						  </tr>
						  <tr>
							<td>Modelo</td>
							<td>H-3000</td>
						  </tr>
						   <tr>
							<td>Precio</td>
							<td>un poco</td>
						  </tr>						 
						</tbody>
					</table>
				</div>
				<div class="product-item" category="Smartphones">
					<img src="<?php echo $rutaImagenes?>samsung_galaxy.jpg" alt="" >
					<a href="#">Samsung Galaxy</a>
					<table class="table">
						<tbody>
						  <tr>
							<td>Marca</td>
							<td>Lenovoo</td>
						  </tr>
						  <tr>
							<td>Modelo</td>
							<td>H-3000</td>
						  </tr>
						   <tr>
							<td>Precio</td>
							<td>un poco</td>
						  </tr>						 
						</tbody>
					</table>
				</div>
				<div class="product-item" category="Smartphones">
					<img src="<?php echo $rutaImagenes?>iphone.jpg" alt="" >
					<a href="#">Iphone 15</a>
					<table class="table">
						<tbody>
						  <tr>
							<td>Marca</td>
							<td>Lenovoo</td>
						  </tr>
						  <tr>
							<td>Modelo</td>
							<td>H-3000</td>
						  </tr>
						   <tr>
							<td>Precio</td>
							<td>un poco</td>
						  </tr>						 
						</tbody>
					</table>
				</div>
				<div class="product-item" category="Ordenadores">
					<img src="<?php echo $rutaImagenes?>pc_hp.jpg" alt="" >
					<a href="#">PC Hp</a>
					<table class="table">
						<tbody>
						  <tr>
							<td>Marca</td>
							<td>Lenovoo</td>
						  </tr>
						  <tr>
							<td>Modelo</td>
							<td>H-3000</td>
						  </tr>
						   <tr>
							<td>Precio</td>
							<td>un poco</td>
						  </tr>						 
						</tbody>
					</table>
				</div>
				<div class="product-item" category="Ordenadores">
					<img src="<?php echo $rutaImagenes?>pc_lenovo.jpg" alt="" >
					<a href="#">PC Lenovo</a>
					<table class="table">
						<tbody>
						  <tr>
							<td>Marca</td>
							<td>Lenovoo</td>
						  </tr>
						  <tr>
							<td>Modelo</td>
							<td>H-3000</td>
						  </tr>
						   <tr>
							<td>Precio</td>
							<td>un poco</td>
						  </tr>						 
						</tbody>
					</table>
				</div>
				<div class="product-item" category="Monitores">
					<img src="<?php echo $rutaImagenes?>monitor_asus.jpg" alt="" >
					<a href="#">Monitor Asus</a>
					<table class="table">
						<tbody>
						  <tr>
							<td>Marca</td>
							<td>Lenovoo</td>
						  </tr>
						  <tr>
							<td>Modelo</td>
							<td>H-3000</td>
						  </tr>
						   <tr>
						<td>Precio</td>
						<td>un poco</td>
					  </tr>						 
					</tbody>
				</table>
			</div>
			<div class="product-item" category="Audifonos">
				<img src="<?php echo $rutaImagenes?>jbl.jpg" alt="" >
				<a href="#">Audifonos JBL</a>
				<table class="table">
					<tbody>
						<tr>
							<td>Marca</td>
							<td>Lenovoo</td>
					    </tr>
						<tr>
							<td>Modelo</td>
							<td>H-3000</td>
                        </tr>
                        <tr>
                            <td>Precio</td>
                            <td>un poco</td>
                        </tr>						 
					</tbody>
				</table>
			</div>			
		</section>
	</div>
</div>
<?php }?>