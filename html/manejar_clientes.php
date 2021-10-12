<?php 
	require_once '../contenidoHtml/cabecera_admin.php'; //Esto es lo que ve el administrador	    
?>

<?php
    require '../contenidoHtml/modal.php';
    modal_cliente();
?>

<script>
    document.getElementById('id01').style.display='block';
</script>
 
<?php
	require_once '../contenidoHtml/pie_pagina.php'
?>