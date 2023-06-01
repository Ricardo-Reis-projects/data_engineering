import React from 'react'
import CardElement from './CardElement'

export default function gameBoard(props) {
    return (
        <div id="gameBoard">
            {props.cards.map((card, index) =>
                <CardElement handleFlip={props.handleFlip} key={index} card={card}></CardElement>
            )}
        </div>
    )

}