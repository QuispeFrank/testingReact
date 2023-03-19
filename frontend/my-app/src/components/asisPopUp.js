import React, { useState, useEffect, useRef } from "react";
import axios from "axios";

const AsistenciaPopUp = ({ closePopUp, cohorteData }) => {
  // const [showPopUp, setShowPopUp] = useState(false);
  const sesionRef = useRef(null);
  const trimestreRef = useRef(null);
  const fechaRef = useRef(null);
  const [alumnos, setAlumnos] = useState(null);
  const [dataRegistro, setDataRegistro] = useState(null);
  const [dataAlumnos, setDataAlumnos] = useState(null);

  //=================USEFFECTS=========/
  useEffect(() => {
    getAlumnos(
      `http://127.0.0.1:5000/api/v1/cohortes/${cohorteData.id_cohorte}/alumnos`
    );
  }, []);

  //=================FUNCTIONS=========/
  // solicitud a la API [GET]
  const getAlumnos = (url) => {
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        const data_alumnos = data.map((alumno) => ({
          id_alumno: alumno.id_alumno,
          asistencia: 1,
          nro_participaciones: 0,
          participacion: 0,
        }));
        setAlumnos(data);
        setDataAlumnos(data_alumnos);
      })
      .catch((error) => {
        console.log("Ha ocurrido un Error: ", error);
      });
  };

  // devuelve la fecha actual en formato: day/month/year
  const fechaHoy = (f = null) => {
    const today = new Date();
    const day = `${today.getDate()}`.padStart(2, "0");
    const month = `${today.getMonth() + 1}`.padStart(2, "0");
    const year = `${today.getFullYear()}`;
    if (f === "P") {
      return `${year}-${month}-${day}`;
    } else {
      return `${day}/${month}/${year}`;
    }
  };

  // nuevo envio de registros de asistencias y participaciones [POST] a la api

  const enviarRegistros = () => {
    const dataRegistro = {
      id_cohorte: cohorteData.id_cohorte,
      trimestre: trimestreRef.current.value,
      sesion: sesionRef.current.value,
      fecha: fechaHoy("P"),
    };

    const data = [
      {
        data_registro: dataRegistro,
        data_alumnos: dataAlumnos,
      },
    ];

    const url_post = "http://127.0.0.1:5000/api/v1/asistencia-participacion/nuevo";
    axios.post(url_post, data, {
        headers: { "Content-Type": "application/json" },
      })
      .then((response) => {
        console.log(response.data);
        closePopUp();
      })
      .catch((error) => {
        console.log(error);
      });

    console.log(
      JSON.stringify([
        {
          data_registro: dataRegistro,
          data_alumnos: dataAlumnos,
        },
      ])
    );
    // closePopUp();
  };

  //onChange checkbox
  const handleAsistenciaChange = (index, value, element) => {
    const data_alumnos = [...dataAlumnos];
    data_alumnos[index].asistencia = value >= 1 ? 1 : 0;
    const row = element.parentNode.parentNode;
    const participaciones = row.querySelector('input[type="number"]');
    if (value === false) {
      participaciones.value = 0;
      handleParticipacionesChange(index, 0);
      participaciones.disabled = true;
    } else {
      participaciones.disabled = false;
    }

    setDataAlumnos(data_alumnos);
    console.log("checked funcionando?");
  };

  //onChange participaciones
  const handleParticipacionesChange = (index, value) => {
    const data_alumnos = [...dataAlumnos];
    data_alumnos[index].nro_participaciones = parseInt(value);
    data_alumnos[index].participacion = parseInt(value) >= 1 ? 1 : 0;
    setDataAlumnos(data_alumnos);
    console.log("texto funcionando?");
  };

  return (
    <div>
      <div className="titulo">
        <h2>{cohorteData.nombre_cohorte}</h2>
      </div>
      <div className="headerMeta">
        <input
          ref={fechaRef}
          type="text"
          disabled={true}
          placeholder={`${fechaHoy()}`}
        ></input>
        <select ref={sesionRef}>
          <option>MAÑANA</option>
          <option>TARDE</option>
        </select>
        <select ref={trimestreRef}>
          <option>1ER TRIMESTRE</option>
          <option>2DO TRIMESTRE</option>
          <option>3ER TRIMESTRE</option>
        </select>
      </div>
      <div className="asis-pop-table">
        <table>
          <thead>
            <th>Alumno</th>
            <th>Asistencia</th>
            <th>Participaciones</th>
          </thead>
          <tbody>
            {alumnos &&
              alumnos.map((alumno, index) => (
                <tr key={alumno.id_alumno}>
                  <td>
                    {alumno.first_name} {alumno.last_name}
                  </td>
                  <td>
                    <input
                      type="checkbox"
                      defaultChecked={true}
                      onChange={(e) =>
                        handleAsistenciaChange(
                          index,
                          e.target.checked,
                          e.target
                        )
                      }
                    />
                  </td>
                  <td>
                    <input
                      type="number"
                      placeholder="0"
                      value={dataAlumnos[index]?.participaciones}
                      onChange={(e) =>
                        handleParticipacionesChange(index, e.target.value)
                      }
                    />
                  </td>
                </tr>
              ))}
          </tbody>
        </table>
      </div>
      <div>
        <button onClick={enviarRegistros}>Grabar</button>
        <button onClick={closePopUp}>Cancelar</button>
      </div>
    </div>
  );
};

export default AsistenciaPopUp;
