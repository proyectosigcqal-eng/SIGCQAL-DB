--liquibase formatted sql
--changeset edgar.zibaja:EEE
--context


CREATE TABLE "public"."municipio" (
  "id_municipio" serial4,
  "municipio" varchar(255),
  "id_estado" int4 NOT NULL,
  PRIMARY KEY ("id_municipio"),
  CONSTRAINT "municipio_id_estado_fk" FOREIGN KEY ("id_estado") REFERENCES "public"."estado" ("id_estado") ON DELETE NO ACTION ON UPDATE NO ACTION
)
;

COMMENT ON COLUMN "public"."municipio"."id_municipio" IS 'Identificador de la tabla';

COMMENT ON COLUMN "public"."municipio"."municipio" IS 'Nombre del municipio';

COMMENT ON COLUMN "public"."municipio"."id_estado" IS 'Relacion a catalogo de estados';