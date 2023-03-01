import React, { Component } from 'react';
import {Link} from 'react-router-dom'


class MyTable extends Component {
    state = {
        data: [
            {id: 1, codigo: 'per-0922', cohort: 'cohorte19'},
            {id: 2, codigo: 'per-0923', cohort: 'cohorte20'},
            {id: 3, codigo: 'per-0924', cohort: 'cohorte21'},
        ],
        selectedRow: null,
    };

    render() {
        const {data, selectedRow } = this.state;

        return (
          <div>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>CODIGO</th>
                        <th>COHORTE</th>
                    </tr>
                </thead>
                <tbody>
                    {data.map((row) => (
                        <tr key={row.id} onClick={() => this.setState({ selectedRow: row })}>
                            <td>{row.id}</td>
                            <td>{row.codigo}</td>
                            <td>{row.cohort}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
            {selectedRow && (
                <div>
                    <p>Selected Row: {selectedRow.cohort}</p>
                    <Link to={`/asistencias/`}>Asistencias</Link>
                    <Link to={`/evaluaciones/`}>Evaluaciones</Link>
                </div>
            )}
          </div>
        );
    }
}

export default MyTable;