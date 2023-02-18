#!/usr/bin/python3
from flask import Blueprint, jsonify

cohorts_api = Blueprint('cohorts', __name__)


@cohorts_api.route('/all', methods=['GET'])
def all_cohorts_basic_data():
    """
    Devuelve informacion basica de todas las cohorts
    existentes en bd
    """
    cohorts = {
        '1': {
            'id': 286,
            'codigo': 'PER-0922',
            'nombre': 'Cohort 19'
        },
        '2': {
            'id': 386,
            'codigo': 'PER-0223',
            'nombre': 'Cohort 20'
        },
        '3': {
            'id': 375,
            'codigo': 'PER-0623',
            'nombre': 'Cohort 21'
        }
    }
    rtn = cohorts
    return jsonify(rtn), 200


@cohorts_api.route('/<int:id>/asistencia-participacion', methods=['GET'])
def all_asistencias_by_cohort_and_date(id):
    """
    Devuelve los ultimos historiales de asistencias y participaciones
    de la cohort especificada
    """
    all_data = {
        'cohort': 19,
        'asistencias': [{
            'fecha': '07/02/2023',
            'trimestre': 1,
            'sesion': 'diurno',
            'asistentes': 19,
            'participaciones': 30
        }, {
            'fecha': '05/02/2023',
            'trimestre': 1,
            'sesion': 'diurno',
            'asistentes': 19,
            'participaciones': 30
        }, {
            'fecha': '28/01/2023',
            'trimestre': 1,
            'sesion': 'diurno',
            'asistentes': 19,
            'participaciones': 30
        }]
    }
    return jsonify(all_data), 200


@cohorts_api.route('/<int:id>/asistencia-participacion/<date>/<sesion>',
                   methods=['GET'])
def all_attendance_by_cohort_and_date(id, date, turn):
    """
    obtiene todas las participaciones y asistencias de todos los alumnos
    de una cohort, en una respectiva fecha y turno
    """
    all_data = {
        'cohort': 19,
        'fecha': '07/02/2023',
        'sesion': 'diurno',
        'trimestre': 1,
        'alumnos': [{
            'id': 4335,
            'firstname': 'Frank',
            'lastname': 'Quispe',
            'asistencia': True,
            'participacion': 5
        }, {
            'id': 5432,
            'firstname': 'Dany',
            'lastname': 'Chavez',
            'asistencia': False,
            'participacion': 0
        }, {
            'id': 3333,
            'firstname': 'John',
            'lastname': 'Chavez',
            'asistencia': True,
            'participacion': 5
        }]
    }
    return jsonify(all_data), 200
