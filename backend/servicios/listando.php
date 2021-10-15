<?php

function conectar($ruta=0){
    if($ruta==0){
        require_once '../backend/componentes/conectar.php';
    }else if($ruta==1){
        require_once '../componentes/conectar.php';
    }
    $conexionMySQL = new conectar("localhost", "detodosparatodos", "root", "");   
    return $conexionMySQL->getConexion();
}

function buscar($conexion, $tabla, $consulta=0, $consulta_personalizada=null){
    //Consulta = 0 => SELECT *
    //Consulta = 1 => Arma tu consulta
    if($consulta==0){
        $sentencia = "SELECT * FROM $tabla";
    }else if($consulta==1){
        $sentencia = $consulta_personalizada;
    }
    $sentencia = $conexion->prepare($sentencia);
    $sentencia->execute();

    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
}

function obtener_perfiles(){         
    $conexion = conectar();

    $tabla="perfiles";

    $perfiles = buscar($conexion, $tabla);
    
    return $perfiles;
}

function obtener_empleados(){
    $conexion = conectar();

    $tabla = "";

    $sql="SELECT e.id, p.nombre perfil, e.nombres, e.apellidos, u.correo correo, e.telefono
    FROM empleados e, perfiles p, usuarios u
    WHERE e.perfil_id=p.id AND e.id=u.id_empleado
    ORDER BY 3, 4";

    $empleados = buscar($conexion, $tabla, 1, $sql);

    return $empleados;
}

function obtenerPassword($pk, $id){    
    $conexion = conectar(1);
    $tabla = "";
    $sql = "SELECT password FROM usuarios WHERE $pk=$id";
    $pass = buscar($conexion, $tabla, 1, $sql);
    return $pass;           
}

function obtener_info_usuario(){         
    $conexion = conectar();

    $tabla="perfiles";

    $perfiles = buscar($conexion, $tabla);
    
    return $perfiles;
}

function verificando_identidad($id, $email){
    $conexion = conectar(1);
    $tabla = "";

    $sql ="SELECT id_empleado
        FROM usuarios
        WHERE correo='$email'";
    
    $id_encontrado = buscar($conexion, $tabla, 1, $sql);

    if(!empty($id_encontrado)){        
        
        if($id_encontrado[0]['id_empleado']==$id){
            return true;            
        }else{
            return false;
        }
                
    }else{
        return true;
    }
}