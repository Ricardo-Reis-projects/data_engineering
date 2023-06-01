const express = require('express');
const router = express.Router();

const linkController = require("../controllers/linkController")

router.get('/', linkController.allLinks);

//rederizando para o tamplate ejs
router.get('/add', (req, res) => res.render('index', { error: false, body: {} }));
router.get('/:title', linkController.redirect);



//rotas para editar documento
router.get('/edit/:id', linkController.loadLink);
router.post('/edit/:id', express.urlencoded({ extended: true }), linkController.editLink);


//express.urlencoded() => permite pegar os dados atraves de um 
//formulário e executar o medotodo addLink do arquivo controle
router.post('/', express.urlencoded({ extended: true }), linkController.addLink);

router.delete('/:id', linkController.deleteLink)

//outra forma de delete utilizando valores do formulário
//router.delete('/',express.urlencoded({ extended: true }), linkController.deleteLink2)

//outra forma de delete utilizando valores como json
router.delete('/',express.json(), linkController.deleteLink3)

module.exports = router