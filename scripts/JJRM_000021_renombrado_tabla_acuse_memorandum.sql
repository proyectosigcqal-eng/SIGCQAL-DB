--liquibase formatted sql
--changeset José Juan Rivera Merino: renombrado_forzado_v2

ALTER TABLE correspondencia.acuserecibointerno  RENAME TO acuse_memorandum;

