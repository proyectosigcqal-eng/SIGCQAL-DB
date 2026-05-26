--liquibase formatted sql

--changeset ErickRivera:crear-tabla-detalle_asesoria dbms:postgresql
--comment: Creacion de la tabla detalle asesoria.

CREATE TABLE IF NOT EXISTS sustantiva.detalle_asesoria (
    id_detalle_asesoria SERIAL PRIMARY KEY,
    id_expediente INT NOT NULL UNIQUE, -- UNIQUE garantiza relación 1 a 1 con el expediente padre
    id_tipo_acto_emitido INT NOT NULL,
    id_autoridad INT NOT NULL,
    calificacion_acto TEXT,
    id_tipo_entrada INT NOT NULL,
    problematica TEXT,
    seguimiento TEXT,
    id_estatus_detalle_expediente INT NOT NULL,

    -- Restricciones de Llaves Foráneas (FK)
    CONSTRAINT fk_det_expediente 
        FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente) ON DELETE CASCADE,
    CONSTRAINT fk_det_tipo_acto 
        FOREIGN KEY (id_tipo_acto_emitido) REFERENCES catalogos.tipo_acto_emitido(id_tipo_acto_emitido),
    CONSTRAINT fk_det_autoridad 
        FOREIGN KEY (id_autoridad) REFERENCES catalogos.autoridades(id_autoridad),
    CONSTRAINT fk_det_tipo_entrada 
        FOREIGN KEY (id_tipo_entrada) REFERENCES catalogos.tipo_entrada(id_tipo_entrada),
    CONSTRAINT fk_det_estatus_detalle 
        FOREIGN KEY (id_estatus_detalle_expediente) REFERENCES catalogos.estatus_detalle_expediente(id_estatus_detalle_expediente)
);

--rollback DROP TABLE sustantiva.detalle_asesoria;