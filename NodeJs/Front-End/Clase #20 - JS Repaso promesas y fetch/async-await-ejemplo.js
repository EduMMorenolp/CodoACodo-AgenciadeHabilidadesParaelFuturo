const clientes = [
  {
    id: 1,
    nombre: 'José',
    email: 'jose@jose.com',
  },
  {
    id: 2,
    nombre: 'Maria',
    email: 'maria@jose.com',
  },
  {
    id: 3,
    nombre: 'Pepe',
    email: 'pepe@jose.com',
  },
];

const getCliente = async(id) => {
  return new Promise((resolve, reject) => {
    let cliente = clientes.find((obj) => obj.id === id);
    if (cliente != undefined) {
      setTimeout(() => {
        resolve(cliente);
      }, 5000);
    } else {
      setTimeout(() => {
        reject('No se ha encontrado al cliente');
      }, 5000);
    }
  });
};

async function obtenerClientes() {
  try {
    const cliente1 = await getCliente(1)
    const cliente2 = await getCliente(2)
    const cliente3 = await getCliente(3)
    const todos = await Promise.all([cliente1,cliente2,cliente3])
    console.log(todos)
    return todos
    
  } catch(err) {
    console.log(err)
  }
}

obtenerClientes()
