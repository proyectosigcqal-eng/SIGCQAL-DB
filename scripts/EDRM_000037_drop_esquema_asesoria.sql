--liquibase formatted sql

--changeset ErickRivera:eliminar_esquema_atencion_juridica

DROP SCHEMA IF EXISTS atencion_juridica CASCADE;