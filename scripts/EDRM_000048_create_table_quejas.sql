-- liquibase formatted sql

-- changeset ErickRivera:3-crear-tabla-sustantiva-quejas dbms:postgresql
-- comment: Creacion de la tabla core de quejas exactamente como fue provista.
CREATE TABLE IF NOT EXISTS sustantiva.quejas (
    id_queja SERIAL PRIMARY KEY,
    id_expediente INT UNIQUE NOT NULL,      -- FK a sustantiva.expedientes
    id_asesor INT NOT NULL,                 -- FK a sustantiva.asesores
    id_autoridad INT NOT NULL,              -- FK a catalogos.cat_autoridades (¡Agregada!)
    id_estatus_queja INT NOT NULL DEFAULT 1,-- FK a catalogos.cat_estatus_queja (¡Agregada!)
    
    -- Requisitos obligatorios de admisión para generar la CIR (Checklist)
    requisito_identificacion BOOLEAN DEFAULT FALSE,
    requisito_actos_fiscales BOOLEAN DEFAULT FALSE,
    requisito_narrativa_clara BOOLEAN DEFAULT FALSE,
    requisito_competencia_cedecon BOOLEAN DEFAULT FALSE,
    
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente),
    FOREIGN KEY (id_asesor) REFERENCES sustantiva.asesores(id_asesores),
    FOREIGN KEY (id_autoridad) REFERENCES catalogos.autoridades(id_autoridad),
    FOREIGN KEY (id_estatus_queja) REFERENCES catalogos.cat_estatus_queja(id_estatus_queja)
);