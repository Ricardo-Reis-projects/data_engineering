import React, { useEffect } from "react";

import AuthButton from '../components/AuthButton';

//importando links para renderizar a pagina para as rotas dos componentes criados
import { Link } from 'react-router-dom'
import { useSelector } from "react-redux";

export default function Nav(props) {

    const login = useSelector(state => state)

    const history = useHistory();

    const location = useLocation();

    //verificando atualização do login, se logado direcionar para a pagina principal
    useEffect(() => {
        let { from } = location.state || { from: { pathname: "/" } }
        if (login) {
            history.replace(from)
        }
    }, [login])

    return (<nav className="nav">
        <h1> ProgBr</h1>
        <ul className="nav-links">
            <AuthButton> </AuthButton>
            <li><Link to="/aulas">Aulas</Link></li>
            <li><Link to="/sobre">Sobre</Link></li>
        </ul>
    </nav>)
}