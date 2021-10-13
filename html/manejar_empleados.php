<?php 
	require_once '../contenidoHtml/cabecera_admin.php'; //Esto es lo que ve el administrador	    
    require_once '../backend/servicios/perfiles.php';
?>

<div class="container">
    <div class="row">
        <div class="col-lg-12">            
            <button onclick="document.getElementById('id01').style.display='block'" class="btn btn-success">Nuevo</button>
        </div>
    </div>
</div>
<br>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="table-responsive">
                <table id="tablaEmpleados" class="table table-striped table-bordered table-condensed" style="width:100%; border: 1px solid black;">
                    <thead class="text-center">
                        <tr>
                            <th>Id</th>
                            <th>Nombres</th>
                            <th>Telefono</th>
                            <th>Accion</th>
                        </tr>
                    </thead>
                    <tbody>                        
                        <?php for($i=1; $i<=1; $i++):?>
                            <form action="#" method="post">
                                <tr>
                                    <td><input type="hidden" name="id" id="id<?=$i?>" value="<?=$i?>"readonly><?=$i?></td>
                                    <td>Empleado <?=$i?></td>
                                    <td>Telefono <?=$i?></td>
                                    <td>
                                        <div class="text-center">
                                            <div class="btn-group">
                                                <button type="button" onclick="document.getElementById('id02').style.display='block'; document.getElementById('id_existente').value=document.getElementById('id<?=$i?>').value" class="btn btn-primary btnEditar">Actualizar</button>
                                                <button type="submit" class="btn btn-danger btnBorrar">Eliminar</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </form>
                        <?php endfor?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!--Modal para el CRUD-->
<!--Modal de prueba-->

<?php
    require '../contenidoHtml/modal.php';
    modal_empleado();
?>

<?php
	require_once '../contenidoHtml/pie_pagina.php'
?>