const express = require('express') // CARGA el "plugin"
const app = express() // Almacena en una variable al "plugin"
const port = 3000 // Puerto en el que se abrirá el servidor

app.use(express.static('public'))

// Ruta raíz (¿qué debe pasar cuando el cliente (navegador) vaya a esta ruta? ej: localhost:3000)
// app.get('/', function(req, res)  { // (string, callback), request, response
//    res.send('Hello World!') // nosotros, como servidor web, RESPONDEMOS con un mensaje
// })

app.get('/productos', function (req, res) {
   fetch("https://ws.smn.gob.ar/map_items/weather")
      .then(respuesta => respuesta.json())
      .then(data => {
        res.send(data)
      })
})

// Encendemos el servidor, y opcionalmente, un callback para indicar en qué puerto está abierto el servidor.
app.listen(port, function () { // 2 parámetros, uno es un número, el otro es un CALLBACK
   console.log(`SERVIDOR WEB ONLINE PUERTO: ${port}`)
})