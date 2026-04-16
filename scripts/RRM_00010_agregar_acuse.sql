--liquibase formatted sql
--changeset RodrigoRivera:creación tabla AcuseReciboInterno



CREATE TABLE AcuseReciboInterno (
    id_acuse SERIAL PRIMARY KEY,

    id_memorandum INT NOT NULL,
    id_usuario_revisor INT NOT NULL,

    fecha_aceptacion DATE,
    hora_aceptacion TIME,

    es_del_area BOOLEAN DEFAULT NULL,

    -- Llaves foráneas
    CONSTRAINT fk_acuse_memorandum
        FOREIGN KEY (id_memorandum)
        REFERENCES memorandums(id_memo),

    CONSTRAINT fk_acuse_usuario
        FOREIGN KEY (id_usuario_revisor)
        REFERENCES usuarios(id_usuario),

    -- Evitar duplicados
    CONSTRAINT uq_acuse UNIQUE (id_memorandum, id_usuario_revisor)
);