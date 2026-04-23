-- =============================================
-- EDRM_00002 - Modificación tabla areas
-- =============================================

-- Eliminar columnas que ya no se necesitan
ALTER TABLE areas DROP COLUMN IF EXISTS titular_area;
ALTER TABLE areas DROP COLUMN IF EXISTS siglas_area;

-- Agregar nueva columna descripción
ALTER TABLE areas ADD COLUMN IF NOT EXISTS descripcion TEXT;

-- Comentario opcional
COMMENT ON COLUMN areas.descripcion IS 'Descripción detallada del área o función principal';