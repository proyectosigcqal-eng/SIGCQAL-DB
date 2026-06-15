--liquibase formatted sql

--changeset anarosariveramorales:create_table_cierre_expediente dbms:postgresql
--comment: crear tabla cierre expediente y añadir registro en estatus expediente para el cierre de este

-- Crear tabla solo si no existe
CREATE TABLE IF NOT EXISTS sustantiva.cierre_expediente (
	id_cierre serial4 NOT NULL,
	id_expediente int4 NOT NULL,
	medio_notificacion varchar(255) NOT NULL,
	ruta_archivo_acuerdo varchar(255) NOT NULL,
	fecha_cierre timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	usuario_cierre int8 NOT NULL,
	CONSTRAINT cierre_expediente_id_expediente_key UNIQUE (id_expediente),
	CONSTRAINT cierre_expediente_pkey PRIMARY KEY (id_cierre)
);

-- Las foreign keys solo se añaden si no existen para evitar errores de duplicidad
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_expediente_cierre') THEN
        ALTER TABLE sustantiva.cierre_expediente ADD CONSTRAINT fk_expediente_cierre FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_usuario_cierre') THEN
        ALTER TABLE sustantiva.cierre_expediente ADD CONSTRAINT fk_usuario_cierre FOREIGN KEY (usuario_cierre) REFERENCES catalogos.usuarios(id_usuario);
    END IF;
END $$;

-- Modificación en estatus_expediente (Tu lógica original ya es segura)
INSERT INTO catalogos.estatus_expediente (id, nombre)
SELECT 5, 'EXPEDIENTE CERRADO'
WHERE NOT EXISTS (
    SELECT 1 FROM catalogos.estatus_expediente WHERE id = 5
) 
AND NOT EXISTS (
    SELECT 1 FROM catalogos.estatus_expediente WHERE nombre = 'EXPEDIENTE CERRADO'
);
