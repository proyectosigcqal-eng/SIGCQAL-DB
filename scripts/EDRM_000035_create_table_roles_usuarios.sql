--liquibase formatted sql

--changeset ErickRivera:crear_tabla_usuarios_roles_v1
-- Creamos la tabla primero con SQL estandar
CREATE TABLE IF NOT EXISTS catalogos.usuarios_roles (
    id_usuario_rol SERIAL PRIMARY KEY,
    id_usuario INT4 NOT NULL,
    id_rol INT4 NOT NULL,
    fecha_asignacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) 
        REFERENCES catalogos.usuarios (id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_rol FOREIGN KEY (id_rol) 
        REFERENCES catalogos.roles (id_rol) ON DELETE CASCADE,
    CONSTRAINT uq_usuario_rol UNIQUE (id_usuario, id_rol)
);

--changeset ErickRivera:limpiar_y_extender_v1 splitStatements:false
-- Aqui usamos splitStatements:false para que Liquibase no rompa el bloque DO
DO $$ 
BEGIN 
    -- Limpiar columna vieja
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_schema='catalogos' AND table_name='usuarios' AND column_name='id_rol') THEN
        ALTER TABLE catalogos.usuarios DROP COLUMN id_rol;
    END IF;

    -- Agregar columna url
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_schema='catalogos' AND table_name='roles' AND column_name='url') THEN
        ALTER TABLE catalogos.roles ADD COLUMN url VARCHAR(255);
    END IF;

    -- Agregar columna activo
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_schema='catalogos' AND table_name='roles' AND column_name='activo') THEN
        ALTER TABLE catalogos.roles ADD COLUMN activo BOOLEAN DEFAULT TRUE;
    END IF;
END $$;