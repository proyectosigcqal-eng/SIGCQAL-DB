--liquibase formatted sql

--changeset RodrigoRivera:alter-table-quejas-ari-add-siglas dbms:postgresql
--comment: Agregar columna siglas_abreviatura_encargado si no existe.
ALTER TABLE sustantiva.quejas_ari 
ADD COLUMN IF NOT EXISTS siglas_abreviatura_encargado VARCHAR(50);