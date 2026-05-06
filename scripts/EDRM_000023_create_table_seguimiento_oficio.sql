--liquibase formatted sql
--changeset Erick Rivera: Creacion tabla seguimiento oficio en esquema correspondencia
CREATE TABLE correspondencia.seguimiento_oficio (
    -- ID autoincremental (SERIAL4)
    id_seguimiento_oficio SERIAL4 PRIMARY KEY,
    
    -- ID Natural (Cambiado de id_memo a id_oficio)
    id_oficio INT4,
    
    -- Folio de respuesta también es SERIAL4 en la imagen
    folio_respuesta SERIAL4,
    
    -- Resto de columnas respetando tipos de datos
    respuesta_seguimiento_oficio TEXT,
    fecha_resolucion DATE,
    hora_resolucion TIME,
    archivo_adjunto VARCHAR(255),
    id_usuario INT4,
    id_estatus INT4,
    fecha_registro TIMESTAMP
);