import React, { useState, useEffect } from "react";
import { BsTrash } from "react-icons/bs";
import { FaPencilAlt } from "react-icons/fa";
import { RiAddFill } from "react-icons/ri";
import { useLocation } from "react-router-dom";
import AsistenciaPopUp from "./asisPopUp";

const Asistencia = () => {
  const [showPopUp, setShowPopUp] = useState(false);
  const [asistenciasList, setAsistenciasList] = useState([]);
  let { state } = useLocation();

  useEffect(() => {
    solicitudApi(
      `http://127.0.0.1:5000/api/v1/asistencia-participacion/${state.selectedRow.id_cohorte}/all`,
      "asistenciasList"
    );
    console.log('hola realice una solicitud api en asistencias ^^')
  }, [showPopUp]);


  const solicitudApi = (url, stateKey) => {
    fetch(url)
      .then((response) => response.json())
      .then((data) => { setAsistenciasList(data); })
      .catch((error) => {
        console.log("Ha ocurrido un Error: ", error);
      });
  };

  // cerrar popUp
  const closePopUp = () => {
    setShowPopUp(false);
  };

  const fechaClasica = (fechaTextoGMT) => {
    const fecha = new Date(fechaTextoGMT);
    const dia = `${fecha.getUTCDate()}`.padStart(2, "0");
    const mes = `${fecha.getUTCMonth() + 1}`.padStart(2, "0");
    const anio = fecha.getUTCFullYear();
    return `${dia}/${mes}/${anio}`;
  };

  return (
    <div>
      <div className="asistencias">
        {/* titulos */}
        <div className="asistencia__header">
          <h2>Asistencias/ Participaciones</h2>
          <h3>{state.selectedRow.nombre_cohorte}</h3>
          <hr />
        </div>

        {/* tabla y datos */}
        <table>
          <thead>
            <tr>
              <th>Fecha</th>
              <th>Trimestre</th>
              <th>Sesion</th>
              <th>Asistencias</th>
              <th>Participaciones</th>
            </tr>
          </thead>
          <tbody>
            {asistenciasList.map((asistencia, index) => (
              <tr key={index}>
                <td>{fechaClasica(asistencia.fecha)}</td>
                <td>{asistencia.trimestre}</td>
                <td>{asistencia.sesion}</td>
                <td>{asistencia.asistencias}</td>
                <td>{asistencia.participaciones}</td>
              </tr>
            ))}
          </tbody>
        </table>

        {/* botones */}
        <div className="buttons">
          <button
            style={{ background: "#48c78e", border: "1px solid #48c78e" }}
            onClick={() => setShowPopUp(true)}
          >
            <RiAddFill /> Nuevo
          </button>
          <button
            style={{
              background: " #ffe08a",
              border: "1px solid  #ffe08a",
              color: "black",
            }}
          >
            <FaPencilAlt /> Editar
          </button>
          <button
            style={{ background: "#f14668", border: "1px solid #f14668" }}
          >
            <BsTrash /> Eliminar
          </button>
        </div>

        {showPopUp && <AsistenciaPopUp closePopUp={ closePopUp } cohorteData={ state.selectedRow } />}
      </div>
    </div>
  );
};

export default Asistencia;
