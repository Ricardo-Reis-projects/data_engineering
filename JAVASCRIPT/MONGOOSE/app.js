const express = require('express')
const app = express()
const port = 3000
const mongoose = require('mongoose')
const path = require('path')
const linkRoute = require('./routes/linkRoute')

mongoose.connect('mongodb://localhost/links', { useNewUrlParser: true, useUnifiedTopology: true })

let db = mongoose.connection;

db.on("error", () => { console.log("houve um erro") });
db.once("open", () => { console.log("banco carregado"); })

//utilizando EJS para integrar com o front-end. deve-se instala-lo antes
app.set('view engine','ejs');
//Qual pasta o sistema vai buscar os tampletas, neste caso na pasta templates
app.set('views',path.join(__dirname,'templates'))

app.use('/', linkRoute)

app.listen(port, () => console.log(`Example app listening on port ${port}!`))


