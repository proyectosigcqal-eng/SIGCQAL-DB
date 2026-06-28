--liquibase formatted sql
--changeset anarivera:add_column_es_personal_to_personas endDelimiter:;
--comment: Se agrega columna es_personal a la tabla personas de forma segura
DO $$ 
BEGIN 
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_schema = 'catalogos' 
        AND table_name = 'personas' 
        AND column_name = 'es_personal'
    ) THEN
        ALTER TABLE catalogos.personas ADD COLUMN es_personal BOOLEAN DEFAULT FALSE;
    END IF;
END $$;