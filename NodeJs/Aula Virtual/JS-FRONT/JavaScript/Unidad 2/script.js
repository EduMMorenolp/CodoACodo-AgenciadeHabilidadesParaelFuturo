/* 
1.Realizar una función, a la que se le pase como parámetro un número N,
y muestre por consola N veces, el siguiente mensaje: “Bienvenidos al
curso Full Stack”
*/

function saludar(numero) {
    for (let i = 0; i < numero; ++i) {
        console.log("Bienvenidos al curso Full Stack")
    }
}

saludar(4)

/*
2.Diseñar una función que tenga como parámetros dos números, y que
calcule el máximo.
*/

function numeroMax(a, b) {
    if (a > b) {
        console.log("el numero mas grande es : " + a)
    } else {
        console.log("el numero mas grande es : " + b)
    }
}
numeroMax(3, 4)

/*
3.Crear una función que se llame promedio3, que reciba como
parámetro tres valores y devuelva el promedio de los mismos.
*/

function promedio3(a, b, c) {
    let resultado = (a + b + c) / 3
    console.log("Resultado promedio : " + resultado)
}
promedio3(2, 6, 4)

/*
4.Crear una función que lea notas hasta que ingrese -1 y devuelve el
promedio de las notas leídas. ( aunque no se suele leer valores en una
función)Una función que se llame siguiente, que reciba como
parámetro un valor entero, y devuelva el siguiente del número
ingresado como parámetro
*/

function calcularPromedioNotas() {
    let suma = 0;
    let cantidad = 0;
    let nota = 0;
    // Iterar hasta que se ingrese -1
    do {
        nota = parseInt(prompt("Ingrese una nota (-1 para terminar):"));
        if (nota !== -1) {
            suma += nota;
            cantidad++;
        }
    } while (nota !== -1);
    // Calcular promedio
    const promedio = cantidad !== 0 ? suma / cantidad : 0;
    return promedio;
}

const promedioNotas = calcularPromedioNotas();
console.log("El promedio de las notas ingresadas es:", promedioNotas);

function siguiente(numero) {
    return numero + 1;
}

const numeroIngresado = 5;
const siguienteNumero = siguiente(numeroIngresado);
console.log("El siguiente número después de", numeroIngresado, "es:", siguienteNumero);