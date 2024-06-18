import { createPool } from 'mysql2/promise';

const pool = createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'demousuarios',
    connectionLimit: 5, // Adjust the connection limit as per your needs
    waitForConnections: true,
    queueLimit: 0
});

pool.getConnection()
    .then(connection => {
        pool.releaseConnection(connection);
        console.log('Conectado a la base de datos');
    })
    .catch(err => console.error('No se ha podido conectar a la base de datos: ', err));

export default pool;