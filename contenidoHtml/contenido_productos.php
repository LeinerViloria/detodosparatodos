<?php 
function contenido($rutaImagenes="images/"){
?>
<div class="wrap">
		<h1>Catalogo de productos</h1>
		<div class="store-wrapper">
			<div class="category_list">
				<a href="#" class="category_item" category="all">Todo</a>
				<a href="#" class="category_item" category="ordenadores">Ordenadores</a>
				<a href="#" class="category_item" category="laptops">Laptops</a>
				<a href="#" class="category_item" category="smartphones">Smartphones</a>
				<a href="#" class="category_item" category="monitores">Monitores</a>
				<a href="#" class="category_item" category="audifonos">Audifonos</a>
			</div>
			<section class="products-list">
				<div class="product-item" category="laptops">
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
				<div class="product-item" category="laptops">
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
				<div class="product-item" category="smartphones">
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
				<div class="product-item" category="smartphones">
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
				<div class="product-item" category="ordenadores">
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
				<div class="product-item" category="ordenadores">
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
				<div class="product-item" category="monitores">
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
			<div class="product-item" category="audifonos">
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