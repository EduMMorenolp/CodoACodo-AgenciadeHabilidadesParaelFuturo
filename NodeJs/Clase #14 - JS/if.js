// Condicional IF
let edad = 19
let vip = true

if (edad >= 18) {
   console.log("Entra al boliche")
   if (vip) {
      console.log("Entra al area VIP")
   }
} else if (edad >= 15) {
   console.log("Entra a matinee")
} else {
   console.log("No entra")
}

// Operador ternario
if (edad == 18) {
   console.log("Tiene 18")
} else {
   console.log("no tiene 18")
}

edad == 21 ? "Tiene 21" : "no tiene 21"
