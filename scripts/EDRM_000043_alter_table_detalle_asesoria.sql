--liquibase formatted sql

--changeset ErickRivera:agregar-monto-y-fecha-notificacion-v4 dbms:postgresql
--comment: Agregando campos usando la clausula nativa IF NOT EXISTS de Postgres para evitar conflictos con Liquibase.

ALTER TABLE sustantiva.detalle_asesoria ADD COLUMN IF NOT EXISTS fecha_notificacion DATE;
ALTER TABLE sustantiva.detalle_asesoria ADD COLUMN IF NOT EXISTS monto NUMERIC(15,2);

--rollback ALTER TABLE sustantiva.detalle_asesoria DROP COLUMN IF EXISTS monto;
--rollback ALTER TABLE sustantiva.detalle_asesoria DROP COLUMN IF EXISTS fecha_notificacion;