import express from 'express';
import session from 'express-session';
import bcrypt from 'bcrypt';
import 'dotenv/config';

const app = express();
const port = 3000;


// Simular DB
let usuarios = []

// middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));   
app.use(session({ // Configuracion de la sesion
    secret: process.env.SESSION_KEY,
    resave: false,
    saveUninitialized: false,
    expires: new Date(Date.now() + (30 * 86400 * 1000))
}))

const checkAuth = (req, res, next) => {
    if (req.session.autenticado) {
        next();
    } else {
        res.status(401).send('No autorizado');
    }
}

app.post('/register', async (req, res) => {
    const { email, password } = req.body;
 
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    usuarios.push({ email, password: hashedPassword });
    console.log("Usuarios", usuarios);
    // sql insert into usuarios (email, password) values (?, ?), [email, hashedPassword]
     res.send(`${email} registrado`);
})

app.post('/login', async (req, res) => {
     const { email, password } = req.body;
     req.body.id = usuarios.length + 1;

    const usuario = usuarios.find(u => u.email === email);
    // const usuario = await db.query(sql select * from usuarios where email = ? AND password = ?, [username, password])
    if (!usuario) {
        return res.status(401).send('Usuario no encontrado');
    }

     const match = await bcrypt.compare(password, usuario.password); // 123 === hash
     if (match) {
        req.session.autenticado = true; // Guardar en la sesion que el usuario esta autenticado
        res.send('Login exitoso');
    } else {
        res.status(401).send('Contraseña o usuario incorrecto');
    }

})

app.get('/admin', checkAuth, (req, res) => {
   res.send('Bienvenido al admin');
    
})

app.get('/logout', (req, res) => {
    req.session.destroy();
    res.send('Logout exitoso');
});



app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});