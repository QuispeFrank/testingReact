/*
 * Descripción: Esta tabla almacena información de los usuarios en el sistema.
 * Los usuarios están asociados a un rol que determina los permisos y el acceso que tienen en la aplicación.
 * Dependencias: Esta tabla depende de la tabla `roles` para el campo `id_rol`.
 * Autores y fecha de creación: Este script fue creado por Jhon Chavez el 18/02/2023.
*/


CREATE TABLE usuarios (
	id_usuario int NOT NULL AUTO_INCREMENT, -- Identificador único del usuario
    first_name varchar(50) NOT NULL, -- Nombre del usuario
    last_name varchar(50) NOT NULL, -- Apellido del usuario
    id_rol int NOT NULL,  -- Identificador del rol asignado al usuario
    last_access timestamp DEFAULT NULL, -- Fecha y hora del último acceso del usuario al sistema
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Fecha de creación del usuario
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Fecha de última actualización del usuario
	created_by int DEFAULT NULL, -- Identificador del usuario que creó este usuario
	updated_by int DEFAULT NULL, -- Identificador del usuario que actualizó este usuario
    deleted tinyint DEFAULT 0 NOT NULL, -- Indica si el usuario está eliminado o no
    deleted_by int DEFAULT NULL, -- Identificador del usuario que eliminó este usuario
    deleted_at timestamp DEFAULT NULL, -- Fecha y hora en que el usuario fue eliminado
    PRIMARY KEY (id_usuario), -- Clave primaria de la tabla
    CONSTRAINT usuarios_ibfk_1 FOREIGN KEY (id_rol) -- Clave foránea que relaciona el usuario con su rol
    REFERENCES roles (id_rol) ON DELETE CASCADE,
    CONSTRAINT usuarios_ibfk_2 FOREIGN KEY (created_by) -- Clave foránea que relaciona al usuario con su creador
    REFERENCES usuarios (id_usuario),
    CONSTRAINT usuarios_ibfk_3 FOREIGN KEY (updated_by)  -- Clave foránea que relaciona al usuario con su último actualizador
    REFERENCES usuarios (id_usuario)
) ENGINE=InnoDB;
