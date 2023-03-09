DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_alumnos_cohorte`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           21/02/2023
    DESCRIPTION:    Retorna la lista de alumnos en una cohorte
    EXAMPLE:
        CALL usp_alumnos_cohorte(286);
*/

CREATE PROCEDURE usp_alumnos_cohorte(
    IN cohorte_id INT
)
BEGIN

    SELECT
        alumnos.id_alumno,
        usuarios.first_name,
        usuarios.last_name,
        usuarios.id_usuario
    FROM
        alumnos
    INNER JOIN
        usuarios
    ON
        alumnos.id_usuario = usuarios.id_usuario
    WHERE
        alumnos.id_cohorte = cohorte_id;
END$$

DELIMITER ;
