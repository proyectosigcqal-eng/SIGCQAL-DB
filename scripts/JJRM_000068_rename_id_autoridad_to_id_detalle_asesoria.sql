--liquibase formatted sql

-- 🆕 Agregamos splitStatements:false aquí
--changeset JuanRivera:rename_id_autoridad_to_id_detalle_asesoria splitStatements:false

-- 1. Eliminar la FK existente (Este comando ya soporta IF EXISTS nativamente)
ALTER TABLE sustantiva.quejas
    DROP CONSTRAINT IF EXISTS quejas_id_autoridad_fkey;

-- 2. Renombrar el campo de forma segura
DO $$
BEGIN
    -- Verifica si la columna 'id_autoridad' todavía existe
    IF EXISTS(SELECT 1 FROM information_schema.columns 
              WHERE table_schema = 'sustantiva' 
                AND table_name = 'quejas' 
                AND column_name = 'id_autoridad') THEN
        
        ALTER TABLE sustantiva.quejas RENAME COLUMN id_autoridad TO id_detalle_asesoria;
    END IF;
END $$;

-- 3. Agregar la nueva FK de forma segura
DO $$
BEGIN
    -- Verifica si la restricción/llave foránea NO existe aún
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'quejas_id_detalle_asesoria_fkey') THEN
        
        ALTER TABLE sustantiva.quejas
            ADD CONSTRAINT quejas_id_detalle_asesoria_fkey
            FOREIGN KEY (id_detalle_asesoria)
            REFERENCES sustantiva.detalle_asesoria(id_detalle_asesoria);
    END IF;
END $$;