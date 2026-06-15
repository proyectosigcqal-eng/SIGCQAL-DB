--liquibase formatted sql
--changeset anarosariveramorales:add_fks_cierre_expediente dbms:postgresql stripComments:false endDelimiter:__END_BLOCK__
--comment: Añadir llaves foraneas usando bloque DO aislado

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_expediente_cierre') THEN
        ALTER TABLE sustantiva.cierre_expediente ADD CONSTRAINT fk_expediente_cierre FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_usuario_cierre') THEN
        ALTER TABLE sustantiva.cierre_expediente ADD CONSTRAINT fk_usuario_cierre FOREIGN KEY (usuario_cierre) REFERENCES catalogos.usuarios(id_usuario);
    END IF;
END $$;
--__END_BLOCK__