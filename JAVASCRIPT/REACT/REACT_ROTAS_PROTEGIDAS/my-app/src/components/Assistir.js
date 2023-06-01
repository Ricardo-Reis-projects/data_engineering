//Acessando o parametro da query vinda da url com o useLocation e useQuery (ex query url: localhost:300/assistir?v=exemplo)
//após o "?" vem o parametro da query, no exemplo acima o parametro é o "v" e query "?v=exemplo"
import React from 'react'
import { useLocation } from 'react-router'

//criando  hocks customizado para acessar a query da URL
function useQuery() {
    return new URLSearchParams(useLocation().search)
}

export default function Assistir(props) {

    //executando o hocks customizado para acessar a query da URL
    const query = useQuery()

    return (<div className="page">
        {/*Acessando o parametro "v"  da query vinda da URL */}
        {query.get("v")}
    </div>)
}