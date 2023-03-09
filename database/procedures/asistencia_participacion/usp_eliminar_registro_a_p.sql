DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_eliminar_registro_a_p`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           21/02/2023
    DESCRIPTION:    Elimina un registro a_p por medio de su asis_id
    EXAMPLE:
        CALL usp_eliminar_registro_a_p(286);
*/

CREATE PROCEDURE usp_eliminar_registro_a_p(
    IN p_id_asis INT
)
BEGIN
  UPDATE asistencias_participaciones SET eliminado = 1 WHERE id_asis = p_id_asis;
END$$

DELIMITER ;
