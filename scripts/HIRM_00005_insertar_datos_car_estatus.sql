--liquibase formatted sql
--changeset HugoRivera:insertar_nombre_estatus_descripción

INSERT INTO cat_estatus (id_estatus, nombre_estatus, descripcion) VALUES
(1, 'REGISTRADO', 'Existe el folio y el PDF, pero está en revisión de calidad.'),
(2, 'VALIDADO', 'Validación por el administrador.'),
(3, 'ASIGNADO', 'Tiene instrucción (Memo) y área asignada. (Archivo original bloqueado).'),
(4, 'EN SEGUIMIENTO', 'El área ya confirmó que lo recibió en su buzón.'),
(5, 'ATENDIDO', 'El área ya subió su informe y respuesta digitalizada.'),
(6, 'CONCLUIDO', 'El administrador validó todo y el trámite se archiva.');