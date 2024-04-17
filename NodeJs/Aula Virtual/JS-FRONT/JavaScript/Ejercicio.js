/* Actividad Práctica JavaScript Unidad 1 */

/* 1. */ 

alert("Hola Mundo");

/* 2. */

document.write("Hola Mundo");

/* 3. */

console.log(3+5);

/* 4. */    

alert("Hola " + prompt("Escribe tu nombre"));

/* 5. */

var num1Texto = prompt("Escribe un número");
var num2Texto = prompt("Escribe otro número");
var num1 = parseInt(num1Texto);
var num2 = parseInt(num2Texto);

alert(num1 + num2);

/* 6. */

var num3Texto = prompt("Escribe un número");
var num4Texto = prompt("Escribe otro número");
var num3 = parseInt(num3Texto);
var num4 = parseInt(num4Texto);
if (num3 > num4) {
    alert(num3 + " es mayor que " + num4);
}else if (num4 > num3) {
    alert(num4 + " es mayor que " + num3);
}