--liquibase formatted sql
--changeset ErickRivera:refactorizacion_tablas_esquema_catalogos_vFinal splitStatements:false endDelimiter:$$

DO $$ 
BEGIN 
    -- 1. USUARIOS
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'usuarios') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'catalogos' AND table_name = 'usuarios') THEN
        ALTER TABLE public.usuarios SET SCHEMA catalogos;
    END IF;

    -- 2. ROLES
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'roles') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'catalogos' AND table_name = 'roles') THEN
        ALTER TABLE public.roles SET SCHEMA catalogos;
    END IF;

    -- 3. PERSONAS
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'personas') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'catalogos' AND table_name = 'personas') THEN
        ALTER TABLE public.personas SET SCHEMA catalogos;
    END IF;

    -- 4. EMPLEADOS
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'empleados') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'catalogos' AND table_name = 'empleados') THEN
        ALTER TABLE public.empleados SET SCHEMA catalogos;
    END IF;

    -- 5. AREAS
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'areas') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'catalogos' AND table_name = 'areas') THEN
        ALTER TABLE public.areas SET SCHEMA catalogos;
    END IF;

    -- 6. DIRECCIONES
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'direcciones') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'catalogos' AND table_name = 'direcciones') THEN
        ALTER TABLE public.direcciones SET SCHEMA catalogos;
    END IF;

    -- 7. CAT_ESTADOS
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'cat_estados') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'catalogos' AND table_name = 'cat_estados') THEN
        ALTER TABLE public.cat_estados SET SCHEMA catalogos;
    END IF;

    -- 8. CAT_MUNICIPIOS
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'cat_municipios') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'catalogos' AND table_name = 'cat_municipios') THEN
        ALTER TABLE public.cat_municipios SET SCHEMA catalogos;
    END IF;

    -- 9. CAT_ESTATUS
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'cat_estatus') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'catalogos' AND table_name = 'cat_estatus') THEN
        ALTER TABLE public.cat_estatus SET SCHEMA catalogos;
    END IF;

    -- 10. CONTROL_FOLIOS_CONFIG (La que causó el error)
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'control_folios_config') 
       AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'catalogos' AND table_name = 'control_folios_config') THEN
        ALTER TABLE public.control_folios_config SET SCHEMA catalogos;
    END IF;

END $$;