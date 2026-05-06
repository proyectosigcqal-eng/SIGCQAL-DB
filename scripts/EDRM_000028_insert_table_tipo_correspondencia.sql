--liquibase formatted sql
--changeset Erick Rivera: insertar datos tabla tipo correspondencia en esquema catalogos
-- Insertar los tipos de correspondencia solicitados
INSERT INTO correspondencia.tipo_correspondencia (id_tipo_correspondencia, descripcion) VALUES
    (DEFAULT, 'externa'),
    (DEFAULT, 'interna');