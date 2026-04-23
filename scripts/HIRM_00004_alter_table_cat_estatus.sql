--liquibase formatted sql
--changeset HugoRivera:alter_table_cat_estatus

ALTER TABLE cat_estatus
ADD COLUMN descripcion TEXT;