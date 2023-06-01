import React from 'react'
import Card from './Card'

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
    return (<li>
        <Card className={props.item.done ? "done item" : "item"}>
            {props.item.text}
            <div>
                <button onClick={() => { props.onDone(props.item) }}><DoneImg done={props.item.done}></DoneImg></button>
                <button onClick={() => { props.onItemDeleted(props.item) }}>X</button>
            </div>
        </Card>
    </li>)
}

export default ListItem;