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
module.exports  = mongoose.model('Link', linkSchema)