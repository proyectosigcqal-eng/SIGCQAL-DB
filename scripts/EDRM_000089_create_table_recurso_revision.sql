--liquibase formatted sql

--changeset ErickRivera:EDRM_000089_create_table_recurso_revision endDelimiter:; runOnChange:true
--comment: Creación de la tabla recurso_revision y comentarios de documentación
CREATE TABLE IF NOT EXISTS sustantiva.recurso_revision (
    id_recurso_revision SERIAL PRIMARY KEY,
    id_sentencia INT NOT NULL,
    numero_oficio_interposicion VARCHAR(100) NOT NULL,
    numero_expediente_revision VARCHAR(50),
    tribunal_colegiado_asig VARCHAR(255),
    fecha_interposicion DATE NOT NULL,
    observaciones_seguimiento TEXT,
    fecha_registro TIMESTAMP DEFAULT NOW() NOT NULL,
    
    CONSTRAINT fk_revision_sentencia 
        FOREIGN KEY (id_sentencia) 
        REFERENCES sustantiva.sentencia_dictada(id_sentencia)
        ON DELETE CASCADE
);

COMMENT ON TABLE sustantiva.recurso_revision IS 'Seguimiento judicial del trámite del Recurso de Revisión ante el Tribunal Colegiado.';

--rollback DROP TABLE sustantiva.recurso_revision CASCADE;