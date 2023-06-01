import React from 'react';
//importandando Header do arquivo Header.js
import Header from './Header';
import Counter from './Counter';
import './App.css';


//utilizando o componente Header do arquivo Header.js, passado as propriedades name, para mudar o titulo e links para
// mudar o menu da pagina
function App() {
  return (
    <div>
      <Header name="R Code" links={["Sobre", "Comprar", "Contato", "Login"]}></Header>
      <Counter count={3}></Counter>
    </div>
  );
}

export default App;
