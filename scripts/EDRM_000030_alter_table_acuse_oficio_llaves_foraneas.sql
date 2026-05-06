--liquibase formatted sql

--changeset Erick Rivera:agregar_fks_acuse_vFINAL
--comment: Agregando llaves foraneas a la tabla acuse_oficio de forma segura

-- Eliminamos las llaves si ya existen para evitar errores de duplicidad
ALTER TABLE correspondencia.acuse_oficio DROP CONSTRAINT IF EXISTS fk_acuse_oficio_rel_oficio;
ALTER TABLE correspondencia.acuse_oficio DROP CONSTRAINT IF EXISTS fk_acuse_oficio_usuario_revisor;

-- Creamos las llaves foraneas
ALTER TABLE correspondencia.acuse_oficio 
    ADD CONSTRAINT fk_acuse_oficio_rel_oficio 
    FOREIGN KEY (id_oficio) 
    REFERENCES correspondencia.oficio(id_oficio);

ALTER TABLE correspondencia.acuse_oficio 
    ADD CONSTRAINT fk_acuse_oficio_usuario_revisor 
    FOREIGN KEY (id_usuario_revisor) 
    REFERENCES catalogos.usuarios(id_usuario);