--liquibase formatted sql

--changeset rodrigoriveramacias:alter-table-quejas_ari dbms:postgresql
--comment: Agrega la columna instituto a la tabla quejas_ari si no existe.
ALTER TABLE sustantiva.quejas_ari
    ADD COLUMN IF NOT EXISTS instituto VARCHAR(255);