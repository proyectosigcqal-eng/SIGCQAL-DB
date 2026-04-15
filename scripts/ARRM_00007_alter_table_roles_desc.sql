--liquibase formatted sql
--changeset AnaRivera:añadir_columna_descripcion

ALTER TABLE roles
ADD COLUMN descripcion VARCHAR(255);