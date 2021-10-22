<?php 
	//require_once '../contenidoHtml/cabecera_Administrador.php'; //Esto es lo que ve el administrador
	//require_once '../contenidoHtml/cabecera_Vendedor.php'; //Esto es lo que ve el vendedor

    require_once '../backend/controladores/destruirSesion.php';
	 
if(!empty($_SESSION['usuario_logueado'])){	
    if($_SESSION['usuario_logueado']['cabecera']=="Administrador"){
	require_once '../contenidoHtml/cabecera_'.$_SESSION['usuario_logueado']['cabecera'].'.php';
    
    require_once '../backend/servicios/listando.php';    
    
?>

<div class="container p-4">
    <div class="row" >
        <div class="col-md-4"></div>
        <div class="col-md-4" id="comisiones">
            <h2>Comisiones</h2>
            <div class="card card-body">
                <form action="../backend/servicios/servicios.php" method="POST">
                    <div class="form-group">
                        <input type="text" name="importe" class="form-control" placeholder="Importe..." autofocus>
                    </div>
                    <div class="form-group">
                        <input type="text" name="comision" class="form-control" placeholder="Comision en %..." autofocus>
                    </div>                   
                    <input type="hidden" name="controlador" value="comision">
                    <input type="hidden" name="operacion" value="0">
                    <input type="submit" class="btn btn-success btn-block" value="Guardar">
                </form>
            </div>
        </div>  
        <div class="col-md-4"></div>
    </div>
</div>

<?php
	require_once '../contenidoHtml/pie_pagina.php';
    }else{
        header("location: ./home.php");
    }

}else{
	destruir();
}
?>