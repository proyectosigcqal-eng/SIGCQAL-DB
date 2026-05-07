--liquibase formatted sql
--changeset ErickRivera:insertar_datos_tipo_correspondencia_vfinal

-- Insertar los tipos de correspondencia solicitados
INSERT INTO catalogos.tipo_correspondencia (id_tipo_correspondencia, descripcion) VALUES
(DEFAULT, 'externa'),
(DEFAULT, 'interna');
--rollback DELETE FROM catalogos.tipo_correspondencia WHERE descripcion IN ('externa', 'interna');