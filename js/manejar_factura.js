document.getElementById("contenedor_factura").innerHTML="";
document.getElementById("input_adicionales").innerHTML="";
$lista=0;

function agregar(){
    $precio_no_definitivo=3000;//Supongamos que el valor de cada producto es de 3000    

    $codigo=document.getElementById("codigo").value;
    $cantidad=document.getElementById("cant").value;
    if($codigo!=="" && $cantidad!==""){

        $total=$precio_no_definitivo*$cantidad;
        $comision=$total/100*$comision_no_definitiva;
        $producto="Producto "+($lista++);

        $html_TBody="<tr>";
            $html_TBody+="<td>"+$codigo+"</td>";
            $html_TBody+="<td>"+$producto+"</td>";
            $html_TBody+="<td>"+$cantidad+"</td>";
            $html_TBody+="<td>"+$total+"</td>";            
            $html_TBody+="<td><button type='button' class='btn btn-warning'>Quitar</button></td>";
        $html_TBody+="</tr>";

        $valores = [$codigo, $producto, $cantidad, $total, $comision];
        add_to_form($valores);

        document.getElementById("contenedor_factura").innerHTML+=$html_TBody;

        document.getElementById("codigo").value="";
        document.getElementById("cant").value="";
    }else{
        alert("No puede dejar campos vacios");
    }

}

function add_to_form($valores){
    $inputs="<input type='hidden' name='articulo"+$lista+"' value='"+$valores+"'>";

    document.getElementById("input_adicionales").innerHTML+=$inputs;
}