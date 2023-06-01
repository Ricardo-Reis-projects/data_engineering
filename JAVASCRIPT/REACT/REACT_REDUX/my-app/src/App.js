import React from 'react';
import './App.css';
//importando os componentes
import Contador from './componentes/Contador'
import Cabecalho from './componentes/Cabecalho'

// importando o createStore para armazenamento do estado
import { createStore, combineReducers } from 'redux'
//importando o reducer controlador do estado
import contadorReducer from './reducers/contadorReducer';

//importando o Provider do react-redux para que todos os componentes da tela tenham acesso ao store do estado
import { Provider } from 'react-redux'

function App() {

  //unindo os reducers em um unico objeto
  const allReducers = combineReducers({ counter: contadorReducer })

  //criando o store para armazenamento do estado
  const store = createStore(allReducers)

  return (
    <div className="App">
      <Provider store={store}>
        <Cabecalho></Cabecalho>
        <Contador></Contador>
      </Provider>
    </div>
  );
}

export default App;
