import React from 'react';
import './App.css'
//importando o componente menu
import Menu from './Menu'

//função retorna um header para utilizar em todas as telas
//utilizando o atributo props para mudar o titulo da pagina
function Header(props) {
    return (
        //utiliza-se className no react pois o html ja possui a palavra reservada class
        <header className="header">
            <h1>{props.name}</h1>
            <Menu links={props.links}></Menu>
        </header>);
}



export default Header;