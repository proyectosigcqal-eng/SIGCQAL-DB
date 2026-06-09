-- liquibase formatted sql

-- changeset ErickRivera:8-crear-tabla-sustantiva-quejas-acci dbms:postgresql runOnChange:true splitStatements:false
-- comment: Creacion de la tabla quejas_acci de forma totalmente idempotente con splitStatements desactivado.
CREATE TABLE IF NOT EXISTS sustantiva.quejas_acci (
    id_acci SERIAL PRIMARY KEY,
    id_queja INT UNIQUE NOT NULL,
    id_oficio_autoridad INT UNIQUE NOT NULL, -- Viene del oficio cuyo informe fue deficiente
    
    -- Datos propios del ACCI:
    justificacion_investigacion TEXT NOT NULL,  -- Por qué el informe previo viola derechos
    nuevos_requerimientos_autoridad TEXT NOT NULL, -- Lo que se le vuelve a pedir bajo apercibimiento
    plazo_dias_habiles INT DEFAULT 5,           -- Plazo legal de desahogo
    
    fecha_emision_acci DATE NOT NULL DEFAULT CURRENT_DATE,
    ruta_pdf_acci VARCHAR(255) NOT NULL,        -- Documento final generado
    concluido BOOLEAN DEFAULT FALSE,            -- Flag para saber si ya puede pasar a resolución
    fecha_conclusion TIMESTAMP,
    
    FOREIGN KEY (id_queja) REFERENCES sustantiva.quejas(id_queja),
    FOREIGN KEY (id_oficio_autoridad) REFERENCES sustantiva.quejas_oficios_autoridad(id_oficio_autoridad)
);

-- rollback ALTER TABLE sustantiva.quejas_acci DROP CONSTRAINT IF EXISTS quejas_acci_id_queja_fkey;
-- rollback ALTER TABLE sustantiva.quejas_acci DROP CONSTRAINT IF EXISTS quejas_acci_id_oficio_autoridad_fkey;
-- rollback DROP TABLE IF EXISTS sustantiva.quejas_acci;