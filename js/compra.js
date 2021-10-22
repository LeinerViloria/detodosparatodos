var tbody = document.getElementById("contenido");
tbody.innerHTML="";

function agregar(){
    var familia = document.getElementById("familias").value;           

    if(familia!="Seleccione una familia"){
        var codigo = document.getElementById("codigoProducto").value;
        var nombre = document.getElementById("nombreProducto").value;
        var cantidad = document.getElementById("cantProducto").value;
        var precioCompra = document.getElementById("precioProducto").value;
        var precioVenta = document.getElementById("precio_ventaProducto").value;
        var imagen = document.getElementById("imagen");
        var descripcion = document.getElementById("descripcionProducto").value;
        
        if(codigo!="" && nombre!="" && cantidad!="" && precioCompra!="" && precioVenta!="" && imagen.value!="" && descripcion!="" && familia!=""){
            //Se crea la fila
            const fila = document.createElement("tr");

            //Se crea cada columna
            const col_codigo = document.createElement("td");
            col_codigo.className="product-code";
            col_codigo.textContent=codigo;            

            const col_nombre = document.createElement("td");
            col_nombre.className="product-name";
            col_nombre.textContent=nombre;

            const col_precioC = document.createElement("td");
            col_precioC.className="product-priceC";
            col_precioC.textContent=precioCompra;

            const col_cant = document.createElement("td");
            col_cant.className="product-stock";   
            col_cant.textContent=cantidad;

            //Se va a crear un solo input con todos las variables en un array
            var variables =
            {'codigo':codigo, 'familia':familia, 'imagen':imagen.value, 'nombre':nombre, 'cantidad':cantidad, 'precioCompra':precioCompra, 'precioVenta':precioVenta, 'precioVenta':precioVenta, 'descripcion':descripcion};                                
            
            //En el siguiente td se contendrá los input hidden del formulario
            const col_apartado = document.createElement("td");
            col_apartado.className="product-remove";

            for(var indice in variables){
                const input = document.createElement("input");
                input.type="hidden";
                input.name="fila[]";
                input.value=variables[indice];

                col_apartado.appendChild(input);
            }

            const boton = document.createElement("button");
            boton.className="btn btn-primary btn-sm";

            const icono = document.createElement("i");
            icono.className="fas fa-eraser";

            boton.appendChild(icono);
            col_apartado.appendChild(boton);

            fila.appendChild(col_codigo);            
            fila.appendChild(col_nombre);
            fila.appendChild(col_precioC);
            fila.appendChild(col_cant);
            fila.appendChild(col_apartado);

            tbody.appendChild(fila);                         

            document.getElementById("familias").value="Seleccione una familia";
            document.getElementById("codigoProducto").value="";
            document.getElementById("nombreProducto").value="";
            document.getElementById("cantProducto").value="";
            document.getElementById("precioProducto").value="";
            document.getElementById("precio_ventaProducto").value="";
            document.getElementById("imagen").value="";
            document.getElementById("descripcionProducto").value="";

        }else{
            alert("No deje elementos vacio");
        }

    }else{
        alert("Seleccione una familia");
    }
}

let vista_preliminar = (event) =>{    
    let leer_img  = new FileReader();
    let id_img = document.getElementById("img-foto");

    leer_img.onload = ()=>{
        if(leer_img.readyState==2){
            id_img.src = leer_img.result
        }
    }

    leer_img.readAsDataURL(event.target.files[0])
}


