<?php
	require_once '../backend/controladores/destruirSesion.php';
	
	if(!empty($_SESSION['usuario_logueado'])){
		require_once '../backend/servicios/listando.php';		
		$perfil_usuario = $_SESSION['usuario_logueado'][0]['perfil_id'];
		$lista_perfiles = obtener_perfiles();
				
		//Para saber qué cabecera mostrar
		foreach($lista_perfiles as $perfil => $idperfil){	
			if($perfil_usuario==$idperfil['id']){		
				$nombreCabecera=$idperfil['nombre'];
				$_SESSION['usuario_logueado']['cabecera']=$nombreCabecera;
			}
		}

		//Se crean los enlaces
		require_once '../contenidoHtml/cabecera_'.$nombreCabecera.'.php';				
		require_once '../contenidoHtml/contenido_productos.php';		
		contenido(0, "../");
		
		require_once '../contenidoHtml/pie_pagina.php';
		
	}else{
		//Esta funcion viene del archivo cerrarSesion.php
		destruir();
	}			
?>