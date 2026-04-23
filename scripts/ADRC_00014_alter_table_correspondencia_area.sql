--liquibase formatted sql
--changeset AlanRivera:adición areas en correspondencia

-- 1. Agregar la columna id_area a la tabla correspondencia
ALTER TABLE public.correspondencia 
ADD COLUMN id_area integer;

-- 2. Crear la llave foránea apuntando a la tabla areas
ALTER TABLE public.correspondencia 
ADD CONSTRAINT fk_correspondencia_areas 
FOREIGN KEY (id_area) REFERENCES public.areas(id_area);
