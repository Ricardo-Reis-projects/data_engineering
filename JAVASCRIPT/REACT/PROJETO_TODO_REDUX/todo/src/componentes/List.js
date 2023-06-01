import React from 'react';
import ListItem from './ListItem';
import { useSelector } from 'react-redux';


//criando componente List
//className={item.done ? "done item":"item" => se o item.done for igual true, a classe sera done e item, senao só item
function List(props) {
    const items = useSelector(state => state)
    return (<ul>
        {items.map(item => <ListItem key={item.id} item={item} ></ListItem>)}
    </ul>)
}

export default List;