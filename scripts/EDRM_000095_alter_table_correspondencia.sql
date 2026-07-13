--changeset ErickRivera:add_column_cargo_usuario_memorandums endDelimiter:; runOnChange:true
--comment: Agregar columna cargo_usuario a la tabla memorandums para el cargo del usuario de forma manual
ALTER TABLE correspondencia.memorandums ADD COLUMN IF NOT EXISTS cargo_usuario VARCHAR(250);

COMMENT ON COLUMN correspondencia.memorandums.cargo_usuario IS 'Cargo del usuario ingresado de forma manual para el memorandum.';

--rollback ALTER TABLE correspondencia.memorandums DROP COLUMN IF EXISTS cargo_usuario;