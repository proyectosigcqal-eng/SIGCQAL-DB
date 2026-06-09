--liquibase formatted sql

--changeset JuanRivera:alter-table-personas dbms:postgresql
--comment: Agrega columna tipo_identificacion si no existe.
ALTER TABLE catalogos.personas ADD COLUMN IF NOT EXISTS tipo_identificacion VARCHAR(100);

--changeset JuanRivera:create-table-dias-inhabiles dbms:postgresql
--comment: Creacion de la tabla dias inhabiles.
CREATE TABLE IF NOT EXISTS catalogos.dias_inhabiles (
    id_dia_inhabil  SERIAL PRIMARY KEY,
    fecha           DATE        NOT NULL UNIQUE,
    descripcion     VARCHAR(150),
    activo          BOOLEAN     NOT NULL DEFAULT true
);

-- Datos de prueba
INSERT INTO catalogos.dias_inhabiles (fecha, descripcion) VALUES
('2026-01-01', 'Año Nuevo'),
('2026-02-03', 'Aniversario Constitución'),
('2026-03-21', 'Natalicio Benito Juárez'),
('2026-05-01', 'Día del Trabajo'),
('2026-09-16', 'Independencia de México'),
('2026-11-02', 'Día de Muertos'),
('2026-11-16', 'Revolución Mexicana'),
('2026-12-25', 'Navidad')
ON CONFLICT (fecha) DO NOTHING;