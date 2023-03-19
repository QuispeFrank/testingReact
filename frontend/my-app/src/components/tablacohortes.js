import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

const TablaCohortes = () => {
  const [selectedRow, setSelectedRow] = useState(null);
  const [cohortesData, setCohortesData] = useState(null);

  useEffect(() => {
    fetch('http://127.0.0.1:5000/api/v1/cohortes/all')
      .then(response => response.json())
      .then(data => setCohortesData(data));
  }, []);

  return (
    <div>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>CODIGO</th>
            <th>NOMBRE</th>
          </tr>
        </thead>
        <tbody>
          {cohortesData &&
            cohortesData.map(row => (
              <tr
                key={row.id_cohorte}
                onClick={() => setSelectedRow(row)}
              >
                <td>{row.id_cohorte}</td>
                <td>{row.codigo_cohorte}</td>
                <td>{row.nombre_cohorte}</td>
              </tr>
            ))}
        </tbody>
      </table>
      {selectedRow && (
        <div>
          <p>Selected Row: {selectedRow.nombre_cohorte}</p>
          <Link style={{ margin: '10px', border: 'solid 1px' }} to="/asistencias/" state={{ selectedRow }}>
            Asistencias
          </Link>
          <Link to={`/evaluaciones/`}>Evaluaciones</Link>
        </div>
      )}
    </div>
  );
};

export default TablaCohortes;
