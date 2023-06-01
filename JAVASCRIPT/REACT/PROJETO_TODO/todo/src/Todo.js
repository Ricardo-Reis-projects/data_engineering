import React, { useEffect, useState } from 'react'
import './Todo.css'
//importando componente Lista
import List from './componentes/List';
//importando componente TodoForm
import TodoForm from './componentes/TodoForm';

import Item from './componentes/Item'
import Modal from './componentes/Modal';

const SAVED_ITEMS = "savedItems"


function Todo() {

    //criando um ESTADO de atualização na pagina do  tipo array. com dado inicial vazio para arualizar a lista
    const [items, setItems] = useState([]);

    //criando um estado para mostrar o Modal
    const [showModal, setShowModal] = useState(false)

    //sempre que o componente Todo for carregado na tela, vamos pegar na memoria a lista atualizado com o comando useEffect()
    //como o array [] está vazio. ele sera feito somente uma vez quando o componente for carregado
    useEffect(() => {
        //pegando lista salva no localStorage do navegador com nome de variavel savedItems
        //o retorno vem com o string desse modo estamos converterndo para objeto JSON.
        let savedItems = JSON.parse(localStorage.getItem(SAVED_ITEMS))

        //se tiver elemento salvo na variavel do localStorage, faça:
        if (savedItems) {
            setItems(savedItems)
        }

    }, [])

    //Salvando lista no localStorage sempre que o estado items for atualizado
    //o item deve ser salvo como string no local storage
    useEffect(() => {
        localStorage.setItem(SAVED_ITEMS, JSON.stringify(items))
    }, [items])

    function onAddItem(text) {
        let item = new Item(text);
        setItems([...items, item])
        onHideModal();
    }

    function onItemDeleted(item) {
        let filteredItems = items.filter(it => it.id !== item.id)

        setItems(filteredItems)
    }

    //item => é o array do item que eu cliquei
    // it => é cada elemento do array
    function onDone(item) {
        let updatedItems = items.map(it => {
            if (it.id === item.id) {
                it.done = !it.done;

            }
            return it;
        })
        setItems(updatedItems);
    }

    //ocultar modal ao usuario clicar fora do modal
    function onHideModal(evento) {
        setShowModal(false)
    }

    return (<div className="container">
        <header className="header"><h1>Todo</h1><button onClick={() => { setShowModal(true) }} className='addButton'>+</button></header>

        {/*<TodoForm onAddItem={onAddItem}></TodoForm>*/}

        <List onDone={onDone} onItemDeleted={onItemDeleted} items={items}></List>

        {/*<Passado o estadp ShowModal como propriedade do componente*/}
        <Modal show={showModal} onHideModal={onHideModal}><TodoForm onAddItem={onAddItem}></TodoForm></Modal>
    </div>)
}



export default Todo