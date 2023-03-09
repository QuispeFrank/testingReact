DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_obtener_registro_a_p`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           21/02/2023
    DESCRIPTION:    Retorna los datos de un registro asistencia_participacion con su id_asis
    EXAMPLE:
        CALL usp_obtener_registro_a_p(76);
*/

CREATE PROCEDURE usp_obtener_registro_a_p(
    IN p_id_asis INT
)
BEGIN

    SELECT
    id_cohorte,
    trimestre,
    sesion,
    fecha
    FROM
        asistencias_participaciones
    where
        id_asis = p_id_asis and eliminado = 0;
END$$

DELIMITER ;
