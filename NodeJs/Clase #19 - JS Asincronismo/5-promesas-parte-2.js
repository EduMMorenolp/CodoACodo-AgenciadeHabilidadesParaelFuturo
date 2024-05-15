let clientes = [
    {
        id: 1,
        nombre: "Santi",
        localidad: "villa urquiza",
        membresia: true,
        abonoMensual: 1000
    },
    {
        id: 2,
        nombre: "José",
        localidad: "colegiales",
        membresia: false,
        abonoMensual: 0
    },
    {
        id: 3,
        nombre: "Maria",
        localidad: "Parque Patricios",
        membresia: true,
        abonoMensual: 1600
    },
    {
        id: 4,
        nombre: "Natalia",
        localidad: "Mataderos",
        membresia: true,
        abonoMensual: 700
    }
]

function getCliente(id) {
    return new Promise(function (res, rej) {
        const cliente = clientes.find(cliente => cliente.id === id)
        if (cliente != undefined) {
            setTimeout(function () {
                res(cliente) // pasa al THEN
            }, 10000)
        } else {
            setTimeout(function () {
                rej("No se ha encontrado al cliente con el ID " + id) // pasa al CATCH
            }, 5000)
        }
    })
}

getCliente(5)
    .then(function (persona) {
        return persona
    })
    .then(function (nombre) {
        console.log(nombre)
    })
    .catch(function (err) {
        console.log(err)
    })

