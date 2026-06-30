--liquibase formatted sql

--changeset ErickRivera:EDRM_000091_create_table_notificacion_sentencia_cumplida endDelimiter:; runOnChange:true
--comment: Creación de la tabla notificacion_sentencia_cumplida y comentarios de documentación
CREATE TABLE IF NOT EXISTS sustantiva.notificacion_sentencia_cumplida (
    id_sentencia_cumplida SERIAL PRIMARY KEY,
    id_sentencia_ejecutoria INT NOT NULL,
    numero_oficio_cumplimiento VARCHAR(100) NOT NULL,
    numero_oficio_archivo VARCHAR(100) NOT NULL,
    fecha_notificacion_archivo DATE NOT NULL,
    observaciones_finales TEXT,
    fecha_registro TIMESTAMP DEFAULT NOW() NOT NULL,
    
    CONSTRAINT fk_cumplida_ejecutoria 
        FOREIGN KEY (id_sentencia_ejecutoria) 
        REFERENCES sustantiva.sentencia_ejecutoria(id_sentencia_ejecutoria)
        ON DELETE CASCADE
);

COMMENT ON TABLE sustantiva.notificacion_sentencia_cumplida IS 'Último hito del juicio: Notificación de cumplimiento por parte del juzgado y orden de archivo definitivo.';

--rollback DROP TABLE sustantiva.notificacion_sentencia_cumplida CASCADE;