import express from 'express';
const router = express.Router();
import multer from 'multer';

import { 
    obtenerProductosGET,
    crearProductoPOST,
    obtenerProductoGET
} from '../controllers/ctrl.productos.js';

// Middleware para cargar archivos
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        console.log('file', file)
        cb(null, 'public/uploads')
    },
    filename: (req, file, cb) => {
        cb(null, `${Date.now()}-${file.originalname}`)
    }
})

const upload = multer({ storage: storage });

router.get('/api/productos', obtenerProductosGET);

router.post('/api/productos', upload.single('foto'), crearProductoPOST)

router.get('/api/productos/ver/:id', obtenerProductoGET)

export default router;