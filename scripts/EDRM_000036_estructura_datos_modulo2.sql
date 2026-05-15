--liquibase formatted sql

--changeset ErickRivera:crear_estructura_datos_modulo2
-- ==============================================================
-- 1. LIMPIEZA Y PREPARACIÓN (ESQUEMA sustantiva)
-- ==============================================================
DROP SCHEMA IF EXISTS sustantiva CASCADE;
CREATE SCHEMA sustantiva;

-- ==============================================================
-- 2. TABLAS OPERATIVAS (ESQUEMA sustantiva)
-- ==============================================================
CREATE TABLE IF NOT EXISTS catalogos.cat_tipo_proceso (
    id_cat_tipo_proceso SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL -- Asesoría, Queja, Representación Legal
);

CREATE TABLE IF NOT EXISTS catalogos.cat_estatus_sustantiva (
    id_cat_estatus_sustantiva SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL -- Abierto, Pendiente Informe, Audiencia, Cerrado
);

CREATE TABLE IF NOT EXISTS catalogos.cat_autoridades (
    id_cat_autoridad SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL -- SEFIN, JIAPAZ, Municipio Zacatecas
);


-- 2.1 ASESORES (Corregido a id_persona en singular)
CREATE TABLE sustantiva.asesores (
    id_asesores SERIAL PRIMARY KEY,
    id_persona INT NOT NULL, 
    especialidad VARCHAR(100),
    carga_actual INT DEFAULT 0,
    ultima_asignacion_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_asesor_persona 
        FOREIGN KEY (id_persona) REFERENCES catalogos.personas(id_persona)
);

-- 2.2 CONTRIBUYENTES (Corregido a id_persona en singular)
CREATE TABLE sustantiva.contribuyentes (
    id_contribuyentes SERIAL PRIMARY KEY,
    id_persona INT NOT NULL, 
    fecha_registro_sistema TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observaciones_internas TEXT,
    CONSTRAINT fk_contribuyente_persona 
        FOREIGN KEY (id_persona) REFERENCES catalogos.personas(id_persona)
);

-- 2.3 EXPEDIENTES
CREATE TABLE sustantiva.expedientes (
    id_expedientes SERIAL PRIMARY KEY,
    folio_gobierno VARCHAR(20) UNIQUE NOT NULL,
    id_contribuyentes INT NOT NULL,
    id_cat_tipo_proceso INT NOT NULL,
     id_cat_estatus_sustantiva INT NOT NULL,
    id_asesores INT NOT NULL,
    fecha_apertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    canal_entrada VARCHAR(20), 
    resumen_asunto TEXT,
    CONSTRAINT fk_exp_contribuyente 
        FOREIGN KEY (id_contribuyentes) REFERENCES sustantiva.contribuyentes(id_contribuyentes),
    CONSTRAINT fk_exp_tipo_proceso 
        FOREIGN KEY (id_cat_tipo_proceso) REFERENCES catalogos.cat_tipo_proceso(id_cat_tipo_proceso),
    CONSTRAINT fk_exp_estatus 
        FOREIGN KEY ( id_cat_estatus_sustantiva) REFERENCES catalogos.cat_estatus_sustantiva ( id_cat_estatus_sustantiva),
    CONSTRAINT fk_exp_asesor 
        FOREIGN KEY (id_asesores) REFERENCES sustantiva.asesores(id_asesores)
);

-- 2.4 DETALLE QUEJA
CREATE TABLE sustantiva.detalle_queja (
    id_detalle_queja SERIAL PRIMARY KEY,
    id_expedientes INT NOT NULL,
    id_cat_autoridad INT NOT NULL,
    num_expediente_interno VARCHAR(50),
    fecha_ari DATE,
    fecha_acci DATE,
    CONSTRAINT fk_queja_expediente 
        FOREIGN KEY (id_expedientes) REFERENCES sustantiva.expedientes(id_expedientes),
    CONSTRAINT fk_queja_autoridad 
        FOREIGN KEY (id_cat_autoridad) REFERENCES catalogos.cat_autoridades(id_cat_autoridad)
);

-- 2.5 DETALLE AMPARO
CREATE TABLE sustantiva.detalle_amparo (
    id_detalle_amparo SERIAL PRIMARY KEY,
    id_expedientes INT NOT NULL,
    num_expediente_judicial VARCHAR(50),
    juzgado_distrito VARCHAR(100),
    fecha_audiencia_constitucional TIMESTAMP,
    sentencia_sentido VARCHAR(100),
    CONSTRAINT fk_amparo_expediente 
        FOREIGN KEY (id_expedientes) REFERENCES sustantiva.expedientes(id_expedientes)
);