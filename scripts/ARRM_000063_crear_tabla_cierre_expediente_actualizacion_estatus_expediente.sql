--liquibase formatted sql
--changeset anarosariveramorales:create_table_cierre_expediente_v2 dbms:postgresql
--comment: Crear tabla cierre expediente si no existe

CREATE TABLE IF NOT EXISTS sustantiva.cierre_expediente (
    id_cierre serial4 NOT NULL,
    id_expediente int4 NOT NULL,
    medio_notificacion varchar(255) NOT NULL,
    ruta_archivo_acuerdo varchar(255) NOT NULL,
    fecha_cierre timestamp DEFAULT CURRENT_TIMESTAMP NULL,
    usuario_cierre int8 NOT NULL,
    CONSTRAINT cierre_expediente_id_expediente_key UNIQUE (id_expediente),
    CONSTRAINT cierre_expediente_pkey PRIMARY KEY (id_cierre)
);