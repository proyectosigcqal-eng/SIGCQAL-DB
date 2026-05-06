--liquibase formatted sql

--changeset Erick Rivera:agregar_fks_oficio_v1 splitStatements:false
--comment: Agregando llaves foraneas a la tabla oficio con validacion de existencia

DO $$ 
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_oficio_correspondencia') THEN
        ALTER TABLE correspondencia.oficio 
        ADD CONSTRAINT fk_oficio_correspondencia 
        FOREIGN KEY (id_correspondencia) 
        REFERENCES correspondencia.correspondencia(id_correspondencia);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_oficio_usuario_emisor') THEN
        ALTER TABLE correspondencia.oficio 
        ADD CONSTRAINT fk_oficio_usuario_emisor 
        FOREIGN KEY (id_usuario_emisor) 
        REFERENCES catalogos.usuarios(id_usuario);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_oficio_area') THEN
        ALTER TABLE correspondencia.oficio 
        ADD CONSTRAINT fk_oficio_area 
        FOREIGN KEY (id_area) 
        REFERENCES catalogos.areas(id_area);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_oficio_usuario_firmante') THEN
        ALTER TABLE correspondencia.oficio 
        ADD CONSTRAINT fk_oficio_usuario_firmante 
        FOREIGN KEY (id_usuario_firmante) 
        REFERENCES catalogos.usuarios(id_usuario);
    END IF;
END $$;