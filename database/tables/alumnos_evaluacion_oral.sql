/*
 * Descripción: Esta tabla almacena información sobre la evaluación oral de un alumno en una cohorte en particular.
 * Para cada evaluación oral, se registra el id de la evaluación, el id del alumno, la asistencia, la nota y una observación.
 * Dependencias: Esta tabla depende de la tabla `evaluacion_oral` para el campo `id_eval` y de la tabla `alumnos` para el campo `id_alumno`.
 * Autores y fecha de creación: Este script fue creado por Jhon Chavez el 18/02/2023.
*/


CREATE TABLE alumnos_evaluacion_oral (
    id_alumnos_eval int NOT NULL AUTO_INCREMENT, -- Identificador único de la evaluación oral del alumno
    id_eval int NOT NULL, -- Identificador de la evaluación oral
    id_alumno int NOT NULL, -- Identificador del alumno evaluado
    asistencia tinyint DEFAULT 0 NOT NULL, -- Valor que indica si el alumno estuvo presente en la evaluación (0 = ausente, 1 = presente)
    nota int DEFAULT 0 NOT NULL, -- Nota obtenida por el alumno en la evaluación
    observacion varchar(100), -- Observación adicional sobre la evaluación
    PRIMARY KEY (id_alumnos_eval), -- Clave primaria de la tabla
    CONSTRAINT alumnos_evaluacion_oral_ibfk_1 FOREIGN KEY (id_eval) -- Clave foránea que relaciona la evaluación del alumno con la evaluación oral correspondiente
    REFERENCES evaluacion_oral (id_eval) ON DELETE CASCADE,
    CONSTRAINT alumnos_evaluacion_oral_ibfk_2 FOREIGN KEY (id_alumno) -- Clave foránea que relaciona la evaluación del alumno con el alumno correspondiente
    REFERENCES alumnos (id_alumno) ON DELETE CASCADE
) ENGINE=InnoDB;
