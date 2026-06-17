--liquibase formatted sql

--changeset hugoisaacriveramorales:create_table_resolucion_final dbms:postgresql
--comment: crear tabla resolución final
CREATE TABLE IF NOT EXISTS sustantiva.resolucion_final (
    id_resolucion_final           SERIAL PRIMARY KEY,
    fecha_emision_resolucion      DATE NOT NULL,
    concepto_cobro                VARCHAR(255),
    contacto_via                  VARCHAR(100),
    numero_credito                INT,
    folio_credito                 VARCHAR(50),
    id_expediente                 INT NOT NULL,
    id_ari                        INT NOT NULL,
    id_queja_respuesta_autoridad  INT NOT NULL,
    id_estatus_queja              INT NOT NULL,
 
    CONSTRAINT fk_resolucion_expediente
        FOREIGN KEY (id_expediente)
        REFERENCES sustantiva.expedientes (id_expediente),
 
    CONSTRAINT fk_resolucion_ari
        FOREIGN KEY (id_ari)
        REFERENCES sustantiva.quejas_ari (id_ari),
 
    CONSTRAINT fk_resolucion_queja_respuesta
        FOREIGN KEY (id_queja_respuesta_autoridad)
        REFERENCES sustantiva.quejas_respuestas_autoridad (id_respuesta_autoridad),
 
    CONSTRAINT fk_resolucion_estatus_queja
        FOREIGN KEY (id_estatus_queja)
        REFERENCES catalogos.cat_estatus_queja (id_estatus_queja)
);
 