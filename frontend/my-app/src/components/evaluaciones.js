import React, { Component } from "react";
import { Link } from "react-router-dom";

class Evaluaciones extends Component {
    render() {
      return (
        <div>
          <h1> me extrañabas? </h1>
          <p> asi es estas en evaluaciones felicidades!! </p>
          <Link to={`/`}>Volver</Link>
        </div>
        );
    }
}


export default Evaluaciones;