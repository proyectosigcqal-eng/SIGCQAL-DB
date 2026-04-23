--liquibase formatted sql
--changeset AnaRivera:añadir_tabla_seguimiento_correspondencia

CREATE TABLE seguimiento_correspondencia (
   	id_seguimiento_correspondencia SERIAL PRIMARY KEY,
	id_folio INT NOT NULL,
	folio_respuesta VARCHAR(50) NOT NULL,
    respuesta_seguimiento_correspondencia TEXT,
    fecha_resolucion DATE NOT NULL,
    hora_resolucion TIME NOT NULL,
    archivo_adjunto VARCHAR(255),
    id_usuario INT NOT NULL,
    id_estatus INT NOT NULL,
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
	    CONSTRAINT fk_estatus FOREIGN KEY (id_estatus) REFERENCES cat_estatus(id_estatus),
	    CONSTRAINT fk_correspondencia FOREIGN KEY (id_folio) REFERENCES correspondencia(id_folio)
    );