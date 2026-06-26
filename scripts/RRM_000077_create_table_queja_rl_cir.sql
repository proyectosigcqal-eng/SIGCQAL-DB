-- liquibase formatted sql

-- changeset RodrigoRivera:crear-tabla-sustantiva-quejas-rl-cir dbms:postgresql runOnChange:true
-- comment: Creacion de la tabla quejas_rl_cir.

CREATE TABLE IF NOT EXISTS sustantiva.queja_rl_cir (
    id_queja_rl_cir SERIAL PRIMARY KEY,
    id_resolucion_final INT NOT NULL,
    fecha_emision DATE NOT NULL,
    motivos TEXT,
    articulos TEXT,
    observaciones TEXT,
    id_asesor_remitente INT NOT NULL,
    id_asesor_recibe INT NOT NULL,
    director VARCHAR(150),
    oficio VARCHAR(100),
    ruta_pdf_queja_rl_cir VARCHAR(255),

    FOREIGN KEY (id_resolucion_final) REFERENCES sustantiva.resolucion_final(id_resolucion_final),
    FOREIGN KEY (id_asesor_remitente) REFERENCES sustantiva.asesores(id_asesores),
    FOREIGN KEY (id_asesor_recibe) REFERENCES sustantiva.asesores(id_asesores)
);