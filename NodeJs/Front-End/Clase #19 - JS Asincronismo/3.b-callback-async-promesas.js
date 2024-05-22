let carrito = "🛒"

function meterEnCarrito() {
  let promesa = new Promise( function(resolver, rechaza) {
         setTimeout(function () {
             console.log(carrito)
              carrito += "📦"
              resolver(carrito) // reemplaza al callback
          // rechaza("No hay stock")
          }, 2000)
  })
  return promesa
}

// No se hace la pirámide de Doom, gracias al manejo de las promesas y el uso de return de lo que devuelva la función.
meterEnCarrito()
  .then( function() { return meterEnCarrito()} ) // 2
  .then( function() { return meterEnCarrito()} ) // 4
  .then( function() { return meterEnCarrito()} ) // 6
  .then( function() { return meterEnCarrito()} ) // 8
   .catch( function(err) { console.log(err) })
  .finally(function() { console.log("Fin del proceso") })

console.log("mientras que espera la respuesta, sigo ejecutando otras instrucciones, NO me bloquea la continuación") 

