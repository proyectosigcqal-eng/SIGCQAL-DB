--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2026-05-13 16:56:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "SIGCQAL_dev";
--
-- TOC entry 5431 (class 1262 OID 54067)
-- Name: SIGCQAL_dev; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "SIGCQAL_dev" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';


\connect "SIGCQAL_dev"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 62770)
-- Name: atencion_juridica; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA atencion_juridica;


--
-- TOC entry 6 (class 2615 OID 62768)
-- Name: catalogos; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA catalogos;


--
-- TOC entry 7 (class 2615 OID 62769)
-- Name: correspondencia; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA correspondencia;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 271 (class 1259 OID 62688)
-- Name: asesores; Type: TABLE; Schema: atencion_juridica; Owner: -
--

CREATE TABLE atencion_juridica.asesores (
    id_asesores integer NOT NULL,
    id_usuario_fk integer NOT NULL,
    activo_round_robin boolean DEFAULT true,
    orden_asignacion integer NOT NULL
);


--
-- TOC entry 269 (class 1259 OID 62686)
-- Name: asesores_id_asesores_seq; Type: SEQUENCE; Schema: atencion_juridica; Owner: -
--

CREATE SEQUENCE atencion_juridica.asesores_id_asesores_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 269
-- Name: asesores_id_asesores_seq; Type: SEQUENCE OWNED BY; Schema: atencion_juridica; Owner: -
--

ALTER SEQUENCE atencion_juridica.asesores_id_asesores_seq OWNED BY atencion_juridica.asesores.id_asesores;


--
-- TOC entry 270 (class 1259 OID 62687)
-- Name: asesores_orden_asignacion_seq; Type: SEQUENCE; Schema: atencion_juridica; Owner: -
--

CREATE SEQUENCE atencion_juridica.asesores_orden_asignacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 270
-- Name: asesores_orden_asignacion_seq; Type: SEQUENCE OWNED BY; Schema: atencion_juridica; Owner: -
--

ALTER SEQUENCE atencion_juridica.asesores_orden_asignacion_seq OWNED BY atencion_juridica.asesores.orden_asignacion;


--
-- TOC entry 266 (class 1259 OID 62658)
-- Name: auditoria_log; Type: TABLE; Schema: atencion_juridica; Owner: -
--

CREATE TABLE atencion_juridica.auditoria_log (
    id_auditoria_log integer NOT NULL,
    id_usuario_accion integer,
    operacion character varying(10),
    tabla_nombre character varying(50),
    id_registro_afectado integer,
    datos_anteriores jsonb,
    datos_nuevos jsonb,
    fecha_evento timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 265 (class 1259 OID 62657)
-- Name: auditoria_log_id_auditoria_log_seq; Type: SEQUENCE; Schema: atencion_juridica; Owner: -
--

CREATE SEQUENCE atencion_juridica.auditoria_log_id_auditoria_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5434 (class 0 OID 0)
-- Dependencies: 265
-- Name: auditoria_log_id_auditoria_log_seq; Type: SEQUENCE OWNED BY; Schema: atencion_juridica; Owner: -
--

ALTER SEQUENCE atencion_juridica.auditoria_log_id_auditoria_log_seq OWNED BY atencion_juridica.auditoria_log.id_auditoria_log;


--
-- TOC entry 268 (class 1259 OID 62679)
-- Name: cat_tipos_tramite; Type: TABLE; Schema: atencion_juridica; Owner: -
--

CREATE TABLE atencion_juridica.cat_tipos_tramite (
    id_cat_tipos_tramite integer NOT NULL,
    nombre_tramite character varying(100) NOT NULL,
    prefijo_folio character varying(5),
    ruta_plantilla_doc character varying(255),
    activo boolean DEFAULT true
);


--
-- TOC entry 267 (class 1259 OID 62678)
-- Name: cat_tipos_tramite_id_cat_tipos_tramite_seq; Type: SEQUENCE; Schema: atencion_juridica; Owner: -
--

CREATE SEQUENCE atencion_juridica.cat_tipos_tramite_id_cat_tipos_tramite_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5435 (class 0 OID 0)
-- Dependencies: 267
-- Name: cat_tipos_tramite_id_cat_tipos_tramite_seq; Type: SEQUENCE OWNED BY; Schema: atencion_juridica; Owner: -
--

ALTER SEQUENCE atencion_juridica.cat_tipos_tramite_id_cat_tipos_tramite_seq OWNED BY atencion_juridica.cat_tipos_tramite.id_cat_tipos_tramite;


--
-- TOC entry 275 (class 1259 OID 62709)
-- Name: expedientes; Type: TABLE; Schema: atencion_juridica; Owner: -
--

CREATE TABLE atencion_juridica.expedientes (
    id_expedientes integer NOT NULL,
    folio_unico character varying(20) NOT NULL,
    id_persona_fk integer NOT NULL,
    id_cat_tipos_tramite_fk integer NOT NULL,
    id_asesores_fk integer,
    estatus_procesal character varying(50) DEFAULT 'ABIERTO'::character varying,
    fecha_apertura timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    creado_por character varying(50),
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 274 (class 1259 OID 62708)
-- Name: expedientes_id_expedientes_seq; Type: SEQUENCE; Schema: atencion_juridica; Owner: -
--

CREATE SEQUENCE atencion_juridica.expedientes_id_expedientes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5436 (class 0 OID 0)
-- Dependencies: 274
-- Name: expedientes_id_expedientes_seq; Type: SEQUENCE OWNED BY; Schema: atencion_juridica; Owner: -
--

ALTER SEQUENCE atencion_juridica.expedientes_id_expedientes_seq OWNED BY atencion_juridica.expedientes.id_expedientes;


--
-- TOC entry 277 (class 1259 OID 62731)
-- Name: instrucciones_trabajo; Type: TABLE; Schema: atencion_juridica; Owner: -
--

CREATE TABLE atencion_juridica.instrucciones_trabajo (
    id_instrucciones_trabajo integer NOT NULL,
    id_expedientes_fk integer NOT NULL,
    folio_instruccion character varying(50),
    cuerpo_instruccion text,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    url_pdf_generado character varying(255)
);


--
-- TOC entry 276 (class 1259 OID 62730)
-- Name: instrucciones_trabajo_id_instrucciones_trabajo_seq; Type: SEQUENCE; Schema: atencion_juridica; Owner: -
--

CREATE SEQUENCE atencion_juridica.instrucciones_trabajo_id_instrucciones_trabajo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5437 (class 0 OID 0)
-- Dependencies: 276
-- Name: instrucciones_trabajo_id_instrucciones_trabajo_seq; Type: SEQUENCE OWNED BY; Schema: atencion_juridica; Owner: -
--

ALTER SEQUENCE atencion_juridica.instrucciones_trabajo_id_instrucciones_trabajo_seq OWNED BY atencion_juridica.instrucciones_trabajo.id_instrucciones_trabajo;


--
-- TOC entry 279 (class 1259 OID 62746)
-- Name: seguimiento_tramite; Type: TABLE; Schema: atencion_juridica; Owner: -
--

CREATE TABLE atencion_juridica.seguimiento_tramite (
    id_seguimiento_tramite integer NOT NULL,
    id_expedientes_fk integer NOT NULL,
    id_asesores_fk integer NOT NULL,
    descripcion_actividad text NOT NULL,
    evidencia_url character varying(255),
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 278 (class 1259 OID 62745)
-- Name: seguimiento_tramite_id_seguimiento_tramite_seq; Type: SEQUENCE; Schema: atencion_juridica; Owner: -
--

CREATE SEQUENCE atencion_juridica.seguimiento_tramite_id_seguimiento_tramite_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5438 (class 0 OID 0)
-- Dependencies: 278
-- Name: seguimiento_tramite_id_seguimiento_tramite_seq; Type: SEQUENCE OWNED BY; Schema: atencion_juridica; Owner: -
--

ALTER SEQUENCE atencion_juridica.seguimiento_tramite_id_seguimiento_tramite_seq OWNED BY atencion_juridica.seguimiento_tramite.id_seguimiento_tramite;


--
-- TOC entry 224 (class 1259 OID 54093)
-- Name: areas; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.areas (
    id_area integer NOT NULL,
    nombre_area character varying(150) NOT NULL,
    descripcion text
);


--
-- TOC entry 5439 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN areas.descripcion; Type: COMMENT; Schema: catalogos; Owner: -
--

COMMENT ON COLUMN catalogos.areas.descripcion IS 'Descripción detallada del área o función principal';


--
-- TOC entry 225 (class 1259 OID 54096)
-- Name: areas_id_area_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.areas_id_area_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5440 (class 0 OID 0)
-- Dependencies: 225
-- Name: areas_id_area_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.areas_id_area_seq OWNED BY catalogos.areas.id_area;


--
-- TOC entry 228 (class 1259 OID 54104)
-- Name: cat_estados; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.cat_estados (
    id_estado integer NOT NULL,
    nombre_estado character varying(100) NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 54107)
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.cat_estados_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5441 (class 0 OID 0)
-- Dependencies: 229
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.cat_estados_id_estado_seq OWNED BY catalogos.cat_estados.id_estado;


--
-- TOC entry 230 (class 1259 OID 54108)
-- Name: cat_estatus; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.cat_estatus (
    id_estatus integer NOT NULL,
    nombre_estatus character varying(50) NOT NULL,
    descripcion text
);


--
-- TOC entry 231 (class 1259 OID 54111)
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.cat_estatus_id_estatus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5442 (class 0 OID 0)
-- Dependencies: 231
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.cat_estatus_id_estatus_seq OWNED BY catalogos.cat_estatus.id_estatus;


--
-- TOC entry 232 (class 1259 OID 54112)
-- Name: cat_municipios; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.cat_municipios (
    id_municipio integer NOT NULL,
    id_estado integer,
    nombre_municipio character varying(100) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 54115)
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.cat_municipios_id_municipio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5443 (class 0 OID 0)
-- Dependencies: 233
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.cat_municipios_id_municipio_seq OWNED BY catalogos.cat_municipios.id_municipio;


--
-- TOC entry 273 (class 1259 OID 62699)
-- Name: control_folios_config; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.control_folios_config (
    id_control_folios_config integer NOT NULL,
    anio integer NOT NULL,
    mes integer NOT NULL,
    consecutivo integer DEFAULT 0
);


--
-- TOC entry 272 (class 1259 OID 62698)
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.control_folios_config_id_control_folios_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5444 (class 0 OID 0)
-- Dependencies: 272
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.control_folios_config_id_control_folios_config_seq OWNED BY catalogos.control_folios_config.id_control_folios_config;


--
-- TOC entry 240 (class 1259 OID 54134)
-- Name: direcciones; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.direcciones (
    id_direccion integer NOT NULL,
    calle character varying(150),
    num_ext character varying(20),
    num_int character varying(20),
    colonia character varying(100),
    cp character varying(10),
    id_municipio integer,
    id_estado integer
);


--
-- TOC entry 241 (class 1259 OID 54137)
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.direcciones_id_direccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5445 (class 0 OID 0)
-- Dependencies: 241
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.direcciones_id_direccion_seq OWNED BY catalogos.direcciones.id_direccion;


--
-- TOC entry 255 (class 1259 OID 54399)
-- Name: empleados; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.empleados (
    id_empleado integer NOT NULL,
    nombre_completo character varying(255) NOT NULL,
    cargo character varying(150),
    id_area integer
);


--
-- TOC entry 254 (class 1259 OID 54398)
-- Name: empleados_id_empleado_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.empleados_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5446 (class 0 OID 0)
-- Dependencies: 254
-- Name: empleados_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.empleados_id_empleado_seq OWNED BY catalogos.empleados.id_empleado;


--
-- TOC entry 246 (class 1259 OID 54153)
-- Name: personas; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.personas (
    id_persona integer NOT NULL,
    id_direccion integer,
    nombre character varying(100) NOT NULL,
    apellido_paterno character varying(100) NOT NULL,
    apellido_materno character varying(100),
    curp character varying(18),
    telefono character varying(20)
);


--
-- TOC entry 247 (class 1259 OID 54156)
-- Name: personas_id_persona_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.personas_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5447 (class 0 OID 0)
-- Dependencies: 247
-- Name: personas_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.personas_id_persona_seq OWNED BY catalogos.personas.id_persona;


--
-- TOC entry 248 (class 1259 OID 54157)
-- Name: roles; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.roles (
    id_rol integer NOT NULL,
    nombre_rol character varying(50) NOT NULL,
    descripcion character varying(255),
    url character varying(255),
    activo boolean DEFAULT true
);


--
-- TOC entry 249 (class 1259 OID 54160)
-- Name: roles_id_rol_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.roles_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5448 (class 0 OID 0)
-- Dependencies: 249
-- Name: roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.roles_id_rol_seq OWNED BY catalogos.roles.id_rol;


--
-- TOC entry 303 (class 1259 OID 62917)
-- Name: tipo_correspondencia; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.tipo_correspondencia (
    id_tipo_correspondencia integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


--
-- TOC entry 302 (class 1259 OID 62916)
-- Name: tipo_correspondencia_id_tipo_correspondencia_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.tipo_correspondencia_id_tipo_correspondencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5449 (class 0 OID 0)
-- Dependencies: 302
-- Name: tipo_correspondencia_id_tipo_correspondencia_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.tipo_correspondencia_id_tipo_correspondencia_seq OWNED BY catalogos.tipo_correspondencia.id_tipo_correspondencia;


--
-- TOC entry 250 (class 1259 OID 54161)
-- Name: usuarios; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.usuarios (
    id_usuario integer NOT NULL,
    id_persona integer,
    id_area integer,
    usuario_login character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    correo_electronico character varying(150),
    fecha_registro_usuario timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    activo boolean DEFAULT true
);


--
-- TOC entry 251 (class 1259 OID 54166)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5450 (class 0 OID 0)
-- Dependencies: 251
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.usuarios_id_usuario_seq OWNED BY catalogos.usuarios.id_usuario;


--
-- TOC entry 309 (class 1259 OID 79366)
-- Name: usuarios_roles; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.usuarios_roles (
    id_usuario_rol integer NOT NULL,
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL,
    fecha_asignacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 308 (class 1259 OID 79365)
-- Name: usuarios_roles_id_usuario_rol_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.usuarios_roles_id_usuario_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5451 (class 0 OID 0)
-- Dependencies: 308
-- Name: usuarios_roles_id_usuario_rol_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.usuarios_roles_id_usuario_rol_seq OWNED BY catalogos.usuarios_roles.id_usuario_rol;


--
-- TOC entry 264 (class 1259 OID 62639)
-- Name: acuse_correspondencia; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.acuse_correspondencia (
    id_acuse_correspondencia integer NOT NULL,
    id_correspondencia integer NOT NULL,
    id_usuario_revisor integer NOT NULL,
    fecha_aceptacion date,
    hora_aceptacion time without time zone,
    es_del_area boolean
);


--
-- TOC entry 263 (class 1259 OID 62638)
-- Name: acuse_correspondencia_id_acuse_correspondencia_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5452 (class 0 OID 0)
-- Dependencies: 263
-- Name: acuse_correspondencia_id_acuse_correspondencia_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq OWNED BY correspondencia.acuse_correspondencia.id_acuse_correspondencia;


--
-- TOC entry 257 (class 1259 OID 54428)
-- Name: acuse_memorandum; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.acuse_memorandum (
    id_acuse integer NOT NULL,
    id_memorandum integer NOT NULL,
    id_usuario_revisor integer NOT NULL,
    fecha_aceptacion date,
    hora_aceptacion time without time zone,
    es_del_area boolean
);


--
-- TOC entry 298 (class 1259 OID 62879)
-- Name: acuse_oficio; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.acuse_oficio (
    id_acuse_oficio integer NOT NULL,
    id_oficio integer,
    id_usuario_revisor integer,
    fecha_aceptacion date,
    hora_aceptacion time without time zone,
    es_del_area boolean
);


--
-- TOC entry 5453 (class 0 OID 0)
-- Dependencies: 298
-- Name: TABLE acuse_oficio; Type: COMMENT; Schema: correspondencia; Owner: -
--

COMMENT ON TABLE correspondencia.acuse_oficio IS 'Tabla de acuse para oficios con ID autoincremental.';


--
-- TOC entry 297 (class 1259 OID 62878)
-- Name: acuse_oficio_id_acuse_oficio_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.acuse_oficio_id_acuse_oficio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5454 (class 0 OID 0)
-- Dependencies: 297
-- Name: acuse_oficio_id_acuse_oficio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.acuse_oficio_id_acuse_oficio_seq OWNED BY correspondencia.acuse_oficio.id_acuse_oficio;


--
-- TOC entry 256 (class 1259 OID 54427)
-- Name: acuserecibointerno_id_acuse_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.acuserecibointerno_id_acuse_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5455 (class 0 OID 0)
-- Dependencies: 256
-- Name: acuserecibointerno_id_acuse_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.acuserecibointerno_id_acuse_seq OWNED BY correspondencia.acuse_memorandum.id_acuse;


--
-- TOC entry 220 (class 1259 OID 54078)
-- Name: alertas_seguimiento; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.alertas_seguimiento (
    id_alerta integer NOT NULL,
    id_turno integer,
    id_usuario_emisor integer,
    mensaje_urgencia text,
    fecha_alerta timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    leida boolean DEFAULT false
);


--
-- TOC entry 221 (class 1259 OID 54085)
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.alertas_seguimiento_id_alerta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5456 (class 0 OID 0)
-- Dependencies: 221
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.alertas_seguimiento_id_alerta_seq OWNED BY correspondencia.alertas_seguimiento.id_alerta;


--
-- TOC entry 222 (class 1259 OID 54086)
-- Name: archivos_adjuntos; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.archivos_adjuntos (
    id_archivo integer NOT NULL,
    id_correspondencia integer,
    id_usuario_subio integer,
    nombre_original character varying(255),
    ruta_servidor character varying(500),
    tipo_archivo character varying(100),
    categoria character varying(50),
    fecha_subida timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 223 (class 1259 OID 54092)
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.archivos_adjuntos_id_archivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5457 (class 0 OID 0)
-- Dependencies: 223
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.archivos_adjuntos_id_archivo_seq OWNED BY correspondencia.archivos_adjuntos.id_archivo;


--
-- TOC entry 226 (class 1259 OID 54097)
-- Name: auditoria_correspondencia; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.auditoria_correspondencia (
    id_log integer NOT NULL,
    id_correspondencia integer,
    id_usuario_accion integer,
    estado_anterior integer,
    estado_nuevo integer,
    observaciones text,
    fecha_movimiento timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 227 (class 1259 OID 54103)
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.auditoria_correspondencia_id_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5458 (class 0 OID 0)
-- Dependencies: 227
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.auditoria_correspondencia_id_log_seq OWNED BY correspondencia.auditoria_correspondencia.id_log;


--
-- TOC entry 234 (class 1259 OID 54116)
-- Name: correspondencia; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.correspondencia (
    id_correspondencia integer NOT NULL,
    folio_unico character varying(50) NOT NULL,
    num_oficio_externo character varying(100),
    dependencia_remitente character varying(255),
    nombre_remitente character varying(255),
    asunto text,
    fecha_oficio date,
    fecha_recibido timestamp without time zone,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    vigencia_desde date,
    termino_fatal date,
    id_estatus integer,
    id_usuario_captura integer,
    observaciones_validacion text,
    id_area integer,
    id_tipo_correspondencia integer
);


--
-- TOC entry 235 (class 1259 OID 54122)
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.correspondencia_id_folio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5459 (class 0 OID 0)
-- Dependencies: 235
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.correspondencia_id_folio_seq OWNED BY correspondencia.correspondencia.id_correspondencia;


--
-- TOC entry 236 (class 1259 OID 54123)
-- Name: correspondencia_respuestas; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.correspondencia_respuestas (
    id_respuesta integer NOT NULL,
    id_turno integer,
    id_usuario_responde integer,
    descripcion_atencion text,
    num_oficio_salida character varying(100),
    fecha_despacho timestamp without time zone,
    resumen_atencion text
);


--
-- TOC entry 237 (class 1259 OID 54128)
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.correspondencia_respuestas_id_respuesta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5460 (class 0 OID 0)
-- Dependencies: 237
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.correspondencia_respuestas_id_respuesta_seq OWNED BY correspondencia.correspondencia_respuestas.id_respuesta;


--
-- TOC entry 238 (class 1259 OID 54129)
-- Name: correspondencia_turnos; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.correspondencia_turnos (
    id_turno integer NOT NULL,
    id_correspondencia integer,
    id_memo integer,
    id_area_destino integer,
    id_usuario_responsable integer,
    fecha_envio timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_acuse_recibo timestamp without time zone,
    id_estatus_individual integer
);


--
-- TOC entry 239 (class 1259 OID 54133)
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.correspondencia_turnos_id_turno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5461 (class 0 OID 0)
-- Dependencies: 239
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.correspondencia_turnos_id_turno_seq OWNED BY correspondencia.correspondencia_turnos.id_turno;


--
-- TOC entry 242 (class 1259 OID 54138)
-- Name: memorandums; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.memorandums (
    id_memo integer NOT NULL,
    id_correspondencia integer,
    num_memo character varying(100),
    instruccion_seguimiento text,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_usuario_emisor integer,
    folio_unico character varying(100),
    observaciones text,
    url_memorandum_generado character varying(255),
    id_plantilla integer,
    id_area integer,
    id_usuario_firmante integer
);


--
-- TOC entry 243 (class 1259 OID 54144)
-- Name: memorandums_id_memo_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.memorandums_id_memo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5462 (class 0 OID 0)
-- Dependencies: 243
-- Name: memorandums_id_memo_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.memorandums_id_memo_seq OWNED BY correspondencia.memorandums.id_memo;


--
-- TOC entry 244 (class 1259 OID 54145)
-- Name: notificaciones; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.notificaciones (
    id_notificacion integer NOT NULL,
    id_usuario_destino integer,
    mensaje character varying(500),
    id_referencia integer,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    leida boolean DEFAULT false
);


--
-- TOC entry 245 (class 1259 OID 54152)
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.notificaciones_id_notificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5463 (class 0 OID 0)
-- Dependencies: 245
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.notificaciones_id_notificacion_seq OWNED BY correspondencia.notificaciones.id_notificacion;


--
-- TOC entry 296 (class 1259 OID 62870)
-- Name: oficio; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.oficio (
    id_oficio integer NOT NULL,
    id_correspondencia integer,
    num_oficio character varying(100),
    instruccion_seguimiento text,
    fecha_emision timestamp without time zone,
    id_usuario_emisor integer,
    folio_unico character varying(100),
    observaciones text,
    url_memorandum_generado character varying(255),
    id_plantilla integer,
    id_area integer,
    id_usuario_firmante integer
);


--
-- TOC entry 5464 (class 0 OID 0)
-- Dependencies: 296
-- Name: TABLE oficio; Type: COMMENT; Schema: correspondencia; Owner: -
--

COMMENT ON TABLE correspondencia.oficio IS 'Tabla para el registro de oficios generados en el sistema de correspondencia.';


--
-- TOC entry 307 (class 1259 OID 79338)
-- Name: oficio_contestacion; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.oficio_contestacion (
    id_contestacion integer NOT NULL,
    id_seguimiento_correspondencia integer,
    id_seguimiento_oficio integer,
    id_seguimiento_memorandum integer,
    num_oficio_contestacion character varying(50) NOT NULL,
    fecha_oficio_contestacion date DEFAULT CURRENT_DATE,
    asunto_contestacion text NOT NULL,
    cuerpo_oficio text NOT NULL,
    nombre_firmante character varying(150),
    puesto_firmante character varying(150),
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 305 (class 1259 OID 63129)
-- Name: oficio_contestacion_externa; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.oficio_contestacion_externa (
    id_oficio_contestacion integer NOT NULL,
    id_correspondencia integer NOT NULL,
    id_usuario_emisor integer NOT NULL,
    num_oficio_salida character varying(100) NOT NULL,
    asunto_contestacion text NOT NULL,
    cuerpo_oficio_texto text NOT NULL,
    url_pdf_final character varying(255),
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 304 (class 1259 OID 63128)
-- Name: oficio_contestacion_externa_id_oficio_contestacion_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5465 (class 0 OID 0)
-- Dependencies: 304
-- Name: oficio_contestacion_externa_id_oficio_contestacion_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq OWNED BY correspondencia.oficio_contestacion_externa.id_oficio_contestacion;


--
-- TOC entry 306 (class 1259 OID 79337)
-- Name: oficio_contestacion_id_contestacion_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.oficio_contestacion_id_contestacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5466 (class 0 OID 0)
-- Dependencies: 306
-- Name: oficio_contestacion_id_contestacion_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.oficio_contestacion_id_contestacion_seq OWNED BY correspondencia.oficio_contestacion.id_contestacion;


--
-- TOC entry 295 (class 1259 OID 62869)
-- Name: oficio_id_oficio_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.oficio_id_oficio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5467 (class 0 OID 0)
-- Dependencies: 295
-- Name: oficio_id_oficio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.oficio_id_oficio_seq OWNED BY correspondencia.oficio.id_oficio;


--
-- TOC entry 253 (class 1259 OID 54388)
-- Name: plantilla_memorandum; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.plantilla_memorandum (
    id_plantilla integer NOT NULL,
    nombre_plantilla character varying(150) NOT NULL,
    url_plantilla_memorandum text,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    activo boolean DEFAULT true
);


--
-- TOC entry 252 (class 1259 OID 54387)
-- Name: plantilla_memorandum_id_plantilla_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.plantilla_memorandum_id_plantilla_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5468 (class 0 OID 0)
-- Dependencies: 252
-- Name: plantilla_memorandum_id_plantilla_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.plantilla_memorandum_id_plantilla_seq OWNED BY correspondencia.plantilla_memorandum.id_plantilla;


--
-- TOC entry 262 (class 1259 OID 54504)
-- Name: seguimiento_correspondencia; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.seguimiento_correspondencia (
    id_seguimiento_correspondencia integer NOT NULL,
    id_correspondencia integer NOT NULL,
    folio_respuesta character varying(50) NOT NULL,
    respuesta_seguimiento_correspondencia text,
    fecha_resolucion date NOT NULL,
    hora_resolucion time without time zone NOT NULL,
    archivo_adjunto character varying(255),
    id_usuario integer NOT NULL,
    id_estatus integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    numero_oficio_contestacion character varying(100)
);


--
-- TOC entry 261 (class 1259 OID 54503)
-- Name: seguimiento_correspondencia_id_seguimiento_correspondencia_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5469 (class 0 OID 0)
-- Dependencies: 261
-- Name: seguimiento_correspondencia_id_seguimiento_correspondencia_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq OWNED BY correspondencia.seguimiento_correspondencia.id_seguimiento_correspondencia;


--
-- TOC entry 260 (class 1259 OID 54458)
-- Name: seguimiento_memorandum; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.seguimiento_memorandum (
    id_seguimiento_memorandum integer NOT NULL,
    id_memo integer NOT NULL,
    folio_respuesta integer NOT NULL,
    respuesta_seguimiento_memorandum text,
    fecha_resolucion date NOT NULL,
    hora_resolucion time without time zone NOT NULL,
    archivo_adjunto character varying(255),
    id_usuario integer NOT NULL,
    id_estatus integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    numero_oficio_contestacion character varying(100)
);


--
-- TOC entry 259 (class 1259 OID 54457)
-- Name: seguimiento_memorandum_folio_respuesta_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.seguimiento_memorandum_folio_respuesta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5470 (class 0 OID 0)
-- Dependencies: 259
-- Name: seguimiento_memorandum_folio_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.seguimiento_memorandum_folio_respuesta_seq OWNED BY correspondencia.seguimiento_memorandum.folio_respuesta;


--
-- TOC entry 258 (class 1259 OID 54456)
-- Name: seguimiento_memorandum_id_seguimiento_memorandum_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5471 (class 0 OID 0)
-- Dependencies: 258
-- Name: seguimiento_memorandum_id_seguimiento_memorandum_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq OWNED BY correspondencia.seguimiento_memorandum.id_seguimiento_memorandum;


--
-- TOC entry 301 (class 1259 OID 62887)
-- Name: seguimiento_oficio; Type: TABLE; Schema: correspondencia; Owner: -
--

CREATE TABLE correspondencia.seguimiento_oficio (
    id_seguimiento_oficio integer NOT NULL,
    id_oficio integer,
    folio_respuesta integer NOT NULL,
    respuesta_seguimiento_oficio text,
    fecha_resolucion date,
    hora_resolucion time without time zone,
    archivo_adjunto character varying(255),
    id_usuario integer,
    id_estatus integer,
    fecha_registro timestamp without time zone,
    numero_oficio_contestacion character varying(100)
);


--
-- TOC entry 300 (class 1259 OID 62886)
-- Name: seguimiento_oficio_folio_respuesta_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.seguimiento_oficio_folio_respuesta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5472 (class 0 OID 0)
-- Dependencies: 300
-- Name: seguimiento_oficio_folio_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.seguimiento_oficio_folio_respuesta_seq OWNED BY correspondencia.seguimiento_oficio.folio_respuesta;


--
-- TOC entry 299 (class 1259 OID 62885)
-- Name: seguimiento_oficio_id_seguimiento_oficio_seq; Type: SEQUENCE; Schema: correspondencia; Owner: -
--

CREATE SEQUENCE correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5473 (class 0 OID 0)
-- Dependencies: 299
-- Name: seguimiento_oficio_id_seguimiento_oficio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq OWNED BY correspondencia.seguimiento_oficio.id_seguimiento_oficio;


--
-- TOC entry 284 (class 1259 OID 62781)
-- Name: asesores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.asesores (
    id_asesores integer NOT NULL,
    id_usuario_fk integer NOT NULL,
    activo_round_robin boolean DEFAULT true,
    orden_asignacion integer NOT NULL
);


--
-- TOC entry 282 (class 1259 OID 62779)
-- Name: asesores_id_asesores_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.asesores_id_asesores_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5474 (class 0 OID 0)
-- Dependencies: 282
-- Name: asesores_id_asesores_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.asesores_id_asesores_seq OWNED BY public.asesores.id_asesores;


--
-- TOC entry 283 (class 1259 OID 62780)
-- Name: asesores_orden_asignacion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.asesores_orden_asignacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5475 (class 0 OID 0)
-- Dependencies: 283
-- Name: asesores_orden_asignacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.asesores_orden_asignacion_seq OWNED BY public.asesores.orden_asignacion;


--
-- TOC entry 294 (class 1259 OID 62859)
-- Name: auditoria_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auditoria_log (
    id_auditoria_log integer NOT NULL,
    id_usuario_accion integer,
    operacion character varying(10),
    tabla_nombre character varying(50),
    id_registro_afectado integer,
    datos_anteriores jsonb,
    datos_nuevos jsonb,
    fecha_evento timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 293 (class 1259 OID 62858)
-- Name: auditoria_log_id_auditoria_log_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auditoria_log_id_auditoria_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5476 (class 0 OID 0)
-- Dependencies: 293
-- Name: auditoria_log_id_auditoria_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auditoria_log_id_auditoria_log_seq OWNED BY public.auditoria_log.id_auditoria_log;


--
-- TOC entry 281 (class 1259 OID 62772)
-- Name: cat_tipos_tramite; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cat_tipos_tramite (
    id_cat_tipos_tramite integer NOT NULL,
    nombre_tramite character varying(100) NOT NULL,
    prefijo_folio character varying(5),
    ruta_plantilla_doc character varying(255),
    activo boolean DEFAULT true
);


--
-- TOC entry 280 (class 1259 OID 62771)
-- Name: cat_tipos_tramite_id_cat_tipos_tramite_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cat_tipos_tramite_id_cat_tipos_tramite_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5477 (class 0 OID 0)
-- Dependencies: 280
-- Name: cat_tipos_tramite_id_cat_tipos_tramite_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cat_tipos_tramite_id_cat_tipos_tramite_seq OWNED BY public.cat_tipos_tramite.id_cat_tipos_tramite;


--
-- TOC entry 286 (class 1259 OID 62792)
-- Name: control_folios_config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.control_folios_config (
    id_control_folios_config integer NOT NULL,
    anio integer NOT NULL,
    mes integer NOT NULL,
    consecutivo integer DEFAULT 0
);


--
-- TOC entry 285 (class 1259 OID 62791)
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.control_folios_config_id_control_folios_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5478 (class 0 OID 0)
-- Dependencies: 285
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.control_folios_config_id_control_folios_config_seq OWNED BY public.control_folios_config.id_control_folios_config;


--
-- TOC entry 219 (class 1259 OID 54073)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- TOC entry 218 (class 1259 OID 54068)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- TOC entry 288 (class 1259 OID 62802)
-- Name: expedientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expedientes (
    id_expedientes integer NOT NULL,
    folio_unico character varying(20) NOT NULL,
    id_persona_fk integer NOT NULL,
    id_cat_tipos_tramite_fk integer NOT NULL,
    id_asesores_fk integer,
    estatus_procesal character varying(50) DEFAULT 'ABIERTO'::character varying,
    fecha_apertura timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    creado_por character varying(50),
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 287 (class 1259 OID 62801)
-- Name: expedientes_id_expedientes_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.expedientes_id_expedientes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5479 (class 0 OID 0)
-- Dependencies: 287
-- Name: expedientes_id_expedientes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.expedientes_id_expedientes_seq OWNED BY public.expedientes.id_expedientes;


--
-- TOC entry 290 (class 1259 OID 62824)
-- Name: instrucciones_trabajo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.instrucciones_trabajo (
    id_instrucciones_trabajo integer NOT NULL,
    id_expedientes_fk integer NOT NULL,
    folio_instruccion character varying(50),
    cuerpo_instruccion text,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    url_pdf_generado character varying(255)
);


--
-- TOC entry 289 (class 1259 OID 62823)
-- Name: instrucciones_trabajo_id_instrucciones_trabajo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.instrucciones_trabajo_id_instrucciones_trabajo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5480 (class 0 OID 0)
-- Dependencies: 289
-- Name: instrucciones_trabajo_id_instrucciones_trabajo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.instrucciones_trabajo_id_instrucciones_trabajo_seq OWNED BY public.instrucciones_trabajo.id_instrucciones_trabajo;


--
-- TOC entry 292 (class 1259 OID 62839)
-- Name: seguimiento_tramite; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.seguimiento_tramite (
    id_seguimiento_tramite integer NOT NULL,
    id_expedientes_fk integer NOT NULL,
    id_asesores_fk integer NOT NULL,
    descripcion_actividad text NOT NULL,
    evidencia_url character varying(255),
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 291 (class 1259 OID 62838)
-- Name: seguimiento_tramite_id_seguimiento_tramite_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.seguimiento_tramite_id_seguimiento_tramite_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5481 (class 0 OID 0)
-- Dependencies: 291
-- Name: seguimiento_tramite_id_seguimiento_tramite_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.seguimiento_tramite_id_seguimiento_tramite_seq OWNED BY public.seguimiento_tramite.id_seguimiento_tramite;


--
-- TOC entry 4956 (class 2604 OID 62691)
-- Name: asesores id_asesores; Type: DEFAULT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.asesores ALTER COLUMN id_asesores SET DEFAULT nextval('atencion_juridica.asesores_id_asesores_seq'::regclass);


--
-- TOC entry 4958 (class 2604 OID 62693)
-- Name: asesores orden_asignacion; Type: DEFAULT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.asesores ALTER COLUMN orden_asignacion SET DEFAULT nextval('atencion_juridica.asesores_orden_asignacion_seq'::regclass);


--
-- TOC entry 4952 (class 2604 OID 62661)
-- Name: auditoria_log id_auditoria_log; Type: DEFAULT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.auditoria_log ALTER COLUMN id_auditoria_log SET DEFAULT nextval('atencion_juridica.auditoria_log_id_auditoria_log_seq'::regclass);


--
-- TOC entry 4954 (class 2604 OID 62682)
-- Name: cat_tipos_tramite id_cat_tipos_tramite; Type: DEFAULT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.cat_tipos_tramite ALTER COLUMN id_cat_tipos_tramite SET DEFAULT nextval('atencion_juridica.cat_tipos_tramite_id_cat_tipos_tramite_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 62712)
-- Name: expedientes id_expedientes; Type: DEFAULT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.expedientes ALTER COLUMN id_expedientes SET DEFAULT nextval('atencion_juridica.expedientes_id_expedientes_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 62734)
-- Name: instrucciones_trabajo id_instrucciones_trabajo; Type: DEFAULT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.instrucciones_trabajo ALTER COLUMN id_instrucciones_trabajo SET DEFAULT nextval('atencion_juridica.instrucciones_trabajo_id_instrucciones_trabajo_seq'::regclass);


--
-- TOC entry 4967 (class 2604 OID 62749)
-- Name: seguimiento_tramite id_seguimiento_tramite; Type: DEFAULT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.seguimiento_tramite ALTER COLUMN id_seguimiento_tramite SET DEFAULT nextval('atencion_juridica.seguimiento_tramite_id_seguimiento_tramite_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 54169)
-- Name: areas id_area; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.areas ALTER COLUMN id_area SET DEFAULT nextval('catalogos.areas_id_area_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 54171)
-- Name: cat_estados id_estado; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estados ALTER COLUMN id_estado SET DEFAULT nextval('catalogos.cat_estados_id_estado_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 54172)
-- Name: cat_estatus id_estatus; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estatus ALTER COLUMN id_estatus SET DEFAULT nextval('catalogos.cat_estatus_id_estatus_seq'::regclass);


--
-- TOC entry 4923 (class 2604 OID 54173)
-- Name: cat_municipios id_municipio; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_municipios ALTER COLUMN id_municipio SET DEFAULT nextval('catalogos.cat_municipios_id_municipio_seq'::regclass);


--
-- TOC entry 4959 (class 2604 OID 62702)
-- Name: control_folios_config id_control_folios_config; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.control_folios_config ALTER COLUMN id_control_folios_config SET DEFAULT nextval('catalogos.control_folios_config_id_control_folios_config_seq'::regclass);


--
-- TOC entry 4929 (class 2604 OID 54177)
-- Name: direcciones id_direccion; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.direcciones ALTER COLUMN id_direccion SET DEFAULT nextval('catalogos.direcciones_id_direccion_seq'::regclass);


--
-- TOC entry 4944 (class 2604 OID 54402)
-- Name: empleados id_empleado; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.empleados ALTER COLUMN id_empleado SET DEFAULT nextval('catalogos.empleados_id_empleado_seq'::regclass);


--
-- TOC entry 4935 (class 2604 OID 54180)
-- Name: personas id_persona; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.personas ALTER COLUMN id_persona SET DEFAULT nextval('catalogos.personas_id_persona_seq'::regclass);


--
-- TOC entry 4936 (class 2604 OID 54181)
-- Name: roles id_rol; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.roles ALTER COLUMN id_rol SET DEFAULT nextval('catalogos.roles_id_rol_seq'::regclass);


--
-- TOC entry 4990 (class 2604 OID 62920)
-- Name: tipo_correspondencia id_tipo_correspondencia; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_correspondencia ALTER COLUMN id_tipo_correspondencia SET DEFAULT nextval('catalogos.tipo_correspondencia_id_tipo_correspondencia_seq'::regclass);


--
-- TOC entry 4938 (class 2604 OID 54182)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('catalogos.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 4996 (class 2604 OID 79369)
-- Name: usuarios_roles id_usuario_rol; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios_roles ALTER COLUMN id_usuario_rol SET DEFAULT nextval('catalogos.usuarios_roles_id_usuario_rol_seq'::regclass);


--
-- TOC entry 4951 (class 2604 OID 62642)
-- Name: acuse_correspondencia id_acuse_correspondencia; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia ALTER COLUMN id_acuse_correspondencia SET DEFAULT nextval('correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq'::regclass);


--
-- TOC entry 4945 (class 2604 OID 54431)
-- Name: acuse_memorandum id_acuse; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_memorandum ALTER COLUMN id_acuse SET DEFAULT nextval('correspondencia.acuserecibointerno_id_acuse_seq'::regclass);


--
-- TOC entry 4987 (class 2604 OID 62882)
-- Name: acuse_oficio id_acuse_oficio; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_oficio ALTER COLUMN id_acuse_oficio SET DEFAULT nextval('correspondencia.acuse_oficio_id_acuse_oficio_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 54167)
-- Name: alertas_seguimiento id_alerta; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento ALTER COLUMN id_alerta SET DEFAULT nextval('correspondencia.alertas_seguimiento_id_alerta_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 54168)
-- Name: archivos_adjuntos id_archivo; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos ALTER COLUMN id_archivo SET DEFAULT nextval('correspondencia.archivos_adjuntos_id_archivo_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 54170)
-- Name: auditoria_correspondencia id_log; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia ALTER COLUMN id_log SET DEFAULT nextval('correspondencia.auditoria_correspondencia_id_log_seq'::regclass);


--
-- TOC entry 4924 (class 2604 OID 54174)
-- Name: correspondencia id_correspondencia; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia ALTER COLUMN id_correspondencia SET DEFAULT nextval('correspondencia.correspondencia_id_folio_seq'::regclass);


--
-- TOC entry 4926 (class 2604 OID 54175)
-- Name: correspondencia_respuestas id_respuesta; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas ALTER COLUMN id_respuesta SET DEFAULT nextval('correspondencia.correspondencia_respuestas_id_respuesta_seq'::regclass);


--
-- TOC entry 4927 (class 2604 OID 54176)
-- Name: correspondencia_turnos id_turno; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos ALTER COLUMN id_turno SET DEFAULT nextval('correspondencia.correspondencia_turnos_id_turno_seq'::regclass);


--
-- TOC entry 4930 (class 2604 OID 54178)
-- Name: memorandums id_memo; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums ALTER COLUMN id_memo SET DEFAULT nextval('correspondencia.memorandums_id_memo_seq'::regclass);


--
-- TOC entry 4932 (class 2604 OID 54179)
-- Name: notificaciones id_notificacion; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.notificaciones ALTER COLUMN id_notificacion SET DEFAULT nextval('correspondencia.notificaciones_id_notificacion_seq'::regclass);


--
-- TOC entry 4986 (class 2604 OID 62873)
-- Name: oficio id_oficio; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio ALTER COLUMN id_oficio SET DEFAULT nextval('correspondencia.oficio_id_oficio_seq'::regclass);


--
-- TOC entry 4993 (class 2604 OID 79341)
-- Name: oficio_contestacion id_contestacion; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion ALTER COLUMN id_contestacion SET DEFAULT nextval('correspondencia.oficio_contestacion_id_contestacion_seq'::regclass);


--
-- TOC entry 4991 (class 2604 OID 63132)
-- Name: oficio_contestacion_externa id_oficio_contestacion; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa ALTER COLUMN id_oficio_contestacion SET DEFAULT nextval('correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 54391)
-- Name: plantilla_memorandum id_plantilla; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.plantilla_memorandum ALTER COLUMN id_plantilla SET DEFAULT nextval('correspondencia.plantilla_memorandum_id_plantilla_seq'::regclass);


--
-- TOC entry 4949 (class 2604 OID 54507)
-- Name: seguimiento_correspondencia id_seguimiento_correspondencia; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia ALTER COLUMN id_seguimiento_correspondencia SET DEFAULT nextval('correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 54461)
-- Name: seguimiento_memorandum id_seguimiento_memorandum; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum ALTER COLUMN id_seguimiento_memorandum SET DEFAULT nextval('correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 54462)
-- Name: seguimiento_memorandum folio_respuesta; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum ALTER COLUMN folio_respuesta SET DEFAULT nextval('correspondencia.seguimiento_memorandum_folio_respuesta_seq'::regclass);


--
-- TOC entry 4988 (class 2604 OID 62890)
-- Name: seguimiento_oficio id_seguimiento_oficio; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio ALTER COLUMN id_seguimiento_oficio SET DEFAULT nextval('correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq'::regclass);


--
-- TOC entry 4989 (class 2604 OID 62891)
-- Name: seguimiento_oficio folio_respuesta; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio ALTER COLUMN folio_respuesta SET DEFAULT nextval('correspondencia.seguimiento_oficio_folio_respuesta_seq'::regclass);


--
-- TOC entry 4971 (class 2604 OID 62784)
-- Name: asesores id_asesores; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asesores ALTER COLUMN id_asesores SET DEFAULT nextval('public.asesores_id_asesores_seq'::regclass);


--
-- TOC entry 4973 (class 2604 OID 62786)
-- Name: asesores orden_asignacion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asesores ALTER COLUMN orden_asignacion SET DEFAULT nextval('public.asesores_orden_asignacion_seq'::regclass);


--
-- TOC entry 4984 (class 2604 OID 62862)
-- Name: auditoria_log id_auditoria_log; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_log ALTER COLUMN id_auditoria_log SET DEFAULT nextval('public.auditoria_log_id_auditoria_log_seq'::regclass);


--
-- TOC entry 4969 (class 2604 OID 62775)
-- Name: cat_tipos_tramite id_cat_tipos_tramite; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat_tipos_tramite ALTER COLUMN id_cat_tipos_tramite SET DEFAULT nextval('public.cat_tipos_tramite_id_cat_tipos_tramite_seq'::regclass);


--
-- TOC entry 4974 (class 2604 OID 62795)
-- Name: control_folios_config id_control_folios_config; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.control_folios_config ALTER COLUMN id_control_folios_config SET DEFAULT nextval('public.control_folios_config_id_control_folios_config_seq'::regclass);


--
-- TOC entry 4976 (class 2604 OID 62805)
-- Name: expedientes id_expedientes; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expedientes ALTER COLUMN id_expedientes SET DEFAULT nextval('public.expedientes_id_expedientes_seq'::regclass);


--
-- TOC entry 4980 (class 2604 OID 62827)
-- Name: instrucciones_trabajo id_instrucciones_trabajo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrucciones_trabajo ALTER COLUMN id_instrucciones_trabajo SET DEFAULT nextval('public.instrucciones_trabajo_id_instrucciones_trabajo_seq'::regclass);


--
-- TOC entry 4982 (class 2604 OID 62842)
-- Name: seguimiento_tramite id_seguimiento_tramite; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seguimiento_tramite ALTER COLUMN id_seguimiento_tramite SET DEFAULT nextval('public.seguimiento_tramite_id_seguimiento_tramite_seq'::regclass);


--
-- TOC entry 5387 (class 0 OID 62688)
-- Dependencies: 271
-- Data for Name: asesores; Type: TABLE DATA; Schema: atencion_juridica; Owner: -
--



--
-- TOC entry 5382 (class 0 OID 62658)
-- Dependencies: 266
-- Data for Name: auditoria_log; Type: TABLE DATA; Schema: atencion_juridica; Owner: -
--



--
-- TOC entry 5384 (class 0 OID 62679)
-- Dependencies: 268
-- Data for Name: cat_tipos_tramite; Type: TABLE DATA; Schema: atencion_juridica; Owner: -
--



--
-- TOC entry 5391 (class 0 OID 62709)
-- Dependencies: 275
-- Data for Name: expedientes; Type: TABLE DATA; Schema: atencion_juridica; Owner: -
--



--
-- TOC entry 5393 (class 0 OID 62731)
-- Dependencies: 277
-- Data for Name: instrucciones_trabajo; Type: TABLE DATA; Schema: atencion_juridica; Owner: -
--



--
-- TOC entry 5395 (class 0 OID 62746)
-- Dependencies: 279
-- Data for Name: seguimiento_tramite; Type: TABLE DATA; Schema: atencion_juridica; Owner: -
--



--
-- TOC entry 5340 (class 0 OID 54093)
-- Dependencies: 224
-- Data for Name: areas; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.areas VALUES (1, 'Administración', NULL);
INSERT INTO catalogos.areas VALUES (2, 'Archivo', NULL);
INSERT INTO catalogos.areas VALUES (3, 'Transparencia', NULL);


--
-- TOC entry 5344 (class 0 OID 54104)
-- Dependencies: 228
-- Data for Name: cat_estados; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.cat_estados VALUES (1, 'Aguascalientes');
INSERT INTO catalogos.cat_estados VALUES (2, 'Baja California');
INSERT INTO catalogos.cat_estados VALUES (3, 'Baja California Sur');
INSERT INTO catalogos.cat_estados VALUES (4, 'Campeche');
INSERT INTO catalogos.cat_estados VALUES (5, 'Chiapas');
INSERT INTO catalogos.cat_estados VALUES (6, 'Chihuahua');
INSERT INTO catalogos.cat_estados VALUES (7, 'Ciudad de México');
INSERT INTO catalogos.cat_estados VALUES (8, 'Coahuila');
INSERT INTO catalogos.cat_estados VALUES (9, 'Colima');
INSERT INTO catalogos.cat_estados VALUES (10, 'Durango');
INSERT INTO catalogos.cat_estados VALUES (11, 'Estado de México');
INSERT INTO catalogos.cat_estados VALUES (12, 'Guanajuato');
INSERT INTO catalogos.cat_estados VALUES (13, 'Guerrero');
INSERT INTO catalogos.cat_estados VALUES (14, 'Hidalgo');
INSERT INTO catalogos.cat_estados VALUES (15, 'Jalisco');
INSERT INTO catalogos.cat_estados VALUES (16, 'Michoacán');
INSERT INTO catalogos.cat_estados VALUES (17, 'Morelos');
INSERT INTO catalogos.cat_estados VALUES (18, 'Nayarit');
INSERT INTO catalogos.cat_estados VALUES (19, 'Nuevo León');
INSERT INTO catalogos.cat_estados VALUES (20, 'Oaxaca');
INSERT INTO catalogos.cat_estados VALUES (21, 'Puebla');
INSERT INTO catalogos.cat_estados VALUES (22, 'Querétaro');
INSERT INTO catalogos.cat_estados VALUES (23, 'Quintana Roo');
INSERT INTO catalogos.cat_estados VALUES (24, 'San Luis Potosí');
INSERT INTO catalogos.cat_estados VALUES (25, 'Sinaloa');
INSERT INTO catalogos.cat_estados VALUES (26, 'Sonora');
INSERT INTO catalogos.cat_estados VALUES (27, 'Tabasco');
INSERT INTO catalogos.cat_estados VALUES (28, 'Tamaulipas');
INSERT INTO catalogos.cat_estados VALUES (29, 'Tlaxcala');
INSERT INTO catalogos.cat_estados VALUES (30, 'Veracruz');
INSERT INTO catalogos.cat_estados VALUES (31, 'Yucatán');
INSERT INTO catalogos.cat_estados VALUES (32, 'Zacatecas');


--
-- TOC entry 5346 (class 0 OID 54108)
-- Dependencies: 230
-- Data for Name: cat_estatus; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.cat_estatus VALUES (1, 'REGISTRADO', 'Existe el folio y el PDF, pero está en revisión de calidad.');
INSERT INTO catalogos.cat_estatus VALUES (2, 'VALIDADO', 'Validación por el administrador.');
INSERT INTO catalogos.cat_estatus VALUES (3, 'ASIGNADO', 'Tiene instrucción (Memo) y área asignada. (Archivo original bloqueado).');
INSERT INTO catalogos.cat_estatus VALUES (4, 'EN SEGUIMIENTO', 'El área ya confirmó que lo recibió en su buzón.');
INSERT INTO catalogos.cat_estatus VALUES (5, 'ATENDIDO', 'El área ya subió su informe y respuesta digitalizada.');
INSERT INTO catalogos.cat_estatus VALUES (6, 'CONCLUIDO', 'El administrador validó todo y el trámite se archiva.');


--
-- TOC entry 5348 (class 0 OID 54112)
-- Dependencies: 232
-- Data for Name: cat_municipios; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.cat_municipios VALUES (1, 32, 'Apozol');
INSERT INTO catalogos.cat_municipios VALUES (2, 32, 'Apulco');
INSERT INTO catalogos.cat_municipios VALUES (3, 32, 'Atolinga');
INSERT INTO catalogos.cat_municipios VALUES (4, 32, 'Benito Juárez');
INSERT INTO catalogos.cat_municipios VALUES (5, 32, 'Calera');
INSERT INTO catalogos.cat_municipios VALUES (6, 32, 'Cañitas de Felipe Pescador');
INSERT INTO catalogos.cat_municipios VALUES (7, 32, 'Concepción del Oro');
INSERT INTO catalogos.cat_municipios VALUES (8, 32, 'Cuauhtémoc');
INSERT INTO catalogos.cat_municipios VALUES (9, 32, 'Chalchihuites');
INSERT INTO catalogos.cat_municipios VALUES (10, 32, 'Fresnillo');
INSERT INTO catalogos.cat_municipios VALUES (11, 32, 'Trinidad García de la Cadena');
INSERT INTO catalogos.cat_municipios VALUES (12, 32, 'Genaro Codina');
INSERT INTO catalogos.cat_municipios VALUES (13, 32, 'General Enrique Estrada');
INSERT INTO catalogos.cat_municipios VALUES (14, 32, 'General Francisco R. Murguía');
INSERT INTO catalogos.cat_municipios VALUES (15, 32, 'El Plateado de Joaquín Amaro');
INSERT INTO catalogos.cat_municipios VALUES (16, 32, 'General Pánfilo Natera');
INSERT INTO catalogos.cat_municipios VALUES (17, 32, 'Guadalupe');
INSERT INTO catalogos.cat_municipios VALUES (18, 32, 'Huanusco');
INSERT INTO catalogos.cat_municipios VALUES (19, 32, 'Jalpa');
INSERT INTO catalogos.cat_municipios VALUES (20, 32, 'Jerez');
INSERT INTO catalogos.cat_municipios VALUES (21, 32, 'Jiménez del Teul');
INSERT INTO catalogos.cat_municipios VALUES (22, 32, 'Juan Aldama');
INSERT INTO catalogos.cat_municipios VALUES (23, 32, 'Juchipila');
INSERT INTO catalogos.cat_municipios VALUES (24, 32, 'Loreto');
INSERT INTO catalogos.cat_municipios VALUES (25, 32, 'Luis Moya');
INSERT INTO catalogos.cat_municipios VALUES (26, 32, 'Mazapil');
INSERT INTO catalogos.cat_municipios VALUES (27, 32, 'Melchor Ocampo');
INSERT INTO catalogos.cat_municipios VALUES (28, 32, 'Mezquital del Oro');
INSERT INTO catalogos.cat_municipios VALUES (29, 32, 'Miguel Auza');
INSERT INTO catalogos.cat_municipios VALUES (30, 32, 'Momax');
INSERT INTO catalogos.cat_municipios VALUES (31, 32, 'Monte Escobedo');
INSERT INTO catalogos.cat_municipios VALUES (32, 32, 'Morelos');
INSERT INTO catalogos.cat_municipios VALUES (33, 32, 'Moyahua de Estrada');
INSERT INTO catalogos.cat_municipios VALUES (34, 32, 'Nochistlán de Mejía');
INSERT INTO catalogos.cat_municipios VALUES (35, 32, 'Noria de Ángeles');
INSERT INTO catalogos.cat_municipios VALUES (36, 32, 'Ojocaliente');
INSERT INTO catalogos.cat_municipios VALUES (37, 32, 'Pánuco');
INSERT INTO catalogos.cat_municipios VALUES (38, 32, 'Pinos');
INSERT INTO catalogos.cat_municipios VALUES (39, 32, 'Río Grande');
INSERT INTO catalogos.cat_municipios VALUES (40, 32, 'Sain Alto');
INSERT INTO catalogos.cat_municipios VALUES (41, 32, 'El Salvador');
INSERT INTO catalogos.cat_municipios VALUES (42, 32, 'Sombrerete');
INSERT INTO catalogos.cat_municipios VALUES (43, 32, 'Susticacán');
INSERT INTO catalogos.cat_municipios VALUES (44, 32, 'Tabasco');
INSERT INTO catalogos.cat_municipios VALUES (45, 32, 'Tepechitlán');
INSERT INTO catalogos.cat_municipios VALUES (46, 32, 'Tepetongo');
INSERT INTO catalogos.cat_municipios VALUES (47, 32, 'Teul de González Ortega');
INSERT INTO catalogos.cat_municipios VALUES (48, 32, 'Tlaltenango de Sánchez Román');
INSERT INTO catalogos.cat_municipios VALUES (49, 32, 'Valparaíso');
INSERT INTO catalogos.cat_municipios VALUES (50, 32, 'Vetagrande');
INSERT INTO catalogos.cat_municipios VALUES (51, 32, 'Villa de Cos');
INSERT INTO catalogos.cat_municipios VALUES (52, 32, 'Villa García');
INSERT INTO catalogos.cat_municipios VALUES (53, 32, 'Villa González Ortega');
INSERT INTO catalogos.cat_municipios VALUES (54, 32, 'Villa Hidalgo');
INSERT INTO catalogos.cat_municipios VALUES (55, 32, 'Villanueva');
INSERT INTO catalogos.cat_municipios VALUES (56, 32, 'Zacatecas');
INSERT INTO catalogos.cat_municipios VALUES (57, 32, 'Trancoso');
INSERT INTO catalogos.cat_municipios VALUES (58, 32, 'Santa María de la Paz');


--
-- TOC entry 5389 (class 0 OID 62699)
-- Dependencies: 273
-- Data for Name: control_folios_config; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5356 (class 0 OID 54134)
-- Dependencies: 240
-- Data for Name: direcciones; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.direcciones VALUES (1, 'Avenida Reforma', '123', 'A-10', 'Centro Histórico', '06000', 1, 9);


--
-- TOC entry 5371 (class 0 OID 54399)
-- Dependencies: 255
-- Data for Name: empleados; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5362 (class 0 OID 54153)
-- Dependencies: 246
-- Data for Name: personas; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.personas VALUES (6, 1, 'Juan', 'Pérez', 'García', 'PERG800101HDFRRR01', '5512345678');
INSERT INTO catalogos.personas VALUES (7, 1, 'María', 'López', 'Martínez', 'LOMM850510MDFSSN02', '5587654321');
INSERT INTO catalogos.personas VALUES (8, NULL, 'Carlos', 'Ramírez', NULL, 'RANC900215HDFGGN03', '5544332211');


--
-- TOC entry 5364 (class 0 OID 54157)
-- Dependencies: 248
-- Data for Name: roles; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.roles VALUES (1, 'Administrador', 'Acceso total a todos los módulos del sistema y gestión de usuarios.', NULL, true);
INSERT INTO catalogos.roles VALUES (2, 'Operador', 'Acceso limitado a la captura de datos y consulta de reportes básicos.', NULL, true);
INSERT INTO catalogos.roles VALUES (3, 'Administrador', 'Control total sobre todos los módulos del sistema', '/admin/dashboard', true);
INSERT INTO catalogos.roles VALUES (4, 'Usuario', 'Acceso a funciones operativas y consultas generales', '/user/home', true);
INSERT INTO catalogos.roles VALUES (5, 'Invitado', 'Acceso limitado únicamente para visualización de reportes', '/guest/view', true);
INSERT INTO catalogos.roles VALUES (6, 'Soporte', 'Acceso a herramientas de diagnóstico y soporte técnico', '/support/tools', true);


--
-- TOC entry 5419 (class 0 OID 62917)
-- Dependencies: 303
-- Data for Name: tipo_correspondencia; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.tipo_correspondencia VALUES (1, 'externa');
INSERT INTO catalogos.tipo_correspondencia VALUES (2, 'interna');


--
-- TOC entry 5366 (class 0 OID 54161)
-- Dependencies: 250
-- Data for Name: usuarios; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.usuarios VALUES (10, 8, 1, 'jperez', 'hash_seguro_123', 'juan.perez@empresa.com', '2026-04-25 13:33:21.566884', true);
INSERT INTO catalogos.usuarios VALUES (11, 6, 2, 'mlopez', 'clave_secreta_456', 'maria.lopez@empresa.com', '2026-04-25 13:33:21.566884', true);
INSERT INTO catalogos.usuarios VALUES (12, 7, NULL, 'cramirez', 'password_789', 'carlos.ram@correo.com', '2026-04-25 13:33:21.566884', true);


--
-- TOC entry 5425 (class 0 OID 79366)
-- Dependencies: 309
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.usuarios_roles VALUES (1, 10, 1, '2026-05-13 15:37:23.785455');
INSERT INTO catalogos.usuarios_roles VALUES (2, 11, 2, '2026-05-13 15:37:23.785455');
INSERT INTO catalogos.usuarios_roles VALUES (3, 12, 6, '2026-05-13 15:37:23.785455');


--
-- TOC entry 5380 (class 0 OID 62639)
-- Dependencies: 264
-- Data for Name: acuse_correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5373 (class 0 OID 54428)
-- Dependencies: 257
-- Data for Name: acuse_memorandum; Type: TABLE DATA; Schema: correspondencia; Owner: -
--

INSERT INTO correspondencia.acuse_memorandum VALUES (4, 2, 11, '2026-04-25', '13:45:00', false);


--
-- TOC entry 5414 (class 0 OID 62879)
-- Dependencies: 298
-- Data for Name: acuse_oficio; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5336 (class 0 OID 54078)
-- Dependencies: 220
-- Data for Name: alertas_seguimiento; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5338 (class 0 OID 54086)
-- Dependencies: 222
-- Data for Name: archivos_adjuntos; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5342 (class 0 OID 54097)
-- Dependencies: 226
-- Data for Name: auditoria_correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5350 (class 0 OID 54116)
-- Dependencies: 234
-- Data for Name: correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: -
--

INSERT INTO correspondencia.correspondencia VALUES (5, 'FOL-2024-001', 'SEP-123-2024', 'Secretaría de Educación Pública', 'Lic. Roberto Gómez', 'Solicitud de becas para el periodo 2024-B', '2024-05-15', '2024-05-16 10:00:00', '2026-04-25 13:38:43.872641', '2024-05-16', '2024-06-16', 1, 10, 'Documentación completa y legible.', 1, NULL);
INSERT INTO correspondencia.correspondencia VALUES (6, 'FOL-2024-002', 'SAT-987-A', 'Servicio de Administración Tributaria', 'Ing. Ana Luz', 'Notificación de auditoría anual', '2024-05-18', '2026-04-25 13:38:43.872641', '2026-04-25 13:38:43.872641', '2024-05-20', '2024-05-30', 2, 11, NULL, 2, NULL);


--
-- TOC entry 5352 (class 0 OID 54123)
-- Dependencies: 236
-- Data for Name: correspondencia_respuestas; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5354 (class 0 OID 54129)
-- Dependencies: 238
-- Data for Name: correspondencia_turnos; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5358 (class 0 OID 54138)
-- Dependencies: 242
-- Data for Name: memorandums; Type: TABLE DATA; Schema: correspondencia; Owner: -
--

INSERT INTO correspondencia.memorandums VALUES (2, 5, 'MEMO-2026-005', 'Favor de revisar la solicitud y dar respuesta en un plazo de 3 días.', '2026-04-25 13:42:50.920047', 11, 'FOL-MEMO-9988', 'Se adjuntan documentos originales en físico.', 'https://servidor/docs/memo_005.pdf', 2, 1, 12);


--
-- TOC entry 5360 (class 0 OID 54145)
-- Dependencies: 244
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5412 (class 0 OID 62870)
-- Dependencies: 296
-- Data for Name: oficio; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5423 (class 0 OID 79338)
-- Dependencies: 307
-- Data for Name: oficio_contestacion; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5421 (class 0 OID 63129)
-- Dependencies: 305
-- Data for Name: oficio_contestacion_externa; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5369 (class 0 OID 54388)
-- Dependencies: 253
-- Data for Name: plantilla_memorandum; Type: TABLE DATA; Schema: correspondencia; Owner: -
--

INSERT INTO correspondencia.plantilla_memorandum VALUES (1, 'Plantilla Estándar Oficinas', '/assets/templates/memo_estandar_v1.docx', '2026-04-25 13:42:44.046661', true);
INSERT INTO correspondencia.plantilla_memorandum VALUES (2, 'Plantilla Urgente / Prioritaria', '/assets/templates/memo_urgente_v2.docx', '2026-04-25 13:42:44.046661', true);


--
-- TOC entry 5378 (class 0 OID 54504)
-- Dependencies: 262
-- Data for Name: seguimiento_correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5376 (class 0 OID 54458)
-- Dependencies: 260
-- Data for Name: seguimiento_memorandum; Type: TABLE DATA; Schema: correspondencia; Owner: -
--

INSERT INTO correspondencia.seguimiento_memorandum VALUES (3, 2, 3, 'Se ha revisado la documentación y se procede con la firma.', '2026-04-27', '14:30:00', 'documento_final_v1.pdf', 10, 2, '2026-04-27 15:09:02.304282', NULL);
INSERT INTO correspondencia.seguimiento_memorandum VALUES (4, 2, 4, 'Prueba final de integración', '2026-04-27', '16:00:00', 'evidencia.pdf', 10, 2, '2026-04-27 16:04:55.619478', NULL);
INSERT INTO correspondencia.seguimiento_memorandum VALUES (5, 2, 5, 'Prueba final de integración', '2026-04-27', '16:00:00', 'evidencia.pdf', 10, 2, '2026-04-29 12:26:44.350989', NULL);
INSERT INTO correspondencia.seguimiento_memorandum VALUES (6, 2, 6, 'Prueba final de integración', '2026-04-27', '16:00:00', 'evidencia.pdf', 10, 2, '2026-04-29 12:31:40.544317', NULL);


--
-- TOC entry 5417 (class 0 OID 62887)
-- Dependencies: 301
-- Data for Name: seguimiento_oficio; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5400 (class 0 OID 62781)
-- Dependencies: 284
-- Data for Name: asesores; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5410 (class 0 OID 62859)
-- Dependencies: 294
-- Data for Name: auditoria_log; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5397 (class 0 OID 62772)
-- Dependencies: 281
-- Data for Name: cat_tipos_tramite; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5402 (class 0 OID 62792)
-- Dependencies: 286
-- Data for Name: control_folios_config; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5335 (class 0 OID 54073)
-- Dependencies: 219
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.databasechangelog VALUES ('raw', 'includeAll', 'mi_nueva_migracion.sql', '2026-04-06 18:24:24.04891', 1, 'EXECUTED', '8:0b94789fa394b4ba93236c7f7baa23bc', 'sql', '', NULL, '4.3.2', NULL, NULL, '5521463867');
INSERT INTO public.databasechangelog VALUES ('insertar_areas_iniciales', 'ErickRivera', 'scripts/EDRM_00001_insertar_datos_tabla_areas.sql', '2026-04-06 18:24:24.081923', 2, 'EXECUTED', '8:bb1d2e8afd76fb1766997c20e5347676', 'sql', '', NULL, '4.3.2', NULL, NULL, '5521463867');
INSERT INTO public.databasechangelog VALUES ('raw', 'includeAll', 'scripts/JJRM_00002_insertar_datos_estados.sql', '2026-04-06 18:24:24.08758', 3, 'EXECUTED', '8:d40bdae7ca849af244828609fda5a81e', 'sql', '', NULL, '4.3.2', NULL, NULL, '5521463867');
INSERT INTO public.databasechangelog VALUES ('raw', 'includeAll', 'scripts/JJRM_00003_insertar_datos_municipios.sql', '2026-04-06 18:24:24.094316', 4, 'EXECUTED', '8:165a39df6a2a5c906ec3eff0283a6df7', 'sql', '', NULL, '4.3.2', NULL, NULL, '5521463867');
INSERT INTO public.databasechangelog VALUES ('alter_table_cat_estatus', 'HugoRivera', 'scripts/HIRM_00004_alter_table_cat_estatus.sql', '2026-04-06 18:24:24.10045', 5, 'EXECUTED', '8:d9ac1c0b0f7577e481a151ee453b3133', 'sql', '', NULL, '4.3.2', NULL, NULL, '5521463867');
INSERT INTO public.databasechangelog VALUES ('insertar_nombre_estatus_descripción', 'HugoRivera', 'scripts/HIRM_00005_insertar_datos_car_estatus.sql', '2026-04-06 18:24:24.104489', 6, 'EXECUTED', '8:a32282657b7c52b0c116ac7e4283487c', 'sql', '', NULL, '4.3.2', NULL, NULL, '5521463867');
INSERT INTO public.databasechangelog VALUES ('raw', 'includeAll', 'scripts/ADRC_00006_modificación_tabla_areas.sql', '2026-04-14 19:42:55.088054', 7, 'EXECUTED', '8:3c048f0cdb99edd69e70cad138e00243', 'sql', '', NULL, '4.3.2', NULL, NULL, '6217374931');
INSERT INTO public.databasechangelog VALUES ('añadir_columna_descripcion', 'AnaRivera', 'scripts/ARRM_00007_alter_table_roles_desc.sql', '2026-04-14 20:21:19.768155', 8, 'EXECUTED', '8:b9bb54d81ed5c89c816ef08f038d39e3', 'sql', '', NULL, '4.3.2', NULL, NULL, '6219679729');
INSERT INTO public.databasechangelog VALUES ('modificar_id_folio', 'RodrigoRivera', 'scripts/RRM_00008_modificar_id_folio.sql', '2026-04-14 21:08:17.191512', 9, 'EXECUTED', '8:983d133c02caa8a18ec6f6a8eb74d012', 'sql', '', NULL, '4.3.2', NULL, NULL, '6222497106');
INSERT INTO public.databasechangelog VALUES ('creación', 'JuanRivera', 'scripts/JJRM_00009_creacion_alteracion_tablas.sql', '2026-04-15 20:40:01.286399', 10, 'EXECUTED', '8:4ddd26ae6ee960b7ee98edaa445ce759', 'sql', '', NULL, '4.3.2', NULL, NULL, '6307201130');
INSERT INTO public.databasechangelog VALUES ('creación', 'RodrigoRivera', 'scripts/RRM_00010_agregar_acuse.sql', '2026-04-15 21:04:55.577183', 11, 'EXECUTED', '8:820243a8472be20f33f7d5a6804b08e5', 'sql', '', NULL, '4.3.2', NULL, NULL, '6308695520');
INSERT INTO public.databasechangelog VALUES ('correccion_relaciones_memo_usuarios', 'JuanRivera', 'scripts/JJRM_00011_correccion_relaciones_memo_usuarios.sql', '2026-04-22 18:35:44.403127', 12, 'EXECUTED', '8:ae4d785f93cd33c5bd59f13f6397b7aa', 'sql', '', NULL, '4.3.2', NULL, NULL, '6904544305');
INSERT INTO public.databasechangelog VALUES ('adición', 'AlanRivera', 'scripts/ADRC_00014_alter_table_correspondencia_area.sql', '2026-04-22 18:54:54.42318', 15, 'EXECUTED', '8:1180c231f5e68b956492a4fbfd245da9', 'sql', '', NULL, '4.3.2', NULL, NULL, '6905694386');
INSERT INTO public.databasechangelog VALUES ('agregar_fks_oficio_v1', 'Erick Rivera', 'scripts/EDRM_000029_alter_table_llaves_foraneas.sql', '2026-05-06 11:24:44.420086', 23, 'EXECUTED', NULL, 'sql', 'Agregando llaves foraneas a la tabla oficio con validacion de existencia', NULL, '4.3.2', NULL, NULL, '8088284349');
INSERT INTO public.databasechangelog VALUES ('agregar_fks_acuse_oficio_v1', 'Erick Rivera', 'scripts/EDRM_000030_alter_table_acuse_oficio_llaves_foraneas.sql', '2026-05-06 11:24:44.461487', 24, 'EXECUTED', NULL, 'sql', 'Agregando llaves foraneas a la tabla acuse_oficio con validacion', NULL, '4.3.2', NULL, NULL, '8088284349');
INSERT INTO public.databasechangelog VALUES ('agregar_fks_seguimiento_oficio_v1', 'Erick Rivera', 'scripts/EDRM_000031_alter_table_seguimiento_oficio.sql', '2026-05-06 11:24:44.465741', 25, 'EXECUTED', NULL, 'sql', 'Agregando llaves foraneas a seguimiento_oficio con validacion', NULL, '4.3.2', NULL, NULL, '8088284349');
INSERT INTO public.databasechangelog VALUES ('agregar_fks_acuse_oficio_v2', 'Erick Rivera', 'scripts/EDRM_000030_alter_table_acuse_oficio_llaves_foraneas.sql', '2026-05-06 14:33:37.813831', 26, 'EXECUTED', NULL, 'sql', 'Agregando llaves foraneas a la tabla acuse_oficio de forma segura', NULL, '4.3.2', NULL, NULL, '8099617717');
INSERT INTO public.databasechangelog VALUES ('agregar_fks_oficio_v2', 'Erick Rivera', 'scripts/EDRM_000029_alter_table_llaves_foraneas.sql', '2026-05-06 14:38:22.804743', 27, 'EXECUTED', NULL, 'sql', '', NULL, '4.3.2', NULL, NULL, '8099902747');
INSERT INTO public.databasechangelog VALUES ('agregar_fks_seguimiento_v2', 'Erick Rivera', 'scripts/EDRM_000031_alter_table_seguimiento_oficio.sql', '2026-05-06 14:38:22.838987', 28, 'EXECUTED', NULL, 'sql', '', NULL, '4.3.2', NULL, NULL, '8099902747');
INSERT INTO public.databasechangelog VALUES ('añadir_tabla_seguimiento_memorandum', 'AnaRivera', 'scripts/ARRM_00012_tabla_seguimiento_memorandum.sql', '2026-04-22 18:35:44.476928', 13, 'EXECUTED', '8:98ddcced4e7da85bf31ed6e6df4c7a6f', 'sql', '', NULL, '4.3.2', NULL, NULL, '6904544305');
INSERT INTO public.databasechangelog VALUES ('añadir_tabla_seguimiento_correspondencia', 'AnaRivera', 'scripts/ARRM_00013_tabla_seguimiento_correspondencia.sql', '2026-04-22 18:42:51.239481', 14, 'EXECUTED', '8:43e62c5eaabf3dc1939929c23e18f757', 'sql', '', NULL, '4.3.2', NULL, NULL, '6904971190');
INSERT INTO public.databasechangelog VALUES ('creación', 'RodrigoRivera', 'scripts/RRM_00015_acuse_correspondencia.sql', '2026-04-27 20:07:12.946486', 16, 'EXECUTED', '8:f56b3c01f06cf9d20bba93f24aea4baf', 'sql', '', NULL, '4.3.2', NULL, NULL, '7342032836');
INSERT INTO public.databasechangelog VALUES ('creacion_tablas_modulo2_atencion_juridica', 'ErickRivera', 'scripts/EDRM_000016_creacion_tablas_modulo2_atencion_juridica.sql', '2026-04-29 11:34:11.832283', 17, 'EXECUTED', '8:852914b12352fad4994952c82b0a24a1', 'sql', '', NULL, '4.3.2', NULL, NULL, '7484051700');
INSERT INTO public.databasechangelog VALUES ('creacion_esquemas', 'ErickRivera', 'scripts/EDRM_000017_creacion_esquemas.sql', '2026-04-29 11:37:21.187475', 18, 'EXECUTED', '8:19cbf0acec331b04a36e46a477f3a23d', 'sql', '', NULL, '4.3.2', NULL, NULL, '7484241141');
INSERT INTO public.databasechangelog VALUES ('refactorizacion_tablas_esquema_catalogos_vFinal', 'ErickRivera', 'scripts/EDRM_000018_agregar_tablas_esquema_catalogos.sql', '2026-04-29 11:58:52.051198', 19, 'EXECUTED', '8:bcaa77a1a28c1c1142e853b34a5ebdb5', 'sql', '', NULL, '4.3.2', NULL, NULL, '7485531937');
INSERT INTO public.databasechangelog VALUES ('refactorizacion_tablas_esquema_correspondencia_vFinal', 'ErickRivera', 'scripts/EDRM_000019_agregar_tablas_esquema_correspondencia.sql', '2026-04-29 12:00:46.201967', 20, 'EXECUTED', '8:7cd80c88ae0d84cf4da1b541b04f31cc', 'sql', '', NULL, '4.3.2', NULL, NULL, '7485646121');
INSERT INTO public.databasechangelog VALUES ('refactorizacion_tablas_esquema_atencion_juridica_vFinal', 'ErickRivera', 'scripts/EDRM_000020_agregar_tablas_esquema_atencion_juridica.sql', '2026-04-29 12:02:21.101751', 21, 'EXECUTED', '8:fc753a3466a602a0cacedf535c1cc03a', 'sql', '', NULL, '4.3.2', NULL, NULL, '7485741011');
INSERT INTO public.databasechangelog VALUES ('raw', 'includeAll', 'scripts/EDRM_000022_create_table_oficio.sql', '2026-05-05 22:34:28.728887', 22, 'EXECUTED', '8:9c868922b138970bf1d9cf8b2ae87275', 'sql', '', NULL, '4.3.2', NULL, NULL, '8042068665');
INSERT INTO public.databasechangelog VALUES ('crear_tabla_acuse_vFINAL', 'Erick Rivera', 'scripts/EDRM_000024_create_table_acuse_oficio.sql', '2026-05-06 15:25:57.71392', 29, 'EXECUTED', '8:bc51c03b7e22cf44ee89e69d6d9d5cc5', 'sql', '', NULL, '4.3.2', NULL, NULL, '8102757670');
INSERT INTO public.databasechangelog VALUES ('agregar_fks_oficio_vFINAL', 'Erick Rivera', 'scripts/EDRM_000029_alter_table_llaves_foraneas.sql', '2026-05-06 15:25:57.765713', 30, 'EXECUTED', '8:08ee9bde80bc750c1039811799844233', 'sql', '', NULL, '4.3.2', NULL, NULL, '8102757670');
INSERT INTO public.databasechangelog VALUES ('agregar_fks_acuse_vFINAL', 'Erick Rivera', 'scripts/EDRM_000030_alter_table_acuse_oficio_llaves_foraneas.sql', '2026-05-06 15:25:57.775114', 31, 'EXECUTED', '8:90029265a9f1ad59994a435d8d573d42', 'sql', 'Agregando llaves foraneas a la tabla acuse_oficio de forma segura', NULL, '4.3.2', NULL, NULL, '8102757670');
INSERT INTO public.databasechangelog VALUES ('agregar_fks_seguimiento_vFINAL', 'Erick Rivera', 'scripts/EDRM_000031_alter_table_seguimiento_oficio.sql', '2026-05-06 15:25:57.785406', 32, 'EXECUTED', '8:6541dff35ca35be8c558a027934214d9', 'sql', '', NULL, '4.3.2', NULL, NULL, '8102757670');
INSERT INTO public.databasechangelog VALUES ('renombrado_forzado_v2', 'JoseJuanRiveraMerino', 'scripts/JJRM_000021_renombrado_tabla_acuse_memorandum.sql', '2026-05-11 19:52:29.530967', 33, 'MARK_RAN', '8:32a7ff9d0bc4da3047dfe686b9f77a39', 'sql', '', NULL, '4.3.2', NULL, NULL, '8550749481');
INSERT INTO public.databasechangelog VALUES ('creacion_seguimiento_oficio_v2', 'Erick Rivera', 'scripts/EDRM_000023_create_table_seguimiento_oficio.sql', '2026-05-11 19:52:29.576106', 34, 'EXECUTED', '8:07a0648ca752bf25e0de7bcaed07d858', 'sql', 'Creacion de tabla seguimiento_oficio con proteccion de existencia', NULL, '4.3.2', NULL, NULL, '8550749481');
INSERT INTO public.databasechangelog VALUES ('crear_tabla_tipo_correspondencia_vFINAL1', 'ErickRivera', 'scripts/EDRM_000025_create_table_tipo_correspondencia.sql', '2026-05-11 19:53:59.562899', 35, 'EXECUTED', '8:9d98a906bab21ad5478108d22da0a44a', 'sql', '', NULL, '4.3.2', NULL, NULL, '8550839516');
INSERT INTO public.databasechangelog VALUES ('modificar_tabla_correspondencia_VFinal', 'ErickRivera', 'scripts/EDRM_000026_alter_table_correspondencia.sql', '2026-05-11 19:56:16.923969', 36, 'MARK_RAN', '8:e732e80dd728fa562c734aa70e888fc9', 'sql', '', NULL, '4.3.2', NULL, NULL, '8550976865');
INSERT INTO public.databasechangelog VALUES ('fk_correspondencia_tipo_vfinal', 'ErickRivera', 'scripts/EDRM_000027_alter_table_correspondencia_llave_foranea.sql', '2026-05-11 19:57:39.350536', 37, 'MARK_RAN', '8:f9fb0fbc863290bac686058a2d2a6176', 'sql', '', NULL, '4.3.2', NULL, NULL, '8551059291');
INSERT INTO public.databasechangelog VALUES ('insertar_datos_tipo_correspondencia_vfinal', 'ErickRivera', 'scripts/EDRM_000028_insert_table_tipo_correspondencia.sql', '2026-05-11 19:59:03.429092', 38, 'EXECUTED', '8:4c6ac89ef33ad232dd27c46495d8c549', 'sql', '', NULL, '4.3.2', NULL, NULL, '8551143373');
INSERT INTO public.databasechangelog VALUES ('agregar_fks_oficio', 'Erick Rivera', 'scripts/EDRM_000029_alter_table_llaves_foraneas.sql', '2026-05-11 19:59:03.487814', 39, 'EXECUTED', '8:08ee9bde80bc750c1039811799844233', 'sql', '', NULL, '4.3.2', NULL, NULL, '8551143373');
INSERT INTO public.databasechangelog VALUES ('crear_tabla_contestacion_oficio_externo_vFINAL', 'Erick Rivera', 'scripts/EDRM_000032_create_table_oficio_contestacion_externa.sql', '2026-05-11 19:59:03.495548', 40, 'EXECUTED', '8:7160514de564edb50ea03f13ce5c85c6', 'sql', '', NULL, '4.3.2', NULL, NULL, '8551143373');
INSERT INTO public.databasechangelog VALUES ('create_table_oficio_contestacion_externa_v1', 'ErickRivera', 'scripts/EDRM_000033_create_table_oficio_contestacion.sql', '2026-05-11 19:59:03.530306', 41, 'EXECUTED', '8:361a854b90697aa03c39a9656e5079ca', 'sql', '', NULL, '4.3.2', NULL, NULL, '8551143373');
INSERT INTO public.databasechangelog VALUES ('create_table_roles_usuarios_v1', 'ErickRivera', 'scripts/EDRM_000035_create_table_roles_usuarios.sql', '2026-05-12 18:30:53.127445', 42, 'EXECUTED', '8:1770a2b098771d772db03e9765899697', 'sql', '', NULL, '4.3.2', NULL, NULL, '8632253061');
INSERT INTO public.databasechangelog VALUES ('crear_tabla_usuarios_roles_v1', 'ErickRivera', 'scripts/EDRM_000035_create_table_roles_usuarios.sql', '2026-05-12 19:13:30.740423', 43, 'EXECUTED', '8:17206f26e169eb7e347e75bbe196c43a', 'sql', '', NULL, '4.3.2', NULL, NULL, '8634810653');
INSERT INTO public.databasechangelog VALUES ('limpiar_y_extender_v1', 'ErickRivera', 'scripts/EDRM_000035_create_table_roles_usuarios.sql', '2026-05-12 19:13:30.762947', 44, 'EXECUTED', '8:f4077486fe61ad6fda8691e423ef3fef', 'sql', '', NULL, '4.3.2', NULL, NULL, '8634810653');


--
-- TOC entry 5334 (class 0 OID 54068)
-- Dependencies: 218
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);


--
-- TOC entry 5404 (class 0 OID 62802)
-- Dependencies: 288
-- Data for Name: expedientes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5406 (class 0 OID 62824)
-- Dependencies: 290
-- Data for Name: instrucciones_trabajo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5408 (class 0 OID 62839)
-- Dependencies: 292
-- Data for Name: seguimiento_tramite; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5482 (class 0 OID 0)
-- Dependencies: 269
-- Name: asesores_id_asesores_seq; Type: SEQUENCE SET; Schema: atencion_juridica; Owner: -
--

SELECT pg_catalog.setval('atencion_juridica.asesores_id_asesores_seq', 1, false);


--
-- TOC entry 5483 (class 0 OID 0)
-- Dependencies: 270
-- Name: asesores_orden_asignacion_seq; Type: SEQUENCE SET; Schema: atencion_juridica; Owner: -
--

SELECT pg_catalog.setval('atencion_juridica.asesores_orden_asignacion_seq', 1, false);


--
-- TOC entry 5484 (class 0 OID 0)
-- Dependencies: 265
-- Name: auditoria_log_id_auditoria_log_seq; Type: SEQUENCE SET; Schema: atencion_juridica; Owner: -
--

SELECT pg_catalog.setval('atencion_juridica.auditoria_log_id_auditoria_log_seq', 1, false);


--
-- TOC entry 5485 (class 0 OID 0)
-- Dependencies: 267
-- Name: cat_tipos_tramite_id_cat_tipos_tramite_seq; Type: SEQUENCE SET; Schema: atencion_juridica; Owner: -
--

SELECT pg_catalog.setval('atencion_juridica.cat_tipos_tramite_id_cat_tipos_tramite_seq', 1, false);


--
-- TOC entry 5486 (class 0 OID 0)
-- Dependencies: 274
-- Name: expedientes_id_expedientes_seq; Type: SEQUENCE SET; Schema: atencion_juridica; Owner: -
--

SELECT pg_catalog.setval('atencion_juridica.expedientes_id_expedientes_seq', 1, false);


--
-- TOC entry 5487 (class 0 OID 0)
-- Dependencies: 276
-- Name: instrucciones_trabajo_id_instrucciones_trabajo_seq; Type: SEQUENCE SET; Schema: atencion_juridica; Owner: -
--

SELECT pg_catalog.setval('atencion_juridica.instrucciones_trabajo_id_instrucciones_trabajo_seq', 1, false);


--
-- TOC entry 5488 (class 0 OID 0)
-- Dependencies: 278
-- Name: seguimiento_tramite_id_seguimiento_tramite_seq; Type: SEQUENCE SET; Schema: atencion_juridica; Owner: -
--

SELECT pg_catalog.setval('atencion_juridica.seguimiento_tramite_id_seguimiento_tramite_seq', 1, false);


--
-- TOC entry 5489 (class 0 OID 0)
-- Dependencies: 225
-- Name: areas_id_area_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.areas_id_area_seq', 3, true);


--
-- TOC entry 5490 (class 0 OID 0)
-- Dependencies: 229
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.cat_estados_id_estado_seq', 32, true);


--
-- TOC entry 5491 (class 0 OID 0)
-- Dependencies: 231
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.cat_estatus_id_estatus_seq', 1, false);


--
-- TOC entry 5492 (class 0 OID 0)
-- Dependencies: 233
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.cat_municipios_id_municipio_seq', 58, true);


--
-- TOC entry 5493 (class 0 OID 0)
-- Dependencies: 272
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.control_folios_config_id_control_folios_config_seq', 1, false);


--
-- TOC entry 5494 (class 0 OID 0)
-- Dependencies: 241
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.direcciones_id_direccion_seq', 1, true);


--
-- TOC entry 5495 (class 0 OID 0)
-- Dependencies: 254
-- Name: empleados_id_empleado_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.empleados_id_empleado_seq', 1, false);


--
-- TOC entry 5496 (class 0 OID 0)
-- Dependencies: 247
-- Name: personas_id_persona_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.personas_id_persona_seq', 8, true);


--
-- TOC entry 5497 (class 0 OID 0)
-- Dependencies: 249
-- Name: roles_id_rol_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.roles_id_rol_seq', 6, true);


--
-- TOC entry 5498 (class 0 OID 0)
-- Dependencies: 302
-- Name: tipo_correspondencia_id_tipo_correspondencia_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.tipo_correspondencia_id_tipo_correspondencia_seq', 6, true);


--
-- TOC entry 5499 (class 0 OID 0)
-- Dependencies: 251
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.usuarios_id_usuario_seq', 13, true);


--
-- TOC entry 5500 (class 0 OID 0)
-- Dependencies: 308
-- Name: usuarios_roles_id_usuario_rol_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.usuarios_roles_id_usuario_rol_seq', 3, true);


--
-- TOC entry 5501 (class 0 OID 0)
-- Dependencies: 263
-- Name: acuse_correspondencia_id_acuse_correspondencia_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq', 1, false);


--
-- TOC entry 5502 (class 0 OID 0)
-- Dependencies: 297
-- Name: acuse_oficio_id_acuse_oficio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.acuse_oficio_id_acuse_oficio_seq', 1, false);


--
-- TOC entry 5503 (class 0 OID 0)
-- Dependencies: 256
-- Name: acuserecibointerno_id_acuse_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.acuserecibointerno_id_acuse_seq', 4, true);


--
-- TOC entry 5504 (class 0 OID 0)
-- Dependencies: 221
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.alertas_seguimiento_id_alerta_seq', 1, false);


--
-- TOC entry 5505 (class 0 OID 0)
-- Dependencies: 223
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.archivos_adjuntos_id_archivo_seq', 1, false);


--
-- TOC entry 5506 (class 0 OID 0)
-- Dependencies: 227
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.auditoria_correspondencia_id_log_seq', 1, false);


--
-- TOC entry 5507 (class 0 OID 0)
-- Dependencies: 235
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.correspondencia_id_folio_seq', 6, true);


--
-- TOC entry 5508 (class 0 OID 0)
-- Dependencies: 237
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.correspondencia_respuestas_id_respuesta_seq', 2, true);


--
-- TOC entry 5509 (class 0 OID 0)
-- Dependencies: 239
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.correspondencia_turnos_id_turno_seq', 1, false);


--
-- TOC entry 5510 (class 0 OID 0)
-- Dependencies: 243
-- Name: memorandums_id_memo_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.memorandums_id_memo_seq', 3, true);


--
-- TOC entry 5511 (class 0 OID 0)
-- Dependencies: 245
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.notificaciones_id_notificacion_seq', 1, false);


--
-- TOC entry 5512 (class 0 OID 0)
-- Dependencies: 304
-- Name: oficio_contestacion_externa_id_oficio_contestacion_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq', 1, false);


--
-- TOC entry 5513 (class 0 OID 0)
-- Dependencies: 306
-- Name: oficio_contestacion_id_contestacion_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.oficio_contestacion_id_contestacion_seq', 1, false);


--
-- TOC entry 5514 (class 0 OID 0)
-- Dependencies: 295
-- Name: oficio_id_oficio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.oficio_id_oficio_seq', 1, false);


--
-- TOC entry 5515 (class 0 OID 0)
-- Dependencies: 252
-- Name: plantilla_memorandum_id_plantilla_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.plantilla_memorandum_id_plantilla_seq', 2, true);


--
-- TOC entry 5516 (class 0 OID 0)
-- Dependencies: 261
-- Name: seguimiento_correspondencia_id_seguimiento_correspondencia_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq', 1, false);


--
-- TOC entry 5517 (class 0 OID 0)
-- Dependencies: 259
-- Name: seguimiento_memorandum_folio_respuesta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.seguimiento_memorandum_folio_respuesta_seq', 6, true);


--
-- TOC entry 5518 (class 0 OID 0)
-- Dependencies: 258
-- Name: seguimiento_memorandum_id_seguimiento_memorandum_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq', 6, true);


--
-- TOC entry 5519 (class 0 OID 0)
-- Dependencies: 300
-- Name: seguimiento_oficio_folio_respuesta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.seguimiento_oficio_folio_respuesta_seq', 1, false);


--
-- TOC entry 5520 (class 0 OID 0)
-- Dependencies: 299
-- Name: seguimiento_oficio_id_seguimiento_oficio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq', 1, false);


--
-- TOC entry 5521 (class 0 OID 0)
-- Dependencies: 282
-- Name: asesores_id_asesores_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.asesores_id_asesores_seq', 1, false);


--
-- TOC entry 5522 (class 0 OID 0)
-- Dependencies: 283
-- Name: asesores_orden_asignacion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.asesores_orden_asignacion_seq', 1, false);


--
-- TOC entry 5523 (class 0 OID 0)
-- Dependencies: 293
-- Name: auditoria_log_id_auditoria_log_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auditoria_log_id_auditoria_log_seq', 1, false);


--
-- TOC entry 5524 (class 0 OID 0)
-- Dependencies: 280
-- Name: cat_tipos_tramite_id_cat_tipos_tramite_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cat_tipos_tramite_id_cat_tipos_tramite_seq', 1, false);


--
-- TOC entry 5525 (class 0 OID 0)
-- Dependencies: 285
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.control_folios_config_id_control_folios_config_seq', 1, false);


--
-- TOC entry 5526 (class 0 OID 0)
-- Dependencies: 287
-- Name: expedientes_id_expedientes_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.expedientes_id_expedientes_seq', 1, false);


--
-- TOC entry 5527 (class 0 OID 0)
-- Dependencies: 289
-- Name: instrucciones_trabajo_id_instrucciones_trabajo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.instrucciones_trabajo_id_instrucciones_trabajo_seq', 1, false);


--
-- TOC entry 5528 (class 0 OID 0)
-- Dependencies: 291
-- Name: seguimiento_tramite_id_seguimiento_tramite_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.seguimiento_tramite_id_seguimiento_tramite_seq', 1, false);


--
-- TOC entry 5067 (class 2606 OID 62697)
-- Name: asesores asesores_id_usuario_fk_key; Type: CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.asesores
    ADD CONSTRAINT asesores_id_usuario_fk_key UNIQUE (id_usuario_fk);


--
-- TOC entry 5069 (class 2606 OID 62695)
-- Name: asesores asesores_pkey; Type: CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.asesores
    ADD CONSTRAINT asesores_pkey PRIMARY KEY (id_asesores);


--
-- TOC entry 5063 (class 2606 OID 62666)
-- Name: auditoria_log auditoria_log_pkey; Type: CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.auditoria_log
    ADD CONSTRAINT auditoria_log_pkey PRIMARY KEY (id_auditoria_log);


--
-- TOC entry 5065 (class 2606 OID 62685)
-- Name: cat_tipos_tramite cat_tipos_tramite_pkey; Type: CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.cat_tipos_tramite
    ADD CONSTRAINT cat_tipos_tramite_pkey PRIMARY KEY (id_cat_tipos_tramite);


--
-- TOC entry 5075 (class 2606 OID 62719)
-- Name: expedientes expedientes_folio_unico_key; Type: CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.expedientes
    ADD CONSTRAINT expedientes_folio_unico_key UNIQUE (folio_unico);


--
-- TOC entry 5077 (class 2606 OID 62717)
-- Name: expedientes expedientes_pkey; Type: CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.expedientes
    ADD CONSTRAINT expedientes_pkey PRIMARY KEY (id_expedientes);


--
-- TOC entry 5079 (class 2606 OID 62739)
-- Name: instrucciones_trabajo instrucciones_trabajo_pkey; Type: CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.instrucciones_trabajo
    ADD CONSTRAINT instrucciones_trabajo_pkey PRIMARY KEY (id_instrucciones_trabajo);


--
-- TOC entry 5081 (class 2606 OID 62754)
-- Name: seguimiento_tramite seguimiento_tramite_pkey; Type: CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.seguimiento_tramite
    ADD CONSTRAINT seguimiento_tramite_pkey PRIMARY KEY (id_seguimiento_tramite);


--
-- TOC entry 5005 (class 2606 OID 54188)
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id_area);


--
-- TOC entry 5009 (class 2606 OID 54192)
-- Name: cat_estados cat_estados_nombre_estado_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estados
    ADD CONSTRAINT cat_estados_nombre_estado_key UNIQUE (nombre_estado);


--
-- TOC entry 5011 (class 2606 OID 54194)
-- Name: cat_estados cat_estados_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estados
    ADD CONSTRAINT cat_estados_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 5013 (class 2606 OID 54196)
-- Name: cat_estatus cat_estatus_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estatus
    ADD CONSTRAINT cat_estatus_pkey PRIMARY KEY (id_estatus);


--
-- TOC entry 5015 (class 2606 OID 54198)
-- Name: cat_municipios cat_municipios_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_municipios
    ADD CONSTRAINT cat_municipios_pkey PRIMARY KEY (id_municipio);


--
-- TOC entry 5071 (class 2606 OID 62707)
-- Name: control_folios_config control_folios_config_anio_mes_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.control_folios_config
    ADD CONSTRAINT control_folios_config_anio_mes_key UNIQUE (anio, mes);


--
-- TOC entry 5073 (class 2606 OID 62705)
-- Name: control_folios_config control_folios_config_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.control_folios_config
    ADD CONSTRAINT control_folios_config_pkey PRIMARY KEY (id_control_folios_config);


--
-- TOC entry 5025 (class 2606 OID 54208)
-- Name: direcciones direcciones_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.direcciones
    ADD CONSTRAINT direcciones_pkey PRIMARY KEY (id_direccion);


--
-- TOC entry 5049 (class 2606 OID 54404)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 5035 (class 2606 OID 54216)
-- Name: personas personas_curp_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT personas_curp_key UNIQUE (curp);


--
-- TOC entry 5037 (class 2606 OID 54218)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id_persona);


--
-- TOC entry 5039 (class 2606 OID 54220)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 5109 (class 2606 OID 62922)
-- Name: tipo_correspondencia tipo_correspondencia_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_correspondencia
    ADD CONSTRAINT tipo_correspondencia_pkey PRIMARY KEY (id_tipo_correspondencia);


--
-- TOC entry 5111 (class 2606 OID 62924)
-- Name: tipo_correspondencia uq_tipo_correspondencia_descripcion; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_correspondencia
    ADD CONSTRAINT uq_tipo_correspondencia_descripcion UNIQUE (descripcion);


--
-- TOC entry 5119 (class 2606 OID 79374)
-- Name: usuarios_roles uq_usuario_rol; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT uq_usuario_rol UNIQUE (id_usuario, id_rol);


--
-- TOC entry 5041 (class 2606 OID 54222)
-- Name: usuarios usuarios_correo_electronico_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_correo_electronico_key UNIQUE (correo_electronico);


--
-- TOC entry 5043 (class 2606 OID 54224)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 5121 (class 2606 OID 79372)
-- Name: usuarios_roles usuarios_roles_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (id_usuario_rol);


--
-- TOC entry 5045 (class 2606 OID 54226)
-- Name: usuarios usuarios_usuario_login_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_usuario_login_key UNIQUE (usuario_login);


--
-- TOC entry 5059 (class 2606 OID 62644)
-- Name: acuse_correspondencia acuse_correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT acuse_correspondencia_pkey PRIMARY KEY (id_acuse_correspondencia);


--
-- TOC entry 5105 (class 2606 OID 62884)
-- Name: acuse_oficio acuse_oficio_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_oficio
    ADD CONSTRAINT acuse_oficio_pkey PRIMARY KEY (id_acuse_oficio);


--
-- TOC entry 5051 (class 2606 OID 54433)
-- Name: acuse_memorandum acuserecibointerno_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT acuserecibointerno_pkey PRIMARY KEY (id_acuse);


--
-- TOC entry 5001 (class 2606 OID 54184)
-- Name: alertas_seguimiento alertas_seguimiento_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_pkey PRIMARY KEY (id_alerta);


--
-- TOC entry 5003 (class 2606 OID 54186)
-- Name: archivos_adjuntos archivos_adjuntos_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_pkey PRIMARY KEY (id_archivo);


--
-- TOC entry 5007 (class 2606 OID 54190)
-- Name: auditoria_correspondencia auditoria_correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_pkey PRIMARY KEY (id_log);


--
-- TOC entry 5017 (class 2606 OID 54200)
-- Name: correspondencia correspondencia_folio_unico_key; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_folio_unico_key UNIQUE (folio_unico);


--
-- TOC entry 5019 (class 2606 OID 54202)
-- Name: correspondencia correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_pkey PRIMARY KEY (id_correspondencia);


--
-- TOC entry 5021 (class 2606 OID 54204)
-- Name: correspondencia_respuestas correspondencia_respuestas_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_pkey PRIMARY KEY (id_respuesta);


--
-- TOC entry 5023 (class 2606 OID 54206)
-- Name: correspondencia_turnos correspondencia_turnos_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_pkey PRIMARY KEY (id_turno);


--
-- TOC entry 5027 (class 2606 OID 54411)
-- Name: memorandums memorandums_folio_unico_key; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_folio_unico_key UNIQUE (folio_unico);


--
-- TOC entry 5029 (class 2606 OID 54210)
-- Name: memorandums memorandums_num_memo_key; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_num_memo_key UNIQUE (num_memo);


--
-- TOC entry 5031 (class 2606 OID 54212)
-- Name: memorandums memorandums_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_pkey PRIMARY KEY (id_memo);


--
-- TOC entry 5033 (class 2606 OID 54214)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);


--
-- TOC entry 5115 (class 2606 OID 79349)
-- Name: oficio_contestacion oficio_contestacion_num_oficio_contestacion_key; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT oficio_contestacion_num_oficio_contestacion_key UNIQUE (num_oficio_contestacion);


--
-- TOC entry 5117 (class 2606 OID 79347)
-- Name: oficio_contestacion oficio_contestacion_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT oficio_contestacion_pkey PRIMARY KEY (id_contestacion);


--
-- TOC entry 5103 (class 2606 OID 62877)
-- Name: oficio oficio_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT oficio_pkey PRIMARY KEY (id_oficio);


--
-- TOC entry 5113 (class 2606 OID 63137)
-- Name: oficio_contestacion_externa pk_oficio_contestacion; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa
    ADD CONSTRAINT pk_oficio_contestacion PRIMARY KEY (id_oficio_contestacion);


--
-- TOC entry 5047 (class 2606 OID 54397)
-- Name: plantilla_memorandum plantilla_memorandum_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.plantilla_memorandum
    ADD CONSTRAINT plantilla_memorandum_pkey PRIMARY KEY (id_plantilla);


--
-- TOC entry 5057 (class 2606 OID 54512)
-- Name: seguimiento_correspondencia seguimiento_correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT seguimiento_correspondencia_pkey PRIMARY KEY (id_seguimiento_correspondencia);


--
-- TOC entry 5055 (class 2606 OID 54467)
-- Name: seguimiento_memorandum seguimiento_memorandum_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT seguimiento_memorandum_pkey PRIMARY KEY (id_seguimiento_memorandum);


--
-- TOC entry 5107 (class 2606 OID 62895)
-- Name: seguimiento_oficio seguimiento_oficio_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT seguimiento_oficio_pkey PRIMARY KEY (id_seguimiento_oficio);


--
-- TOC entry 5053 (class 2606 OID 54435)
-- Name: acuse_memorandum uq_acuse; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT uq_acuse UNIQUE (id_memorandum, id_usuario_revisor);


--
-- TOC entry 5061 (class 2606 OID 62646)
-- Name: acuse_correspondencia uq_acuse_correspondencia; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT uq_acuse_correspondencia UNIQUE (id_correspondencia, id_usuario_revisor);


--
-- TOC entry 5085 (class 2606 OID 62790)
-- Name: asesores asesores_id_usuario_fk_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asesores
    ADD CONSTRAINT asesores_id_usuario_fk_key UNIQUE (id_usuario_fk);


--
-- TOC entry 5087 (class 2606 OID 62788)
-- Name: asesores asesores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asesores
    ADD CONSTRAINT asesores_pkey PRIMARY KEY (id_asesores);


--
-- TOC entry 5101 (class 2606 OID 62867)
-- Name: auditoria_log auditoria_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_log
    ADD CONSTRAINT auditoria_log_pkey PRIMARY KEY (id_auditoria_log);


--
-- TOC entry 5083 (class 2606 OID 62778)
-- Name: cat_tipos_tramite cat_tipos_tramite_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat_tipos_tramite
    ADD CONSTRAINT cat_tipos_tramite_pkey PRIMARY KEY (id_cat_tipos_tramite);


--
-- TOC entry 5089 (class 2606 OID 62800)
-- Name: control_folios_config control_folios_config_anio_mes_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.control_folios_config
    ADD CONSTRAINT control_folios_config_anio_mes_key UNIQUE (anio, mes);


--
-- TOC entry 5091 (class 2606 OID 62798)
-- Name: control_folios_config control_folios_config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.control_folios_config
    ADD CONSTRAINT control_folios_config_pkey PRIMARY KEY (id_control_folios_config);


--
-- TOC entry 4999 (class 2606 OID 54072)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 5093 (class 2606 OID 62812)
-- Name: expedientes expedientes_folio_unico_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expedientes
    ADD CONSTRAINT expedientes_folio_unico_key UNIQUE (folio_unico);


--
-- TOC entry 5095 (class 2606 OID 62810)
-- Name: expedientes expedientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expedientes
    ADD CONSTRAINT expedientes_pkey PRIMARY KEY (id_expedientes);


--
-- TOC entry 5097 (class 2606 OID 62832)
-- Name: instrucciones_trabajo instrucciones_trabajo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrucciones_trabajo
    ADD CONSTRAINT instrucciones_trabajo_pkey PRIMARY KEY (id_instrucciones_trabajo);


--
-- TOC entry 5099 (class 2606 OID 62847)
-- Name: seguimiento_tramite seguimiento_tramite_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seguimiento_tramite
    ADD CONSTRAINT seguimiento_tramite_pkey PRIMARY KEY (id_seguimiento_tramite);


--
-- TOC entry 5165 (class 2606 OID 62725)
-- Name: expedientes fk_expediente_asesor; Type: FK CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.expedientes
    ADD CONSTRAINT fk_expediente_asesor FOREIGN KEY (id_asesores_fk) REFERENCES atencion_juridica.asesores(id_asesores);


--
-- TOC entry 5166 (class 2606 OID 62720)
-- Name: expedientes fk_expediente_tipo_tramite; Type: FK CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.expedientes
    ADD CONSTRAINT fk_expediente_tipo_tramite FOREIGN KEY (id_cat_tipos_tramite_fk) REFERENCES atencion_juridica.cat_tipos_tramite(id_cat_tipos_tramite);


--
-- TOC entry 5167 (class 2606 OID 62740)
-- Name: instrucciones_trabajo fk_instruccion_expediente; Type: FK CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.instrucciones_trabajo
    ADD CONSTRAINT fk_instruccion_expediente FOREIGN KEY (id_expedientes_fk) REFERENCES atencion_juridica.expedientes(id_expedientes);


--
-- TOC entry 5168 (class 2606 OID 62760)
-- Name: seguimiento_tramite fk_seguimiento_asesor; Type: FK CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.seguimiento_tramite
    ADD CONSTRAINT fk_seguimiento_asesor FOREIGN KEY (id_asesores_fk) REFERENCES atencion_juridica.asesores(id_asesores);


--
-- TOC entry 5169 (class 2606 OID 62755)
-- Name: seguimiento_tramite fk_seguimiento_expediente; Type: FK CONSTRAINT; Schema: atencion_juridica; Owner: -
--

ALTER TABLE ONLY atencion_juridica.seguimiento_tramite
    ADD CONSTRAINT fk_seguimiento_expediente FOREIGN KEY (id_expedientes_fk) REFERENCES atencion_juridica.expedientes(id_expedientes);


--
-- TOC entry 5130 (class 2606 OID 54267)
-- Name: cat_municipios cat_municipios_id_estado_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_municipios
    ADD CONSTRAINT cat_municipios_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES catalogos.cat_estados(id_estado);


--
-- TOC entry 5142 (class 2606 OID 54317)
-- Name: direcciones direcciones_id_estado_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.direcciones
    ADD CONSTRAINT direcciones_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES catalogos.cat_estados(id_estado);


--
-- TOC entry 5143 (class 2606 OID 54322)
-- Name: direcciones direcciones_id_municipio_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.direcciones
    ADD CONSTRAINT direcciones_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES catalogos.cat_municipios(id_municipio);


--
-- TOC entry 5154 (class 2606 OID 54405)
-- Name: empleados fk_empleado_area; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.empleados
    ADD CONSTRAINT fk_empleado_area FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5189 (class 2606 OID 79380)
-- Name: usuarios_roles fk_rol; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT fk_rol FOREIGN KEY (id_rol) REFERENCES catalogos.roles(id_rol) ON DELETE CASCADE;


--
-- TOC entry 5190 (class 2606 OID 79375)
-- Name: usuarios_roles fk_usuario; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 5151 (class 2606 OID 54342)
-- Name: personas personas_id_direccion_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT personas_id_direccion_fkey FOREIGN KEY (id_direccion) REFERENCES catalogos.direcciones(id_direccion);


--
-- TOC entry 5152 (class 2606 OID 54347)
-- Name: usuarios usuarios_id_area_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_id_area_fkey FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5153 (class 2606 OID 54352)
-- Name: usuarios usuarios_id_persona_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5122 (class 2606 OID 54227)
-- Name: alertas_seguimiento alertas_seguimiento_id_turno_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES correspondencia.correspondencia_turnos(id_turno);


--
-- TOC entry 5123 (class 2606 OID 54232)
-- Name: alertas_seguimiento alertas_seguimiento_id_usuario_emisor_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_id_usuario_emisor_fkey FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5124 (class 2606 OID 54242)
-- Name: archivos_adjuntos archivos_adjuntos_id_usuario_subio_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_id_usuario_subio_fkey FOREIGN KEY (id_usuario_subio) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5126 (class 2606 OID 54247)
-- Name: auditoria_correspondencia auditoria_correspondencia_estado_anterior_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_estado_anterior_fkey FOREIGN KEY (estado_anterior) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5127 (class 2606 OID 54252)
-- Name: auditoria_correspondencia auditoria_correspondencia_estado_nuevo_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_estado_nuevo_fkey FOREIGN KEY (estado_nuevo) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5128 (class 2606 OID 54262)
-- Name: auditoria_correspondencia auditoria_correspondencia_id_usuario_accion_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_id_usuario_accion_fkey FOREIGN KEY (id_usuario_accion) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5131 (class 2606 OID 54272)
-- Name: correspondencia correspondencia_id_estatus_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_id_estatus_fkey FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5132 (class 2606 OID 54277)
-- Name: correspondencia correspondencia_id_usuario_captura_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_id_usuario_captura_fkey FOREIGN KEY (id_usuario_captura) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5135 (class 2606 OID 54282)
-- Name: correspondencia_respuestas correspondencia_respuestas_id_turno_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES correspondencia.correspondencia_turnos(id_turno);


--
-- TOC entry 5136 (class 2606 OID 54287)
-- Name: correspondencia_respuestas correspondencia_respuestas_id_usuario_responde_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_id_usuario_responde_fkey FOREIGN KEY (id_usuario_responde) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5137 (class 2606 OID 54292)
-- Name: correspondencia_turnos correspondencia_turnos_id_area_destino_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_area_destino_fkey FOREIGN KEY (id_area_destino) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5138 (class 2606 OID 54297)
-- Name: correspondencia_turnos correspondencia_turnos_id_estatus_individual_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_estatus_individual_fkey FOREIGN KEY (id_estatus_individual) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5139 (class 2606 OID 54307)
-- Name: correspondencia_turnos correspondencia_turnos_id_memo_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_memo_fkey FOREIGN KEY (id_memo) REFERENCES correspondencia.memorandums(id_memo);


--
-- TOC entry 5140 (class 2606 OID 54312)
-- Name: correspondencia_turnos correspondencia_turnos_id_usuario_responsable_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_usuario_responsable_fkey FOREIGN KEY (id_usuario_responsable) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5163 (class 2606 OID 62647)
-- Name: acuse_correspondencia fk_acuse_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT fk_acuse_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5155 (class 2606 OID 54436)
-- Name: acuse_memorandum fk_acuse_memorandum; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT fk_acuse_memorandum FOREIGN KEY (id_memorandum) REFERENCES correspondencia.memorandums(id_memo);


--
-- TOC entry 5179 (class 2606 OID 63047)
-- Name: acuse_oficio fk_acuse_oficio_rel_oficio; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_oficio
    ADD CONSTRAINT fk_acuse_oficio_rel_oficio FOREIGN KEY (id_oficio) REFERENCES correspondencia.oficio(id_oficio);


--
-- TOC entry 5180 (class 2606 OID 63052)
-- Name: acuse_oficio fk_acuse_oficio_usuario_revisor; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_oficio
    ADD CONSTRAINT fk_acuse_oficio_usuario_revisor FOREIGN KEY (id_usuario_revisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5156 (class 2606 OID 54441)
-- Name: acuse_memorandum fk_acuse_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT fk_acuse_usuario FOREIGN KEY (id_usuario_revisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5164 (class 2606 OID 62652)
-- Name: acuse_correspondencia fk_acuse_usuario_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT fk_acuse_usuario_correspondencia FOREIGN KEY (id_usuario_revisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5125 (class 2606 OID 54382)
-- Name: archivos_adjuntos fk_archivos_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos
    ADD CONSTRAINT fk_archivos_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5129 (class 2606 OID 54377)
-- Name: auditoria_correspondencia fk_auditoria_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT fk_auditoria_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5184 (class 2606 OID 63138)
-- Name: oficio_contestacion_externa fk_contestacion_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa
    ADD CONSTRAINT fk_contestacion_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia) ON DELETE CASCADE;


--
-- TOC entry 5186 (class 2606 OID 79350)
-- Name: oficio_contestacion fk_contestacion_seguimiento_corr; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT fk_contestacion_seguimiento_corr FOREIGN KEY (id_seguimiento_correspondencia) REFERENCES correspondencia.seguimiento_correspondencia(id_seguimiento_correspondencia);


--
-- TOC entry 5187 (class 2606 OID 79360)
-- Name: oficio_contestacion fk_contestacion_seguimiento_memo; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT fk_contestacion_seguimiento_memo FOREIGN KEY (id_seguimiento_memorandum) REFERENCES correspondencia.seguimiento_memorandum(id_seguimiento_memorandum);


--
-- TOC entry 5188 (class 2606 OID 79355)
-- Name: oficio_contestacion fk_contestacion_seguimiento_oficio; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT fk_contestacion_seguimiento_oficio FOREIGN KEY (id_seguimiento_oficio) REFERENCES correspondencia.seguimiento_oficio(id_seguimiento_oficio);


--
-- TOC entry 5185 (class 2606 OID 63143)
-- Name: oficio_contestacion_externa fk_contestacion_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa
    ADD CONSTRAINT fk_contestacion_usuario FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5160 (class 2606 OID 54523)
-- Name: seguimiento_correspondencia fk_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT fk_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5133 (class 2606 OID 54528)
-- Name: correspondencia fk_correspondencia_areas; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT fk_correspondencia_areas FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5134 (class 2606 OID 62925)
-- Name: correspondencia fk_correspondencia_tipo; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT fk_correspondencia_tipo FOREIGN KEY (id_tipo_correspondencia) REFERENCES catalogos.tipo_correspondencia(id_tipo_correspondencia);


--
-- TOC entry 5157 (class 2606 OID 54478)
-- Name: seguimiento_memorandum fk_estatus; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT fk_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5161 (class 2606 OID 54518)
-- Name: seguimiento_correspondencia fk_estatus; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT fk_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5144 (class 2606 OID 54417)
-- Name: memorandums fk_memo_area; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_area FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5145 (class 2606 OID 54451)
-- Name: memorandums fk_memo_emisor; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_emisor FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5146 (class 2606 OID 54446)
-- Name: memorandums fk_memo_firmante; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_firmante FOREIGN KEY (id_usuario_firmante) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5147 (class 2606 OID 54412)
-- Name: memorandums fk_memo_plantilla; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_plantilla FOREIGN KEY (id_plantilla) REFERENCES correspondencia.plantilla_memorandum(id_plantilla);


--
-- TOC entry 5158 (class 2606 OID 54468)
-- Name: seguimiento_memorandum fk_memorandum; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT fk_memorandum FOREIGN KEY (id_memo) REFERENCES correspondencia.memorandums(id_memo);


--
-- TOC entry 5148 (class 2606 OID 54367)
-- Name: memorandums fk_memorandums_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memorandums_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5175 (class 2606 OID 79327)
-- Name: oficio fk_oficio_area; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_area FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5176 (class 2606 OID 79317)
-- Name: oficio fk_oficio_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5177 (class 2606 OID 79322)
-- Name: oficio fk_oficio_usuario_emisor; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_usuario_emisor FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5178 (class 2606 OID 79332)
-- Name: oficio fk_oficio_usuario_firmante; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_usuario_firmante FOREIGN KEY (id_usuario_firmante) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5181 (class 2606 OID 63067)
-- Name: seguimiento_oficio fk_seguimiento_oficio_estatus; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT fk_seguimiento_oficio_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5182 (class 2606 OID 63057)
-- Name: seguimiento_oficio fk_seguimiento_oficio_oficio; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT fk_seguimiento_oficio_oficio FOREIGN KEY (id_oficio) REFERENCES correspondencia.oficio(id_oficio);


--
-- TOC entry 5183 (class 2606 OID 63062)
-- Name: seguimiento_oficio fk_seguimiento_oficio_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT fk_seguimiento_oficio_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5141 (class 2606 OID 54372)
-- Name: correspondencia_turnos fk_turnos_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT fk_turnos_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5159 (class 2606 OID 54473)
-- Name: seguimiento_memorandum fk_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5162 (class 2606 OID 54513)
-- Name: seguimiento_correspondencia fk_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5149 (class 2606 OID 54332)
-- Name: memorandums memorandums_id_usuario_emisor_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_id_usuario_emisor_fkey FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5150 (class 2606 OID 54337)
-- Name: notificaciones notificaciones_id_usuario_destino_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.notificaciones
    ADD CONSTRAINT notificaciones_id_usuario_destino_fkey FOREIGN KEY (id_usuario_destino) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5170 (class 2606 OID 62818)
-- Name: expedientes fk_expediente_asesor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expedientes
    ADD CONSTRAINT fk_expediente_asesor FOREIGN KEY (id_asesores_fk) REFERENCES public.asesores(id_asesores);


--
-- TOC entry 5171 (class 2606 OID 62813)
-- Name: expedientes fk_expediente_tipo_tramite; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expedientes
    ADD CONSTRAINT fk_expediente_tipo_tramite FOREIGN KEY (id_cat_tipos_tramite_fk) REFERENCES public.cat_tipos_tramite(id_cat_tipos_tramite);


--
-- TOC entry 5172 (class 2606 OID 62833)
-- Name: instrucciones_trabajo fk_instruccion_expediente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instrucciones_trabajo
    ADD CONSTRAINT fk_instruccion_expediente FOREIGN KEY (id_expedientes_fk) REFERENCES public.expedientes(id_expedientes);


--
-- TOC entry 5173 (class 2606 OID 62853)
-- Name: seguimiento_tramite fk_seguimiento_asesor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seguimiento_tramite
    ADD CONSTRAINT fk_seguimiento_asesor FOREIGN KEY (id_asesores_fk) REFERENCES public.asesores(id_asesores);


--
-- TOC entry 5174 (class 2606 OID 62848)
-- Name: seguimiento_tramite fk_seguimiento_expediente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seguimiento_tramite
    ADD CONSTRAINT fk_seguimiento_expediente FOREIGN KEY (id_expedientes_fk) REFERENCES public.expedientes(id_expedientes);


-- Completed on 2026-05-13 16:56:41

--
-- PostgreSQL database dump complete
--

