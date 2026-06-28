--liquibase formatted sql
--changeset anarivera:create_table_personal endDelimiter:;
--comment: Creación de la tabla personal con validación IF NOT EXISTS
CREATE TABLE IF NOT EXISTS catalogos.personal (
    id_personal SERIAL PRIMARY KEY,
    id_persona INT8 NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT fk_persona 
        FOREIGN KEY (id_persona) 
        REFERENCES catalogos.personas(id_persona)
);