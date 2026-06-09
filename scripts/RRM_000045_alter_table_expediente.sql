--liquibase formatted sql

--changeset RodrigoRivera:alter-tabla-expedientes dbms:postgresql runOnChange:true splitStatements:false
--comment: Alteracion de la tabla expedientes de forma totalmente idempotente mandando el bloque completo.
ALTER TABLE sustantiva.expedientes
ADD COLUMN IF NOT EXISTS id_representante_legal INT;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.table_constraints 
        WHERE constraint_name = 'fk_expedientes_representante_legal' 
          AND table_schema = 'sustantiva'
    ) THEN
        ALTER TABLE sustantiva.expedientes
            ADD CONSTRAINT fk_expedientes_representante_legal
            FOREIGN KEY (id_representante_legal) 
            REFERENCES catalogos.personas (id_persona);
    END IF;
END $$;

--rollback ALTER TABLE sustantiva.expedientes DROP CONSTRAINT IF EXISTS fk_expedientes_representante_legal;
--rollback ALTER TABLE sustantiva.expedientes DROP COLUMN IF EXISTS id_representante_legal;