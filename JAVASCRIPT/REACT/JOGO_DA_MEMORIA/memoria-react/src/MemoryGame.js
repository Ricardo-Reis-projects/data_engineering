import React, { useEffect, useState } from 'react'
import GameOver from './componentes/GameOver'
import game from './game/game'
import GameBoard from './componentes/GameBoard'

export default function MemoryGame() {

    //criando estado GameOver
    const [gameOver, setGameOver] = useState(false);

    //criando estado Cards
    const [cards, setCards] = useState([])

    useEffect(() => {
        setCards(game.createCardsFromTechs())
    }, [])

    //função para reiniciar o jogo
    function restart() {
        game.clearCards()
        setCards(game.createCardsFromTechs())
        setGameOver(false)

    }

    function handleFlip(card) {

        game.flipCard(card.id, () => {

            //GameOverCallback
            setGameOver(true)
        }, () => {
            //NoMatchCallback
            setCards([...game.cards])
        })
        setCards([...game.cards])
    }
    return (
        <div>
            <GameBoard handleFlip={handleFlip} cards={cards}></GameBoard>
            <GameOver show={gameOver} handleRestart={restart}></GameOver>
        </div>
    )

}