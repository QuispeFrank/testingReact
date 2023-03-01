import React, { Component } from "react";
import MyTable from './components/mytable.js';
import Asistencias from './components/asistencias.js';
import Evaluaciones from './components/evaluaciones.js';
import { Routes, Route } from 'react-router-dom'

class App extends Component {
  render() {
    return(
      <div className="App">
        <Routes>
          <Route path='/*' element={ <MyTable/> }/>
          <Route path='/asistencias' element={ <Asistencias/> }/>
          <Route path='/evaluaciones' element={ <Evaluaciones/> }/>
        </Routes>
      </div>
    )
  }
}

export default App;
