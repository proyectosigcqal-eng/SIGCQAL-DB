--liquibase formatted sql
--changeset ErickRivera:crear_tabla_tipo_correspondencia_vFINAL1

-- Añadimos IF NOT EXISTS para evitar el error si la tabla ya existe
CREATE TABLE IF NOT EXISTS catalogos.tipo_correspondencia (
    id_tipo_correspondencia SERIAL4 PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    CONSTRAINT uq_tipo_correspondencia_descripcion UNIQUE (descripcion)
);

--rollback DROP TABLE catalogos.tipo_correspondencia;