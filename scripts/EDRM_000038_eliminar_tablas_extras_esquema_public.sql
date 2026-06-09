--liquibase formatted sql

--changeset ErickRivera:eliminar_tablas_esquema_public
-- 1. Borrado de tablas con dependencias fuertes
DROP TABLE IF EXISTS public.seguimiento_tramite CASCADE;
DROP TABLE IF EXISTS public.instrucciones_trabajo CASCADE;
DROP TABLE IF EXISTS public.expedientes CASCADE;

-- 2. Borrado de tablas de catálogos y personal
DROP TABLE IF EXISTS public.asesores CASCADE;
DROP TABLE IF EXISTS public.cat_tipos_tramite CASCADE;
DROP TABLE IF EXISTS public.cat_estatus CASCADE;

-- 3. Borrado de tablas de estructura y usuarios
DROP TABLE IF EXISTS public.areas CASCADE;
DROP TABLE IF EXISTS public.usuarios CASCADE;
DROP TABLE IF EXISTS public.roles CASCADE;
DROP TABLE IF EXISTS public.permisos CASCADE;

-- 4. Borrado de tablas de ubicación y datos generales
DROP TABLE IF EXISTS public.municipios CASCADE;
DROP TABLE IF EXISTS public.estados CASCADE;
DROP TABLE IF EXISTS public.personas CASCADE;
DROP TABLE IF EXISTS public.control_folios_config CASCADE;
DROP TABLE IF EXISTS public.auditoria_log CASCADE;