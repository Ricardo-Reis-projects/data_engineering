//importando arquivo Link
const Link = require('../models/Link')

const redirect = async (req, res) => {
    let title = req.params.title;
    try {
        let doc = await Link.findOne({ title })//modelo .find

        if (doc) {
            console.log(doc);
            res.redirect(doc.url);
        } else {
            //se não encontrar o documento ele tenta outra roda, para
            //nao conflitar com o :title
            next();
        }

    } catch (error) {
        res.send(error);

    }
}


const addLink = async (req, res) => {
    let link = new Link(req.body)

    try {
        let doc = await link.save()
        res.redirect('/')
    } catch (error) {
        //   res.send(error);

        // com tratamento de erro e o utilizando o body: req.body 
        // para incluir novamente as infos digitadas pelo usuário
        res.render('index', { error, body: req.body });
    }

    /* //OUTRA FORMA   
     link.save().then(doc => { res.send(doc) }).cath(error => { res.send(error) })
    */

}



//selecionando todos os documentos
const allLinks = async (req, res) => {
    try {
        //find busca os elementos no banco
        //  find() = seleciona todos / find(name: "ricardo") = realiza filtro

        // como não utilizamos o then. temos que utilizar o await para
        // esperar a consulta finalizar para depois ir para o proximo passo
        let docs = await Link.find({});

        //renderizando para a o tempalte all.ejs enviando o resultado da consulta(find)
        res.render('all', { links: docs });

        //res.send(links);

    } catch {
        res.send(error);
    }
}

const deleteLink = async (req, res) => {

    let id = req.params.id;
    try {
        res.send(await Link.findByIdAndDelete(id));
        res.redirect('/')
        // outra maneira
        // Link.deleteOne({ _id: id })

    } catch {
        res.send(error);
    }
}


const deleteLink2 = async (req, res) => {

    let id = req.params.id;
    if (!id) {
        //utilizando o id do formulário
        id = req.body.id
    }
    try {
        res.send(await Link.findByIdAndDelete(id));
        res.redirect('/')
        // outra maneira
        // Link.deleteOne({ _id: id })

    } catch {
        res.send(error);
    }
}


const deleteLink3 = async (req, res) => {

    let id = req.params.id;
    if (!id) {
        //utilizando o id do formulário
        id = req.body.id
    }
    try {
        await Link.findByIdAndDelete(id)
        //res.send(id)
        res.redirect('/')
        // outra maneira
        // Link.deleteOne({ _id: id })

    } catch {
        res.status(404).send(error);
    }
}

const loadLink = async (req, res) => {

    let id = req.params.id;
    try {
        let doc = await Link.findById(id)
        //res.send(id)
        res.render('edit', { error:false, body: doc })
        // outra maneira
        // Link.deleteOne({ _id: id })

    } catch {
        res.status(404).send(error);
    }
}


const editLink = async (req, res) => {
    let link = {};
    link.title = req.body.title;
    link.description = req.body.description;
    link.url = req.body.url;


    let id = req.params.id;
    if (!id) {
        //utilizando o id do formulário
        id = req.body.id
    }

    try {
        let doc = await Link.findByIdAndUpdate(id, link)
        // ou: let doc = await Link.updateOne({_id: id}, link)
        res.redirect('/')
    } catch (error) {

        res.render('edit', { error, body: req.body });
    }


}

module.exports = { redirect, addLink, allLinks, deleteLink, deleteLink2, deleteLink3, loadLink,editLink }