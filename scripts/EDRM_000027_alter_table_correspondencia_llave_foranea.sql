--liquibase formatted sql
--changeset ErickRivera:fk_correspondencia_tipo_vfinal
--preconditions onFail:MARK_RAN
--precondition-sql-check expectedResult:0 SELECT count(*) FROM information_schema.table_constraints WHERE constraint_name = 'fk_correspondencia_tipo' AND table_schema = 'correspondencia';

-- Agregamos la llave foránea
ALTER TABLE correspondencia.correspondencia 
ADD CONSTRAINT fk_correspondencia_tipo 
FOREIGN KEY (id_tipo_correspondencia) 
REFERENCES catalogos.tipo_correspondencia(id_tipo_correspondencia);

--rollback ALTER TABLE correspondencia.correspondencia DROP CONSTRAINT fk_correspondencia_tipo;