--liquibase formatted sql
--changeset Erick Rivera:agregar_fks_oficio_v2

-- Limpieza preventiva
ALTER TABLE correspondencia.oficio DROP CONSTRAINT IF EXISTS fk_oficio_correspondencia;
ALTER TABLE correspondencia.oficio DROP CONSTRAINT IF EXISTS fk_oficio_usuario_emisor;
ALTER TABLE correspondencia.oficio DROP CONSTRAINT IF EXISTS fk_oficio_area;
ALTER TABLE correspondencia.oficio DROP CONSTRAINT IF EXISTS fk_oficio_usuario_firmante;

-- Creación de llaves foráneas
ALTER TABLE correspondencia.oficio 
    ADD CONSTRAINT fk_oficio_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);
ALTER TABLE correspondencia.oficio 
    ADD CONSTRAINT fk_oficio_usuario_emisor FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);
ALTER TABLE correspondencia.oficio 
    ADD CONSTRAINT fk_oficio_area FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);
ALTER TABLE correspondencia.oficio 
    ADD CONSTRAINT fk_oficio_usuario_firmante FOREIGN KEY (id_usuario_firmante) REFERENCES catalogos.usuarios(id_usuario);