let clientes = [
    {
        id: 1,
        nombre: 'Santi',
        localidad: 'villa urquiza',
        membresia: true,
        abonoMensual: 1000,
        email: 'santi@bue.edu.ar',
    },
    {
        id: 2,
        nombre: 'José',
        localidad: 'colegiales',
        membresia: false,
        abonoMensual: 0,
        email: 'jose@bue.edu.ar',
    },
    {
        id: 3,
        nombre: 'Maria',
        localidad: 'Parque Patricios',
        membresia: true,
        abonoMensual: 1600,
        email: 'maria@bue.edu.ar',
    },
    {
        id: 4,
        nombre: 'Natalia',
        localidad: 'Mataderos',
        membresia: true,
        abonoMensual: 700,
        email: 'natalia@bue.edu.ar',
    },
];

const getNombre = id => {
    return new Promise((resuelve, rechaza) => {
        const cliente = clientes.find(obj => obj.id === id)

        // Truthy y falsy 
        if (cliente) {
            setTimeout(() => {
                resuelve(cliente.nombre)
            }, 4000)
        } else {
            rechaza("No se ha encontrado el cliente")
        }
    })
}

const getEmail = id => {
    return new Promise((resuelve, rechaza) => {
        const cliente = clientes.find(obj => obj.id === id)
        if (cliente) {
            setTimeout(() => {
                resuelve(cliente.email);
            }, 6000);
        } else {
            rechaza("No se ha encontrado el cliente")
        }
    })
}

const busquedas = async idCliente => {
    try {
        const nombre = await getNombre(idCliente)
        const email = await getEmail(idCliente)

        return `El nombre del cliente es ${nombre} y su email es ${email}`;
    } catch (err) {
        return err
    }
}

busquedas(1)
    .then(info => console.log(info), err => console.log(err))