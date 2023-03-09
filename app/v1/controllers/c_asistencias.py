from ..data.asistencias_data import AsistenciasData

def obtener_registros_asistencias(cohorte_id):
    o_asistencias = AsistenciasData()
    registros = o_asistencias.listar_registros_a_p(cohorte_id)

    for registro in registros:
        id_asis = registro['id_asis']
        asistencias_participaciones = o_asistencias.contar_participaciones_alumnos(id_asis)
        for key, value in asistencias_participaciones[0].items():
            registro[key] = value

    return registros

#   (286, '3ER TRIMESTRE', 'MAÑANA', '2022-11-28'),
def check_nuevo_registro(content):
    o_asistencias = AsistenciasData()

    id_cohorte = content[0]['data_registro']['id_cohorte']
    fecha = content[0]['data_registro']['fecha']
    trimestre = content[0]['data_registro']['trimestre']
    sesion = content[0]['data_registro']['sesion']

    # se crea un registro en la tabla asistencias_particiones
    registro = o_asistencias.crear_registro_a_p([id_cohorte, trimestre, sesion, fecha])
    
    # Iteramos cada dato de alumno y lo agregamos a la tabla alumnos_asistenci, participación
    for alumno in content[0]['data_alumnos']:
        id_asis = registro['id']
        id_alumno = alumno['id_alumno']
        asistencia = alumno['asistencia']
        participacion = alumno['participacion']
        participaciones = alumno['nro_participaciones']
        o_asistencias.agregar_alumnos_a_p([id_asis, id_alumno, asistencia, participacion, participaciones])

    return registro['id']


def obtener_registro_asistencia(id_asis):
    o_asistencias = AsistenciasData()
    data_registro = o_asistencias.obtener_registro_a_p(id_asis)
    if data_registro == []:
        return []
    data_alumnos = o_asistencias.data_alumnos_obtener_registro_a_p(id_asis)
    new_dict = {
        'data_registro': data_registro,
        'data_alumnos': data_alumnos 
    }

    return [new_dict]

def actualizar_registro_a_p(id_asis, content):
    o_asistencias = AsistenciasData()

    check = obtener_registro_asistencia(id_asis)
    if check == []:
        return []

    trimestre = content[0]['data_registro']['trimestre']
    sesion = content[0]['data_registro']['sesion']

    o_asistencias.actualizar_registro_a_p([id_asis, trimestre, sesion])

    for alumno in content[0]['data_alumnos']:
        id_alumno_a_p = alumno['id_alumnos_a_p']
        asistencia = alumno['asistencia']
        participacion = alumno['participacion']
        participaciones = alumno['nro_participaciones']
        o_asistencias.actualizar_alumno_registro_a_p([id_alumno_a_p, asistencia, participacion, participaciones])

def eliminado_suave(id_asis):
    o_asistencias = AsistenciasData()
    data_registro = o_asistencias.obtener_registro_a_p(id_asis)
    if data_registro == []:
        return []
    o_asistencias.eliminar_registro_a_p(id_asis)