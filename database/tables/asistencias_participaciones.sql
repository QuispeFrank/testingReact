/*
 * Descripción: Esta tabla almacena información sobre las asistencias y participaciones de los alumnos de una cohorte en una sesión en particular.
 * Dependencias: Esta tabla depende de la tabla `cohortes` para el campo `id_cohorte`.
 * Autores y fecha de creación: Este script fue creado por <nombre del autor> el <fecha de creación>.
*/


CREATE TABLE asistencias_participaciones (
	id_asis int NOT NULL AUTO_INCREMENT, -- Identificador único de la asistencia/participación
    id_cohorte int NOT NULL, -- Identificador de la cohorte asociada a la asistencia/participación
    trimestre varchar(20) NOT NULL, -- Trimestre al que pertenece la sesión
    sesion varchar(20) NOT NULL, -- Sesión en la que se registró la asistencia/participación
    fecha date NOT NULL, -- Fecha en que se realizó la asistencia/participación
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Fecha de creación de la asistencia/participación
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Fecha de última actualización de la asistencia/participación
	created_by int DEFAULT NULL, -- Identificador del usuario que creó esta asistencia/participación
	updated_by int DEFAULT NULL, -- Identificador del usuario que actualizó esta asistencia/participación
    PRIMARY KEY (id_asis), -- Clave primaria de la tabla
    CONSTRAINT asistencias_participaciones_ibfk_1 FOREIGN KEY (id_cohorte) -- Clave foránea que relaciona la asistencia/participación con su cohorte
    REFERENCES cohortes (id_cohorte) ON DELETE CASCADE,
    CONSTRAINT asistencias_participaciones_ibfk_2 FOREIGN KEY (created_by) -- Clave foránea que relaciona la asistencia/participación con su creador
    REFERENCES usuarios (id_usuario),
    CONSTRAINT asistencias_participaciones_ibfk_3 FOREIGN KEY (updated_by) -- Clave foránea que relaciona la asistencia/participación con su último actualizador
    REFERENCES usuarios (id_usuario)
) ENGINE=InnoDB;
