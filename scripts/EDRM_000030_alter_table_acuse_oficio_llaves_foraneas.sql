--liquibase formatted sql

--changeset Erick Rivera:agregar_fks_acuse_oficio_v1 splitStatements:false
--comment: Agregando llaves foraneas a la tabla acuse_oficio con validacion

DO $$ 
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_acuse_oficio_rel_oficio') THEN
        ALTER TABLE correspondencia.acuse_oficio 
        ADD CONSTRAINT fk_acuse_oficio_rel_oficio 
        FOREIGN KEY (id_oficio) 
        REFERENCES correspondencia.oficio(id_oficio);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_acuse_oficio_usuario_revisor') THEN
        ALTER TABLE correspondencia.acuse_oficio 
        ADD CONSTRAINT fk_acuse_oficio_usuario_revisor 
        FOREIGN KEY (id_usuario_revisor) 
        REFERENCES catalogos.usuarios(id_usuario);
    END IF;
END $$;