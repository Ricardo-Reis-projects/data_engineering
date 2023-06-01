import React, {  useState } from 'react'
import './Todo.css'
//importando componente Lista
import List from './componentes/List';
//importando componente TodoForm
import TodoForm from './componentes/TodoForm';

import Modal from './componentes/Modal';

import { createStore } from 'redux'
import { Provider } from 'react-redux'
import listReducer from './reducers/listReducer';


const SAVED_ITEMS = "savedItems"

function persistState(state) {
    localStorage.setItem(SAVED_ITEMS, JSON.stringify(state));
}

function loadState() {
    const actualState = localStorage.getItem(SAVED_ITEMS);
    if (actualState)
        return JSON.parse(actualState)
    else
        return []
}

const store = createStore(listReducer, loadState())

//persistindo os dados no local store do navegador
store.subscribe(()=>{
    persistState(store.getState())
})

function App() {

    //criando um ESTADO de atualização na pagina do  tipo array. com dado inicial vazio para arualizar a lista
    // const [items, setItems] = useState([]);

    //criando um estado para mostrar o Modal
    const [showModal, setShowModal] = useState(false)


    //ocultar modal ao usuario clicar fora do modal
    function onHideModal(evento) {
        setShowModal(false)
    }

    return (<div className="container">
        <Provider store={store}>
            <header className="header"><h1>Todo</h1><button onClick={() => { setShowModal(true) }} className='addButton'>+</button></header>

            {/*<TodoForm onAddItem={onAddItem}></TodoForm>*/}

            <List ></List>

            {/*<Passado o estadp ShowModal como propriedade do componente*/}
            <Modal show={showModal} onHideModal={onHideModal}><TodoForm onHideModal={onHideModal} ></TodoForm></Modal>
        </Provider>
    </div>)
}



export default App