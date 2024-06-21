import pool from '../config/db.js';
import { procesarFiltros } from '../helpers/filtros.js';

// get('/api/productos')
export const obtenerProductosGET = async (req, res) => {

    let {consulta, values } = procesarFiltros(req.query)

    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query(consulta, values);
        connection.release();
        res.json(rows);
    } catch (error) {
        console.error('Hubo un error al consultar la base de datos:', error);
        res.status(500).send('Hubo un error al consultar la base de datos');
    }

}

// post('/api/productos')
export const crearProductoPOST =  async (req, res) => {

    const nuevoProducto = req.body; // Toma la info TEXTO
    nuevoProducto.imagen = req.file.filename; // Toma la info ARCHIVO
    /*
    {
        "nombre": "fsdfsfsd",
        "descripcion": "lorem",
        "precio": "1000",
        "stock": "1",
        "fk_categoria": "1"
        "imagen": "1718836985456-Clase #0.png"
    },
  */

    try {
        const connection = await pool.getConnection();
        const [result] = await connection.query('INSERT INTO nuevos SET ?', nuevoProducto);
        console.log(result)
        connection.release();
        res.send('Producto insertado correctamente');
    } catch (error) {
        console.error('Hubo un error al insertar en la base de datos:', error);
    }
}

export const obtenerProductoGET = async (req, res) => {
    const id = req.params.id;
    const consulta = 'SELECT nuevos.nombre, nuevos.precio, nuevos.descripcion, nuevos.stock, categorias.nombre AS categoria FROM nuevos JOIN categorias ON nuevos.fk_categoria = categorias.id_categoria WHERE id = ?;';
    
    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query(consulta, id);
        connection.release();
        res.json(rows);
    } catch (error) {
        console.error('Hubo un error al consultar la base de datos:', error);
        res.status(500).send('Hubo un error al consultar la base de datos');
    }

}