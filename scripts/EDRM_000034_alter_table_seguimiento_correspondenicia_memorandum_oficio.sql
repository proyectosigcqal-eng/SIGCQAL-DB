--liquibase formatted sql
--changeset ErickRivera:alter_table_seguimiento_correspondencia_memorandum_oficio_v1
--preconditions onFail:CONTINUE

-- 1. Intento para seguimiento_correspondencia
--precondition-sql-check expectedResult:0 SELECT count(*) FROM information_schema.columns WHERE table_schema = 'correspondencia' AND table_name = 'seguimiento_correspondencia' AND column_name = 'numero_oficio_contestacion';
ALTER TABLE correspondencia.seguimiento_correspondencia ADD COLUMN numero_oficio_contestacion VARCHAR(100);

-- 2. Intento para seguimiento_oficio
--precondition-sql-check expectedResult:0 SELECT count(*) FROM information_schema.columns WHERE table_schema = 'correspondencia' AND table_name = 'seguimiento_oficio' AND column_name = 'numero_oficio_contestacion';
ALTER TABLE correspondencia.seguimiento_oficio ADD COLUMN numero_oficio_contestacion VARCHAR(100);

-- 3. Intento para seguimiento_memorandum
--precondition-sql-check expectedResult:0 SELECT count(*) FROM information_schema.columns WHERE table_schema = 'correspondencia' AND table_name = 'seguimiento_memorandum' AND column_name = 'numero_oficio_contestacion';
ALTER TABLE correspondencia.seguimiento_memorandum ADD COLUMN numero_oficio_contestacion VARCHAR(100);