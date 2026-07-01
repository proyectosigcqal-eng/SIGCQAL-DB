--liquibase formatted sql

--changeset JuanRivera:alter_amparo

-- Columnas + CHECK + índices
ALTER TABLE sustantiva.irl_demanda_amparo
    ADD COLUMN id_rl_cir INTEGER,
    ADD COLUMN id_queja_rl_cir INTEGER;

ALTER TABLE sustantiva.irl_demanda_amparo
    ADD CONSTRAINT chk_irl_demanda_amparo_flujo_cir
    CHECK (
        (id_rl_cir IS NOT NULL AND id_queja_rl_cir IS NULL)
        OR
        (id_rl_cir IS NULL AND id_queja_rl_cir IS NOT NULL)
    );

CREATE INDEX idx_demanda_amparo_rl_cir
    ON sustantiva.irl_demanda_amparo (id_rl_cir);

CREATE INDEX idx_demanda_amparo_queja_rl_cir
    ON sustantiva.irl_demanda_amparo (id_queja_rl_cir);

ALTER TABLE sustantiva.irl_demanda_amparo
    ADD CONSTRAINT fk_demanda_amparo_rl_cir
    FOREIGN KEY (id_rl_cir)
    REFERENCES sustantiva.rl_cir (id_rl_cir);

ALTER TABLE sustantiva.irl_demanda_amparo
    ADD CONSTRAINT fk_demanda_amparo_queja_rl_cir
    FOREIGN KEY (id_queja_rl_cir)
    REFERENCES sustantiva.queja_rl_cir (id_queja_rl_cir);