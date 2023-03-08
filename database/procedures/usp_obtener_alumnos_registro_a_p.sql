DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_obtener_alumnos_registro_a_p`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           21/02/2023
    DESCRIPTION:    Retorna los datos de un registro asistencia_participacion con su id_asis
    EXAMPLE:
        CALL usp_obtener_alumnos_registro_a_p(76);
*/

CREATE PROCEDURE usp_obtener_alumnos_registro_a_p(
    IN p_id_asis INT
)
BEGIN

    SELECT
    usuarios.first_name,
    usuarios.last_name,
    alumnos.id_alumno,
    alumnos_asistencia_participacion.asistencia,
    alumnos_asistencia_participacion.participacion,
    alumnos_asistencia_participacion.nro_participaciones
    FROM
        alumnos_asistencia_participacion
    INNER JOIN alumnos ON alumnos_asistencia_participacion.id_alumno = alumnos.id_alumno
    INNER JOIN usuarios ON alumnos.id_usuario = usuarios.id_usuario
    WHERE
        alumnos_asistencia_participacion.id_asis = p_id_asis;
END$$

DELIMITER ;
