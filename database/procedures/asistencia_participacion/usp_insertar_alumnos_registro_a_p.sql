DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_insertar_alumnos_registro_a_p`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           26/02/2023
    DESCRIPTION:    Inserta un registro en la tabla alumnos_asistencia_participacion
        CALL usp_insertar_alumnos_registro_a_p(1, 1, 1, 1, 2);
*/

CREATE PROCEDURE usp_insertar_alumnos_registro_a_p(
    IN id_asis_param INT,
    IN id_alumno_param INT,
    IN asistencia_param TINYINT,
    IN participacion_param TINYINT,
    IN nro_participaciones_param INT
)
BEGIN
    INSERT INTO alumnos_asistencia_participacion (
        id_asis,
        id_alumno,
        asistencia,
        participacion,
        nro_participaciones
    ) VALUES (
        id_asis_param,
        id_alumno_param,
        asistencia_param,
        participacion_param,
        nro_participaciones_param
    );
END$$

DELIMITER ;
