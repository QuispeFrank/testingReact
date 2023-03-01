from ..data.asistencias_data import AsistenciasData

def obtener_registro_asistencias(cohorte_id):
    o_asistencias = AsistenciasData()
    registros = o_asistencias.listar_registros_a_p(cohorte_id)

    for registro in registros:
        id_asis = registro['id_asis']
        asistencias_participaciones = o_asistencias.contar_participaciones_alumnos(id_asis)
        #print(registro)
        for key, value in asistencias_participaciones[0].items():
            registro[key] = value

    return registros

#   (286, '3ER TRIMESTRE', 'MAÑANA', '2022-11-28'),
def check_nuevo_registro(content):
    o_asistencias = AsistenciasData()

    id_cohorte = content['data_registro']['id_cohorte']
    fecha = content['data_registro']['fecha']
    trimestre = content['data_registro']['trimestre']
    sesion = content['data_registro']['sesion']

    # se crea un registro en la tabla asistencias_particiones
    registro = o_asistencias.crear_registro_a_p([id_cohorte, trimestre, sesion, fecha])
    
    # Iteramos cada dato de alumno y lo agregamos a la tabla alumnos_asistenci, participación
    for alumno in content['data_alumnos']:
        id_asis = registro['id']
        id_alumno = alumno['id_alumno']
        asistencia = alumno['asistencia']
        participacion = alumno['participacion']
        participaciones = alumno['nro_participaciones']
        o_asistencias.agregar_alumnos_a_p([id_asis, id_alumno, asistencia, participacion, participaciones])

    return registro['id']

