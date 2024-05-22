let clientes = [
  {
    id: 1,
    nombre: 'Santi',
    localidad: 'villa urquiza',
    membresia: true,
    abonoMensual: 1000,
  },
  {
    id: 2,
    nombre: 'José',
    localidad: 'colegiales',
    membresia: false,
    abonoMensual: 0,
  },
  {
    id: 3,
    nombre: 'Maria',
    localidad: 'Parque Patricios',
    membresia: true,
    abonoMensual: 1600,
  },
  {
    id: 4,
    nombre: 'Natalia',
    localidad: 'Mataderos',
    membresia: true,
    abonoMensual: 700,
  },
];

function getClientes() {
  return new Promise(function (res, rej) {
    setTimeout(function () {
      res(clientes);
    }, 3000);
  });
}

getClientes()
  // info --> el array de clientes
  .then( info => info.find( item =>  item.id == 1))
  .then( cliente => cliente.nombre)
  .then( nombre => {
      let div = document.querySelector("div")
      let html = `Hola ${nombre}`
      div.appendChild(html)
  
} )

