import React, { useEffect, useState } from "react";
import data from '../Data'
import { useParams } from 'react-router-dom'

//criando um hocks customizado
function useAula() {
    const id = useParams().id
    return data.filter(aula => aula.id == id)[0]
}


export default function Aula(props) {
    /*EXEMPLO SEM A UTILIZAÇÃO DO HOCKS CUSTOMIZADO
    
    //capturando a rota da página
    //const match = useRouteMatch()

    //Outra forma é utilizar o useParams() para selecionar somente o parametro que foi utilizado da URL.
    //No caso o parametro é o ID.
    const params = useParams()

    //criando o estado Aula com um objeto vazio para apresentar na tela
    const [aula, setAula] = useState({})

    //Atualizando a tela toda vez que o params for atualizado
    useEffect(() => {

        //será retornado uma array que possui um objeto(vide arquivo Data.js), sendo assim estamos filtrando o 
        //o index zero para trazer o objeto.
        let aula = data.filter(aula => aula.id == params.id)[0]

        //atualizando o estado Aula
        setAula(aula)

    }, [params])
    */

    const aula = useAula()
    return (
        <div className="page">
            <h1>{aula.title}</h1>
            <h3>{aula.desc}</h3>
        </div>)
}