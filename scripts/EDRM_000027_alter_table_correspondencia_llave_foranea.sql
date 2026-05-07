--liquibase formatted sql
--changeset ErickRivera:fk_correspondencia_tipo_vfinal

-- Agregamos la llave foránea
ALTER TABLE correspondencia.correspondencia
ADD CONSTRAINT fk_correspondencia_tipo
FOREIGN KEY (id_tipo_correspondencia)
REFERENCES catalogos.tipo_correspondencia(id_tipo_correspondencia);
--rollback ALTER TABLE correspondencia.correspondencia DROP CONSTRAINT fk_correspondencia_tipo;