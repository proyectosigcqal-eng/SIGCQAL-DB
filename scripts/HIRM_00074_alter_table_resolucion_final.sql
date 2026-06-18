--liquibase formatted sql

--changeset hugoisaacriveramorales:alter_table_resolucion_final dbms:postgresql
--comment: añadir campo ruta_resolucion_final
ALTER TABLE sustantiva.resolucion_final
    ADD COLUMN IF NOT EXISTS ruta_resolucion_final VARCHAR(500);