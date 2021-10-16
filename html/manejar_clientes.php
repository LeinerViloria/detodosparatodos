<?php 
    require_once '../backend/controladores/destruirSesion.php';
	if(!empty($_SESSION['usuario_logueado'])){	
        require_once '../contenidoHtml/cabecera_'.$_SESSION['usuario_logueado']['cabecera'].'.php';
?>

<?php
    require '../contenidoHtml/modal.php';
    modal_cliente();
?>

<script>
    document.getElementById('id01').style.display='block';
</script>
<script src="../js/add_to_actualize.js"></script>
<?php
	require_once '../contenidoHtml/pie_pagina.php';
}else{
	destruir();
}
?>