const express = require('express')
const app = express()
const port = 3000
const mongoose = require('mongoose')

//esquema do documento
const linkSchema = new mongoose.Schema({
    title: { type: String, required: true }, //campo obrigatório
    description: String,
    url: { type: String, required: true },
    click: { type: Number, default: 0 } // valor default
})


//criando o modelo do documento, nome da Model deve começar com 
// letra maiuscula
const Link = mongoose.model('Link', linkSchema)

//criando documento
let link = new Link({
    title: "Ricardo",
    description: "teste de criação de documento",
    url: "https://youtube.com",
    click: 0
})


//salvando documento
link.save().then(doc => {
    console.log(doc)
}).catch(err => { console.log(err) })

/*

//conectando no banco blog
mongoose.connect('mongodb://localhost/blog', (error, db) => {
    console.log(error);
    console.log(db);

})

//Outra maneira de conectar no banco blog
mongoose.connect('mongodb://localhost/blog').then(db => {
    console.log(db)

}).catch(error => {
    console.log(error)
    
})

*/

//Outra maneira de conectar no banco blog
mongoose.connect('mongodb://localhost/links',
    {
        useNewUrlParser: true,
        useUnifiedTopology: true
    })

let db = mongoose.connection;

db.on("error", () => { console.log("houve um erro") });
db.once("open", () => { console.log("banco carregado") });


app.get('/', (req, res) => res.send('Hello World'))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))


