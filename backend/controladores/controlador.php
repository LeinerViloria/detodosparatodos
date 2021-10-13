<?php
class controlador{
    private $tabla;
    private $conexion;

    public function __construct($server, $nombreBd, $tabla, $user, $password=""){                    
        $conexionMySQL = new conectar($server, $nombreBd, $user, $password);   
        $this->tabla=$tabla;         
        $this->conexion= $conexionMySQL->getConexion();                           
    }
}