--liquibase formatted sql

--changeset JuanRivera:alter_amparo
ALTER TABLE sustantiva.irl_demanda_amparo
  ADD COLUMN IF NOT EXISTS folio_recibo_pago_2   VARCHAR(100),
  ADD COLUMN IF NOT EXISTS num_recibo_1           VARCHAR(100),
  ADD COLUMN IF NOT EXISTS num_recibo_2           VARCHAR(100),
  ADD COLUMN IF NOT EXISTS clave_predial          VARCHAR(100),
  ADD COLUMN IF NOT EXISTS num_cuenta             VARCHAR(100),
  ADD COLUMN IF NOT EXISTS domicilio_autoridad    VARCHAR(500);

