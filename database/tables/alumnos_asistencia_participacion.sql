/*
 * Descripción: Esta tabla almacena información sobre la evaluación oral de un alumno en una cohorte en particular.
 * Para cada evaluación oral, se registra el id de la evaluación, el id del alumno, la asistencia, la nota y una observación.
 * Dependencias: Esta tabla depende de la tabla `evaluacion_oral` para el campo `id_eval` y de la tabla `alumnos` para el campo `id_alumno`.
 * Autores y fecha de creación: Este script fue creado por Jhon Chavez el 18/02/2023.
*/


CREATE TABLE alumnos_asistencia_participacion (
    id_alumnos_a_p int NOT NULL AUTO_INCREMENT, -- Identificador único de la tabla alumnos_asistencia_participacion
    id_asis int NOT NULL, -- Identificador único de la tabla asistencias_participaciones
    id_alumno int NOT NULL, -- Identificador único de la tabla alumnos
    asistencia tinyint DEFAULT 0 NOT NULL, -- Valor booleano que indica si el alumno asistió a la sesión
    participacion tinyint DEFAULT 0 NOT NULL, -- Valor booleano que indica si el alumno participó en la sesión
    nro_participaciones int DEFAULT 0 NOT NULL, -- Número de veces que el alumno ha participado en las sesiones
    PRIMARY KEY (id_alumnos_a_p), -- Clave primaria de la tabla
    KEY id_asis (id_asis), -- Clave externa que referencia la tabla asistencias_participaciones
    CONSTRAINT alumnos_asistencia_participacion_ibfk_1 FOREIGN KEY (id_asis) -- Restricción de clave externa
    REFERENCES asistencias_participaciones (id_asis) ON DELETE CASCADE, -- Clave externa que hace referencia a la tabla asistencias_participaciones y elimina en cascada
    CONSTRAINT alumnos_asistencia_participacion_ibfk_2 FOREIGN KEY (id_alumno) -- Restricción de clave externa
    REFERENCES alumnos (id_alumno) ON DELETE CASCADE -- Clave externa que hace referencia a la tabla alumnos y elimina en cascada
) ENGINE=InnoDB;