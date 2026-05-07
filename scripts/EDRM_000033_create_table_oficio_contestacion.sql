--liquibase formatted sql
--changeset ErickRivera:create_table_oficio_contestacion_externa_v1

CREATE TABLE correspondencia.oficio_contestacion (
    id_contestacion SERIAL4 PRIMARY KEY,
    
    -- Relaciones con los seguimientos existentes (opcionales para permitir flexibilidad)
    id_seguimiento_correspondencia INT4,
    id_seguimiento_oficio INT4,
    id_seguimiento_memorandum INT4,
    
    -- Datos del oficio de contestación
    num_oficio_contestacion VARCHAR(50) NOT NULL UNIQUE,
    fecha_oficio_contestacion DATE DEFAULT CURRENT_DATE,
    asunto_contestacion TEXT NOT NULL,
    cuerpo_oficio TEXT NOT NULL,
    
    -- Datos del Firmante (Encargado de la comisión)
    nombre_firmante VARCHAR(150),
    puesto_firmante VARCHAR(150),
   

    -- Auditoría básica
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Llaves Foráneas
    CONSTRAINT fk_contestacion_seguimiento_corr FOREIGN KEY (id_seguimiento_correspondencia) 
        REFERENCES correspondencia.seguimiento_correspondencia(id_seguimiento_correspondencia),
    CONSTRAINT fk_contestacion_seguimiento_oficio FOREIGN KEY (id_seguimiento_oficio) 
        REFERENCES correspondencia.seguimiento_oficio(id_seguimiento_oficio),
    CONSTRAINT fk_contestacion_seguimiento_memo FOREIGN KEY (id_seguimiento_memorandum) 
        REFERENCES correspondencia.seguimiento_memorandum(id_seguimiento_memorandum)
);

--rollback DROP TABLE correspondencia.oficio_contestacion_externa;