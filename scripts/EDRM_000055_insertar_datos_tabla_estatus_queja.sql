--liquibase formatted sql

--changeset Erick_Rivera:insertar_catalogo_estatus_queja endDelimiter:;
--comment: Inserción y actualización del catálogo de estatus de quejas sin duplicados ni errores

INSERT INTO catalogos.cat_estatus_queja (id_estatus_queja, descripcion_estatus, orden, activo) VALUES
(1, 'Asignada a Asesor', 1, true),
(2, 'En Validación de Requisitos', 2, true),
(3, 'CIR Generada (Constancia Interna de Remisión)', 3, true),
(4, 'ARI Generado (Acuerdo con Requerimiento de Informe)', 4, true),
(5, 'Oficio de Notificación Emitido', 5, true),
(6, 'Contestación de Autoridad Recibida', 6, true),
(7, 'ACCI Generado (Acuerdo de Informe de Investigación)', 7, true),
(8, 'Informe de Resolución Emitido', 8, true),
(9, 'En Proceso de Notificación Final', 9, true),
(10, 'Cerrada / Concluida', 10, true)
ON CONFLICT (id_estatus_queja) 
DO UPDATE SET 
    descripcion_estatus = EXCLUDED.descripcion_estatus,
    orden = EXCLUDED.orden,
    activo = EXCLUDED.activo;

-- NOTA: Sincronizar el secuencial de Postgres después de forzar los IDs de nuestro catálogo
SELECT setval('catalogos.cat_estatus_queja_id_estatus_queja_seq', COALESCE((SELECT MAX(id_estatus_queja) FROM catalogos.cat_estatus_queja), 1));