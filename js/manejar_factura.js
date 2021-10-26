document.getElementById("contenedor_factura").innerHTML="";
document.getElementById("input_adicionales").innerHTML="";
lista=0;

var cuerpo = document.getElementById("contenedor_factura");

var listando = new Array();

function agregar(){        
    info=document.getElementById("codigo").value;
    cantidad=document.getElementById("cant").value;
    
    if(codigo!=="" && codigo!="Seleccione un producto" && cantidad!=="" && cantidad>0){
        listando.push(listando.length);
        
        var informacion = info.split(",");

        codigo=informacion[0];
        precio=informacion[1];
        total=precio*cantidad;        
        producto=document.getElementById(codigo).innerHTML;        

        //Se crea la fila
        const fila = document.createElement("tr");
        fila.id=""+listando.length+"";

        //Se crean las columnas
        const col_codigo = document.createElement("td");
        col_codigo.textContent=codigo;

        const col_producto = document.createElement("td");
        col_producto.textContent=producto;

        const col_cantidad = document.createElement("td");
        col_cantidad.textContent=cantidad;

        const col_total = document.createElement("td");
        col_total.textContent=total;

        const col_quitar = document.createElement("td");

        const boton = document.createElement("button");
        boton.type="button";
        boton.className="btn btn-warning";
        boton.textContent="Quitar";
        boton.onclick = function (){
            eliminando_fila = document.getElementById(listando.length);
                if(!eliminando_fila){
                    alert("Esta fila no existe");
                }else{
                    padre = eliminando_fila.parentNode;
                    padre.removeChild(eliminando_fila);
                }
                listando.pop();  
        }

        col_quitar.appendChild(boton);

        //Se agregan las columas a la fila
        fila.appendChild(col_codigo);
        fila.appendChild(col_producto);
        fila.appendChild(col_cantidad);
        fila.appendChild(col_total);
        fila.appendChild(col_quitar);

        valores = [codigo, cantidad];
        add_to_form(valores);

        cuerpo.appendChild(fila);

        document.getElementById("codigo").value="Seleccione el producto";
        document.getElementById("cant").value="";
    }else{
        alert("Ingrese correctamente los datos");
    }

}

function add_to_form(valores){
    var inputs="<input type='hidden' name='articulo"+listando.length+"' value='"+valores+"'>";

    document.getElementById("input_adicionales").innerHTML+=inputs;
}