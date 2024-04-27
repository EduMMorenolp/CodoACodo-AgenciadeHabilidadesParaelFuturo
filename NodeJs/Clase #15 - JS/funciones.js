// Funciones
saludar()

// Declarativas (funciona hoisting)
function saludar() {
  console.log("Hola")
}

// Expresadas (no funciona hoisting)
const chau = function() {
  console.log("chau")
}
chau()

// funciones flecha
const chau2 = () => console.log("chau2")
chau2()



