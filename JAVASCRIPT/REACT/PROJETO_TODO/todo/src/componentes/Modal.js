import React from "react"
//import { useState } from "react/cjs/react.development"
import Card from "./Card"

function Modal(props) {

    function hideModal(evento) {
        let target = evento.target;
        if (target.id === 'modal') {
            props.onHideModal();
        }
    }


    //se show for verdadeiro, colocar classe Modal, senão classe modal e hide
    return (<div id="modal" onClick={hideModal} className={props.show ? "modal" : "model hide"}>
        <Card className="cardModal">
            {/*passando o componente filho para o componente Model*/}
            {props.children}
        </Card>
    </div>)


}

export default Modal