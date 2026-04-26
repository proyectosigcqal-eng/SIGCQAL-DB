--liquibase formatted sql
--changeset RodrigoRivera:creación tabla AcuseCorrespondencia

CREATE TABLE acuse_correspondencia (
    id_acuse_correspondencia SERIAL PRIMARY KEY,
    id_correspondencia INT NOT NULL,
    id_usuario_revisor INT NOT NULL,
    fecha_aceptacion DATE,
    hora_aceptacion TIME,
    es_del_area BOOLEAN DEFAULT NULL,

    CONSTRAINT fk_acuse_correspondencia
        FOREIGN KEY (id_correspondencia)
        REFERENCES correspondencia(id_correspondencia),

    CONSTRAINT fk_acuse_usuario_correspondencia
        FOREIGN KEY (id_usuario_revisor)
        REFERENCES usuarios(id_usuario),

    CONSTRAINT uq_acuse_correspondencia 
        UNIQUE (id_correspondencia, id_usuario_revisor)
);

