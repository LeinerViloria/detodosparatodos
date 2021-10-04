<?php
if($_SERVER['REQUEST_METHOD']=="POST"){
    echo "<h2>La informacion de la factura es:</h2>";

    foreach($_POST as $articulo){   
        echo "<ul>"; 
        $articulos=explode(",", $articulo);
        foreach($articulos as $producto){         
            if(count(explode(",", $articulo))!=1){                           
                    echo "<li>".$producto."</li>";                            
            }  
        }   
        echo "</ul>";   
        
        if(count($articulos)==1){
            echo "<h2>El cliente tiene el codigo $producto</h2>";
        }
    }
}
?>