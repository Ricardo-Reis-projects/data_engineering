//importando o modelo JSON
const User = require('../models/User')

//importando o bcryptjs para criptografar a senha ao salvar no banco
const bcrypt = require('bcryptjs')

//importando o jwt para a construção do token do login
const jwt = require('jsonwebtoken');


//importando o arquivo de validação
const { loginValidade, registerValidate } = require('./validate');

const userController = {
    register: async function (req, res) {

        //verificando/validando os dados vindo do JSON do front-end, 
        //ex: limite e valor minimo de caracteres
        const { error } = registerValidate(req.body)
        if(error){return res.status(400).send(error.message)} 

        //verificando se email ja esta cadastrado
        const selectedUser = await User.findOne({ email: req.body.email })
        //se retornar alguma coisa, mandar mensagem para o usuário
        if (selectedUser) return res.status(400).send('Email already exists')

        //criando um novo arquivo com base nos dados vindo do 
        //front-end, no caso um JSON
        const user = new User({
            name: req.body.name,
            email: req.body.email,
            //criptografando senha 
            password: bcrypt.hashSync(req.body.password)
        })


        //tentando salvar objeto gerado acima
        try {
            const savedUser = await user.save()
            //enviando resposta na tela do usuario
            res.send(savedUser)
        } catch (error) {
            res.status(400).send(error)
        }
    },
    login: async function (req, res) {

        //verificando/validando os dados vindo do JSON do front-end, 
        //ex: limite e valor minimo de caracteres
        const { error } = loginValidade(req.body)
        if(error){return res.status(400).send(error.message)} 

        //verificando se existe o email no banco, filtrando o email
        //Obs: ele retorna o documento inteiro no formato JSON
        const selectedUser = await User.findOne({ email: req.body.email })
        //se não retornar nada, mandar mensagem para o usuário
        if (!selectedUser) return res.status(400).send('Email or password incorrect')


        //comparando se a senha bate com a cadastrada.
        const passwordAndUserMatch = bcrypt.compareSync(req.body.password, selectedUser.password)
        // se a comparação retornar false, mandar mensagem para o usuario
        if (!passwordAndUserMatch) return res.status(400).send('Email or password incorrect')


        //criando o token e enviando nivel de acesso admin
        const token = jwt.sign({ _id: selectedUser._id, admin: selectedUser.admin }, process.env.TOKEN_SECRET)

        //enviando o token para através do header da resposta
        res.header('authorization-token', token)

        res.send("User Logged")

    }
}

module.exports = userController




/*
//outra maneira

function register(req, res) {
    console.log('resgister')
    //enviando resposta na tela do usuário
    res.send('Register')
}

function login(req, res) {
    console.log('login')
    //enviando resposta na tela do usuário
    res.send('login')
}

module.exports = { register, login }



*/