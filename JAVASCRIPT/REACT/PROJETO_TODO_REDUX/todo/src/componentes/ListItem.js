import React from 'react'
import Card from './Card'
import { useDispatch } from 'react-redux'
import { deleteItem, changeDone } from '../actions/listAction'

//criando componente
function DoneImg(props) {

    //verificando se o atributo done do componente está como true do atruibuto do elemento
    //poderia utilizar uma imagem no return
    if (props.done) {
        return ("Feito")

    } else {
        return ("A Fazer")
    }

}

//criando componente ListItem
//className={item.done ? "done item":"item" => se o item.done for igual true, a classe sera done e item, senao só item
function ListItem(props) {
    const dispatch = useDispatch()
    return (<li>
        <Card className={props.item.done ? "done item" : "item"}>
            {props.item.text}
            <div>
                <button onClick={() => { dispatch(changeDone(props.item.id)) }}><DoneImg done={props.item.done}></DoneImg></button>
                <button onClick={() => { dispatch(deleteItem(props.item.id)) }}>X</button>
            </div>
        </Card>
    </li>)
}

export default ListItem;