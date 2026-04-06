--liquibase formatted sql
--changeset ErickRivera:insertar_areas_iniciales

INSERT INTO public.areas (nombre_area) 
('Administración'),
('Archivo'),
('Transparencia');