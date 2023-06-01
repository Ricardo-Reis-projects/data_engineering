//processo para buscar o arquivo .env
//das variaveis de ambiente
require('dotenv').config();

//importo o node express
const express = require('express');
//crio o meu app
const app = express();

//importando o arquivo de rotas (userRouter).
const userRouter = require('./routes/userRouter')

//importando o arquivo de rotas (adminRouter).
const adminRouter = require('./routes/adminRouter')


//importando o mongoose
const mongoose = require('mongoose');

//conectando com o mongo através de uma string de conexão
//do atlas cloud (mongo db)
mongoose.connect(process.env.MONGO_CONNECTION_URL,
    {
        useNewUrlParser: true,
        useUnifiedTopology: true
    },
    (error) => {
        if (error)
            console.log(error)
        else
            console.log("Mongo Connected")

    })



//definindo a rota dominio/user, para usar as rodas do arquivo userRouter, sendo ela POST ou GET
//enviando o JSON através da rota(express.json()), para user o seu body no controles
app.use('/user', express.json(), userRouter);


app.use('/admin', express.json(), adminRouter)


//faço o app ouvir a minha porta definida na variavel PORT 
//do arquivo .env
app.listen(process.env.PORT, () => { console.log("Server Running") })