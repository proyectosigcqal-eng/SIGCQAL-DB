--liquibase formatted sql

--changeset hugoisaacriveramorales:create_table_resolucion_final dbms:postgresql
--comment: crear e insertar datos a columna resolucion_final si no existe.
CREATE TABLE IF NOT EXISTS sustantiva.resolucion_final (
    id_resolucion_final     SERIAL          PRIMARY KEY,
    id_expediente           INTEGER         NOT NULL,
    tipo_resolucion         VARCHAR(30)     NOT NULL
                            CONSTRAINT chk_tipo_resolucion
                            CHECK (tipo_resolucion IN ('RECOMENDACION', 'NO_RESPONSABILIDAD')),
    ruta_documento          VARCHAR(500)    NOT NULL,
    fecha_emision           DATE            NOT NULL,
    id_estatus_expediente   INTEGER         NOT NULL,

    CONSTRAINT fk_resolucion_estatus
        FOREIGN KEY (id_estatus_expediente)
        REFERENCES catalogos.estatus_expediente(id_estatus_expediente)
);

INSERT INTO catalogos.estatus_expediente (nombre)
SELECT 'DICTAMINACION'
WHERE NOT EXISTS (
    SELECT 1 FROM catalogos.estatus_expediente
    WHERE nombre = 'DICTAMINACION'
);

INSERT INTO catalogos.estatus_expediente (nombre)
SELECT 'RESOLUCION_EMITIDA_PENDIENTE_NOTIFICACION'
WHERE NOT EXISTS (
    SELECT 1 FROM catalogos.estatus_expediente
    WHERE nombre = 'RESOLUCION_EMITIDA_PENDIENTE_NOTIFICACION'
);