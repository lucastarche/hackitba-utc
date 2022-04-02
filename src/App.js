import React from 'react';
import { Routes, Route } from "react-router-dom";
import Welcome from './components/welcome';

function App() {
  return (
    <div className="App">
      <Routes>
        <Route exact path="/" element={<Welcome />} />
      </Routes>
    </div>
  );
}

export default App;
