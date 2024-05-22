// Promesa
function resolverLuegode2segundos(numero) {
    return new Promise(resolve => {
        setTimeout(() => {
            resolve(numero);
        }, 2000);
    });
}

function resolverLuegode10segundos(numero) {
    return new Promise(resolve => {
        setTimeout(() => {
            resolve(numero);
        }, 10000);
    });
}

// Async/Await
/* async function add() {
  
}
*/
const add = async numero => {
  
  // Con async, me permite manejar múltiple promesas
    const a = resolverLuegode2segundos(20);
    const b = resolverLuegode2segundos(20);
    const c = resolverLuegode10segundos(100);
  console.log("a: " + await a)
  console.log("b: " + await b)
  console.log("c: " + await c)
  
   return numero + await a + await b + await c;
  
}

add(35)
  .then(total => console.log(total))






