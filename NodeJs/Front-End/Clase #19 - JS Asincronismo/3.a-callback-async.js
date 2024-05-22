let carrito = '🛒';

function meterEnCarrito(callback) {
  // simular atraso
  setTimeout(function () {
    carrito += '📦';
    callback(); // Función invocada DENTRO de otra, se denomina CALLBACK
  }, 3000);
}

// Problema con los callbacks asíncronos de forma clásica, se hace pirámide de Doom.
meterEnCarrito(function () {
  console.log(carrito); // 3 segundos
  meterEnCarrito(function () {
    console.log(carrito);  // 6 segundos
    meterEnCarrito(function () {
      console.log(carrito);  // 9 segundos
      meterEnCarrito(function () {
        console.log(carrito);  // 12 segundos
        meterEnCarrito(function () {
          console.log(carrito);  // 15 segundos
        });
      });
    });
  });
});

console.log('otras tareas');
console.log(
  'mientras que espera la respuesta, sigo ejecutando otras instrucciones, NO me bloquea la continuación',
);
