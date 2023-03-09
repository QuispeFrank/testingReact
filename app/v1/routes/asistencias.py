#!/usr/bin/python3
from flask import Blueprint, jsonify, request, abort
import app.v1.controllers.c_asistencias as Controller_asistencias

asistencias_api = Blueprint('asistencias', __name__)


@asistencias_api.route('/<cohorte_id>/all', methods=['GET'])
def registros_asistencias_participaciones(cohorte_id):
    """
    Devuelve informacion basica de todas las cohorts
    existentes en bd
    """
    rtn = Controller_asistencias.obtener_registros_asistencias(cohorte_id)
    return jsonify(rtn), 200

# var = datetime.now().strftime('%Y-%m-%d')


@asistencias_api.route('/nuevo', methods=['POST'])
def nuevo_registro_asistencia_participacion():
    """
    crea un registro en a_p
    """
    content = request.get_json()
    registro = Controller_asistencias.check_nuevo_registro(content)
    rtn = {
        'creado': True,
        'id_asis': registro,
    }

    return jsonify(rtn), 200


@asistencias_api.route('/<asis_id>', methods=['GET', 'PUT', 'DELETE'])
def get_update_registro_a_p(asis_id):
    """
    Devuleve un JSON con el registro de asistencias, participaciones y alumnos
    """
    # if request.method == 'GET':
    if request.method == 'GET':
        rtn = Controller_asistencias.obtener_registro_asistencia(asis_id)
        if rtn == []:
            return abort(404)
        return jsonify(rtn), 200
    
    if request.method == 'PUT':
        """Falta agregar la funcionalidad para actualizar"""
        content = request.get_json()
        check = Controller_asistencias.actualizar_registro_a_p(asis_id, content)
        if check == []:
            return abort(404)
        rtn = {
            'actualizado': True
        }
        return jsonify(rtn), 200
    
    if request.method == 'DELETE':
        check = Controller_asistencias.eliminado_suave(asis_id)
        if check == []:
            return abort(404)
        rtn = {
            'eliminado': True,
            'id_asis': asis_id
        }
        return jsonify(rtn), 200