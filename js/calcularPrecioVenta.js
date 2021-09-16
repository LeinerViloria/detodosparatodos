//setup before functions
let typingTimer;                //timer identifier
let doneTypingInterval = 500;  //time in ms (5 seconds)
let myInput = document.getElementById('precioProducto');

//on keyup, start the countdown
myInput.addEventListener('keyup', () => {
    clearTimeout(typingTimer);
    if (myInput.value) {
        typingTimer = setTimeout(doneTyping, doneTypingInterval);
    }
});

//user is "finished typing," do something
function doneTyping () {
    document.getElementById("precio_ventaProducto").value=0;    
    //El precio de venta se pondrá como el valor de compra más el 15%
    var ganancia=0.15;
    var valor=parseFloat(document.getElementById("precioProducto").value);
    
    var precioVenta=valor+valor*ganancia;    
    document.getElementById("precio_ventaProducto").value=precioVenta;    
}