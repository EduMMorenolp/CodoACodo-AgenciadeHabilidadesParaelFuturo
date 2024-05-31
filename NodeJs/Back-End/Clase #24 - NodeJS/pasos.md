# Paso 1
 npm init -y

# Paso 2
npm install express

# Paso 3

Crear el servidor web con el siguiente código

`
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
   res.send('Hello World!')
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})

`

# Paso 4
Ejecutar "node <nombre archivo>"
Ir al navegador y escribir "localhost:3000" y deberias ver "hello world!"