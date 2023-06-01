
//importando o mongoose
const mongoose = require('mongoose');

//criando o esquema JSON
const userSchema = mongoose.Schema({
    name: { type: String, required: true, minlenght: 3, maxlenght: 50 },
    email: { type: String, required: true, minlenght: 3, maxlenght: 100 },
    password: { type: String, required: true, minlenght: 6, maxlenght: 200 },
    createdAt: { type: Date, default: Date.now },
    admin: { type: Boolean, default: false }
})

//criando o modelo JSON
module.exports = mongoose.model('User', userSchema);