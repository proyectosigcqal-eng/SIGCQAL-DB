--liquibase formatted sql
--changeset ErickRivera:modificar_tabla_correspondencia_VFinal
--preconditions onFail:MARK_RAN
--precondition-sql-check expectedResult:0 SELECT count(*) FROM information_schema.columns WHERE table_schema = 'correspondencia' AND table_name = 'correspondencia' AND column_name = 'id_tipo_correspondencia';

-- Agregamos la columna
ALTER TABLE correspondencia.correspondencia ADD COLUMN id_tipo_correspondencia INT4;

--rollback ALTER TABLE correspondencia.correspondencia DROP COLUMN id_tipo_correspondencia;