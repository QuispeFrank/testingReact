DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_all_cohortes`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           19/02/2023
    DESCRIPTION:    Retorna la lista de todas las cohortes
    EXAMPLE:
        CALL usp_all_cohortes();
*/

CREATE PROCEDURE usp_all_cohortes()
BEGIN

    SELECT 
        id_cohorte,
        codigo_cohorte,
        nombre_cohorte
    FROM
        cohortes;

END$$

DELIMITER ;
