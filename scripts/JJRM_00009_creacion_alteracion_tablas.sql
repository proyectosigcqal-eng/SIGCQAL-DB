--liquibase formatted sql
--changeset JuanRivera:creación tabla Plantilla_memorandum, creación tabla empleados, agregar campos del memorandum


-- 1. Crear la tabla de Plantillas (Solo si no existe)
CREATE TABLE IF NOT EXISTS plantilla_memorandum (
    id_plantilla SERIAL PRIMARY KEY,
    nombre_plantilla VARCHAR(150) NOT NULL,
    url_plantilla_memorandum TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);

-- 2. Crear la tabla de Empleados (Solo si no existe)
-- Requerido para capturar Nombre, Cargo y Dependencia [cite: 22, 23, 24]
CREATE TABLE IF NOT EXISTS empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(255) NOT NULL,
    cargo VARCHAR(150),
    id_area INT, 
    CONSTRAINT fk_empleado_area FOREIGN KEY (id_area) REFERENCES areas(id_area)
);

-- 3. Agregar los campos faltantes a 'memorandums'
-- Usamos IF NOT EXISTS en cada columna por si ya habías agregado alguna
ALTER TABLE memorandums
    ADD COLUMN IF NOT EXISTS folio_unico VARCHAR(100) UNIQUE, -- [cite: 10]            --            -- 
    ADD COLUMN IF NOT EXISTS observaciones TEXT,               -- [cite: 20, 43]
    ADD COLUMN IF NOT EXISTS url_memorandum_generado VARCHAR(255),
    ADD COLUMN IF NOT EXISTS id_plantilla INT,
    ADD COLUMN IF NOT EXISTS id_area INT,                     -- [cite: 47, 51]
    ADD COLUMN IF NOT EXISTS id_usuario_firmante INT;         -- [cite: 25, 48]

-- 4. Establecer las llaves foráneas
-- Nota: Si estas ya existen, esta sección podría dar error. 
-- Se recomienda ejecutarlas una sola vez.
ALTER TABLE memorandums
    DROP CONSTRAINT IF EXISTS fk_memo_plantilla,
    DROP CONSTRAINT IF EXISTS fk_memo_area,
    DROP CONSTRAINT IF EXISTS fk_memo_firmante;

ALTER TABLE memorandums
    ADD CONSTRAINT fk_memo_plantilla FOREIGN KEY (id_plantilla) REFERENCES plantilla_memorandum(id_plantilla),
    ADD CONSTRAINT fk_memo_area FOREIGN KEY (id_area) REFERENCES areas(id_area),
    ADD CONSTRAINT fk_memo_firmante FOREIGN KEY (id_usuario_firmante) REFERENCES empleados(id_empleado);