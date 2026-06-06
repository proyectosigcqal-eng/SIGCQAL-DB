-- liquibase formatted sql

-- changeset ErickRivera:5-crear-tabla-sustantiva-quejas-ari dbms:postgresql
-- comment: Creacion de la tabla quejas_ari exactamente como fue provista.
CREATE TABLE IF NOT EXISTS sustantiva.quejas_ari (
    id_ari SERIAL PRIMARY KEY,
    id_queja INT UNIQUE NOT NULL,           -- Hereda todo el contexto transaccional
    id_cir INT UNIQUE NOT NULL,             -- Vinculación obligatoria del paso anterior
    
    -- Datos propios del ARI:
    num_expediente_oficial VARCHAR(50) UNIQUE NOT NULL, -- Ej: CEDECON-ZAC-QR-020/2025
    sintesis_actos_omisiones TEXT NOT NULL,           -- Transcripción de hechos violatorios
    articulos_vulnerados_autoridad TEXT NOT NULL,      -- Ej: "Art. 115 frac I del Código Fiscal..."
    nombre_encargado_firma VARCHAR(150) NOT NULL,      -- Lic. José David Rivera Sesma (Dinámico)
    
    fecha_acuerdo DATE NOT NULL DEFAULT CURRENT_DATE,
    ruta_pdf_ari VARCHAR(255) NOT NULL,                -- PDF del ARI firmado
    
    FOREIGN KEY (id_queja) REFERENCES sustantiva.quejas(id_queja),
    FOREIGN KEY (id_cir) REFERENCES sustantiva.quejas_cir(id_cir)
);