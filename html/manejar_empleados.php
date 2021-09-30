<?php 
	require_once '../contenidoHtml/cabecera_admin.php'; //Esto es lo que ve el administrador	

?>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <button id="btnNuevo" type="button" class="btn btn-success">Nuevo</button>
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
                        <tr>
                            <td>1</td>
                            <td>Anonimo</td>
                            <td>Anonimo</td>
                            <td>
                                <div class="text-center">
                                    <div class="btn-group">
                                        <button class="btn btn-primary btnEditar">Actualizar</button>
                                        <button class="btn btn-danger btnBorrar">Eliminar</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Fulano de tal</td>
                            <td>No tiene</td>
                            <td>
                                <div class="text-center">
                                    <div class="btn-group">
                                        <button class="btn btn-primary btnEditar">Actualizar</button>
                                        <button class="btn btn-danger btnBorrar">Eliminar</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Jero Roblez</td>
                            <td>3402293299</td>
                            <td>
                                <div class="text-center">
                                    <div class="btn-group">
                                        <button class="btn btn-primary btnEditar">Actualizar</button>
                                        <button class="btn btn-danger btnBorrar">Eliminar</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<?php
	require_once '../contenidoHtml/pie_pagina.php'
?>