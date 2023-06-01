import './App.css';
import React from 'react';

import Nav from './components/Nav';
import Home from './components/Home';
import Aulas from './components/Aulas';
import Sobre from './components/Sobre';
import Assistir from './components/Assistir';
import Aula from './components/Aula';

//importando o gerenciador de rotas BrowserRouter e apelidando-o de Router, toda a aplicação deve estar dentro da tag.
// Route é o componente  para criar as rotas
// Routes é o componente para impedir o react de usar todas as rotas simultaneamente
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'

function App() {
  return (
    <Router>
      <div className="App">
        <Nav />
        <Routes>
          <Route path="/sobre" element={<Sobre />} />

          <Route path="/aulas/:id" element={<Aula />} />

          <Route path="/aulas" element={<Aulas />} />

          <Route path="/assistir" element={<Assistir />} />

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
  );
}

export default App;
