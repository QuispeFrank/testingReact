DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_actualizar_registro_a_p`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           19/02/2023
    DESCRIPTION:    Actualiza un registro de asistencia/participación
    EXAMPLE:
        CALL usp_actualizar_registro_a_p(286, "3ER TRIMESTRE", "MAÑANA", '2022-11-28');
*/

CREATE PROCEDURE usp_actualizar_registro_a_p(
    IN p_id_asis INT, -- Id de la asistencia/participación a editar
    IN p_trimestre VARCHAR(20), -- Nuevo trimestre
    IN p_sesion VARCHAR(20) -- Nueva sesión
)
BEGIN
    UPDATE
        asistencias_participaciones
    SET
        trimestre = p_trimestre,
        sesion = p_sesion,
        updated_at = CURRENT_TIMESTAMP
    WHERE
        id_asis = p_id_asis;
END$$

DELIMITER ;
