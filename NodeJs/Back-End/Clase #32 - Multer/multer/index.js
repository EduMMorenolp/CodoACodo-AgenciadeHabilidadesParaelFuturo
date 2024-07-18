import express from 'express';
import multer from 'multer';

const app = express();

// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

function checkError(err, req, res, next) {
    if (err instanceof multer.MulterError) {
        console.log('Multer Error', err);
        if (err.code === 'LIMIT_FILE_SIZE') {
            return res.status(400).json({ error: 'El tamaño del archivo es muy grande' });
        } else {
            return res.status(400).json({ error: err.message })
        }
    } else {
        console.log('Error', err);
        return res.status(500).json({ error: err.message })
    }
    next()
}

// Multer
const almacenamiento = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/uploads');
    },
    filename: (req, file, cb) => {
        cb(null, `${file.fieldname}-${Date.now()}-${file.originalname}`);
    },
});


const maxSize = 1; // 2MB

const upload = multer({
    storage: almacenamiento,
    limits: { fileSize: maxSize },
    fileFilter: (req, file, cb) => {
        console.log("ARCHIVO ", file)
        if (file.mimetype === 'image/png' || file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg') {
            cb(null, true);
        } else {
            cb(null, false);
            return cb(new Error('Solo se permiten archivos de tipo .png, jpg o jpeg'));
        }
    }
});

// Routes
app.post('/upload', upload.single('foto'), checkError, (req, res) => {
    res.json({ file: req.file, body: req.body });
});


app.listen(3000, () => {
    console.log('Server on port 3000');
});