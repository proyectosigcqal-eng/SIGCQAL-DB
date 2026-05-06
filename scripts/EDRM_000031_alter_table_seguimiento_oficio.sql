--liquibase formatted sql
--changeset Erick Rivera:agregar_fks_seguimiento_vFINAL

-- Limpieza preventiva
ALTER TABLE correspondencia.seguimiento_oficio DROP CONSTRAINT IF EXISTS fk_seguimiento_oficio_oficio;
ALTER TABLE correspondencia.seguimiento_oficio DROP CONSTRAINT IF EXISTS fk_seguimiento_oficio_usuario;
ALTER TABLE correspondencia.seguimiento_oficio DROP CONSTRAINT IF EXISTS fk_seguimiento_oficio_estatus;

-- Creación de llaves foráneas
ALTER TABLE correspondencia.seguimiento_oficio 
    ADD CONSTRAINT fk_seguimiento_oficio_oficio FOREIGN KEY (id_oficio) REFERENCES correspondencia.oficio(id_oficio);
ALTER TABLE correspondencia.seguimiento_oficio 
    ADD CONSTRAINT fk_seguimiento_oficio_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario);
ALTER TABLE correspondencia.seguimiento_oficio 
    ADD CONSTRAINT fk_seguimiento_oficio_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);