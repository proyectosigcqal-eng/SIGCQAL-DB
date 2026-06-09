-- liquibase formatted sql

-- changeset ErickRivera:7-crear-tabla-sustantiva-quejas-oficios-autoridad dbms:postgresql runOnChange:true
-- comment: Creacion de la tabla quejas_oficios_autoridad exactamente como fue provista de forma idempotente.
CREATE TABLE IF NOT EXISTS sustantiva.quejas_oficios_autoridad (
    id_oficio_autoridad SERIAL PRIMARY KEY,
    id_ari INT NOT NULL,                     
    
    -- Oficio de salida (Para firma del comisionado)
    num_oficio_comisionado VARCHAR(50) UNIQUE NOT NULL,
    fecha_envio_oficio DATE NOT NULL,
    
    -- Notificación inicial obligatoria al quejoso (A más tardar al día siguiente)
    fecha_notificacion_quejoso DATE,
    
    FOREIGN KEY (id_ari) REFERENCES sustantiva.quejas_ari(id_ari)
);
