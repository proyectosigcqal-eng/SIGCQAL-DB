--liquibase formatted sql

--changeset ErickRivera:crear-tabla-expedientes dbms:postgresql
--comment: Creacion de la tabla maestra de expedientes con herencia e integridad referencial ajustada.

CREATE TABLE IF NOT EXISTS sustantiva.expedientes (
    id_expediente SERIAL PRIMARY KEY,
    folio_gobierno VARCHAR(30) UNIQUE NOT NULL,
    fecha_solicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_municipio INT NOT NULL,
    id_asesor INT NOT NULL,
    id_contribuyente INT NOT NULL,
    id_solicitante INT NOT NULL,
    id_tipo_tramite INT NOT NULL,
    id_estatus_expediente INT NOT NULL,
    documento_acredita_personalidad VARCHAR(255),
    archivo_documento_acredita_personalidad VARCHAR(255),

    CONSTRAINT fk_exp_municipio 
        FOREIGN KEY (id_municipio) REFERENCES catalogos.cat_municipios (id_municipio),
    CONSTRAINT fk_exp_asesor 
        FOREIGN KEY (id_asesor) REFERENCES sustantiva.asesores(id_asesores),
    CONSTRAINT fk_exp_contribuyente 
        FOREIGN KEY (id_contribuyente) REFERENCES sustantiva.contribuyentes(id_contribuyentes),
    CONSTRAINT fk_exp_solicitante 
        FOREIGN KEY (id_solicitante) REFERENCES catalogos.personas(id_persona),
    CONSTRAINT fk_exp_tipo_tramite 
        FOREIGN KEY (id_tipo_tramite) REFERENCES catalogos.tipo_tramite(id_tipo_tramite),
    CONSTRAINT fk_exp_estatus 
        FOREIGN KEY (id_estatus_expediente) REFERENCES catalogos.estatus_expediente(id_estatus_expediente)
);

--rollback DROP TABLE sustantiva.expedientes;