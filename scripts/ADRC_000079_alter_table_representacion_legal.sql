--liquibase formatted sql
--changeset aland:create_table_representacion_legal endDelimiter:;
--comment: Creación de la tabla representacion_legal con llaves foráneas nombradas

CREATE TABLE IF NOT EXISTS sustantiva.representacion_legal (
    id                  SERIAL PRIMARY KEY,
    id_expediente        INT8 REFERENCES sustantiva.expedientes(id_expediente),
    id_resolucion_final  INT8 REFERENCES sustantiva.resolucion_final(id_resolucion_final),
    id_queja_origen      INT8 REFERENCES sustantiva.quejas(id_queja),
    es_evolucion         BOOLEAN NOT NULL DEFAULT false,
    fecha_creacion       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Directo:    id_expediente ✅ | id_resolucion_final NULL | id_queja_origen NULL | es_evolucion false
-- Evolución:  id_expediente NULL/✅ | id_resolucion_final ✅ | id_queja_origen ✅ | es_evolucion true