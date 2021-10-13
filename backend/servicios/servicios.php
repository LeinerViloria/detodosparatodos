<?php
    
    if($_SERVER['REQUEST_METHOD']=='POST'){
        require '../modelos/empleado.php';
        require './controlador_empleado.php';

        $id=$_POST['id'];
        $nombres = $_POST['nombres'];
        $apellidos = $_POST['apellidos'];
        $salario = $_POST['salario'];

        $controlador = $_POST['controlador'];
        $operacion = $_POST['operacion'];

        if($controlador=="empleado"){

            $empleado = new empleado($id, $nombres, $apellidos, $salario);
            
            $controlador_MVC=new controlador_empleado("localhost", "manpower", "root");
                        
            
            if($operacion=="guardar"){
                $resultado = $controlador_MVC->guardar($empleado);

                if($resultado){
                    echo "Transaccion exitosa";
                }else{
                    echo "Error en la transaccion";
                }
            }elseif ($operacion=="listar"){
                $resultado = $controlador_MVC->listar();
            }
            
        }

    }


?>