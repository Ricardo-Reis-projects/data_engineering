const express = require('express');
const path = require('path');
//const http = require('http');
const socketIO = require('socket.io');

const app = express();

/* exemplo utilizando lista

const list = ["José", "Marcos", "Antônio"];

console.log(list)

//comando para rodar após 5 segundos e inserir o joão no array list
setTimeout(() => {
    list.push("João");
    console.log(list)
}, 5000)


app.get('/list', (req, res) => {
    res.send(list);
})

*/

app.use('/', express.static(path.join(__dirname, 'public')))


const server = app.listen(3000, () => {
    console.log('running');
})


/*  outra maneira
const server = http.Server(app)

server.listen(3000, () => {
    console.log('running');
})
*/

const io = socketIO(server)

//criando os listener do io utilizando o evento connection 
io.on('connection', (socket) => {
    console.log('New connection')

    //enviando mensagem para o front 
    //parametros: nome_mensagem = hello e o objeto de envio
    socket.emit('hello', { msg: "Seja bem vindo!" })

    //para enviar mensagem a todos os navegadores que abrir
    //utilizar o io. exemplo:
    //io.emit('hello', { msg: "Seja bem vindo!" })

     //para enviar mensagem a todos os navegadores que abrir menos para o primeiro usuario referente ao socket
    //exemplo:
    //socket.broadcast.emit('hello', { msg: "Seja bem vindo!" })


    //preparando o back  para receber mensagem do frontend
    //recebendo a mensagem hello_client_response do front 
    socket.on('hello_client_response', (data)=>{
        console.log(data.msg)


    })
})