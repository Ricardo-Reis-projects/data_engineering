import './App.css';
import React from 'react';

import Nav from './components/Nav';
import Home from './components/Home';
import Aulas from './components/Aulas';
import Sobre from './components/Sobre';
import Aula from './components/Aula';
import Assistir from './components/Assistir';

//importando o gerenciador de rotas BrowserRouter e apelidando-o de Router, toda a aplicação deve estar dentro da tag.
// Route é o componente  para criar as rotas
// Routes é o componente para impedir o react de usar todas as rotas simultaneamente
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'

import loginReducer from './reducers/loginReducer';
import { createStore } from 'redux'
import { Provider } from 'react-redux'
import PrivateRoute from './components/PrivateRouter';
import Negado from './components/Negado';

const store = createStore(loginReducer)

function App() {
  return (
    <Provider store={store}>
    <Router>
      <div className="App">
        <Nav />
        <Routes>
          <Route path="/sobre" element={<Sobre />} />

          <Route path="/aulas/:id" element={<Aula />} />

          <PrivateRoute path="/aulas" element={<Aulas />} />

          <Route path="/assistir" element={<Assistir />} />

          <Route path="/negado" element={<Negado />} />

          <Route path="/" element={<Home />} />

          <Route path="*" element={<div className="page"> Essa rota não existe</div>} />
        </Routes>

        {/* <Route exact path="/">
            <Home></Home>
          </Route> */}

        {/* <Route path="*">
          <div className="page"> Essa rota não existe</div>
        </Route>*/}

      </div>
    </Router>
    </Provider >
  );
}

export default App;
