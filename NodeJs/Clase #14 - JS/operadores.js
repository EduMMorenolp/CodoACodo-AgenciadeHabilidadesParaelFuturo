// Operadores lógicos

// && (Y)
let haceFrio = true
let llueve = true

let quedarseEnCasa = haceFrio && llueve

if (quedarseEnCasa == true) {
   console.log("noche de netflix!")
} else {
   console.log("Voy a salir a comprar algo en el Día")
}


// || (o)
let bondi = false
let subte = false
let tren = false

let llegoAlTrabajo = bondi || subte || tren
if (llegoAlTrabajo == true) {
   console.log("llegué!")
} else {
   console.log("Jefe, no puedo ir, hago home office")
}

// Negacion (!)

let enfermo = true;

if (enfermo) { // De forma predeterminada chequea si es TRUE
   console.log("llamo al Dr")
} else {
   console.log("vida normal")
}


if (!enfermo) { // Puedo hacer que chequee si es FALSO
   // Si es FALSO que estoy enfermo me dirá que haga vida normal.
   console.log("vida normal")
} else {
   console.log("llamo al Dr")
}


