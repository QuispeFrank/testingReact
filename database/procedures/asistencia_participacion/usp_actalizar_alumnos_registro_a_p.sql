DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_actalizar_alumnos_registro_a_p`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           19/02/2023
    DESCRIPTION:    Actualiza un registro de algun alumno con el id_asis de asistencia/participación
    EXAMPLE:
        CALL usp_actalizar_alumnos_registro_a_p(286, "3ER TRIMESTRE", "MAÑANA", '2022-11-28');
*/

CREATE PROCEDURE usp_actalizar_alumnos_registro_a_p(
    IN p_id_alumnos_a_p int,
    IN p_asistencia int,
    IN p_participacion int,
    IN p_nro_participaciones int
)
BEGIN
    UPDATE
        alumnos_asistencia_participacion
    SET
        asistencia = p_asistencia,
        participacion = p_participacion,
        nro_participaciones = p_nro_participaciones
    WHERE
        id_alumnos_a_p = p_id_alumnos_a_p;
END$$

DELIMITER ;
