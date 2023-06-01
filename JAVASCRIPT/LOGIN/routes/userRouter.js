//importando o node express
const express = require('express');
//importando o router do express.
const router = express.Router();
//importando o arquivo de controles (userController)
const userController = require('../controllers/userController')


//rota: dominio/user/register
router.post('/register', userController.register)
//rota: dominio/user/login
router.post('/login', userController.login)


module.exports = router;