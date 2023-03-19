import { Component } from "react";
import TablaCohortes from "./components/tablacohortes.js";
import Asistencias from "./components/asistencias.js";
import Evaluaciones from "./components/evaluaciones.js";
import AsistenciaPopUp from "./components/asisPopUp.js";
import { Routes, Route } from "react-router-dom";
import './styles/app.css';

class App extends Component {
  // state = {
    // cohortesData: null,
    // asistenciasList: null,
    // evaluacionesList: null
  // };

  // componentDidMount() {
  //   this.solicitudApi(
  //     "http://127.0.0.1:5000/api/v1/asistencia-participacion/286/all",
  //     "asistenciasList"
  //   );
    // this.solicitudApi('')
  // }

  // solicitudApi = (url, stateKey) => {
  //   fetch(url)
  //     .then((response) => response.json())
  //     .then((data) => {
  //       this.setState({ [stateKey]: data });
  //     });
  // };
  render() {
    return (
      <div className="App">
        <Routes>
          <Route path="/" element={<TablaCohortes />} />
          <Route path="/asistencias" element={<Asistencias />} />
          <Route path="/evaluaciones" element={<Evaluaciones />} />
          <Route path="/asispopup" element={<AsistenciaPopUp />} />
        </Routes>
      </div>
    );
  }
}

export default App;
