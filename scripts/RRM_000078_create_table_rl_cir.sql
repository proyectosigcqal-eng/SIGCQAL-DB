-- liquibase formatted sql

-- changeset RodrigoRivera:crear-tabla-sustantiva-rl-cir dbms:postgresql runOnChange:true
-- comment: Creacion de la tabla rl_cir.

CREATE TABLE IF NOT EXISTS sustantiva.rl_cir (
    id_rl_cir SERIAL PRIMARY KEY,
    id_expediente INT NOT NULL,
    fecha_emision DATE NOT NULL,
    motivos TEXT,
    articulos TEXT,
    observaciones TEXT,
    id_asesor_remitente INT NOT NULL,
    id_asesor_recibe INT NOT NULL,
    director VARCHAR(150),
    ruta_pdf_rl_cir VARCHAR(255),

    FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente),
    FOREIGN KEY (id_asesor_remitente) REFERENCES sustantiva.asesores(id_asesores),
    FOREIGN KEY (id_asesor_recibe) REFERENCES sustantiva.asesores(id_asesores)
);