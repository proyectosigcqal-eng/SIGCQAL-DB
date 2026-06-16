--liquibase formatted sql

--changeset RodrigoRivera:alter-table-queja-ari dbms:postgresql
--comment: Borrar columna si no existen.
ALTER TABLE sustantiva.quejas_ari 
DROP COLUMN IF EXISTS articulos_vulnerados_autoridad;