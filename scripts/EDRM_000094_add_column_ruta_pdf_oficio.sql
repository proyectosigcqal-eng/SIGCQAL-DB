--liquibase formatted sql

--changeset ErickRivera:EDRM_000094_add_column_ruta_pdf_oficio endDelimiter:; runOnChange:true
--comment: Agregar columna ruta_pdf_oficio a las tablas de hitos de amparo
ALTER TABLE sustantiva.audiencia_espera ADD COLUMN IF NOT EXISTS ruta_pdf_oficio VARCHAR(255);
ALTER TABLE sustantiva.audiencia_celebrada ADD COLUMN IF NOT EXISTS ruta_pdf_oficio VARCHAR(255);
ALTER TABLE sustantiva.sentencia_dictada ADD COLUMN IF NOT EXISTS ruta_pdf_oficio VARCHAR(255);
ALTER TABLE sustantiva.recurso_revision ADD COLUMN IF NOT EXISTS ruta_pdf_oficio VARCHAR(255); 
ALTER TABLE sustantiva.sentencia_ejecutoria ADD COLUMN IF NOT EXISTS ruta_pdf_oficio VARCHAR(255);
ALTER TABLE sustantiva.notificacion_sentencia_cumplida ADD COLUMN IF NOT EXISTS ruta_pdf_oficio VARCHAR(255);

COMMENT ON COLUMN sustantiva.audiencia_espera.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF del oficio de admisión.';
COMMENT ON COLUMN sustantiva.audiencia_celebrada.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF del acta de la audiencia.';
COMMENT ON COLUMN sustantiva.sentencia_dictada.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF de la sentencia.';
COMMENT ON COLUMN sustantiva.recurso_revision.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF del recurso de revisión.';
COMMENT ON COLUMN sustantiva.sentencia_ejecutoria.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF del oficio de la ejecutoria.';
COMMENT ON COLUMN sustantiva.notificacion_sentencia_cumplida.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF del cumplimiento y archivo.';

--rollback ALTER TABLE sustantiva.audiencia_espera DROP COLUMN IF EXISTS ruta_pdf_oficio;
--rollback ALTER TABLE sustantiva.audiencia_celebrada DROP COLUMN IF EXISTS ruta_pdf_oficio;
--rollback ALTER TABLE sustantiva.sentencia_dictada DROP COLUMN IF EXISTS ruta_pdf_oficio;
--rollback ALTER TABLE sustantiva.recurso_revision DROP COLUMN IF EXISTS ruta_pdf_oficio;
--rollback ALTER TABLE sustantiva.sentencia_ejecutoria DROP COLUMN IF EXISTS ruta_pdf_oficio;
--rollback ALTER TABLE sustantiva.notificacion_sentencia_cumplida DROP COLUMN IF EXISTS ruta_pdf_oficio;