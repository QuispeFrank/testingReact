DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_listar_registros_a_p`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           21/02/2023
    DESCRIPTION:    Retorna el registro de asistencias en una cohorte
    EXAMPLE:
        CALL usp_listar_registros_a_p(286);
*/

CREATE PROCEDURE usp_listar_registros_a_p(
    IN cohorte_id INT
)
BEGIN

    SELECT
	id_asis,
    id_cohorte,
    trimestre,
    sesion,
    fecha
    FROM
        asistencias_participaciones
    where
        id_cohorte = cohorte_id and eliminado = 0;
END$$

DELIMITER ;
