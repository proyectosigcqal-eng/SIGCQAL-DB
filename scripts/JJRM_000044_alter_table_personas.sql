--liquibase formatted sql

--changeset JuanRivera:alter_table_personas dbms:postgresql
--comment: Agregando campos y catálogos usando IF NOT EXISTS para evitar conflictos.

-- ============================================================
-- 1. TABLA CATÁLOGO: tipo_persona
-- ============================================================
CREATE TABLE IF NOT EXISTS catalogos.tipo_persona (
    id_tipo_persona SERIAL PRIMARY KEY,
    nombre          VARCHAR(50) NOT NULL
);

-- Insertar solo si no existen (evita duplicados en re-ejecución)
INSERT INTO catalogos.tipo_persona (nombre)
SELECT 'Física'
WHERE NOT EXISTS (
    SELECT 1 FROM catalogos.tipo_persona WHERE nombre = 'Física'
);

INSERT INTO catalogos.tipo_persona (nombre)
SELECT 'Moral'
WHERE NOT EXISTS (
    SELECT 1 FROM catalogos.tipo_persona WHERE nombre = 'Moral'
);

-- ============================================================
-- 2. COLUMNAS NUEVAS EN personas
--    Cada ADD COLUMN usa IF NOT EXISTS (disponible desde PG 9.6)
--    para que no falle si se ejecuta dos veces
-- ============================================================
ALTER TABLE catalogos.personas
    ADD COLUMN IF NOT EXISTS comunidad              VARCHAR(150),
    ADD COLUMN IF NOT EXISTS rfc                    VARCHAR(13),
    ADD COLUMN IF NOT EXISTS rec                    VARCHAR(20),
    ADD COLUMN IF NOT EXISTS identificacion_oficial VARCHAR(50),
    ADD COLUMN IF NOT EXISTS telefono_fijo          VARCHAR(50),
    ADD COLUMN IF NOT EXISTS numero_id_folio        VARCHAR(30),
    ADD COLUMN IF NOT EXISTS correo                 VARCHAR(100),
    ADD COLUMN IF NOT EXISTS id_tipo_persona        INTEGER;


--changeset JuanRivera:alter_table_personas_fk dbms:postgresql splitStatements:false
--comment: Agregando llave foránea usando DO para evitar errores de Liquibase al partir sentencias.

-- ============================================================
-- 3. LLAVE FORÁNEA hacia tipo_persona
--    Se verifica en pg_constraint antes de agregarla
-- ============================================================
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_constraint
        WHERE  conname = 'fk_personas_tipo_persona'
    ) THEN
        ALTER TABLE catalogos.personas
            ADD CONSTRAINT fk_personas_tipo_persona
            FOREIGN KEY (id_tipo_persona)
            REFERENCES catalogos.tipo_persona (id_tipo_persona);
    END IF;
END;
$$;