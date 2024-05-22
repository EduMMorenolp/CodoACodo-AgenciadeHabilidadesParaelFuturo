const cliente = {
  nombre: "Jorge",
  edad: 40,
  cursando: true
}

function obtenerCliente() {
  return new Promise( function(res, rej) {
      let clienteExiste = false
      if (clienteExiste) {
        setTimeout(function() {
           res(cliente) // Aparecerá en el THEN
        },2000)
       
      } else {
          setTimeout(function() {
           rej("no se encuentra el cliente")
            // Aparecerá en el CATCH
        },2000)
      }
  })

}

obtenerCliente()
// entonces ... si resuelve, si es exitosa la consulta
   .then( function(data) { 
      console.table(data)
      const contenedor = document.querySelector("div")
      contenedor.innerHTML = `
      <h1>${data.nombre}</h1> 
    `
   })
   .catch( function(err) {
      console.log(err)
      const contenedor = document.querySelector(".error")
      contenedor.innerHTML = `
      <strong>${err}</strong> 
    `
   })
