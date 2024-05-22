// Arrays (múltiples valores)
// Se puede almacenar strings, numeros, booleanos, arrays, objetos, null, undefined.
let ejemplo = ["string", 100, true, ["otro", "array"], { nombre: "José"}]

let personas = ["Edu", "Ale", "Male", "Orlando","Pablo"]
// Posición.     0.     1.     2.        3.        4. 

// Acceder a un valor
personas[4] = "Silvia"

// Imaginemos que necesitemos que al hacer clic sobre un botón, elimine el último valor del array y necesito que lo diga en el Front.
let ultimoRemovido = personas.pop()

// Imaginemos que necesitamos saber cuantos valores hay luego de haber sumado unos nuevos.
let nuevaLongitud = personas.push("Diego","Jesús","Ale") // Devuelve 7

// Ejemplo de indexOf 
if (personas.indexOf("Santi") > -1) {
  console.log("Persona encontrada")
} else {
  console.log("Persona NO encontrada")
}


// Ordena alfabéticamente
personas.sort()

// Ordenar números
let numeros = [10, 1, 400, 300, 20, 2]

numeros.sort(function(a,b) {
  return a - b
})

// Ordenar según valor de la propiedad
const items = [
  { name: "Edward", edad: 21 },
  { name: "Sharpe", edad: 37 },
  { name: "Santi", edad: 45 },
  { name: "Diego", edad: 12 },
  { name: "Magnetic", edad: 13 },
  { name: "Zeros", edad: 37 },
];
items.sort(function (a, b) {
  if (a.edad > b.edad) {
    return 1;
  }
  if (a.edad < b.edad) {
    return -1;
  }
  // a must be equal to b
  return 0;
});






