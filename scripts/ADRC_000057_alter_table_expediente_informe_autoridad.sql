--liquibase formatted sql

--changeset alan:ADRC-000057-alter-expediente-informe-autoridad dbms:postgresql
--comment: Agrega columnas para controlar el plazo de 5 dias habiles e informe de autoridad.
ALTER TABLE sustantiva.expedientes
    ADD COLUMN IF NOT EXISTS fecha_envio_oficio_autoridad TIMESTAMP,
    ADD COLUMN IF NOT EXISTS fecha_limite_informe DATE,
    ADD COLUMN IF NOT EXISTS numero_oficio_respuesta VARCHAR(50),
    ADD COLUMN IF NOT EXISTS fojas_informe INT,
    ADD COLUMN IF NOT EXISTS fecha_recepcion_informe TIMESTAMP,
    ADD COLUMN IF NOT EXISTS ruta_pdf_informe VARCHAR(500),
    ADD COLUMN IF NOT EXISTS estado_alerta_5dias VARCHAR(30),
    ADD COLUMN IF NOT EXISTS notificacion_vencimiento_enviada BOOLEAN DEFAULT FALSE;

UPDATE sustantiva.expedientes
SET notificacion_vencimiento_enviada = FALSE
WHERE notificacion_vencimiento_enviada IS NULL;

INSERT INTO catalogos.estatus_expediente (nombre)
SELECT 'OFICIO ENVIADO'
WHERE NOT EXISTS (
    SELECT 1
    FROM catalogos.estatus_expediente
    WHERE UPPER(TRIM(nombre)) = 'OFICIO ENVIADO'
);

INSERT INTO catalogos.estatus_expediente (nombre)
SELECT 'INFORME RENDIDO'
WHERE NOT EXISTS (
    SELECT 1
    FROM catalogos.estatus_expediente
    WHERE UPPER(TRIM(nombre)) = 'INFORME RENDIDO'
);

-- rollback ALTER TABLE sustantiva.expedientes DROP COLUMN IF EXISTS notificacion_vencimiento_enviada;
-- rollback ALTER TABLE sustantiva.expedientes DROP COLUMN IF EXISTS estado_alerta_5dias;
-- rollback ALTER TABLE sustantiva.expedientes DROP COLUMN IF EXISTS ruta_pdf_informe;
-- rollback ALTER TABLE sustantiva.expedientes DROP COLUMN IF EXISTS fecha_recepcion_informe;
-- rollback ALTER TABLE sustantiva.expedientes DROP COLUMN IF EXISTS fojas_informe;
-- rollback ALTER TABLE sustantiva.expedientes DROP COLUMN IF EXISTS numero_oficio_respuesta;
-- rollback ALTER TABLE sustantiva.expedientes DROP COLUMN IF EXISTS fecha_limite_informe;
-- rollback ALTER TABLE sustantiva.expedientes DROP COLUMN IF EXISTS fecha_envio_oficio_autoridad;
-- rollback DELETE FROM catalogos.estatus_expediente e
-- rollback WHERE UPPER(TRIM(e.nombre)) IN ('OFICIO ENVIADO', 'INFORME RENDIDO')
-- rollback   AND NOT EXISTS (
-- rollback       SELECT 1
-- rollback       FROM sustantiva.expedientes exp
-- rollback       WHERE exp.id_estatus_expediente = e.id_estatus_expediente
-- rollback   );

