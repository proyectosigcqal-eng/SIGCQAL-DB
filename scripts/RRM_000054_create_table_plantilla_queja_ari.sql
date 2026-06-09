-- liquibase formatted sql

-- changeset RodrigoRivera:1-crear-tabla-sustantiva-plantilla-queja-ari dbms:postgresql runOnChange:true splitStatements:false
-- comment: Creacion de la tabla plantilla_queja_ari de forma totalmente idempotente con splitStatements desactivado.
CREATE TABLE IF NOT EXISTS sustantiva.plantilla_queja_ari (
    id_plantilla SERIAL PRIMARY KEY,
    nombre_plantilla VARCHAR(150) NOT NULL,
    url_plantilla_queja_ari VARCHAR(255) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);

-- rollback DROP TABLE IF EXISTS sustantiva.plantilla_queja_ari;


-- changeset RodrigoRivera:2-modificar-tabla-sustantiva-quejas-ari dbms:postgresql runOnChange:true splitStatements:false
-- comment: Modificacion de la tabla quejas_ari para agregar el campo id_plantilla_queja_ari de forma idempotente.
ALTER TABLE sustantiva.quejas_ari 
ADD COLUMN IF NOT EXISTS id_plantilla_queja_ari INT;

ALTER TABLE sustantiva.quejas_ari
DROP CONSTRAINT IF EXISTS fk_quejas_ari_plantilla;

ALTER TABLE sustantiva.quejas_ari
ADD CONSTRAINT fk_quejas_ari_plantilla
FOREIGN KEY (id_plantilla_queja_ari) 
REFERENCES sustantiva.plantilla_queja_ari(id_plantilla)
ON DELETE SET NULL;

-- rollback ALTER TABLE sustantiva.quejas_ari DROP CONSTRAINT IF EXISTS fk_quejas_ari_plantilla;
-- rollback ALTER TABLE sustantiva.quejas_ari DROP COLUMN IF EXISTS id_plantilla_queja_ari;