<?php 
function contenido($ruta, $ruta_origen="./"){
	require_once ''.$ruta_origen.'backend/servicios/listando.php';
	$categorias = !empty(familias($ruta)) ? familias($ruta) : null;
	
	$productos = productos($ruta);
	
?>
<div class="wrap">
		<h1>Catalogo de productos</h1>
		<div class="store-wrapper">
			<div class="category_list">
				<a href="#" class="category_item" category="all">Todo</a>
				<?php if(!empty($categorias)): ?>
				<?php foreach($categorias as $id => $categoria):?>					
					<a href="#" class="category_item" category="<?=$categoria['nombre']?>"><?=$categoria['nombre']?></a>	
				<?php endforeach;?>	
				<?php endif; ?>
			</div>
			<section class="products-list">
				<?php if(!empty($productos)): ?>
				<?php foreach($productos as $producto):?>					
					<div class="product-item" category="<?=$producto['Nombre de familia']?>">
						<div class="imagen">
							<img src="data:image/*; base64, <?php echo base64_encode($producto['imagen'])?>" alt="<?=$producto['Nombre del producto']?>" >						
						</div>
						<a href="#"><?=$producto['Nombre del producto']?></a>
						<table class="table">
							<tbody>
							<tr>
								<td>Familia</td>
								<td><?=$producto['Nombre de familia']?></td>								
							</tr>
							<tr>
								<td>Cantidad</td>
								<td><?=$producto['stock']?></td>
							</tr>
							<tr>
								<td>Precio</td>
								<td>$<?=$producto['precio']?></td>																
							</tr>
							<tr>								
								<td colspan="2"><?=$producto['descripcion']?></td>
							</tr>					 
							</tbody>
						</table>
					</div>
				<?php endforeach;?>	
				<?php endif; ?>						
		</section>
	</div>
</div>
<?php }?>