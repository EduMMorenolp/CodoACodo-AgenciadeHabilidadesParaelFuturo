import express from 'express'
import pool from './config/db.js'

const app = express()

// middlewares
app.use(express.json())
app.use(express.urlencoded({ extended: false })) 

// leer todos los usuarios
app.get('/users', async (req, res) => {
  try {
    const rol = req.query.rol
    const connection = await pool.getConnection()
    const [rows] = await connection.query('SELECT * FROM usuarios WHERE rol = ?', [rol])
    console.log('ROWS--> ', rows)
    connection.release()
    
    // const filtrados = rows.filter((user) => user.rol === rol)
    // if (filtrados.length === 0) {
    //   res.status(404).json({ message: 'No se han encontrado con ese filtro' })
    // } else {
    //     res.json(filtrados)
    // }
    res.json(rows)
  } catch (err) {
    console.error('Error executing query: ', err)
    res.sendStatus(500)
  }
})

// Leer un usuario
app.get('/users/:id', async (req, res) => {
  try {
    const id = req.params.id
    const connection = await pool.getConnection()
    const [rows] = await connection.query(
      'SELECT * FROM usuarios WHERE id = ?',
      [id]
    )
    connection.release()
    if (rows.length === 0) {
      res.status(404).json({ message: 'User not found' })
      // res.redirect('/' + "?mensaje=User+not+found");
    } else {
      res.json(rows[0])
    }
  } catch (err) {
    console.error('Error executing query: ', err)
    res.sendStatus(500)
  }
})

// Crear
app.post('/users', async (req, res) => {
  // Create a new user
  try {
    console.log("req.body ---> ", req.body)
    // const { nombre, email, password, rol } = req.body;
    const connection = await pool.getConnection()
    // const [result] = await connection.query('INSERT INTO usuarios (name, email) VALUES (?, ?)', [nombre, email]);
    const [result] = await connection.query('INSERT INTO usuarios SET ?', [
      req.body
    ])
    connection.release()
    res
      .status(201)
      .json({ message: 'User created successfully', id: result.insertId })
  } catch (err) {
    console.error('Error executing query: ', err)
    res.sendStatus(500)
  }
})

// Actualizar un usuario
app.post('/users/:id', async (req, res) => {
  try {
    const id = req.params.id
    // const { nombre, email, password, rol } = req.body
    const connection = await pool.getConnection()
    // const [result] = await connection.query(
    //   'UPDATE usuarios SET nombre = ?, email = ?, password = ?, rol = ? WHERE id = ?',
    //   [nombre, email, password, rol, id]
    // )
    const [result] = await connection.query('UPDATE usuarios SET ? WHERE id = ?',[req.body, id])
    connection.release()
    if (result.affectedRows === 0) {
      res.status(404).json({ message: 'User not found' })
    } else {
      res.json({ message: 'User updated successfully' })
    }
  } catch (err) {
    console.error('Error executing query: ', err)
    res.sendStatus(500)
  }
})

// Borrar un usuario
app.get('/users/borrar/:id', async (req, res) => {
    try {
        const id = req.params.id
        const connection = await pool.getConnection()
        const [result] = await connection.query(
            'DELETE FROM usuarios WHERE id = ?',
            [id]
        )
        connection.release()
        if (result.affectedRows === 0) {
            res.status(404).json({ message: 'User not found' })
        } else {
            res.json({ message: 'User deleted successfully' })
        }
    } catch (err) {
        console.error('Error executing query: ', err)
        res.sendStatus(500)
    }
})

app.listen(3000, () => {
  console.log('Server is running on port 3000')
})
