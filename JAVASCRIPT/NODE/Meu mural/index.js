const PORT = 3000;
const express = require('express');
const apiRoute = require('./routes/api');

const path = require("path");

const app = express();


//rota para enviar uma página statica para o usuario
app.use('/', express.static(path.join(__dirname, "public")));


//rota para o arquivo api.js
app.use('/api', apiRoute);




app.listen(PORT, () => {
    console.log("Server running on port", PORT)
});

