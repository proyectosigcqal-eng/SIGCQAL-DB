--liquibase formatted sql
--changeset alan_rivera:crear_cat_tipo_y_alter_correspondencia

-- 1. Crear catálogo
CREATE TABLE IF NOT EXISTS catalogos.cat_tipo_correspondencia (
    id_tipo          SERIAL       PRIMARY KEY,
    id_natural       VARCHAR(20)  NOT NULL UNIQUE,
    descripcion      VARCHAR(100) NOT NULL,
    activo           BOOLEAN      NOT NULL DEFAULT TRUE,
    fecha_creacion   TIMESTAMP    NOT NULL DEFAULT NOW()
);

-- 2. Insertar Semilla
INSERT INTO catalogos.cat_tipo_correspondencia (id_natural, descripcion)
VALUES 
    ('EXTERNA', 'Correspondencia proveniente de dependencias externas'),
    ('INTERNA', 'Correspondencia generada internamente entre áreas')
ON CONFLICT (id_natural) DO NOTHING;

-- 3. Alterar tabla principal
ALTER TABLE correspondencia.correspondencia 
    ADD COLUMN IF NOT EXISTS id_tipo_correspondencia INTEGER 
    REFERENCES catalogos.cat_tipo_correspondencia(id_tipo) 
    DEFAULT 1;

CREATE INDEX IF NOT EXISTS idx_correspondencia_tipo 
    ON correspondencia.correspondencia(id_tipo_correspondencia);