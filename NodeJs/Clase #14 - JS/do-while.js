/* do while: Hacer mientras...  */
let palabra = ""

do {
   console.log("Instrucciones de como acceder a la plataforma")
   console.log("Te damos la bienvenida a Codo a Codo")
   palabra = prompt('Ingresa continuar si deseas repetir las instrucciones: ');
} while (palabra == "continuar")

// =================================================================

let seleccion = 0

do {

   console.log("Opciones de menu");
   console.log("Presione 1 para ventas");
   console.log("Presione 2 para servicio técnico");
   console.log("Presione 3 para administración")

   seleccion = parseInt(prompt("Momento de ingresar opción:"))

} while (seleccion < 1 || seleccion > 3); 

switch (seleccion) {
   case 1:
      console.log("Espere un momento que será atendido por VENTAS")
      break;
   case 2:
      console.log("Espere un momento que será atendido por SERVICIO TÉCNICO")
      break;
   case 3:
      console.log("Espere un momento que será atendido por ADMINISTRACIÓN")
      break;
   default:
      console.log("ERROR")

}