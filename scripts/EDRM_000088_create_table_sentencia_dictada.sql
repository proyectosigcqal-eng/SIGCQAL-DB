--liquibase formatted sql

--changeset ErickRivera:EDRM_000088_create_table_sentencia_dictada endDelimiter:; runOnChange:true
--comment: Creación de la tabla sentencia_dictada y comentarios de documentación
CREATE TABLE IF NOT EXISTS sustantiva.sentencia_dictada (
    id_sentencia SERIAL PRIMARY KEY,
    id_audiencia_celebrada INT NOT NULL,
    fecha_dictado DATE NOT NULL,
    fecha_notificacion_sentencia DATE NOT NULL,
    sentido_fallo VARCHAR(100) NOT NULL,
    puntos_resolutivos TEXT NOT NULL,
    numero_oficio_sentencia VARCHAR(100),
    ruta_archivo_sentencia VARCHAR(500),
    fecha_registro TIMESTAMP DEFAULT NOW() NOT NULL,
    
    CONSTRAINT fk_sentencia_aud_celebrada 
        FOREIGN KEY (id_audiencia_celebrada) 
        REFERENCES sustantiva.audiencia_celebrada(id_audiencia_celebrada)
        ON DELETE CASCADE
);

COMMENT ON TABLE sustantiva.sentencia_dictada IS 'Guarda el fallo final del juez, sentidos de resolución y documentos adjuntos de la sentencia dictada.';

--rollback DROP TABLE sustantiva.sentencia_dictada CASCADE;