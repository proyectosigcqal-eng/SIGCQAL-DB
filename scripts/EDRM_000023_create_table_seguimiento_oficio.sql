--liquibase formatted sql
--changeset Erick Rivera:creacion_seguimiento_oficio_v2 splitStatements:false
--comment: Creacion de tabla seguimiento_oficio con proteccion de existencia

CREATE TABLE IF NOT EXISTS correspondencia.seguimiento_oficio (
    id_seguimiento_oficio SERIAL4 PRIMARY KEY,
    id_oficio INT4,
    folio_respuesta SERIAL4,
    respuesta_seguimiento_oficio TEXT,
    fecha_resolucion DATE,
    hora_resolucion TIME,
    archivo_adjunto VARCHAR(255),
    id_usuario INT4,
    id_estatus INT4,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);