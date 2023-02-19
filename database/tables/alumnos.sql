/*
 * Descripción: Esta tabla almacena información sobre los alumnos que están inscritos en una cohorte en particular.
 * Cada alumno es asociado a un usuario y a una cohorte específica.
 * Dependencias: Esta tabla depende de la tabla `cohortes` para el campo `id_cohorte` y de la tabla `usuarios` para el campo `id_usuario`.
 * Autores y fecha de creación: Este script fue creado por Jhon Chavez el 18/02/2023.
*/


CREATE TABLE alumnos (
    id_alumno int NOT NULL AUTO_INCREMENT, -- Identificador único del alumno
    id_usuario int NOT NULL, -- Identificador del usuario asociado al alumno
    id_cohorte int NOT NULL, -- Identificador de la cohorte a la que pertenece el alumno
    PRIMARY KEY (id_alumno), -- Clave primaria de la tabla
    KEY id_cohorte (id_cohorte), -- Índice de la columna id_cohorte para mejorar el rendimiento en las consultas
    CONSTRAINT alumnos_ibfk_1 FOREIGN KEY (id_cohorte) -- Clave foránea que relaciona el alumno con su cohorte
    REFERENCES cohortes (id_cohorte) ON DELETE CASCADE,
    CONSTRAINT alumnos_ibfk_2 FOREIGN KEY (id_usuario) -- Clave foránea que relaciona el alumno con su usuario
    REFERENCES usuarios (id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB;
