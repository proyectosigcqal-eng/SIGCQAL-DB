--liquibase formatted sql
--changeset Erick Rivera:crear_tabla_contestacion_oficio_externo_vFINAL
CREATE TABLE IF NOT EXISTS correspondencia.oficio_contestacion_externa (
    -- PK propia de la tabla
    id_oficio_contestacion serial4 NOT NULL,
    
    -- FK hacia la tabla que me mostraste (Correspondencia original)
    id_correspondencia int4 NOT NULL,
    
    -- FK hacia el usuario que crea el oficio (El Encargado)
    id_usuario_emisor int4 NOT NULL,
    
    -- Datos del Oficio de Salida
    num_oficio_salida varchar(100) NOT NULL, -- Ej: CEDZ/CONTESTACION/2024/005
    asunto_contestacion text NOT NULL,
    cuerpo_oficio_texto text NOT NULL, -- El contenido redactado
    
    -- Gestión de Archivo
    url_pdf_final varchar(255), -- Ruta del documento generado
    
    -- Tiempos
    fecha_emision timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Restricciones
    CONSTRAINT pk_oficio_contestacion PRIMARY KEY (id_oficio_contestacion),
    
    CONSTRAINT fk_contestacion_correspondencia 
        FOREIGN KEY (id_correspondencia) 
        REFERENCES correspondencia.correspondencia (id_correspondencia)
        ON DELETE CASCADE,
        
    CONSTRAINT fk_contestacion_usuario 
        FOREIGN KEY (id_usuario_emisor) 
        REFERENCES catalogos.usuarios (id_usuario) 
);