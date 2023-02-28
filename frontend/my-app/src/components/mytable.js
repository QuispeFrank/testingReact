import React, { Component } from "react";

class MyTable extends Component {
    state = {
        data: [
            {id: 1, codigo: 'per-0922', cohort: 'cohorte19'},
            {id: 2, codigo: 'per-0923', cohort: 'cohorte20'},
            {id: 3, codigo: 'per-0924', cohort: 'cohorte21'},
        ],
        selectedRow: null,
        showAsistencias: false,
        showEvaluaciones: false,
    };

    render() {
        const {data, selectedRow, showAsistencias, showEvaluaciones} = this.state;

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
                        <button onClick={() => this.setState({showAsistencias: true})}> Asistencias </button>
                        <button onClick={() => this.setState({showEvaluaciones: true})}> Evaluaciones </button>
                    </div>
                )}
                {showAsistencias && (
                    <div>
                        <p> en construccion: Implementar nueva pagina de asistencias </p>
                        <button onClick={() => this.setState({showAsistencias: false})}>Volver</button>
                    </div>
                )}
                
                {showEvaluaciones && (
                    <div>
                        <p> en construccion: Implementar nueva pagina de evaluaciones </p>
                        <button onClick={() => this.setState({showEvaluaciones: false})}>Volver</button>
                    </div>
                )}
            </div>
        )
    }
}

export default MyTable;