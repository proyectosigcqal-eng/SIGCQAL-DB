--liquibase formatted sql

--changeset ErickRivera:EDRM_000086_create_table_audiencia_espera endDelimiter:; runOnChange:true
--comment: Creación de la tabla audiencia_espera y comentarios de documentación
CREATE TABLE IF NOT EXISTS sustantiva.audiencia_espera (
    id_audiencia_espera SERIAL PRIMARY KEY,
    id_demanda_amparo INT NOT NULL,
    numero_oficio_admision VARCHAR(100) NOT NULL,
    fecha_notificacion_oficio DATE NOT NULL,
    fecha_hora_audiencia_prog TIMESTAMP NOT NULL,
    observaciones TEXT,
    fecha_registro TIMESTAMP DEFAULT NOW() NOT NULL,
    
    CONSTRAINT fk_aud_espera_demanda 
        FOREIGN KEY (id_demanda_amparo) 
        REFERENCES sustantiva.irl_demanda_amparo(id_demanda_amparo)
        ON DELETE CASCADE
);

COMMENT ON TABLE sustantiva.audiencia_espera IS 'Almacena los datos cuando la demanda de amparo es admitida y se espera la fecha de audiencia constitucional.';
COMMENT ON COLUMN sustantiva.audiencia_espera.fecha_hora_audiencia_prog IS 'Fecha y hora programada por el juzgado para celebrar la audiencia.';

--rollback DROP TABLE sustantiva.audiencia_espera CASCADE;