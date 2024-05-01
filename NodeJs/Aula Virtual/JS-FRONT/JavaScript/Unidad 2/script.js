/* 
1.Realizar una función, a la que se le pase como parámetro un número N,
y muestre por consola N veces, el siguiente mensaje: “Bienvenidos al
curso Full Stack”
*/

function saludar(numero) {
    for (let i = 0; i  < numero; ++i) {
        console.log("Bienvenidos al curso Full Stack")
    }
}

saludar(4)

/*
2.Diseñar una función que tenga como parámetros dos números, y que
calcule el máximo.
*/

function numeroMax(a,b) {
    if (a > b) {
        console.log("el numero mas grande es : " + a)
    }else {
        console.log("el numero mas grande es : " + b)
    }
}
numeroMax(3,4)

/*
3.Crear una función que se llame promedio3, que reciba como
parámetro tres valores y devuelva el promedio de los mismos.
*/

function promedio3(a,b,c) {
    let resultado = (a + b + c)/3
    console.log("Resultado promedio : " + resultado)
}
promedio3(2,6,4)

/*
4.Crear una función que lea notas hasta que ingrese -1 y devuelve el
promedio de las notas leídas. ( aunque no se suele leer valores en una
función)Una función que se llame siguiente, que reciba como
parámetro un valor entero, y devuelva el siguiente del número
ingresado como parámetro
*/ 

