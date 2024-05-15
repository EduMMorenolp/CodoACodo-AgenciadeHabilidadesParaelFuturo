// Ejemplos
// El callback nos permite poder realizar distintas acciones según el dato obtenido. Veamos:

function saludar(nombre, callback) {
    console.log("ejecutando callback...")
    callback(nombre) // santi
}
function hola(elNombre) { // santi
    console.log(`Hola ${elNombre}`) // backtick
    // console.log("hola " + elNombre) //
}

// saludo al entrar
saludar("santi", hola)

// Despido al salir
saludar("santi", function (elNombre) {
    console.log(`Chau ${elNombre}`)
})


// Métodos avanzados de array

// clientes 
let clientes = [
    {
        nombre: "Santi",
        localidad: "villa urquiza",
        membresia: true,
        abonoMensual: 1000
    },
    {
        nombre: "José",
        localidad: "colegiales",
        membresia: false,
        abonoMensual: 0
    },
    {
        nombre: "Maria",
        localidad: "Parque Patricios",
        membresia: true,
        abonoMensual: 1600
    },
    {
        nombre: "Natalia",
        localidad: "Mataderos",
        membresia: true,
        abonoMensual: 700
    }
]

// Find
/* let resultado = clientes.find( item => item.nombre == "Santi") */
let resultado = clientes.find( function(item) {
  return item.nombre == "Santi"
})

let miembrosActivos = clientes.filter( function(item) {
  return item.membresia == true
})
// console.table(miembrosActivos)

let abonoMensualPremium = clientes.filter( function(item) {
  return item.abonoMensual > 900
})
console.table(abonoMensualPremium)




console.log(resultado)