--liquibase formatted sql

--changeset JuanRivera:alter_amparo

-- Quita el constraint estricto
ALTER TABLE sustantiva.irl_demanda_amparo 
  DROP CONSTRAINT chk_irl_demanda_amparo_flujo_cir;

-- Reemplaza por uno que permita ambos NULL en creación,
-- pero sí bloquea que ambos sean NOT NULL simultáneamente
ALTER TABLE sustantiva.irl_demanda_amparo 
  ADD CONSTRAINT chk_irl_demanda_amparo_flujo_cir CHECK (
    NOT (id_rl_cir IS NOT NULL AND id_queja_rl_cir IS NOT NULL)
  );