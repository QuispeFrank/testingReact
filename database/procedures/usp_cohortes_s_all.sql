DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_cohortes_s_all`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           19/02/2023
    DESCRIPTION:    Returns the list of the all cohorts
    EXAMPLE:
        CALL usp_cohortes_s_cohortes();
*/

CREATE PROCEDURE usp_cohortes_s_all()
BEGIN

    SELECT 
        id_cohorte,
        codigo_cohorte,
        nombre_cohorte
    FROM
        cohortes;

END$$

DELIMITER ;
