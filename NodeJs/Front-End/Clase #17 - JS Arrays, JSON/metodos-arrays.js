// Métodos de array con callback

let personas = ["Edu", "Ale", "Male", "Orlando","Pablo"]

// Bucle
for (let persona of personas) {
  console.log(`La persona es: ${persona}`)
}


const usuarios = [
  {
    id: 1,
    nombre: "María",
    edad: 25,
    cursa: true
  },
  {
    id: 2,
    nombre: "José",
    edad: 30,
    cursa: false
  },
  {
    id: 3,
    nombre: "Jorge",
    edad: 32,
    cursa: true
  },
  {
    id: 4,
    nombre: "Alejandra",
    edad: 21,
    cursa: true
  },
  {
    id: 5,
    nombre: "Mateo",
    edad: 25,
    cursa: false
  }
]
usuarios.length

let html = ''
usuarios.forEach(function(usuario) {
   html += `
     <div>
       <h2>Nombre: ${usuario.nombre}</h2>
       <p>Edad: ${usuario.edad}</p>
       <p>Cursando: ${usuario.cursa ? "Cursando" : "No cursa"}</p>
     </div> 
   `
})
// console.log(html)

// Uso del reduce para contar el total de las edades de los usuarios
const totalEdades = usuarios.reduce(function(acc,usuario) {
  return acc + usuario.edad
},0)
console.log(`El promedio de edad es ${totalEdades / usuarios.length} años`)


// Filter (filtraremos por los estudiantes que siguen cursando)

usuarios.filter(function(usuario) {
  return usuario.cursa == true
})


