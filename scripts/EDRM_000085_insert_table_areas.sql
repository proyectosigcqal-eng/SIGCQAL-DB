--liquibase formatted sql

--changeset tu_usuario:insert-inicial-areas-catalogos endDelimiter:;
--comment: Inserción inicial de áreas en el esquema catalogos
INSERT INTO catalogos.areas (nombre_area) VALUES
('Correspondencia'),
('Planeación'),
('Jurídica'),
('Transparencia'),
('Administrativa'),
('Archivo'),
('Recursos Materiales');

--rollback TRUNCATE TABLE catalogos.areas RESTART IDENTITY CASCADE;