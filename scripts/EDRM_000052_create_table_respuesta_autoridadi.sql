-- liquibase formatted sql

-- changeset ErickRivera:6-crear-tabla-sustantiva-quejas-respuestas-autoridad dbms:postgresql
-- comment: Creacion de la tabla quejas_respuestas_autoridad exactamente como fue provista.
CREATE TABLE IF NOT EXISTS sustantiva.quejas_respuestas_autoridad (
    id_respuesta_autoridad SERIAL PRIMARY KEY,
    id_oficio_autoridad INT NOT NULL,       -- FK apuntando al oficio de salida que se está contestando
    
    num_oficio_contestacion_autoridad VARCHAR(50) NOT NULL, -- Ej: DI/3239/2025
    fecha_recepcion_oficialia DATE NOT NULL,                -- Fecha de entrada a CEDECON
    informe_rendido BOOLEAN DEFAULT TRUE,
    
    descripcion_analisis_asesor TEXT,       -- Comentarios/análisis del Asesor sobre la respuesta
    ruta_pdf_informe_autoridad VARCHAR(255) NOT NULL,       -- PDF del informe escaneado
    
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_oficio_autoridad) REFERENCES sustantiva.quejas_oficios_autoridad(id_oficio_autoridad)
);
