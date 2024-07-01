import express from 'express';
import jwt from 'jsonwebtoken';
import cookieParser from 'cookie-parser';
import 'dotenv/config';
// Para que funcione __dirname
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url); // c://fsdfsfsdf/index.js
const __dirname = dirname(__filename); // c://fsdfsfsdf

const app = express();
const port = 3000;

const secretKey = process.env.SECRET_KEY;

// middlewares
app.use(express.static('public'))
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());

function verifyToken(req, res, next) {
     const token = req.cookies.token;

     if (!token) {
        return res.status(403).send('Token requerido');
    }
    try {
        const decoded = jwt.verify(token, secretKey);
        console.log(decoded)
        req.usuario = decoded;
        next();
    } catch (error) {
         res.status(401).send('Token no válido');
    }
}

app.post('/login', (req, res) => {
    const { username, password } = req.body;

    // sql = 'SELECT * FROM users WHERE username = ? AND password = ?'
    // const usuario = await db.query(sql, [username, password])
    // if (!usuario) { res.send('Usuario no encontrado') } else {}

    if (username === 'santi' && password === '123') {
        const token = jwt.sign({ username, role: 'admin' }, secretKey, { expiresIn: '5m' });
        res.cookie(
            'token',
            token,
            {
                httpOnly: true,
                secure: false,
                expires: new Date(Date.now() + 3600000)
            }
        ).send(`
            <h1>Bienvenido ${username}</h1>
            <a href="/admin">Admin</a>
        `)
    } else {
        res.status(401).send('Invalid username or password');
    
    }
   
});

app.get('/admin', verifyToken, (req, res) => {
    console.log("req usuario", req.usuario)
    if (req.usuario.role === 'admin') {
        // res.send(`Bienvenido ${req.usuario.username}`)
        res.sendFile(__dirname + '/private/admin.html');
    }

});

app.get('/logout', (req, res) => {
    res.clearCookie('token').send('Logout exitoso');
})

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});