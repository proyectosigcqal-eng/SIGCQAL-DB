
--liquibase formatted sql
--changeset Erick Rivera: crear_tabla_oficio_vFINAL

CREATE TABLE IF NOT EXISTS correspondencia.oficio (
    -- ID serial para la clave primaria
    id_oficio SERIAL4 PRIMARY KEY,
    
    -- ID de relación con correspondencia
    id_correspondencia INT4,
    
    -- ID Natural (Cambiado de num_memo a num_oficio)
    num_oficio VARCHAR(100),
    
    -- Resto de columnas idénticas a la referencia
    instruccion_seguimiento TEXT,
    fecha_emision TIMESTAMP,
    id_usuario_emisor INT4,
    folio_unico VARCHAR(100),
    observaciones TEXT,
    url_memorandum_generado VARCHAR(255),
    id_plantilla INT4,
    id_area INT4,
    id_usuario_firmante INT4
);