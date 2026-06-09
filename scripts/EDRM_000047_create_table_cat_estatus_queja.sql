-- liquibase formatted sql

-- changeset ErickRivera:1-crear-cat-estatus-queja dbms:postgresql
-- comment: Creacion del catalogo de estatus para tramites de queja de forma idempotente.
CREATE TABLE IF NOT EXISTS catalogos.cat_estatus_queja (
    id_estatus_queja SERIAL PRIMARY KEY,
    descripcion_estatus VARCHAR(50) NOT NULL UNIQUE,     -- Ej: En Análisis, Admitida, Concluida
    activo BOOLEAN DEFAULT TRUE
);

