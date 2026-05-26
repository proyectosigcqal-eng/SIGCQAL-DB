--liquibase formatted sql

--changeset ErickRivera:crear-catalogos-modulo2 dbms:postgresql
--comment: Creacion de tablas maestras de catalogos para expedientes y detalles de asesoria.

CREATE TABLE IF NOT EXISTS catalogos.tipo_tramite (
    id_tipo_tramite SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS catalogos.estatus_expediente (
    id_estatus_expediente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS catalogos.tipo_acto_emitido (
    id_tipo_acto_emitido SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS catalogos.autoridades (
    id_autoridad SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS catalogos.tipo_entrada (
    id_tipo_entrada SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS catalogos.estatus_detalle_expediente (
    id_estatus_detalle_expediente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

--rollback DROP TABLE catalogos.estatus_detalle_expediente;
--rollback DROP TABLE catalogos.tipo_entrada;
--rollback DROP TABLE catalogos.autoridades;
--rollback DROP TABLE catalogos.tipo_acto_emitido;
--rollback DROP TABLE catalogos.estatus_expediente;
--rollback DROP TABLE catalogos.tipo_tramite;