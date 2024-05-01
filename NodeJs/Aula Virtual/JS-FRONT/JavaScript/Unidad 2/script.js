/* 
1.Realizar una función, a la que se le pase como parámetro un número N,
y muestre por consola N veces, el siguiente mensaje: “Bienvenidos al
curso Full Stack”
*/

function saludar(numero) {
    for (let i = 0; i < numero; ++i) {
        console.log("1.Bienvenidos al curso Full Stack")
    }
}

saludar(4)

/*
2.Diseñar una función que tenga como parámetros dos números, y que
calcule el máximo.
*/

function numeroMax(a, b) {
    if (a > b) {
        console.log("2.el numero mas grande es : " + a)
    } else {
        console.log("2.el numero mas grande es : " + b)
    }
}
numeroMax(3, 4)

/*
3.Crear una función que se llame promedio3, que reciba como
parámetro tres valores y devuelva el promedio de los mismos.
*/

function promedio3(a, b, c) {
    let resultado = (a + b + c) / 3
    console.log("3.Resultado promedio : " + resultado)
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
console.log("4.a.El promedio de las notas ingresadas es:", promedioNotas);

function siguiente(numero) {
    return numero + 1;
}

const numeroIngresado = 5;
const siguienteNumero = siguiente(numeroIngresado);
console.log("4.b.El siguiente número después de", numeroIngresado, "es:", siguienteNumero);

/*
5.Una función que se llame doble, que reciba como parámetro un valor, y
devuelva el doble del número ingresado como parámetro. 
*/

function doble(numero) {
    return numero * 2
}

const numeroDoble = 5
const dobleNumero = doble(numeroDoble)
console.log("5.El doble de ", numeroDoble, " es : ",dobleNumero );

/*
6.Una función que se llame cuadrado, que reciba como parámetro un
valor, y devuelva el valor del numero ingresado como parámetro
elevado al cuadrado.
*/

function cuadrado(valor) {
    return valor ** 2
}

const numeroCuadrado = 5
const cuadradoNumero = cuadrado(numeroCuadrado)
console.log("5.El cuadrado de ", numeroCuadrado, " es : ",cuadradoNumero );

/*
7.Una función que se denomine imprimirValores que dado un número
por parámetro, imprima cual es el valor siguiente, el doble y el
cuadrado. Usando las funciones definidas en los puntos 5) , 6) y 7) :
siguiente, el doble y el cuadrado.
*/

function imprimirValores(numero) {
    console.log("Siguiente : ", siguiente(numero))
    console.log("Doble : ", doble(numero))
    console.log("Cuadrado : ", cuadrado(numero))
}

imprimirValores(5)