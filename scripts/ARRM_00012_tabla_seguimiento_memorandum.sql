--liquibase formatted sql
--changeset AnaRivera:añadir_tabla_seguimiento_memorandum
CREATE TABLE seguimiento_memorandum (
    id_seguimiento_memorandum SERIAL PRIMARY KEY,
    id_memo INT NOT NULL,
    folio_respuesta  SERIAL not NULL,
    respuesta_seguimiento_memorandum TEXT,
    fecha_resolucion DATE NOT NULL,
    hora_resolucion TIME NOT NULL,
    archivo_adjunto VARCHAR(255),
    id_usuario INT NOT NULL,
    id_estatus INT NOT NULL,
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    -- Relaciones (FK)
    CONSTRAINT fk_memorandum FOREIGN KEY (id_memo) REFERENCES memorandums (id_memo),
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    CONSTRAINT fk_estatus FOREIGN KEY (id_estatus) REFERENCES cat_estatus(id_estatus)
);
