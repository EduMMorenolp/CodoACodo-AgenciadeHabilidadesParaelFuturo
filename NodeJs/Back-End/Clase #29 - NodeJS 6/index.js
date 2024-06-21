import express from 'express';
import rutasProductos from './routes/rutas.productos.js';

const app = express();
const port = 3000;

// middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static('public'));

// Rutas
app.use('/', rutasProductos);


app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});