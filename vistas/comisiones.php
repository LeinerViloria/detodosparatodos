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
    
    $comisiones = !empty(infoComisiones()) ? infoComisiones()[0] : null;    
    $detalles = !empty(comisionVendedor()) ? comisionVendedor() : null;
    if(!empty($detalles)):
        $years = !empty(years()) ? years() : null;

        $cantidadYears = array();
        for($i=0; $i<count($years); $i++){
            $cantidadYears[$years[$i]['year']]=0;
        }

        for($i=0; $i<count($detalles); $i++){   
            $cantidadYears[$detalles[$i]['Año']]+=1;                     
        }

        $fecha = $detalles[0]['Mes'];
        setlocale(LC_ALL, 'es_Es');        
        //var_dump(ucfirst($nombreMes));               
?>

<table id="infoComision" class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Porcentaje de la comision</th>      
      <th scope="col">Volumen minimo de ventas</th>      
    </tr>
  </thead>
  <tbody>
    <tr>
        <?php if(!empty($comisiones)): ?>
            <td><?=$comisiones['Porcentajes']?>%</td>      
            <td><?=$comisiones['Volumen_Ventas']?></td> 
        <?php endif ?>
    </tr>    
  </tbody>
</table>
<br>
<table id="tcomisiones" class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Años</th>
            <th scope="col">Meses</th>
            <th scope="col">Importe total de ventas</th>
            <th scope="col">Comision</th>    
        </tr>
    </thead>
    <tbody>
        <?php 
            $combinandoCelda = false;
            $iterador=0;
            foreach($detalles as $detalle): var_dump($detalle);echo "<br><br>";
                $iterador++; 
        ?>
        <tr>
            <?php                 
                if($combinandoCelda==false): 
                    $combinandoCelda=true;                    
            ?>            
            <td rowspan="<?=$cantidadYears[$detalle['Año']]?>" style="vertical-align:middle;"><?=$detalle['Año']?></td>
            <?php 
                endif; 
                if($iterador==$cantidadYears[$detalle['Año']]){
                    $iterador=0;
                    $combinandoCelda=false;
                }
                $dateObj = DateTime::createFromFormat('!m', $detalle['Mes']);
                $nombreMes = strftime('%B', $dateObj->getTimestamp());
            ?>
            <th scope="row"><?=ucfirst($nombreMes)?></th>
            <td>$<?=$detalle["Precio total vendido"]?></td>
            <td><?php echo "$".aleatorio(); ?></td>    
        </tr>
        <?php endforeach; ?>
    <tfoot>
        <tr>    
            <td></td>        
            <td>Total</td>
            <td><?php echo "$".aleatorio();?></td>
            <td><?php echo "$".aleatorio();?></td>
        </tr>
    </tfoot>
</table>

<?php
    else:
        echo "<h2>No ha vendido productos</h2>";
    endif;
	require_once '../contenidoHtml/pie_pagina.php';
    }else{
        header("location: ./home.php");
    }

}else{
	destruir();
}
?>