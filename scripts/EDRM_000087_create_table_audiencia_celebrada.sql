--liquibase formatted sql

--changeset ErickRivera:EDRM_000087_create_table_audiencia_celebrada endDelimiter:; runOnChange:true
--comment: Creación de la tabla audiencia_celebrada y comentarios de documentación
CREATE TABLE IF NOT EXISTS sustantiva.audiencia_celebrada (
    id_audiencia_celebrada SERIAL PRIMARY KEY,
    id_audiencia_espera INT NOT NULL,
    fecha_hora_celebracion TIMESTAMP NOT NULL,
    numero_oficio_acta VARCHAR(100),
    sala_o_modalidad VARCHAR(150),
    resultado_audiencia TEXT NOT NULL,
    asistio_autoridad BOOLEAN DEFAULT TRUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT NOW() NOT NULL,
    
    CONSTRAINT fk_aud_celebrada_espera 
        FOREIGN KEY (id_audiencia_espera) 
        REFERENCES sustantiva.audiencia_espera(id_audiencia_espera)
        ON DELETE CASCADE
);

COMMENT ON TABLE sustantiva.audiencia_celebrada IS 'Registra las actas, resultados y detalles cuando la audiencia constitucional efectivamente se celebra.';

--rollback DROP TABLE sustantiva.audiencia_celebrada CASCADE;