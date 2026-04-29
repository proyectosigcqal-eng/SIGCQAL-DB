--liquibase formatted sql
--changeset ErickRivera:creacion_esquemas
-- Estructura de Usuarios y Personal
CREATE SCHEMA IF NOT EXISTS catalogos;
CREATE SCHEMA IF NOT EXISTS correspondencia;
CREATE SCHEMA IF NOT EXISTS atencion_juridica;