<?php 
	require_once '../contenidoHtml/cabecera_admin.php'; //Esto es lo que ve el administrador
	//require_once '../contenidoHtml/cabecera_vendedor.php'; //Esto es lo que ve el vendedor

    require_once '../controladores/alertas.php';
    //La sesion deberia iniciarse en las cabeceras pero de momento se queda acá
    session_start();
?>
<h2>Porcentaje anual para calcular el precio de venta</h2>
<div class="container">
    <div class="row">
        <div class="col">            
            <?php echo !empty($_SESSION['alerta']) ? mostrarError($_SESSION['alerta'], "year", "error", "#c90808") : ""?>
            <?php echo !empty($_SESSION['alerta']) ? mostrarError($_SESSION['alerta'], "conseguido", "exito", "#3a8b3a") : ""?>
            <form action="../controladores/controlador_porcentaje.php" method="post">
                <label for="valorActual">El porcentaje actual es: </label>
                <input type="text" id="valorActual" class="form-control" value="15%" readonly>
                <label for="valorActual">El porcentaje pertenece al año: </label>
                <input type="text" name="year" id="yearCargado" class="form-control" value="2021" readonly>
                <label for="valorActual">Ingrese el porcentaje de este año: </label>
                <input type="number" name="valorNuevo" id="valorNuevo" class="form-control" placeholder="Porcentaje 2022" required>
                <?php echo !empty($_SESSION['alerta']) ? mostrarError($_SESSION['alerta'], "longitud", "error", "#c90808") : ""?>
                <?php echo !empty($_SESSION['alerta']) ? mostrarError($_SESSION['alerta'], "valor", "error", "#c90808") : ""?>
                <br>
                <button type="submit" class="btn btn-outline-primary">Subir</button>
                <?php !empty($_SESSION['alerta']) || !empty($_SESSION['conseguido']) ? borrar_errores() : ''; ?>                
            </form>            
        </div>
    </div>
</div>


<?php require_once '../contenidoHtml/pie_pagina.php'?>