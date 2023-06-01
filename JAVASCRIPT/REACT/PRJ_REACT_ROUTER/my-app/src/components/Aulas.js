import React, { useEffect,  useState } from "react";
import data from '../Data';

//importando links para renderizar a pagina para as rotas dos componentes criados
//useRouteMatch para utilizar as rotas já declaradas anteriormente
import { Link, useMatch } from 'react-router-dom'


export default function Aulas(props) {
    //capturando a rota que chegou até essa pagina para acrescentar na apresentação dos curso
    const match = useMatch()

    //criando o estado url
    const [url, setUrl] = useState("")
    //UseEffect será executado toda vez que o match for atualizado
    useEffect(() => {
        //verificando se o ultimo caracter da url é "/", senão for ele acrescenta a barra a força
        const newUrl = match.url.slice(-1) === '/' ? match.url : match.url + '/'

        //Atualizando o estado URL
        setUrl(newUrl)
    }, [match])


    return (
        <div className="page">
            <h1>Aulas</h1>
            <ul className="aulas">
                {data.map(aula =>
                    <li key={aula.id}>
                        <Link to={`${url}${aula.id}`} className="link">{aula.title}</Link>
                    </li>
                )}
            </ul>
        </div>)

}