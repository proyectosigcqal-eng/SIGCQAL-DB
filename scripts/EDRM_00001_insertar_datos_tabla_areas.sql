--liquibase formatted sql
--changeset ErickRivera:insertar_areas_iniciales

INSERT INTO public.areas (nombre_area) 
VALUES 
('Administración'),
('Archivo'),
('Transparencia');