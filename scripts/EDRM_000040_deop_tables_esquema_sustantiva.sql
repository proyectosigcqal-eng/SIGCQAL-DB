--liquibase formatted sql

--changeset ErickRivera:drop-tablas-viejas-sustantiva dbms:postgresql
--comment: Eliminacion de tablas viejas de expedientes y detalles para reestructurar el modulo 2.

DROP TABLE IF EXISTS sustantiva.detalle_amparo CASCADE;
DROP TABLE IF EXISTS sustantiva.detalle_queja CASCADE;
DROP TABLE IF EXISTS sustantiva.expedientes CASCADE;

--rollback CREATE TABLE sustantiva.expedientes (id_expediente SERIAL PRIMARY KEY);
--rollback CREATE TABLE sustantiva.detalle_queja (id_detalle_queja SERIAL PRIMARY KEY);
--rollback CREATE TABLE sustantiva.detalle_amparo (id_detalle_amparo SERIAL PRIMARY KEY);