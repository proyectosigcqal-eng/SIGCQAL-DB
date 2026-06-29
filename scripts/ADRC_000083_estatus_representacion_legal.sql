--liquibase formatted sql

--changeset ADRC:create_estatus_representacion_legal
-- 1) Crear tabla de estatus
CREATE TABLE IF NOT EXISTS catalogos.estatus_representacion_legal (
    id_estatus SERIAL PRIMARY KEY,
    nombre_estatus VARCHAR(100) NOT NULL UNIQUE,
    orden INT NOT NULL,
    descripcion TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar datos evitando duplicados en caso de re-ejecución
INSERT INTO catalogos.estatus_representacion_legal (nombre_estatus, orden, descripcion) VALUES
('Asignado', 1, 'Caso asignado al representante legal.'),
('CIR generado', 2, 'Certificado de Información de Resultados (CIR) generado.'),
('Demanda presentada', 3, 'La demanda formal ha sido presentada ante la autoridad competente.'),
('Admitida en espera de audiencia', 4, 'La demanda ha sido admitida y se encuentra a la espera de la celebración de la audiencia.'),
('Audiencia celebrada', 5, 'Se ha llevado a cabo la audiencia correspondiente.'),
('Sentencia dictada', 6, 'La autoridad judicial ha emitido la sentencia en primera instancia.'),
('En recurso de revisión', 7, 'El proceso se encuentra impugnado mediante recurso de revisión u otra apelación.'),
('Sentencia Ejecutoria', 8, 'La sentencia ha quedado firme (causó ejecutoria) y es de cumplimiento obligatorio.'),
('Cumplimiento notificado', 9, 'Se ha informado y notificado formalmente el cumplimiento de la resolución.'),
('Concluido', 10, 'El caso de representación legal ha finalizado por completo.')
ON CONFLICT (nombre_estatus) DO NOTHING;

-- 2) Agregar FK a representacion_legal
ALTER TABLE sustantiva.representacion_legal
ADD COLUMN IF NOT EXISTS id_estatus INT;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_rep_legal_estatus') THEN
        ALTER TABLE sustantiva.representacion_legal 
        ADD CONSTRAINT fk_rep_legal_estatus 
        FOREIGN KEY (id_estatus) REFERENCES catalogos.estatus_representacion_legal(id_estatus);
    END IF;
END $$;