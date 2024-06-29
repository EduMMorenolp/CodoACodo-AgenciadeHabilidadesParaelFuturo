import express from 'express';
import jwt from 'jsonwebtoken';
import 'dotenv/config'

const secretKey = process.env.SECRET_KEY;

const app = express();
const port = 3000;

// middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

function verifyToken(req, res, next) {
  
    const tokenHeader = req.headers.authorization;
    if (!tokenHeader) {
        res.sendStatus(403).send("A token is required for authentication");
    } else {
        
        const tokenBearer = tokenHeader.split(' ')[1]; // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWF0IjoxNzE5MjY4OTYzLCJleHAiOjE3MTkyNjkyNjN9.33x2ihTz_wzK1FSpYmqmIy46JjDv4YVyMd5hAxFytbY
       
        jwt.verify(tokenBearer, secretKey, (err, authData) => {
            if (err) {
                res.sendStatus(403).send("Invalid Token");
            } else {
                next();
            }
        });
    }

}

app.post('/login',  (req, res) => {
    const user = req.body

    if (user.username !== 'admin' || user.password !== 'admin') {
        // firma el token
        jwt.sign(
            { username: user.username}, 
            secretKey, 
            { expiresIn: '5m' }, 
            (err, token) => {
                res.json({
                    token
                }
            );
        });
    }
});

app.get('/admin', verifyToken, (req, res) => {
    res.send("Admin Page");
})

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});