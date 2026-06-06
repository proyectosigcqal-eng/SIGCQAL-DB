-- liquibase formatted sql

-- changeset ErickRivera:4-crear-tabla-sustantiva-quejas-cir dbms:postgresql
-- comment: Creacion de la tabla quejas_cir exactamente como fue provista.
CREATE TABLE IF NOT EXISTS sustantiva.quejas_cir (
    id_cir SERIAL PRIMARY KEY,
    id_queja INT UNIQUE NOT NULL,           -- Relación 1:1
    fecha_emision TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ruta_pdf_cir VARCHAR(255) NOT NULL,     -- Archivo generado automáticamente
    id_asesor_ejecutor INT NOT NULL,        
    
    FOREIGN KEY (id_queja) REFERENCES sustantiva.quejas(id_queja),
    FOREIGN KEY (id_asesor_ejecutor) REFERENCES sustantiva.asesores(id_asesores)
);