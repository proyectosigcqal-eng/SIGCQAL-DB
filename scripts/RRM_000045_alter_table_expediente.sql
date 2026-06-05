--liquibase formatted sql

--changeset RodrigoRivera:alter-tabla-expedientes dbms:postgresql
--comment: Alteracion de la tabla expedientes.
ALTER TABLE sustantiva.expedientes
ADD COLUMN IF NOT EXISTS id_representante_legal INT;

ALTER TABLE sustantiva.expedientes
    ADD CONSTRAINT fk_expedientes_representante_legal
    FOREIGN KEY (id_representante_legal) 
    REFERENCES catalogos.personas (id_persona);

--rollback ALTER TABLE sustantiva.expedientes DROP CONSTRAINT IF EXISTS fk_expedientes_representante_legal;
--rollback ALTER TABLE sustantiva.expedientes DROP COLUMN IF EXISTS id_representante_legal;