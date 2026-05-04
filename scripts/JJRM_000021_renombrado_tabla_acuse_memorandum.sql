--liquibase formatted sql
--changeset José Juan Rivera Merino: Renombrado tabla acuse_recibo_interno a acuse_memorandum

ALTER TABLE correspondencia.acuserecibointerno  RENAME TO acuse_memorandum;

