// Uso del return

const sumar = function(nro1,nro2) {

  return nro1 + nro2

}

let resultado = sumar(100,349)

console.log("El resultado es: " + resultado)

/* uso de RETURN
- NO se usa más de una vez por función
- NO se ejecuta el código que esté luego del return
*/

const chequearEdad = function(edad) {
  if (edad >= 18) {
    return "Puede entrar"
  } 
  return "No puede entrar"
  
}
const check = chequearEdad(15)
console.log("¿Puede entrar? " + check)

