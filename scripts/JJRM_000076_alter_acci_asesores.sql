--liquibase formatted sql
--changeset JuanRivera:alter_acci_asesores
-- 1. Quitar el FK que apunta a la tabla huérfana
ALTER TABLE sustantiva.quejas_acci DROP CONSTRAINT IF EXISTS quejas_acci_id_oficio_autoridad_fkey;

ALTER TABLE sustantiva.quejas_acci
  ADD CONSTRAINT quejas_acci_id_oficio_notificacion_fkey
  FOREIGN KEY (id_oficio_autoridad)
  REFERENCES sustantiva.oficio_notificacion (id_oficio_notificacion);

ALTER TABLE sustantiva.asesores 
ADD COLUMN IF NOT EXISTS activo boolean DEFAULT true;

