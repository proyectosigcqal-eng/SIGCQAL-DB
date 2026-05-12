--liquibase formatted sql
--changeset JoseJuanRiveraMerino:renombrado_forzado_v2
--preconditions onFail:MARK_RAN
--precondition-sql-check expectedResult:1 SELECT count(*) FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'acuserecibointerno';

ALTER TABLE correspondencia.acuserecibointerno RENAME TO acuse_memorandum;