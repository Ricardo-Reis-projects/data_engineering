import React from 'react';
import ListItem from './ListItem';


//criando componente List
//className={item.done ? "done item":"item" => se o item.done for igual true, a classe sera done e item, senao só item
function List(props) {
    return (<ul>
        {props.items.map(item => <ListItem key={item.id} item={item} onDone={props.onDone} onItemDeleted ={props.onItemDeleted}></ListItem>)}
    </ul>)
}

export default List;