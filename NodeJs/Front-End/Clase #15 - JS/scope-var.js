// Scope
// CASO: el uso de "var"

function saludar() {
    var nombre = "Santi" // no puedo acceder desde afuera
}

if (true) {
    var nombre = "Santi" // si puedo acceder desde afuera
}



var repeticion = 0; // Variable GLOBAL (Se define por AFUERA)
while (repeticion < 5) {
  var apellido = "Acosta"
  repeticion++
}

apellido

let confirmar;
do {
   
    confirmar = true

} while (confirmar == true)
