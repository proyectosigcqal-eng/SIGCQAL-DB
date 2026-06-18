--liquibase formatted sql
--changeset JuanRivera:create_table_oficio_notificacion

CREATE TABLE IF NOT EXISTS sustantiva.oficio_notificacion (
    id_oficio_notificacion BIGSERIAL PRIMARY KEY,

    folio_expediente       VARCHAR(50)  NOT NULL,
    id_autoridad           INTEGER      NOT NULL,
    num_oficio             VARCHAR(100) NOT NULL,
    fecha_acuerdo          VARCHAR(100) NOT NULL,
    fundamento             TEXT,
    iniciales_asesor       VARCHAR(50),
    ruta_pdf               VARCHAR(500),
    fecha_generacion       TIMESTAMP    NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_oficio_notif_expediente
        FOREIGN KEY (folio_expediente)
        REFERENCES sustantiva.expedientes(folio_gobierno)
        ON DELETE RESTRICT,

    CONSTRAINT fk_oficio_notif_autoridad
        FOREIGN KEY (id_autoridad)
        REFERENCES catalogos.autoridades(id_autoridad)
        ON DELETE RESTRICT
);

CREATE INDEX IF NOT EXISTS idx_oficio_notif_folio
    ON sustantiva.oficio_notificacion(folio_expediente);

CREATE INDEX IF NOT EXISTS idx_oficio_notif_autoridad
    ON sustantiva.oficio_notificacion(id_autoridad);

