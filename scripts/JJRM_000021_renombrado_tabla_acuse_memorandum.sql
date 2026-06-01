--liquibase formatted sql
--changeset JoseJuanRiveraMerino:renombrado_forzado_v2_fijo
--preconditions onFail:MARK_RAN

--precondition-sql-check expectedResult:1 SELECT count(*) FROM information_schema.tables WHERE table_schema='correspondencia' AND table_name='acuserecibointerno';

-- Renombramos la tabla
ALTER TABLE correspondencia.acuserecibointerno RENAME TO acuse_memorandum;
--rollback ALTER TABLE correspondencia.acuse_memorandum RENAME TO acuserecibointerno;
