// Scope con let
// CASO: el uso de "let"
function saludar() {
    let nombre = "Santi" // no puedo acceder desde afuera
    return nombre
}

if (true) {
    let nombre = "Santi" // no puedo acceder desde afuera
}
//nombre

let repeticion = 0
while (repeticion < 5) {
    let apellido = "Acosta" // no puedo acceder desde afuera
    repeticion++
}

// apellido

function despedir() {
  let nombre = "Santiago"
  return nombre
}

saludar()
despedir()