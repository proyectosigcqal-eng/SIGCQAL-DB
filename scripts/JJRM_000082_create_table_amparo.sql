--liquibase formatted sql

--changeset JuanRivera:create_table_amparo
CREATE TABLE IF NOT EXISTS sustantiva.irl_demanda_amparo (
    id_demanda_amparo                 SERIAL PRIMARY KEY,
    id_expediente                     INTEGER NOT NULL REFERENCES sustantiva.expedientes(id_expediente),
    id_representacion_legal           INTEGER NOT NULL REFERENCES sustantiva.representacion_legal(id),
    autoridad_reclamada_municipio     VARCHAR(200),
    superficie_terreno                NUMERIC(10,2),
    superficie_construccion           NUMERIC(10,2),
    tipo_construccion                 VARCHAR(10),
    zonificacion                      VARCHAR(50),
    folio_recibo_pago                 VARCHAR(100),
    monto_pago                        NUMERIC(12,2),
    fecha_primer_pago                 DATE,
    incluye_multas_historicas         BOOLEAN DEFAULT false,
    anios_multas_historicas           VARCHAR(200),
    argumentacion_falta_notificacion  TEXT,
    transcripcion_ley_ingresos        TEXT,
    ruta_pdf_demanda_generada         VARCHAR(500),
    fecha_generacion_demanda          TIMESTAMP,
    ruta_pdf_demanda_presentada       VARCHAR(500),
    ruta_pdf_acuse_demanda            VARCHAR(500),
    fecha_presentacion_demanda        DATE,
    fecha_registro                    TIMESTAMP DEFAULT NOW(),
    ultima_actualizacion              TIMESTAMP DEFAULT NOW()
);