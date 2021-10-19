<?php 
	//require_once '../contenidoHtml/cabecera_Administrador.php'; //Esto es lo que ve el administrador
	//require_once '../contenidoHtml/cabecera_Vendedor.php'; //Esto es lo que ve el vendedor

    require_once '../backend/controladores/destruirSesion.php';
	 
if(!empty($_SESSION['usuario_logueado'])){	
    if($_SESSION['usuario_logueado']['cabecera']=="Vendedor"){
	require_once '../contenidoHtml/cabecera_'.$_SESSION['usuario_logueado']['cabecera'].'.php';
    function aleatorio($min=1000, $max=30000){
        return rand($min, $max);
    }
    require_once '../backend/servicios/listando.php';

    $porcentaje = !empty(obtener_porcentaje_anual()) ? obtener_porcentaje_anual()[0]['valor']."%" : "No hay registro";    
    
?>

<table id="infoComision" class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Porcentaje de la comision</th>
      <th scope="col">Total de ventas</th>
      <th scope="col">Total de comisiones pagadas</th>      
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><?=$porcentaje?></td>
      <td>$680000</td>
      <td>$68600</td>      
    </tr>    
  </tbody>
</table>
<br>
<table id="tcomisiones" class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Meses</th>
            <th scope="col">Importe total de ventas</th>
            <th scope="col">Comision</th>    
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">Mes 1</th>
            <td><?php echo "$".aleatorio(); ?></td>
            <td><?php echo "$".aleatorio(); ?></td>    
        </tr>
        <tr>
            <th scope="row">Mes 2</th>
            <td><?php echo "$".aleatorio(); ?></td>
            <td><?php echo "$".aleatorio(); ?></td>    
        </tr>
        <tr>
            <th scope="row">Mes 3</th>
            <td><?php echo "$".aleatorio(); ?></td>
            <td><?php echo "$".aleatorio(); ?></td>    
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td>Total</td>
            <td><?php echo "$".aleatorio();?></td>
            <td><?php echo "$".aleatorio();?></td>
        </tr>
    </tfoot>
</table>

<?php
	require_once '../contenidoHtml/pie_pagina.php';
    }else{
        header("location: ./home.php");
    }

}else{
	destruir();
}
?>