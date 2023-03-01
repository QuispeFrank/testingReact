objeto = {
    "data_registro": {
      "id_cohorte": 2222,
      "trimestre": "1ER TRIMESTRE",
      "sesion": "diruno",
      "fecha": "2022-03-2"
    },
    "data_alumnos": [
      {
        "first_name": "Leonel",
        "id_alumno": 79,
        "id_usuario": 80,
        "last_name": "Messi",
        "asistencia": 1,
        "participacion": 1,
        "nro_participaciones": 3
      },
      {
        "first_name": "Cristiano",
        "id_alumno": 80,
        "id_usuario": 81,
        "last_name": "Ronaldo",
        "asistencia": 1,
        "participacion": 0,
        "nro_participaciones": 0
      },
      {
        "first_name": "Kylian",
        "id_alumno": 81,
        "id_usuario": 82,
        "last_name": "Mbape",
        "asistencia": 1,
        "participacion": 1,
        "nro_participaciones": 5          
      }
    ]
  }

print(objeto['data_registro'])
# print(objeto[0])
for alumno in objeto['data_alumnos']:
    # id_asis = registro
    id_alumno = alumno['id_alumno']
    asistencia = alumno['asistencia']
    participacion = alumno['participacion']
    participaciones = alumno['nro_participaciones']
    print(id_alumno)
