--liquibase formatted sql

--changeset JuanRivera:insert-roles-iniciales
INSERT INTO catalogos.roles (id_rol, nombre_rol, descripcion, url, activo) VALUES
(1, 'Administrador', 'Acceso total y configuración del sistema', '/admin/usuarios', true),
(2, 'Asesor', 'Atención a clientes y gestión de ventas', '/atencion-juridica/bandeja', true),
(3, 'Administrador Correspondencia', 'Gestión de correspondencia', '/correspondencia/registrar', true),
(4, 'Gestor de Correspondencia', 'Bandeja y acuses', '/correspondencia/bandeja', true)
ON CONFLICT (id_rol) DO NOTHING;