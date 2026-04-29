--liquibase formatted sql
--changeset ErickRivera:creacion_tablas_modulo2_atencion_juridica

-- 1. CATÁLOGO DE TIPOS DE TRÁMITE (Asesoría, Queja, Representación, etc.)
CREATE TABLE cat_tipos_tramite (
    id_cat_tipos_tramite SERIAL PRIMARY KEY,
    nombre_tramite VARCHAR(100) NOT NULL,
    prefijo_folio VARCHAR(5), -- AS, QJ, RL, CV
    ruta_plantilla_doc VARCHAR(255), 
    activo BOOLEAN DEFAULT TRUE
);

-- 2. TABLA DE ASESORES (Extensión de la tabla de usuarios del sistema)
CREATE TABLE asesores (
    id_asesores SERIAL PRIMARY KEY,
    id_usuario_fk INTEGER UNIQUE NOT NULL, -- FK a la tabla 'usuarios' preexistente
    activo_round_robin BOOLEAN DEFAULT TRUE,
    orden_asignacion SERIAL 
);

-- 3. CONTROL DE FOLIO (Lógica para el Generador de Folios Inteligente)
CREATE TABLE control_folios_config (
    id_control_folios_config SERIAL PRIMARY KEY,
    anio INTEGER NOT NULL,
    mes INTEGER NOT NULL,
    consecutivo INTEGER DEFAULT 0,
    UNIQUE (anio, mes)
);

-- 4. EXPEDIENTES (Tabla central del módulo)
CREATE TABLE expedientes (
    id_expedientes SERIAL PRIMARY KEY,
    folio_unico VARCHAR(20) UNIQUE NOT NULL,
    id_persona_fk INTEGER NOT NULL, -- FK a la tabla 'personas' preexistente
    id_cat_tipos_tramite_fk INTEGER NOT NULL,
    id_asesores_fk INTEGER, -- Asesor asignado automáticamente
    estatus_procesal VARCHAR(50) DEFAULT 'ABIERTO',
    fecha_apertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    creado_por VARCHAR(50),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_expediente_tipo_tramite FOREIGN KEY (id_cat_tipos_tramite_fk) 
        REFERENCES cat_tipos_tramite(id_cat_tipos_tramite),
    CONSTRAINT fk_expediente_asesor FOREIGN KEY (id_asesores_fk) 
        REFERENCES asesores(id_asesores)
);

-- 5. INSTRUCCIONES DE TRABAJO (El detonante: Oficio o Memorándum de asignación)
CREATE TABLE instrucciones_trabajo (
    id_instrucciones_trabajo SERIAL PRIMARY KEY,
    id_expedientes_fk INTEGER NOT NULL,
    folio_instruccion VARCHAR(50), 
    cuerpo_instruccion TEXT, 
    fecha_emision TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    url_pdf_generado VARCHAR(255),
    
    CONSTRAINT fk_instruccion_expediente FOREIGN KEY (id_expedientes_fk) 
        REFERENCES expedientes(id_expedientes)
);

-- 6. SEGUIMIENTO DE TRÁMITE (Bandeja de actividades del asesor)
CREATE TABLE seguimiento_tramite (
    id_seguimiento_tramite SERIAL PRIMARY KEY,
    id_expedientes_fk INTEGER NOT NULL,
    id_asesores_fk INTEGER NOT NULL,
    descripcion_actividad TEXT NOT NULL,
    evidencia_url VARCHAR(255), -- Ruta de archivos adjuntos (hasta 10MB)
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_seguimiento_expediente FOREIGN KEY (id_expedientes_fk) 
        REFERENCES expedientes(id_expedientes),
    CONSTRAINT fk_seguimiento_asesor FOREIGN KEY (id_asesores_fk) 
        REFERENCES asesores(id_asesores)
);

-- 7. AUDITORÍA JURÍDICA (Trazabilidad profunda e histórica)
CREATE TABLE auditoria_log (
    id_auditoria_log SERIAL PRIMARY KEY,
    id_usuario_accion INTEGER, -- Usuario que realizó el movimiento
    operacion VARCHAR(10), -- INSERT, UPDATE, DELETE
    tabla_nombre VARCHAR(50),
    id_registro_afectado INTEGER,
    datos_anteriores JSONB, -- Estado previo del registro en formato JSON
    datos_nuevos JSONB,     -- Estado nuevo del registro en formato JSON
    fecha_evento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);