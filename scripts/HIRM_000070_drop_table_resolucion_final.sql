--liquibase formatted sql

--changeset hugoisaacriveramorales:drop_table_resolucion_final dbms:postgresql
--comment: eliminar tabla resolución_final
DROP TABLE IF EXISTS sustantiva.resolucion_final;