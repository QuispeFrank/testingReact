user="$1"

cat database/make_database.sql\
    database/tables/roles.sql\
    database/tables/usuarios.sql\
    database/tables/cohortes.sql\
    database/tables/alumnos.sql\
    database/tables/asistencias_participaciones.sql\
    database/tables/evaluacion_oral.sql\
    database/tables/alumnos_asistencia_participacion.sql\
    database/tables/alumnos_evaluacion_oral.sql\
    database/data_dummy.sql\
| mysql -u"$user" -p