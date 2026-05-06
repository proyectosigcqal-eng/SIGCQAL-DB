--liquibase formatted sql
--changeset Erick Rivera: Creacion tabla tipo correspondencia en esquema catalogos
-- Crear la tabla de catálogo 'tipo_correspondencia' en el esquema 'correspondencia'
CREATE TABLE catalogos.tipo_correspondencia (
    -- ID autoincremental de la tabla
    id_tipo_correspondencia SERIAL4 PRIMARY KEY,
    
    -- Columna de descripción (texto)
    descripcion VARCHAR(100) NOT NULL,
    
    -- Restricción opcional para asegurar que las descripciones sean únicas
    CONSTRAINT uq_tipo_correspondencia_descripcion UNIQUE (descripcion)
);