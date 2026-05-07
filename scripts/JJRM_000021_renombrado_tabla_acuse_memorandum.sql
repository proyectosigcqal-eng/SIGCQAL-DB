--liquibase formatted sql
--changeset JoseJuanRiveraMerino:renombrado_forzado_v2

ALTER TABLE correspondencia.acuserecibointerno RENAME TO acuse_memorandum;
--rollback ALTER TABLE correspondencia.acuse_memorandum RENAME TO acuserecibointerno;
