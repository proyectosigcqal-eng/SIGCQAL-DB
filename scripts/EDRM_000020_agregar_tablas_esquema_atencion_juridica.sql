--liquibase formatted sql
--changeset ErickRivera:refactorizacion_tablas_esquema_atencion_juridica_vFinal splitStatements:false endDelimiter:$$

DO $$ 
BEGIN 
    -- Núcleo del Expediente
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'expedientes') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'atencion_juridica' AND table_name = 'expedientes') THEN
        ALTER TABLE public.expedientes SET SCHEMA atencion_juridica;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'cat_tipos_tramite') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'atencion_juridica' AND table_name = 'cat_tipos_tramite') THEN
        ALTER TABLE public.cat_tipos_tramite SET SCHEMA atencion_juridica;
    END IF;

    -- Asignación y Seguimiento
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'asesores') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'atencion_juridica' AND table_name = 'asesores') THEN
        ALTER TABLE public.asesores SET SCHEMA atencion_juridica;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'instrucciones_trabajo') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'atencion_juridica' AND table_name = 'instrucciones_trabajo') THEN
        ALTER TABLE public.instrucciones_trabajo SET SCHEMA atencion_juridica;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'seguimiento_tramite') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'atencion_juridica' AND table_name = 'seguimiento_tramite') THEN
        ALTER TABLE public.seguimiento_tramite SET SCHEMA atencion_juridica;
    END IF;

    -- Auditoría y Log del Módulo 2
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'auditoria_log') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'atencion_juridica' AND table_name = 'auditoria_log') THEN
        ALTER TABLE public.auditoria_log SET SCHEMA atencion_juridica;
    END IF;

END $$;