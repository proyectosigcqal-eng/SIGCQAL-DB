--liquibase formatted sql
--changeset RodrigoRivera:modificar_id_folio

ALTER TABLE memorandums DROP CONSTRAINT memorandums_id_folio_fkey;

ALTER TABLE correspondencia_turnos DROP CONSTRAINT correspondencia_turnos_id_folio_fkey;

ALTER TABLE auditoria_correspondencia DROP CONSTRAINT auditoria_correspondencia_id_folio_fkey;

ALTER TABLE archivos_adjuntos DROP CONSTRAINT archivos_adjuntos_id_folio_fkey;



-- 2. RENOMBRAR LOS CAMPOS EN LAS TABLAS RELACIONADAS (FKs)



ALTER TABLE memorandums RENAME COLUMN id_folio TO id_correspondencia;

ALTER TABLE correspondencia_turnos RENAME COLUMN id_folio TO id_correspondencia;

ALTER TABLE auditoria_correspondencia RENAME COLUMN id_folio TO id_correspondencia;

ALTER TABLE archivos_adjuntos RENAME COLUMN id_folio TO id_correspondencia;



-- 3. RENOMBRAR LA LLAVE PRIMARIA (PK) EN LA TABLA PRINCIPAL



ALTER TABLE correspondencia RENAME COLUMN id_folio TO id_correspondencia;



-- 4. RECREAR LAS RESTRICCIONES DE LLAVE FORÁNEA

-- Aquí vinculamos los nuevos nombres de columna.



ALTER TABLE memorandums 

    ADD CONSTRAINT fk_memorandums_correspondencia 

    FOREIGN KEY (id_correspondencia) REFERENCES correspondencia(id_correspondencia);



ALTER TABLE correspondencia_turnos 

    ADD CONSTRAINT fk_turnos_correspondencia 

    FOREIGN KEY (id_correspondencia) REFERENCES correspondencia(id_correspondencia);



ALTER TABLE auditoria_correspondencia 

    ADD CONSTRAINT fk_auditoria_correspondencia 

    FOREIGN KEY (id_correspondencia) REFERENCES correspondencia(id_correspondencia);



ALTER TABLE archivos_adjuntos 

    ADD CONSTRAINT fk_archivos_correspondencia 

    FOREIGN KEY (id_correspondencia) REFERENCES correspondencia(id_correspondencia);