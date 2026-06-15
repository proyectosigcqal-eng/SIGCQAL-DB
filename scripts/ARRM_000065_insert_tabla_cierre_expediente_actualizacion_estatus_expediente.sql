--liquibase formatted sql
--changeset anarosariveramorales:insert_estatus_cierre_v4 dbms:postgresql
--comment: Insertar registro en tabla estatus_expediente usando la columna correcta id_estatus_expediente

INSERT INTO catalogos.estatus_expediente (id_estatus_expediente, nombre)
SELECT 5, 'EXPEDIENTE CERRADO'
WHERE NOT EXISTS (
    SELECT 1 FROM catalogos.estatus_expediente WHERE id_estatus_expediente = 5
) 
AND NOT EXISTS (
    SELECT 1 FROM catalogos.estatus_expediente WHERE nombre = 'EXPEDIENTE CERRADO'
);