// let saludar = nombre => console.log(`Hola ${nombre}`)
 export function saludar(nombre) {
    console.log("hola " + nombre)
}

 export const profe = {
    nombre: "Santi",
    materia: "Programación"
}

 export const materias = ["Tecnologías de la información", "Taller de programación", "Educación tecnológica"]

 export const numero = 10

 export const cursando = true

// Si no quiero poner "export" en cada uno para poder importarlos de forma individual, se puede especificar en el siguiente objeto
//  export default {
//     cursando,
//     numero,
//     materias,
//     profe,
//     saludar
// }
