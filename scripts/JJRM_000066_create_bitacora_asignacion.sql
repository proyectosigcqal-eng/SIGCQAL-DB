--liquibase formatted sql

--changeset JuanRivera:create_bitacora_asignacion

-- Tabla de bitácora de asignaciones (auditoría)
CREATE TABLE IF NOT EXISTS sustantiva.bitacora_asignacion (
    id_bitacora         SERIAL PRIMARY KEY,
    id_expediente       INTEGER NOT NULL,
    id_asesor_anterior  INTEGER,
    id_asesor_nuevo     INTEGER NOT NULL,
    id_usuario_asigno   INTEGER,
    fecha_asignacion    TIMESTAMP NOT NULL DEFAULT NOW(),
    ip_origen           VARCHAR(45),
    motivo              VARCHAR(255)
);

-- Índice para consultas de auditoría por expediente
CREATE INDEX IF NOT EXISTS idx_bitacora_expediente
    ON sustantiva.bitacora_asignacion(id_expediente);

ALTER TABLE sustantiva.quejas_respuestas_autoridad
    -- 1. Eliminamos las columnas viejas que ya no quieres
    DROP COLUMN IF EXISTS id_oficio_autoridad CASCADE,
    DROP COLUMN IF EXISTS num_oficio_contestacion_autoridad,
    DROP COLUMN IF EXISTS fecha_recepcion_oficialia,
    DROP COLUMN IF EXISTS informe_rendido,
    DROP COLUMN IF EXISTS descripcion_analisis_asesor,
    DROP COLUMN IF EXISTS ruta_pdf_informe_autoridad,

    -- 2. Aseguramos que existan las columnas de tu script
    ADD COLUMN IF NOT EXISTS id_queja INTEGER,
    ADD COLUMN IF NOT EXISTS folio_expediente VARCHAR(50),
    ADD COLUMN IF NOT EXISTS numero_oficio VARCHAR(100),
    ADD COLUMN IF NOT EXISTS id_autoridad INTEGER,
    ADD COLUMN IF NOT EXISTS nombre_titular VARCHAR(200),
    ADD COLUMN IF NOT EXISTS adjunto VARCHAR(500),
    ADD COLUMN IF NOT EXISTS observaciones TEXT,
    ADD COLUMN IF NOT EXISTS decision VARCHAR(20);