import React from "react";
import { useSelector, useDispatch } from 'react-redux'

// criando o componente contador
function Contador(props) {

    //Selecionando o estado counter, do combineReducer
    const contador = useSelector((state) => { return state.counter })
    //criando o dispatch para enviar a ação ao reducer
    const dispatch = useDispatch()

    return (<div>
        <div>{contador}</div>
        <button onClick={() => { dispatch({ type: 'DECREMENT' }) }}>-</button>
        <button onClick={() => { dispatch({ type: 'INCREMENT' }) }}>+</button>
    </div>)
}

export default Contador;