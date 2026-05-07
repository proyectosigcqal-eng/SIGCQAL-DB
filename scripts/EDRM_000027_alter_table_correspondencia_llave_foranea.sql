--liquibase formatted sql
--changeset Erick Rivera: modificar la tabla  correspondencia en esquema correspondencia_vfinal
-- Agregamos la llave foránea
ALTER TABLE correspondencia.correspondencia
ADD CONSTRAINT fk_correspondencia_tipo
FOREIGN KEY (id_tipo_correspondencia)
REFERENCES catalogos.tipo_correspondencia(id_tipo_correspondencia);