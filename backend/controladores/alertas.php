<?php
function mostrarError($errores, $campo, $clase, $color){
	$alerta = '';
	if(!empty($errores[$campo]) && !empty($campo)){
		$alerta = "<div class='alerta alerta-$clase' style='color: $color'>".$errores[$campo].'</div>';
	}
	
	return $alerta;
}

function borrar_errores(){
    session_destroy();
    //return $borrado;
}
?>