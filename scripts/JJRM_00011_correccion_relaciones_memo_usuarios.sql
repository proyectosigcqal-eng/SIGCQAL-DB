--liquibase formatted sql
--changeset JuanRivera:correccion_relaciones_memo_usuarios

-- 1. Borrar la relación incorrecta actual
ALTER TABLE memorandums 
DROP CONSTRAINT IF EXISTS fk_memo_firmante;

-- 2. Crear la relación correcta hacia la tabla usuarios
ALTER TABLE memorandums 
ADD CONSTRAINT fk_memo_firmante 
FOREIGN KEY (id_usuario_firmante) 
REFERENCES usuarios(id_usuario);

-- 1. Borrar la relación antigua (si existe)
ALTER TABLE memorandums 
DROP CONSTRAINT IF EXISTS fk_memo_emisor;

-- 2. Crear la relación correcta hacia la tabla usuarios
ALTER TABLE memorandums 
ADD CONSTRAINT fk_memo_emisor 
FOREIGN KEY (id_usuario_emisor) 
REFERENCES usuarios(id_usuario);