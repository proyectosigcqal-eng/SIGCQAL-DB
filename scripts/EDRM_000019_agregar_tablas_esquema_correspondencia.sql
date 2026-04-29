--liquibase formatted sql
--changeset ErickRivera:refactorizacion_tablas_esquema_correspondencia_vFinal splitStatements:false endDelimiter:$$

DO $$ 
BEGIN 
    -- Gestión de Correspondencia
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'correspondencia') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'correspondencia') THEN
        ALTER TABLE public.correspondencia SET SCHEMA correspondencia;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'correspondencia_respuestas') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'correspondencia_respuestas') THEN
        ALTER TABLE public.correspondencia_respuestas SET SCHEMA correspondencia;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'correspondencia_turnos') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'correspondencia_turnos') THEN
        ALTER TABLE public.correspondencia_turnos SET SCHEMA correspondencia;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'acuse_correspondencia') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'acuse_correspondencia') THEN
        ALTER TABLE public.acuse_correspondencia SET SCHEMA correspondencia;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'acuserecibointerno') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'acuserecibointerno') THEN
        ALTER TABLE public.acuserecibointerno SET SCHEMA correspondencia;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'seguimiento_correspondencia') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'seguimiento_correspondencia') THEN
        ALTER TABLE public.seguimiento_correspondencia SET SCHEMA correspondencia;
    END IF;

    -- Gestión de Memorándums
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'memorandums') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'memorandums') THEN
        ALTER TABLE public.memorandums SET SCHEMA correspondencia;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'seguimiento_memorandum') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'seguimiento_memorandum') THEN
        ALTER TABLE public.seguimiento_memorandum SET SCHEMA correspondencia;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'plantilla_memorandum') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'plantilla_memorandum') THEN
        ALTER TABLE public.plantilla_memorandum SET SCHEMA correspondencia;
    END IF;

    -- Soporte y Auditoría
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'archivos_adjuntos') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'archivos_adjuntos') THEN
        ALTER TABLE public.archivos_adjuntos SET SCHEMA correspondencia;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'notificaciones') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'notificaciones') THEN
        ALTER TABLE public.notificaciones SET SCHEMA correspondencia;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'alertas_seguimiento') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'alertas_seguimiento') THEN
        ALTER TABLE public.alertas_seguimiento SET SCHEMA correspondencia;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'auditoria_correspondencia') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'correspondencia' AND table_name = 'auditoria_correspondencia') THEN
        ALTER TABLE public.auditoria_correspondencia SET SCHEMA correspondencia;
    END IF;

END $$;