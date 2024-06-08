import express from 'express';
const app = express();
const port = 3000

// Middlewares para que funcionen los métodos POST y PUT y tome los datos enviados en el body
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// simular base de datos
let usuarios = []
/*
{
    id: 1,
    nombre: '',
    email: '',
    password: '',
    membresia: true
}
*/

// Your code here
app.get('/users', (req, res) => {

    const membresia = req.query.membresia; // true, o false

    if (usuarios.length === 0) {
        res.status(404).send('No hay usuarios registrados')
    } else {
        // si hay filtro
        if (membresia) {
            const usuariosFiltrados = usuarios.filter(function(usuario) {
                return usuario.membresia === membresia
            })
            res.status(200).json(usuariosFiltrados)
        }   
        // si no hay filtro
        res.json(usuarios)
    }
    
});

// ruta dinámica, en donde ID es un parámetro que variará
app.get('/users/:id', (req, res) => {
    const id = parseInt(req.params.id)
    const usuario = usuarios.find(function(usuario) {
        return usuario.id === id
    })
    if (usuario) {  
        res.status(200).json(usuario)
    } else {
        res.status(404).send('Usuario no encontrado')
    }
    // Logic to fetch a specific user with the given id from the database
    // Send the response with the fetched user
   
});



app.post('/users', (req, res) => {
    const {nombre, email, password, membresia} = req.body;
    const id = usuarios.length + 1 // simular autoincremento de una base de datos
    const usuario = {
        id: id, // propiedad y valor almacenado en una variable
        nombre: nombre,
        email: email,
        password: password,
        membresia: membresia
    }
    usuarios.push(usuario)
    res.json(usuario)
});

app.put('/users/:id', (req, res) => {
    const id = parseInt(req.params.id);
    const usuario = usuarios.find(function(u) { return u.id === id})

    if (usuario) {
        const { nombre, email, password, membresia } = req.body;
        usuario.nombre = nombre;
        usuario.email = email;
        usuario.password = password;
        usuario.membresia = membresia;
        res.status(200).json(usuario);
    } else {
        res.status(404).send("usuario no encontrado");
    }
});

app.delete('/users/:id', (req, res) => {
    const id = parseInt(req.params.id);
    // Filtra todos los usuarios que NO coincidan con el ID que se quiere eliminar
    usuarios = usuarios.filter(function(usuario) {
        return usuario.id !== id;
    });

    res.send(`Usuario con ID: ${id} eliminado`);
});

app.listen(port, () => {
    console.log('Server is running on port 3000');
});