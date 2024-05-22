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

function getClientes() {
    console.log("consiguiendo lista de clientes...")
  // simular atraso
    setTimeout(function() {
        return clientes
    }, 1)
}
console.log("otras tareas...")
let resultado = getClientes()
console.log(`El resultado es ${resultado}`)// YA, quiero conocer el resultado de la función, pero no le dió tiempo a "getClientes" a procesar el pedido