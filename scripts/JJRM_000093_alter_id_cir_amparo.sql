--liquibase formatted sql

--changeset JuanRivera:alter_amparo splitStatements:false

ALTER TABLE sustantiva.irl_demanda_amparo
    ADD COLUMN IF NOT EXISTS id_rl_cir INTEGER,
    ADD COLUMN IF NOT EXISTS id_queja_rl_cir INTEGER;

CREATE INDEX IF NOT EXISTS idx_demanda_amparo_rl_cir
    ON sustantiva.irl_demanda_amparo (id_rl_cir);

CREATE INDEX IF NOT EXISTS idx_demanda_amparo_queja_rl_cir
    ON sustantiva.irl_demanda_amparo (id_queja_rl_cir);

DO $$
BEGIN
    -- Check Constraint con NOT VALID
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'chk_irl_demanda_amparo_flujo_cir') THEN
        ALTER TABLE sustantiva.irl_demanda_amparo
            ADD CONSTRAINT chk_irl_demanda_amparo_flujo_cir
            CHECK (
                (id_rl_cir IS NOT NULL AND id_queja_rl_cir IS NULL)
                OR
                (id_rl_cir IS NULL AND id_queja_rl_cir IS NOT NULL)
            ) NOT VALID; -- <-- ESTA ES LA MAGIA
    END IF;

    -- Foreign Key 1
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_demanda_amparo_rl_cir') THEN
        ALTER TABLE sustantiva.irl_demanda_amparo
            ADD CONSTRAINT fk_demanda_amparo_rl_cir
            FOREIGN KEY (id_rl_cir)
            REFERENCES sustantiva.rl_cir (id_rl_cir);
    END IF;

    -- Foreign Key 2
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_demanda_amparo_queja_rl_cir') THEN
        ALTER TABLE sustantiva.irl_demanda_amparo
            ADD CONSTRAINT fk_demanda_amparo_queja_rl_cir
            FOREIGN KEY (id_queja_rl_cir)
            REFERENCES sustantiva.queja_rl_cir (id_queja_rl_cir);
    END IF;
END $$;