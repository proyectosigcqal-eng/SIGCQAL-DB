--liquibase formatted sql
--changeset Erick Rivera: Creacion tabla acuse oficio en esquema correspondencia

CREATE SCHEMA IF NOT EXISTS correspondencia;

CREATE TABLE IF NOT EXISTS correspondencia.acuse_oficio (
    -- ID autoincremental para el registro del acuse
    id_acuse_oficio SERIAL4 PRIMARY KEY,
    
    -- ID Natural del oficio (Referencia a la tabla oficio)
    id_oficio INT4,
    
    -- Columnas de auditoría y estado
    id_usuario_revisor INT4,
    fecha_aceptacion DATE,
    hora_aceptacion TIME,
    es_del_area BOOL
);