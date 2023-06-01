const jwt = require('jsonwebtoken');
const userController = require('./userController');

module.exports = function (req, res, next) {

    //obtendo o token vindo do header do front-end.
    const token = req.header('authorization-token');
    //verificando se existe token 
    if (!token) return res.status(401).send('Access Denied')

    try {
        //validando token
        const userVerified = jwt.verify(token, process.env.TOKEN_SECRET);
       // se ok, atribuir token ao user da requisição
        req.user = userVerified
        next()
    } catch (error) {
        res.status(401).send('Access Denied')
    }

    res.send("token recebido")
}