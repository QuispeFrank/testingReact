DELIMITER $$
DROP PROCEDURE IF EXISTS `usp_usuario_s_usuario`$$

/*
    AUTHOR:         Dany Chavez
    DATE:           19/02/2023
    DESCRIPTION:    Returns the list of the all cohorts
    EXAMPLE:
        CALL usp_cohortes_s_cohortes('admin');
*/
CREATE PROCEDURE usp_usuario_s_usuario(
    IN p_username VARCHAR(50)
)
BEGIN

    SELECT 
        `usuario_id`,
        `username`,
        `email`,
        `password`
    FROM
        `usuario`
    WHERE 
        `eliminado` = 0
        AND `username` = p_username;

END$$

DELIMITER ;