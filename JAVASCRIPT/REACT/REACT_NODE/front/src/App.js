
import './App.css';
import React, { useEffect, useState } from 'react';

function App() {

  //criando o estado videos
  const [videos, setVideos] = useState([]);

  //useEffect para atualizar a pagina toda vez que for carregada
  useEffect(() => {

    //chamndo a rota '/api/videos' do node
    fetch('/api/videos').then(res => res.json()).then(data => {
      setVideos(data);
    })

  }, [])

  return (
    <div className="App">
      <header className="App-header">

        {videos.map((id, index) => {
          return (<a key={index} href={`https://youtube.com/watch?v=${id}`}>
            <img src={`https://img.youtube.com/vi${id}/0.jpg`}></img>
          </a>)
        })}

      </header>
    </div>
  );
}

export default App;
