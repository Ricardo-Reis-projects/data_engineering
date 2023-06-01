//NODE
const express = require('express');
const app = express();
const path = require('path');
require('dotenv').config()

const videos = [
    'sUm3mvZii6Y',
    'DvwMVIJb0Jk',
    'Zu073TPW3E8',
    'mvMJl_0oQ_8',
    'MMF9I_9DAcs'
]


//criando rota
//quando acessar a rota ira responder com o array de videos
app.get('/api/videos', (req, res) => {
    res.send(videos);
})

//acessando varivel de ambiente
if (process.env.NODE_ENV != 'development') {

    //servido um arquivo estático
    //acessando o arquivo index.html da pasta 'front/build'
    app.use(express.static(path.join(__dirname, 'front/build')))

    //criando uma roda generica para enviar o arquivo index.html
    app.get('*', (req, res) => {
        res.sendFile(path.join(__dirname, 'front/build/index.html', function (error) {
            if (error) {
                res.status(500).send(error)
            }
        }))
    })

}
app.listen(3000, () => {
    console.log("Runnning");
})