DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_count_asistencias`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           21/02/2023
    DESCRIPTION:    Retorna la cantidad de asistencias y participaciones
    EXAMPLE:
        CALL usp_count_asistencias(1);
*/

CREATE PROCEDURE usp_count_asistencias(
    IN asis_id INT
)
BEGIN

    SELECT
	count(CASE WHEN asistencia = 1 THEN 1 END) AS asistencias,
	count(CASE WHEN participacion = 1 THEN 1 END) AS participaciones
    FROM
        alumnos_asistencia_participacion
    WHERE
        id_asis = asis_id;
END$$

DELIMITER ;
