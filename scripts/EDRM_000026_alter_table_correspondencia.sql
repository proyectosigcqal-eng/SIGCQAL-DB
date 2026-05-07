--liquibase formatted sql
--changeset Erick Rivera: modificar la tabla  correspondencia en esquema correspondencia_VFinal´
-- Agregamos la columna
ALTER TABLE correspondencia.correspondencia ADD COLUMN id_tipo_correspondencia INT4;