<?php
function modal_empleado(){
?>
<div class="w3-container">
  <div id="id01" class="w3-modal" style="padding-top:16px">
      <!--Contenido del modal-->
    <div class="w3-modal-content w3-card-4 w3-animate-zoom">
        <!--Cabecera del modal-->
        <header class="w3-container w3-teal" style="background-color:#0e7a53!important"> 
            <span onclick="document.getElementById('id01').style.display='none'" 
            class="w3-button w3-display-topright">&times;</span>
            <h2 class="modal-title" id="exampleModalLabel">Nuevo empleado</h2>
        </header>

        <!--Formulario-->
        <form action="#" method="post" id="formEmpleados">
        <div class="w3-container">
            <!--Cada input esta en un grupo-->
            <div class="form-group">
                <label for="id" class="col-form-label">Identificacion: </label>
                <input type="text" name="id" id="id" class="form-control" required="required">
            </div>
            <div class="form-group">
                <label for="nombres" class="col-form-label">Nombres: </label>
                <input type="text" name="nombres" id="nombres" class="form-control" required="required" pattern="[a-z ]+">
            </div>
            <div class="form-group">
                <label for="apellidos" class="col-form-label">Apellidos: </label>
                <input type="text" name="apellidos" id="apellidos" class="form-control" required="required" pattern="[a-z ]+">
            </div>
            <div class="form-group">
                <label for="telefono" class="col-form-label">Telefono: </label>
                <input type="tel" name="telefono" id="telefono" class="form-control" pattern="[0-9]+" minlenght="8">
            </div>
            <div class="form-group">
                <label for="email" class="col-form-label">Email: </label>
                <input type="email" name="email" id="email" class="form-control" required="required">
            </div>
            <div class="form-group">
                <label for="pass" class="col-form-label">Contraseña: </label>
                <input type="password" name="pass" id="pass" class="form-control" required="required" minlenght="6">
            </div>
        </div>
        <br>
        <footer class="w3-container w3-white" style="align-items:right;">            
            <button type="submit" id="btn-guardar" class="btn btn-dark">Guardar</button>
        </footer>
        </form>
        <br>
    </div>
  </div>
</div>

<div class="w3-container">
  <div id="id02" class="w3-modal" style="padding-top:16px">
      <!--Contenido del modal-->
    <div class="w3-modal-content w3-card-4 w3-animate-zoom">
        <!--Cabecera del modal-->
        <header class="w3-container w3-teal" style="background-color:#0d6efd!important"> 
            <span onclick="document.getElementById('id02').style.display='none'" 
            class="w3-button w3-display-topright">&times;</span>
            <h2 class="modal-title" id="exampleModalLabel">Actualizar informacion de empleado</h2>
        </header>

        <!--Formulario-->
        <form action="#" method="post" id="formEmpleados">
        <div class="w3-container">
            <!--Cada input esta en un grupo-->
            <div class="form-group">
                <label for="id" class="col-form-label">Identificacion: </label>
                <input type="text" name="id" id="id_existente" class="form-control" required="required" readonly>
            </div>
            <div class="form-group">
                <label for="nombres" class="col-form-label">Nombres: </label>
                <input type="text" name="nombres" id="nombres" class="form-control" required="required" pattern="[a-z ]+">
            </div>
            <div class="form-group">
                <label for="apellidos" class="col-form-label">Apellidos: </label>
                <input type="text" name="apellidos" id="apellidos" class="form-control" required="required" pattern="[a-z ]+">
            </div>
            <div class="form-group">
                <label for="telefono" class="col-form-label">Telefono: </label>
                <input type="tel" name="telefono" id="telefono" class="form-control" pattern="[0-9]+" minlenght="8">
            </div>
            <div class="form-group">
                <label for="email" class="col-form-label">Email: </label>
                <input type="email" name="email" id="email" class="form-control" required="required">
            </div>
        </div>
        <br>
        <footer class="w3-container w3-white" style="align-items:right;">            
            <button type="submit" id="btn-guardar" class="btn btn-dark">Guardar</button>
        </footer>
        </form>
        <br>
    </div>
  </div>
</div>

<?php
}
?>
<?php
function modal_cliente(){    
?>
<div class="w3-container">
  <div id="id01" class="w3-modal" style="padding-top:16px; display:'block'!important">
      <!--Contenido del modal-->
    <div class="w3-modal-content w3-card-4 w3-animate-zoom">
        <!--Cabecera del modal-->
        <header class="w3-container w3-teal" style="background-color:#0d6efd!important"> 
            <a href="../html/home.php"><span class="w3-button w3-display-topright">&times;</span></a>
            <h2 class="modal-title" id="exampleModalLabel">Nuevo cliente</h2>
        </header>

        <!--Formulario-->
        <form action="#" method="post" id="formClientes">
        <div class="w3-container">
            <!--Cada input esta en un grupo-->
            <div class="form-group">
                <label for="id" class="col-form-label">Identificacion: </label>
                <input type="text" name="id" id="id" class="form-control" required="required">
            </div>
            <div class="form-group">
                <label for="nombres" class="col-form-label">Nombres: </label>
                <input type="text" name="nombres" id="nombres" class="form-control" required="required" pattern="[a-z ]+">
            </div>
            <div class="form-group">
                <label for="apellidos" class="col-form-label">Apellidos: </label>
                <input type="text" name="apellidos" id="apellidos" class="form-control" required="required" pattern="[a-z ]+">
            </div>
            <br>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fab fa-whatsapp"></i></span>
                    </div>
                    <input type="text" class="form-control" placeholder="Username" id="whatsapp" name="whatsapp">
                </div>  
                <div class="input-group">  
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fab fa-instagram"></i></span>
                    </div>                  
                    <input type="text" name="instagram" id="instagram" class="form-control">                    
                </div> 
                <div class="input-group"> 
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fab fa-telegram"></i></span>
                    </div>                   
                    <input type="text" name="telegram" id="telegram" class="form-control">                    
                </div> 
                <div class="input-group"> 
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fab fa-twitter"></i></span>
                    </div>                   
                    <input type="text" name="twitter" id="twitter" class="form-control">
                </div>                             
            </div>
        </div>
        <br>
        <footer class="w3-container w3-white" style="align-items:right;">            
            <button type="submit" id="btn-guardar" class="btn btn-dark">Guardar</button>
        </footer>
        </form>
        <br>
    </div>
  </div>
</div>
<?php
}
?>