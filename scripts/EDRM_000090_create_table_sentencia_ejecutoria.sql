--liquibase formatted sql

--changeset ErickRivera:EDRM_000090_create_table_sentencia_ejecutoria endDelimiter:; runOnChange:true
--comment: Creación de la tabla sentencia_ejecutoria y comentarios de documentación
CREATE TABLE IF NOT EXISTS sustantiva.sentencia_ejecutoria (
    id_sentencia_ejecutoria SERIAL PRIMARY KEY,
    id_sentencia INT NOT NULL,
    id_recurso_revision INT,
    numero_oficio_ejecutoria VARCHAR(100) NOT NULL,
    fecha_declaracion_ejecutoria DATE NOT NULL,
    requerimiento_cumplimiento TEXT,
    fecha_registro TIMESTAMP DEFAULT NOW() NOT NULL,
    
    CONSTRAINT fk_ejecutoria_sentencia 
        FOREIGN KEY (id_sentencia) 
        REFERENCES sustantiva.sentencia_dictada(id_sentencia)
        ON DELETE CASCADE,
        
    CONSTRAINT fk_ejecutoria_revision 
        FOREIGN KEY (id_recurso_revision) 
        REFERENCES sustantiva.recurso_revision(id_recurso_revision)
        ON DELETE SET NULL
);

COMMENT ON TABLE sustantiva.sentencia_ejecutoria IS 'Registra el momento en que la sentencia queda firme (Ejecutoria), ya sea por plazo o por resolución del recurso.';

--rollback DROP TABLE sustantiva.sentencia_ejecutoria CASCADE;