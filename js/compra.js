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
        
        //Se crea la fila
        const fila = document.createElement("tr");

        //Se crea cada columna
        const col_codigo = document.createElement("td");
        col_codigo.className="product-code";
        col_codigo.textContent=codigo;

        const col_imagen = document.createElement("td");
        col_imagen.className="product-image";

        const col_nombre = document.createElement("td");
        col_nombre.className="product-name";
        col_nombre.textContent=nombre;

        const col_precioC = document.createElement("td");
        col_precioC.className="product-priceC";
        col_precioC.textContent=precioCompra;

        const col_cant = document.createElement("td");
        col_cant.className="product-stock";   
        col_cant.textContent=cantidad;
        
        //En el siguiente td se contendrá los input hidden del formulario
        const col_apartado = document.createElement("td");
        col_apartado.className="product-remove";

        fila.appendChild(col_codigo);
        fila.appendChild(col_imagen);
        fila.appendChild(col_nombre);
        fila.appendChild(col_precioC);
        fila.appendChild(col_cant);
        fila.appendChild(col_apartado);

        tbody.appendChild(fila);

    }else{
        alert("Seleccione una familia");
    }
}