--liquibase formatted sql

--changeset Erick Rivera:agregar_fks_seguimiento_oficio_v1 splitStatements:false
--comment: Agregando llaves foraneas a seguimiento_oficio con validacion

DO $$ 
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_seguimiento_oficio_oficio') THEN
        ALTER TABLE correspondencia.seguimiento_oficio 
        ADD CONSTRAINT fk_seguimiento_oficio_oficio 
        FOREIGN KEY (id_oficio) 
        REFERENCES correspondencia.oficio(id_oficio);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_seguimiento_oficio_usuario') THEN
        ALTER TABLE correspondencia.seguimiento_oficio 
        ADD CONSTRAINT fk_seguimiento_oficio_usuario 
        FOREIGN KEY (id_usuario) 
        REFERENCES catalogos.usuarios(id_usuario);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_seguimiento_oficio_estatus') THEN
        ALTER TABLE correspondencia.seguimiento_oficio 
        ADD CONSTRAINT fk_seguimiento_oficio_estatus 
        FOREIGN KEY (id_estatus) 
        REFERENCES catalogos.cat_estatus(id_estatus);
    END IF;
END $$;