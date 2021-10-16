<?php
    
    if($_SERVER['REQUEST_METHOD']=='POST'){        
        require_once '../controladores/controlador.php';  
        
        //Se crean las variables generales de la base de datos
        $servidor="localhost";
        $nombreBd="detodosparatodos";
        $userBD="root";        
        
        $controlador = trim($_POST['controlador']);
        $operacion = trim($_POST['operacion']);

        if(!isset($_SESSION)){
            session_start();
        }
        
        if($controlador=="empleado"){
            require_once '../modelos/empleado.php';
            require_once '../modelos/usuario.php';
            //En caso de que quiera actualizar o para verificar un detalle al ingresar un empleado nuevo
            require_once './listando.php';

            //Recupero los datos que se hayan mandado por POST, 
            //y se pone la primera letra en mayuscula

            //Con quote() se escapan los datos por si se ingresan caracteres especiales
            //para evitar errores en la base de datos

            //Datos para la tabla empleados
            $id = !empty($_POST['id']) ? trim($_POST['id']) : null ;
            $perfil=  !empty($_POST['perfil']) ? trim($_POST['perfil']) : null ;
            $nombres = !empty($_POST['nombres']) ? ucwords(trim($_POST['nombres'])) : null ; 
            $apellidos = !empty($_POST['apellidos']) ? ucwords(trim($_POST['apellidos'])) : null ; 
            $telefono = !empty($_POST['telefono']) ? trim($_POST['telefono']) : null ; 
            
            //Datos para la tabla usuarios
            $email = !empty($_POST['email']) ? trim($_POST['email']) : null ; 
            $password = !empty($_POST['pass']) ? trim($_POST['pass']) : null ;                                    

            //Se crea una variable de session para los mensajes resultantes
            $errores = array();            
            
            //Se necesitan validar las variables    
            if(is_null($id)){
                $errores['id']="El id no puede quedar vacio";
            }else if(!is_numeric($id)){
                $errores['id']="El id del empleado debe ser un numero";
            }else{
                /*
                Cuando se pasa por el formulario de actualizacion, se pide la contraseña
                para verificar si es correcta y se puede dar el paso.

                Aqui se trabaja con el input validar
                */
                $verificacion=true;
                
                if(isset($_POST['validar'])){                    
                    $password_traida=obtenerPassword('id_empleado',$id)[0]['password'];
                    $verificando = password_verify($password,$password_traida);
                    if($verificando==false){
                        $verificacion=false;
                        $errores['verificacion']="La contraseña ingresada para poder actualizar es incorrecta";
                    }
                }
            }

            if(is_null($perfil)){
                $errores['perfil']="El perfil no puede quedar vacio";
            }

            if(is_numeric($nombres) || preg_match("/[0-9]/", $nombres)){                
                $errores['nombre']="El nombre no admite numeros";
            }  
            
            if(!ctype_alpha($nombres)){                
                $errores['nombreerror2']="El nombre solo debe contener letras";
            } 
            
            if(is_numeric($apellidos) || preg_match("/[0-9]/", $apellidos)){                
                $errores['apellidos']="El apellido no admite numeros";
            } 
            
            if(!ctype_alpha($apellidos)){                
                $errores['apellidoserror2']="El apellido solo debe contener letras";
            }

            if(!is_numeric($telefono) && !is_null($telefono)){                
                $errores['tel']="El telefono es solo numerico";
            } 

            if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                $errores['email']="Ingrese un email correcto";
            }

            if(is_null($password)){
                $errores['password']="La contraseña no puede quedar vacia";
            }else if(strlen($password)<6){                
                $errores['password']="La longitud minima de la contraseña es de 6";
            }else if(strlen($password)>16){                
                $errores['password']="La longitud maxima de la contraseña es de 16";
            }else{
                //Se encripta la contraseña si no hay problemas con la original
                $password = password_hash($password, PASSWORD_BCRYPT, ['cost'=>4]) ; 
            }  
            
            if(is_null($perfil)){
                $errores['perfil']="El perfil no puede quedar vacio";
            }

            //Se necesita verificar que no haya otro usuario con el correo ingresado para un nuevo usuario            
            $pase = verificando_identidad($id, $email);
            
            if($pase==false){
                $errores['pase']="El correo ingresado es usado por otro usuario";
            }            
                        
            //Si no hay errores
            if(count($errores)==0 && $verificacion==true){                
                
                $empleado = new empleado($id, $perfil, $nombres, $apellidos, $telefono);
                $usuario = new usuario($id, $email, $password);
                
                //Para controlar la tabla empleados
                $controlador_empleado=new controlador($servidor, $nombreBd, "empleados", $userBD);
                //Para controlar la tabla usuarios
                $controlador_usuario=new controlador($servidor, $nombreBd, "usuarios", $userBD);            
                                
                if(is_numeric($operacion) && $operacion==0){  
                    //Se manda al empleado              
                    $resultado_empleado = $controlador_empleado->guardar("gestionar_empleado",$empleado);
                    if($resultado_empleado==true){
                        //Se manda al usuario de ese empleado
                        $resultado_usuario = $controlador_usuario->guardar("gestionar_usuario",$usuario);                        
                        if($resultado_empleado==true){
                            $_SESSION['completado']="Se ha registrado exitosamente";                             
                        }else{
                            $errores['errores']['general']="No se guardó el usuario del empleado";    
                        }
                    }else{
                        $errores['errores']['general']="No se guardó el empleado";
                    }
                }
                
            }else{                
                $_SESSION['errores']=$errores;            
            }    
            
            //Al terminar todo, regresa
            /*
                Sé que regresa a manejar_empleado.php porque estoy en
                el condicional de empleado
            */
            header('location: ../../html/manejar_empleados.php');
            
        }else if($controlador=="cliente"){
            //Entra aqui si la solicitud viene de manejar_cliente
            
            //var_dump($_POST);

            $id = !empty($_POST['id']) ? trim($_POST['id']) : null ;
            $id_empleado = !empty($_POST['trabajador']) ? trim($_POST['trabajador']) : null ;
            $nombres = !empty($_POST['nombres']) ? trim($_POST['nombres']) : null ;
            $apellidos = !empty($_POST['apellidos']) ? trim($_POST['apellidos']) : null ;
            $numeros = array();
            $cuentas = array();

            //Variable de errores
            $errores = array();            

            //Capturar errores en el id
            if(is_null($id)){
                $errores['id']="El id no puede quedar vacio";
            }else if(!is_numeric($id)){
                $errores['id']="El id del empleado debe ser un numero";
            }

            //Capturar errores en el id_empleado
            if(is_null($id)){
                $errores['id_empleado']="El id no puede quedar vacio";
            }else if(!is_numeric($id)){
                $errores['id_empleado']="El id del empleado debe ser un numero";
            }

            //Capturar errores en el nombre
            if(is_numeric($nombres) || preg_match("/[0-9]/", $nombres)){                
                $errores['nombre']="El nombre no admite numeros";
            }  
            
            if(!ctype_alpha($nombres)){                
                $errores['nombreerror2']="El nombre solo debe contener letras";
            } 

            //Capturar errores en el apellido
            if(is_numeric($apellidos) || preg_match("/[0-9]/", $apellidos)){                
                $errores['apellidos']="El apellido no admite numeros";
            } 
            
            if(!ctype_alpha($apellidos)){                
                $errores['apellidoserror2']="El apellido solo debe contener letras";
            }

            if(count($errores)==0){
                require_once '../modelos/cliente.php';
                //Creo a mi cliente
                $cliente = new cliente($id, $id_empleado, $nombres, $apellidos);
                
                $controlador_cliente=new controlador($servidor, $nombreBd, "clientes", $userBD);

                if(is_numeric($operacion) && $operacion==0){
                    $resultado_cliente = $controlador_cliente->guardar("gestionar_cliente",$cliente);
                    if($resultado_cliente){
                        $_SESSION['completado']="El cliente se registró exitosamente";
                        if(!empty($_POST['numero1'])){
                            require_once '../modelos/telefono.php';
                            $j=1;
                            //Busco esos numeros ingresados
                            for($i=0; $i<count($_POST); $i++){
                                if(!empty($_POST['numero'.$j.''])){                                    
                                    $numeros['numero'.$j.'']=$_POST['numero'.$j.''];
                                    $j++;
                                }
                            }                            

                            //Cada numero guardado en la variable numeros 
                            //debe ser guardado en la base de datos
                            $controlador_telefono=new controlador($servidor, $nombreBd, "telefonos", $userBD);
                            foreach($numeros as $numero){
                                $j=1;
                                //Mando el numero al objeto
                                $telefono = new telefono($id, $numero);
                                $resultado_telefono = $controlador_telefono->guardar("gestionar_telefono", $telefono);
                                if($resultado_telefono){
                                    $_SESSION['completado']['numero'.$j.''] = "El numero ".$numero." se guardó con exito";
                                }else{
                                    $errores['errores']['general']="No se guardó el numero ".$numero;
                                }
                                $j++;
                            }

                        }

                    }else{
                        $errores['errores']['general']="No se guardó el cliente";
                    }
                }
            }

        }

    }    
?>