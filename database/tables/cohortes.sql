/*
* Descripción: Esta tabla almacena información sobre las cohortes de estudiantes en un programa educativo.
* Cada cohorte tiene un identificador único, un código y un nombre, y puede ser creada y actualizada por un usuario del sistema.
* Autores y fecha de creación: Este script fue creado por [nombre del autor] el [fecha de creación].
*/


CREATE TABLE cohortes (
	id_cohorte int NOT NULL, -- Identificador único de la cohorte
    codigo_cohorte char(8) NOT NULL, -- Código de la cohorte
    nombre_cohorte varchar(20) NOT NULL, -- Nombre de la cohorte
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Fecha de creación de la cohorte
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Fecha de última actualización de la cohorte
	created_by int DEFAULT  NULL, -- Identificador del usuario que creó la cohorte
	updated_by int DEFAULT  NULL, -- Identificador del usuario que actualizó la cohorte
    PRIMARY KEY (id_cohorte), -- Clave Primaria
    CONSTRAINT cohortes_ibfk_1 FOREIGN KEY (created_by)  -- Clave foránea que relaciona la cohorte con su creador
    REFERENCES usuarios (id_usuario), 
    CONSTRAINT cohortes_ibfk_2 FOREIGN KEY (updated_by) -- Clave foránea que relaciona la cohorte con su último actualizador
    REFERENCES usuarios (id_usuario)
) ENGINE=InnoDB;
