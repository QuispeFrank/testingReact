#!/usr/bin/python3
from flask import Blueprint, jsonify, request
import app.v1.controllers.c_asistencias as Controller_asistencias

asistencias_api = Blueprint('asistencias', __name__)

@asistencias_api.route('/<cohorte_id>', methods=['GET'])
def registros_asistencia(cohorte_id):
    """
    Devuelve informacion basica de todas las cohorts
    existentes en bd
    """
    rtn = Controller_asistencias.obtener_registro_asistencias(cohorte_id)
    return jsonify(rtn), 200

#var = datetime.now().strftime('%Y-%m-%d')
@asistencias_api.route('/nuevo', methods=['POST'])
def nuevo_registro_asistencia():
    """
    crea un registro en a_p
    [
  {
    "data_registro": {
      "id_cohorte": 2222,
      "trimestre": "1ER TRIMESTRE",
      "sesion": "NOCHE",
      "fecha": "2022-03-1"
    },
    "data_alumnos": [
      {
        "first_name": "Leonel",
        "id_alumno": 79,
        "last_name": "Messi",
        "asistencia": 1,
        "participacion": 1,
        "nro_participaciones": 3
      },
      {
        "first_name": "Cristiano",
        "id_alumno": 80,
        "last_name": "Ronaldo",
        "asistencia": 1,
        "participacion": 0,
        "nro_participaciones": 0
      },
      {
        "first_name": "Kylian",
        "id_alumno": 81,
        "last_name": "Mbape",
        "asistencia": 1,
        "participacion": 1,
        "nro_participaciones": 5          
      }
    ]
  }
]
    """
    content = request.get_json()
    registro = Controller_asistencias.check_nuevo_registro(content)
    rtn = {
        'creado': True,
        'id_asis': registro,
    }

    return jsonify(rtn), 200
