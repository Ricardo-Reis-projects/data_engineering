
import React, { useState }  from "react";

//componente formulario
function TodoForm(props) {

    //criando um ESTADO de atualização na pagina. com dado inicial vazio
    const [text, setText] = useState("");

    //função js utilizada pelo input para atualizar a lista ao input ser atualizado/digitado
    function handleChange(event) {
        //event.target.value => recupera o valor do elemento 
        let t = event.target.value;
        //modificando o estado text.
        setText(t);
    }

    function AddItem(event) {
        //botões de formulario por default envia os dados de formulario ao banckend via action.
        //para evitar essa ação usa-se o método abaixo
        event.preventDefault();
        //if para adicionar o text a lista, somente se ele não for vazio
        if (text) {
            //atualizando array, incrementando o estado text na lista.
            props.onAddItem(text);
            //Limpando o estado teste
            setText("");
        }
    }
    return (<form>
            <input onChange={handleChange} type="text" value={text}></input>
            <button onClick={AddItem}>Add</button>
        </form>
    )

}


export default TodoForm;