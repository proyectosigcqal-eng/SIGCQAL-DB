-- liquibase formatted sql

-- changeset RodrigoRivera:3-agregar-campos-multas-quejas-ari dbms:postgresql runOnChange:true splitStatements:false
-- comment: Adicion de los campos multas_requerimientos y multas_credito en la tabla quejas_ari de forma idempotente.
ALTER TABLE sustantiva.quejas_ari 
ADD COLUMN IF NOT EXISTS multas_requerimientos TEXT,
ADD COLUMN IF NOT EXISTS multas_credito TEXT;

-- rollback ALTER TABLE sustantiva.quejas_ari DROP COLUMN IF EXISTS multas_requerimientos;
-- rollback ALTER TABLE sustantiva.quejas_ari DROP COLUMN IF EXISTS multas_credito;