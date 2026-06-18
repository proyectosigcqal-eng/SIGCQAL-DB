--liquibase formatted sql
--changeset JuanRivera:create_table_oficio_notificacion

ALTER TABLE sustantiva.quejas_respuestas_autoridad 
add if not EXISTS fecha_oficio DATE;