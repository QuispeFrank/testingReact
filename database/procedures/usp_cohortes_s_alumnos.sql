DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_cohorte_s_alumnos`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           21/02/2023
    DESCRIPTION:    Returns the list of students of a specific cohort
    EXAMPLE:
        CALL usp_cohortes_s_cohortes(286);
*/

CREATE PROCEDURE usp_cohorte_s_alumnos(
    IN cohort_id INT
)
BEGIN

    SELECT
        alumnos.id_alumno,
        usuarios.first_name,
        usuarios.last_name
    FROM
        alumnos
    INNER JOIN
        usuarios
    ON
        alumnos.id_usuario = usuarios.id_usuario
    WHERE
        alumnos.id_cohorte = cohort_id;
END$$

DELIMITER ;
