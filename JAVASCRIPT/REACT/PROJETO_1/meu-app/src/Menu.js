import React from 'react';


//criando o componente Menu
// função map: para cada item do array retornar um item <li>  da lista.
function Menu(props) {
const listLinks = props.links.map((link, index) => <li key={index}>{link}</li>)

    return (
        <ul className="menu">
            {listLinks}
        </ul>);
}

export default Menu;