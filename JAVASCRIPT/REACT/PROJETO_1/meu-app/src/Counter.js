


// exemplo utilizando função com Hooks de estados(useState) para o gerenciamento de estados 
// função é o modelo mais atual para trabalhar com react 
import React, { useEffect, useState } from 'react';

function Counter(props) {

    //criando um estado utilizando hooks
    const [count, setContador] = useState(props.count)

    //similar ao componentDidMount e o componentDidUpdate do class. que é executado ao ser criado ou atualizado
    useEffect(() => {
        //atualizando estado
        setContador(parseInt(localStorage.getItem("count")));

        //é executado quando o elemento é removido da tela
        //similar ao componentWillUnmount do class
        return () => {
            console.log("Não tem mais contador")
        }

        // comando sera executado uma vez quando qualquer estado da página for atualizado, se remover "[]" sera executado toda vez
    }, []);



    //utilizando o metodo useEffect que é chamado quando o componente é criado
    // ou quando ele for atualizado
    //similar ao componentDidMount e o componentDidUpdate do class. que é executado ao ser criado ou atualizado
    useEffect(() => {
        document.title = count
        //salvando dado na memoria/cache do navegador
        localStorage.setItem("count", count);
        // comando sera executado somente quando o estado count for atualizado   
    }, [count]);


    function add() {
        setContador(count + 1);
        console.log("atualizar");
    }

    return (
        <div>
            <h1>Counter: {count}</h1>
            <button onClick={add}>add</button>
        </div>
    )
}




/*
import React from 'react';


class Counter extends React.Component {

    constructor(props) {
        super(props);

        // definindo estado inicial do count utilizando o construtor
        this.state = { count: 0 }


        this.add = this.add.bind(this)
    }

    //pegando dado salvo na memoria/cache
    componentDidMount() {
        document.title = this.state.count
        this.setState(JSON.parse(localStorage.getItem('state')))
    }

    add() {
        //alterando o estado da página e utilizando função callback
        this.setState((state) => { return { count: state.count + 1 } }, () => {
            console.log(this.state)

        }


        )
    }

    componentDidUpdate() {
         document.title = this.state.count

        //salvando dado na memoria/cache do navegador
        localStorage.setItem("state", JSON.stringify(this.state))
    }

    //é executado quando o elemento é removido da tela
    componentWillUnmount() {

    }

    render() {
        return (<div>
            <h1>Counter:{this.state.count}</h1>
            <button onClick={this.add}>Add</button>
        </div>)
    }
}
*/
export default Counter;