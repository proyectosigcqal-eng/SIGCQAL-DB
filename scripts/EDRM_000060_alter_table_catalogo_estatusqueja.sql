--liquibase formatted sql

--changeset Erick_Rivera:modificar_tabla_cat_estatus_queja endDelimiter:;
--comment: Modificación de longitud de descripción y adición de columna orden sin errores en re-ejecución

-- 1. Modificar la longitud del campo de descripción a 100 caracteres
ALTER TABLE catalogos.cat_estatus_queja 
ALTER COLUMN descripcion_estatus TYPE varchar(100);

-- 2. Agregar la columna 'orden' solo si no existe para evitar errores en el .bat
ALTER TABLE catalogos.cat_estatus_queja 
ADD COLUMN IF NOT EXISTS orden integer;

-- 3. Añadir el comentario a la columna
COMMENT ON COLUMN catalogos.cat_estatus_queja.orden IS 'Indica la secuencia lógica del estatus en el flujo de la queja';
