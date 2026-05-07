--liquibase formatted sql
--changeset ErickRivera:modificar_tabla_correspondencia_VFinal

-- Agregamos la columna
ALTER TABLE correspondencia.correspondencia ADD COLUMN id_tipo_correspondencia INT4;
--rollback ALTER TABLE correspondencia.correspondencia DROP COLUMN id_tipo_correspondencia;