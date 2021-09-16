function familiaNueva(){    
    formulario="<label for='nombreFamilia'>Ingrese el nombre de la nueva familia:</label><input type='text' name='nombreFamilia' id='nombreFamilia' placeholder='Nombre de la familia'>";
    nuevo(formulario);
}

function familiaExistente(){
    formulario="<label for='familias'>Elija la familia:</label><select name='familias' id='familias'><option value='vacio'>Vacio</option></select>";
    nuevo(formulario);
}

function nuevo(etiqueta){
    document.getElementById("adicionar").innerHTML="";
    document.getElementById("boton").innerHTML="";
    document.getElementById("adicionar").innerHTML=etiqueta;       
    document.getElementById("boton").innerHTML="<input type='submit' value='Subir compra'>";    
}
