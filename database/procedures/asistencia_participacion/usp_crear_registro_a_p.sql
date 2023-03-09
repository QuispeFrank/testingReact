DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_crear_registro_a_p`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           19/02/2023
    DESCRIPTION:    Crea un registro de asistencia/participación
    EXAMPLE:
        CALL usp_crear_registro_a_p(286, "3ER TRIMESTRE", "MAÑANA", '2022-11-28');
*/

CREATE PROCEDURE usp_crear_registro_a_p(
    IN cohorte_id_param INT,
    IN trimestre_param VARCHAR(20),
    IN sesion_param VARCHAR(20),
    IN fecha_param TIMESTAMP
    -- IN created_by_param INT,
    -- IN updated_by_param INT
)
BEGIN
    INSERT INTO asistencias_participaciones (id_cohorte, trimestre, sesion, fecha)
    VALUES (cohorte_id_param, trimestre_param, sesion_param, fecha_param);
END$$

DELIMITER ;
