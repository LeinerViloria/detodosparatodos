<?php

if($_SERVER['REQUEST_METHOD']=="POST"){    

    session_start();

    $year = !empty($_POST['year']) ? $_POST['year'] : false;
    $valor = !empty($_POST['valorNuevo']) ? $_POST['valorNuevo'] : false;
    
    echo $year."<br>".$valor."<br>".date("Y")."<br>";

    $errores = array();
    if($year>=date("Y")){
        $errores['year']="No es permitido realizar este cambio, debe esperar al ".(date("Y")+1);
    }

    if(strlen($valor)<=0 || strlen($valor)>2){
        $errores['longitud']="Ingrese una longitud valida";
    }

    if($valor<=0){
        $errores['valor']="Ingrese un valor valido";
    }

    if(count($errores)==0){
        $errores['conseguido']="Se puede hacer el cambio";
    }

    $_SESSION['alerta']=$errores;
}
header("location:../html/porcentaje.php");
?>