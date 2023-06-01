//importando o node express
const express = require('express');
//importando o router do express.
const router = express.Router();

//importando o arquivo de controle de autenticação
const auth = require('../controllers/authController')


router.get('/', auth, (req, res) => {

    //verificando se o usuario  é admin = true
    if (req.user.admin) {

        res.send('Esse dado só deve ser visto pelo Admin')
    }
    else {
        res.status(401).send('Not Admin: Access Denied')

    }

})


router.get('/free', auth, (req, res) => {
    res.send('Esse dado só deve ser visto por quem esta logado')

})




module.exports = router;