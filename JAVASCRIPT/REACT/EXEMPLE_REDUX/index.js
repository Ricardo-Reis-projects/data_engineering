const redux = require('redux')
const createStore = redux.createStore;
//importando o combine reducer para juntar os reducer e armazenar no store
const combineReducer = redux.combineReducers;

//importando o CounterActions
const { incrementAction, decrementAction } = require('./actions/CounterActions')

//importando o ListActions
const {addItemAction} = require('./actions/ListActions')

//importando o counterReducer
const counterReducer = require('./reducer/CounterReducer')

//importando o listReducer
const listReducer = require('./reducer/ListReducer')

//criando objeto para unicar os reducer 
const allReducers = combineReducer({
    counter: counterReducer,
    list: listReducer
})



//Criando o store para armazenar o valor do estado, utilizando a função reducer.
const store = createStore(allReducers)

//atualizando o valor na tela toda vez que o estado for alterado no store.
//comando executado toda vez que o dispatch envia ação ao reducer
store.subscribe(() => { console.log(store.getState()) })

//enviando a ação ao reducer através do dispatch para atualizar a lista
store.dispatch(addItemAction('Um novo item'));

//enviando a ação ao reducer através do dispatch
store.dispatch(incrementAction(2));

//enviando a ação ao reducer através do dispatch
store.dispatch(incrementAction(1));

//enviando a ação ao reducer através do dispatch
store.dispatch(decrementAction(1));