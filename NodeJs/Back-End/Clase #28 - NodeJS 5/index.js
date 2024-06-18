import express from 'express';
import pool from './config/db.js';

const app = express();
const port = 3000;

// middleware
app.use(express.static('public'));

app.get('/api/productos', async (req, res) => {

    let filtros = req.query
    /*
		{
			nombre: 'pc',
			precioMin: 100,
			precioMax: 200,
            descripcion: 'gamer',
			orden: 'asc',
			pagina: 1,
			tamanoPagina: 10
		}
	*/

    let consulta = 'SELECT * FROM productos'
    let whereClause = ''
    let values = []

    if (filtros.nombre) {
        whereClause += ` nombre LIKE '%${filtros.nombre}%' AND`
    }

    if (filtros.descripcion) {
         whereClause += ` descripcion LIKE '%${filtros.descripcion}%' AND`
    }

    if (filtros.precioMin) {
        whereClause += ` precio >= ? AND`
        values.push(filtros.precioMin)
    }

    if (filtros.precioMax) {
        whereClause += ` precio <= ? AND`
        values.push(filtros.precioMax)
    }

// "SELECT * FROM productos WHERE nombre LIKE '%pc%' AND precio >= ? AND precio <= ? AND descripcion LIKE '%gamer%' ORDER BY precio asc", [100, 200]
    if (whereClause !== '') {
        whereClause = ' WHERE' + whereClause.slice(0, -3)
        consulta += whereClause;
    }

    if (filtros.orden) {
        consulta += ` ORDER BY precio ${filtros.orden}`
    }

    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query(consulta, values);
        connection.release();
        res.json(rows);
    } catch (error) {
        console.error('Hubo un error al consultar la base de datos:', error);
		res.status(500).send('Hubo un error al consultar la base de datos');
    }

});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});