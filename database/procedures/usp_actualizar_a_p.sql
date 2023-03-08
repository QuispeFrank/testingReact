DELIMITER $$
CREATE PROCEDURE sp_editar_asistencia_participacion(
    IN p_id_asis INT, -- Id de la asistencia/participación a editar
    IN p_id_cohorte INT, -- Nuevo id de cohorte
    IN p_trimestre VARCHAR(20), -- Nuevo trimestre
    IN p_sesion VARCHAR(20), -- Nueva sesión
    IN p_fecha DATE -- Nueva fecha
)
BEGIN
    UPDATE asistencias_participaciones
    SET id_cohorte = p_id_cohorte,
        trimestre = p_trimestre,
        sesion = p_sesion,
        fecha = p_fecha,
        updated_at = CURRENT_TIMESTAMP
    WHERE id_asis = p_id_asis;
END$$
DELIMITER ;