--liquibase formatted sql
--changeset ADRC:alter_table_quejas_cir_fk endDelimiter:;
--comment: Adición de campos faltantes y llaves foráneas a la tabla quejas_cir según nuevo modelo

-- 1. Agregar las columnas faltantes verificando que no existan previamente
ALTER TABLE sustantiva.quejas_cir 
ADD COLUMN IF NOT EXISTS id_expediente integer,
ADD COLUMN IF NOT EXISTS id_area_recibe integer,
ADD COLUMN IF NOT EXISTS id_area_remite integer,
ADD COLUMN IF NOT EXISTS id_tipo_tramite integer,
ADD COLUMN IF NOT EXISTS fundamentos text;

-- 2. Agregar los Constraints (Llaves Foráneas)
-- Relación con tabla expedientes
ALTER TABLE sustantiva.quejas_cir
ADD CONSTRAINT fk_quejas_cir_expediente 
FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);

-- Relación con tabla areas (Área que recibe)
ALTER TABLE sustantiva.quejas_cir
ADD CONSTRAINT fk_quejas_cir_area_recibe 
FOREIGN KEY (id_area_recibe) REFERENCES catalogos.areas(id_area);

-- Relación con tabla areas (Área que remite)
ALTER TABLE sustantiva.quejas_cir
ADD CONSTRAINT fk_quejas_cir_area_remite 
FOREIGN KEY (id_area_remite) REFERENCES catalogos.areas(id_area);

-- Relación con tabla tipo_tramite
ALTER TABLE sustantiva.quejas_cir
ADD CONSTRAINT fk_quejas_cir_tipo_tramite 
FOREIGN KEY (id_tipo_tramite) REFERENCES catalogos.tipo_tramite(id_tipo_tramite);
