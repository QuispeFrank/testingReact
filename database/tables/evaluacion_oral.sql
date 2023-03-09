/* 
 * Descripción: Esta tabla almacena información sobre las evaluaciones orales que se realizan durante un trimestre para una cohorte en particular.
 * Cada evaluación oral tiene una fecha y es asociada a una cohorte.
 * Dependencias: Esta tabla depende de la tabla `cohortes` para el campo `id_cohorte`.
 * Autores y fecha de creación: Este script fue creado por Jhon Chavez el 18/02/2023.
*/

CREATE TABLE evaluacion_oral (
	id_eval int NOT NULL AUTO_INCREMENT, -- Identificador único de la evaluación oral
    id_cohorte int NOT NULL, -- Identificador de la cohorte asociada a la evaluación
    trimestre varchar(20) NOT NULL,  -- Trimestre al que pertenece la evaluación
    fecha date NOT NULL,  -- Fecha en que se realizó la evaluación
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Fecha de creación de la evaluación
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Fecha de última actualización de la evaluación
	created_by int DEFAULT NULL, -- Identificador del usuario que creó esta evaluación
	updated_by int DEFAULT NULL, -- Identificador del usuario que actualizó esta evaluación
    eliminado tinyint DEFAULT 0 NOT NULL,
    PRIMARY KEY (id_eval), -- Clave primaria de la tabla
    CONSTRAINT evaluacion_oral_ibfk_1 FOREIGN KEY (id_cohorte) -- Clave foránea que relaciona la evaluación con su cohorte
    REFERENCES cohortes (id_cohorte) ON DELETE CASCADE,
    CONSTRAINT evaluacion_oral_ibfk_2 FOREIGN KEY (created_by) -- Clave foránea que relaciona la evaluación con su creador
    REFERENCES usuarios (id_usuario),
    CONSTRAINT evaluacion_oral_ibfk_3 FOREIGN KEY (updated_by) -- Clave foránea que relaciona la evaluación con su último actualizador
    REFERENCES usuarios (id_usuario)
) ENGINE=InnoDB;
