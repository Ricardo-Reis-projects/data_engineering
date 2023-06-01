import React from 'react'
import { Fragment } from 'react'

export default function GameOver(props) {
    //se props.show vir verdadeiro, mostrar game over, senão nao mostar nada, utilizando  o <Fragment />
    return (props.show ?
        <div id="gameOver">
            <div>
                Parabéns, você completou o jogo!
            </div>
            <button id="restart" onClick={props.handleRestart}>Jogue Novamente</button>
        </div> : <Fragment />
    )
}