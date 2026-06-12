--liquibase formatted sql

--changeset JuanRivera:alter-table-expedientes dbms:postgresql
--comment: Agrega columnas si no existen.
-- Agregar campo de bloqueo en expedientes
ALTER TABLE sustantiva.expedientes
    ADD COLUMN IF NOT EXISTS bloqueado BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN IF NOT EXISTS fecha_cierre_automatico TIMESTAMP;
