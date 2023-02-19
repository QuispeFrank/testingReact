/*
 * Descripción: Esta tabla almacena los roles de usuario en el sistema.
 * Los roles se utilizan para definir los permisos y el acceso de los usuarios a diferentes partes de la aplicación.
 * Dependencias: Ninguna.
 * Autores y fecha de creación: Este script fue creado por Jhon Chavez el 18/02/2023.
*/


CREATE TABLE roles (
	id_rol int NOT NULL AUTO_INCREMENT,  -- Identificador único del rol
    nombre_rol varchar(50) NOT NULL, -- Nombre del rol
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Fecha de creación del rol
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,  -- Fecha de última actualización del rol
	created_by int DEFAULT NULL, -- Identificador del usuario que creó el rol
	updated_by int DEFAULT NULL, -- Identificador del usuario que actualizó el rol
    PRIMARY KEY (id_rol) -- Clave primaria de la tabla
) ENGINE=InnoDB;
