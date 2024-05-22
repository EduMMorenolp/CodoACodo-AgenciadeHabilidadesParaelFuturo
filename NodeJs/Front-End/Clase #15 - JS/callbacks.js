// Callbacks
/*
Las funciones pueden tomar como parámetros:
- string ("texto"): Si necesito manejar un dato en texto
- number(100): Si necesito manejar un dato en numero
- boolean(true): Si necesito manejar un dato en booleano, verdadero o falso
- array ([ ]): Si necesito manejar múltiples valores
- object ({ }): Si necesito manejar objetos con propiedades y valores
- funciones --> son llamados callbacks: De forma sincrónica, es para indicar que ejecute diferentes instrucciones.
*/

function saludar(nombre, callback) {
    console.log("Invocando a saludar...") // instrucciones fijas
    callback(nombre) // "Dani"
}

// let nombre = "Dani"
saludar("Dani", function(elNombre) {
  console.log("Hola " + elNombre)
})

saludar("Dani", () => console.log("chau santi"))




