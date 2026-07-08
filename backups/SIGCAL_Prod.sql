--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2026-07-07 22:12:34

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
-- TOC entry 7 (class 2615 OID 119414)
-- Name: catalogos; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA catalogos;


ALTER SCHEMA catalogos OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 119415)
-- Name: correspondencia; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA correspondencia;


ALTER SCHEMA correspondencia OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 119416)
-- Name: sustantiva; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sustantiva;


ALTER SCHEMA sustantiva OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 119417)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 5858 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 119454)
-- Name: areas; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.areas (
    id_area bigint NOT NULL,
    nombre_area character varying(255) NOT NULL,
    descripcion character varying(255)
);


ALTER TABLE catalogos.areas OWNER TO postgres;

--
-- TOC entry 5859 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN areas.descripcion; Type: COMMENT; Schema: catalogos; Owner: postgres
--

COMMENT ON COLUMN catalogos.areas.descripcion IS 'Descripción detallada del área o función principal';


--
-- TOC entry 220 (class 1259 OID 119459)
-- Name: areas_id_area_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.areas_id_area_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.areas_id_area_seq OWNER TO postgres;

--
-- TOC entry 5860 (class 0 OID 0)
-- Dependencies: 220
-- Name: areas_id_area_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.areas_id_area_seq OWNED BY catalogos.areas.id_area;


--
-- TOC entry 221 (class 1259 OID 119460)
-- Name: autoridades; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.autoridades (
    id_autoridad bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE catalogos.autoridades OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 119463)
-- Name: autoridades_id_autoridad_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.autoridades_id_autoridad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.autoridades_id_autoridad_seq OWNER TO postgres;

--
-- TOC entry 5861 (class 0 OID 0)
-- Dependencies: 222
-- Name: autoridades_id_autoridad_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.autoridades_id_autoridad_seq OWNED BY catalogos.autoridades.id_autoridad;


--
-- TOC entry 223 (class 1259 OID 119464)
-- Name: cat_autoridades; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.cat_autoridades (
    id_cat_autoridad bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE catalogos.cat_autoridades OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 119467)
-- Name: cat_autoridades_id_cat_autoridad_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.cat_autoridades_id_cat_autoridad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.cat_autoridades_id_cat_autoridad_seq OWNER TO postgres;

--
-- TOC entry 5862 (class 0 OID 0)
-- Dependencies: 224
-- Name: cat_autoridades_id_cat_autoridad_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.cat_autoridades_id_cat_autoridad_seq OWNED BY catalogos.cat_autoridades.id_cat_autoridad;


--
-- TOC entry 225 (class 1259 OID 119468)
-- Name: cat_estados; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.cat_estados (
    id_estado integer NOT NULL,
    nombre_estado character varying(255) NOT NULL
);


ALTER TABLE catalogos.cat_estados OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 119471)
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.cat_estados_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.cat_estados_id_estado_seq OWNER TO postgres;

--
-- TOC entry 5863 (class 0 OID 0)
-- Dependencies: 226
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.cat_estados_id_estado_seq OWNED BY catalogos.cat_estados.id_estado;


--
-- TOC entry 227 (class 1259 OID 119472)
-- Name: cat_estatus; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.cat_estatus (
    id_estatus integer NOT NULL,
    nombre_estatus character varying(255) NOT NULL,
    descripcion character varying(255)
);


ALTER TABLE catalogos.cat_estatus OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 119477)
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.cat_estatus_id_estatus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.cat_estatus_id_estatus_seq OWNER TO postgres;

--
-- TOC entry 5864 (class 0 OID 0)
-- Dependencies: 228
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.cat_estatus_id_estatus_seq OWNED BY catalogos.cat_estatus.id_estatus;


--
-- TOC entry 229 (class 1259 OID 119478)
-- Name: cat_estatus_queja; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.cat_estatus_queja (
    id_estatus_queja integer NOT NULL,
    descripcion_estatus character varying(100) NOT NULL,
    activo boolean DEFAULT true,
    orden integer
);


ALTER TABLE catalogos.cat_estatus_queja OWNER TO postgres;

--
-- TOC entry 5865 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN cat_estatus_queja.orden; Type: COMMENT; Schema: catalogos; Owner: postgres
--

COMMENT ON COLUMN catalogos.cat_estatus_queja.orden IS 'Indica la secuencia lógica del estatus en el flujo de la queja';


--
-- TOC entry 230 (class 1259 OID 119482)
-- Name: cat_estatus_queja_id_estatus_queja_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.cat_estatus_queja_id_estatus_queja_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.cat_estatus_queja_id_estatus_queja_seq OWNER TO postgres;

--
-- TOC entry 5866 (class 0 OID 0)
-- Dependencies: 230
-- Name: cat_estatus_queja_id_estatus_queja_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.cat_estatus_queja_id_estatus_queja_seq OWNED BY catalogos.cat_estatus_queja.id_estatus_queja;


--
-- TOC entry 231 (class 1259 OID 119483)
-- Name: cat_estatus_sustantiva; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.cat_estatus_sustantiva (
    id_cat_estatus_sustantiva bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE catalogos.cat_estatus_sustantiva OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 119486)
-- Name: cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq OWNER TO postgres;

--
-- TOC entry 5867 (class 0 OID 0)
-- Dependencies: 232
-- Name: cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq OWNED BY catalogos.cat_estatus_sustantiva.id_cat_estatus_sustantiva;


--
-- TOC entry 233 (class 1259 OID 119487)
-- Name: cat_municipios; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.cat_municipios (
    id_municipio bigint NOT NULL,
    id_estado integer,
    nombre_municipio character varying(255) NOT NULL
);


ALTER TABLE catalogos.cat_municipios OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 119490)
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.cat_municipios_id_municipio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.cat_municipios_id_municipio_seq OWNER TO postgres;

--
-- TOC entry 5868 (class 0 OID 0)
-- Dependencies: 234
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.cat_municipios_id_municipio_seq OWNED BY catalogos.cat_municipios.id_municipio;


--
-- TOC entry 235 (class 1259 OID 119491)
-- Name: cat_tipo_proceso; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.cat_tipo_proceso (
    id_cat_tipo_proceso bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE catalogos.cat_tipo_proceso OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 119494)
-- Name: cat_tipo_proceso_id_cat_tipo_proceso_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.cat_tipo_proceso_id_cat_tipo_proceso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.cat_tipo_proceso_id_cat_tipo_proceso_seq OWNER TO postgres;

--
-- TOC entry 5869 (class 0 OID 0)
-- Dependencies: 236
-- Name: cat_tipo_proceso_id_cat_tipo_proceso_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.cat_tipo_proceso_id_cat_tipo_proceso_seq OWNED BY catalogos.cat_tipo_proceso.id_cat_tipo_proceso;


--
-- TOC entry 237 (class 1259 OID 119495)
-- Name: control_folios_config; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.control_folios_config (
    id_control_folios_config bigint NOT NULL,
    anio integer NOT NULL,
    mes integer NOT NULL,
    consecutivo integer DEFAULT 0,
    nombre character varying(255)
);


ALTER TABLE catalogos.control_folios_config OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 119499)
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.control_folios_config_id_control_folios_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.control_folios_config_id_control_folios_config_seq OWNER TO postgres;

--
-- TOC entry 5870 (class 0 OID 0)
-- Dependencies: 238
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.control_folios_config_id_control_folios_config_seq OWNED BY catalogos.control_folios_config.id_control_folios_config;


--
-- TOC entry 239 (class 1259 OID 119500)
-- Name: dias_inhabiles; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.dias_inhabiles (
    id_dia_inhabil integer NOT NULL,
    fecha date NOT NULL,
    descripcion character varying(255),
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE catalogos.dias_inhabiles OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 119504)
-- Name: dias_inhabiles_id_dia_inhabil_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.dias_inhabiles_id_dia_inhabil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.dias_inhabiles_id_dia_inhabil_seq OWNER TO postgres;

--
-- TOC entry 5871 (class 0 OID 0)
-- Dependencies: 240
-- Name: dias_inhabiles_id_dia_inhabil_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.dias_inhabiles_id_dia_inhabil_seq OWNED BY catalogos.dias_inhabiles.id_dia_inhabil;


--
-- TOC entry 241 (class 1259 OID 119505)
-- Name: direcciones; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.direcciones (
    id_direccion bigint NOT NULL,
    calle character varying(255),
    num_ext character varying(255),
    num_int character varying(255),
    colonia character varying(255),
    cp character varying(255),
    id_municipio integer,
    id_estado integer
);


ALTER TABLE catalogos.direcciones OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 119510)
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.direcciones_id_direccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.direcciones_id_direccion_seq OWNER TO postgres;

--
-- TOC entry 5872 (class 0 OID 0)
-- Dependencies: 242
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.direcciones_id_direccion_seq OWNED BY catalogos.direcciones.id_direccion;


--
-- TOC entry 243 (class 1259 OID 119511)
-- Name: empleados; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.empleados (
    id_empleado bigint NOT NULL,
    nombre_completo character varying(255) NOT NULL,
    cargo character varying(255),
    id_area integer
);


ALTER TABLE catalogos.empleados OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 119516)
-- Name: empleados_id_empleado_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.empleados_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.empleados_id_empleado_seq OWNER TO postgres;

--
-- TOC entry 5873 (class 0 OID 0)
-- Dependencies: 244
-- Name: empleados_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.empleados_id_empleado_seq OWNED BY catalogos.empleados.id_empleado;


--
-- TOC entry 245 (class 1259 OID 119517)
-- Name: estatus_detalle_expediente; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.estatus_detalle_expediente (
    id_estatus_detalle_expediente bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE catalogos.estatus_detalle_expediente OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 119520)
-- Name: estatus_detalle_expediente_id_estatus_detalle_expediente_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.estatus_detalle_expediente_id_estatus_detalle_expediente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.estatus_detalle_expediente_id_estatus_detalle_expediente_seq OWNER TO postgres;

--
-- TOC entry 5874 (class 0 OID 0)
-- Dependencies: 246
-- Name: estatus_detalle_expediente_id_estatus_detalle_expediente_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.estatus_detalle_expediente_id_estatus_detalle_expediente_seq OWNED BY catalogos.estatus_detalle_expediente.id_estatus_detalle_expediente;


--
-- TOC entry 247 (class 1259 OID 119521)
-- Name: estatus_expediente; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.estatus_expediente (
    id_estatus_expediente bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE catalogos.estatus_expediente OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 119524)
-- Name: estatus_expediente_id_estatus_expediente_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.estatus_expediente_id_estatus_expediente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.estatus_expediente_id_estatus_expediente_seq OWNER TO postgres;

--
-- TOC entry 5875 (class 0 OID 0)
-- Dependencies: 248
-- Name: estatus_expediente_id_estatus_expediente_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.estatus_expediente_id_estatus_expediente_seq OWNED BY catalogos.estatus_expediente.id_estatus_expediente;


--
-- TOC entry 249 (class 1259 OID 119525)
-- Name: estatus_representacion_legal; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.estatus_representacion_legal (
    id_estatus integer NOT NULL,
    nombre_estatus character varying(100) NOT NULL,
    orden integer NOT NULL,
    descripcion text,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE catalogos.estatus_representacion_legal OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 119531)
-- Name: estatus_representacion_legal_id_estatus_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.estatus_representacion_legal_id_estatus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.estatus_representacion_legal_id_estatus_seq OWNER TO postgres;

--
-- TOC entry 5876 (class 0 OID 0)
-- Dependencies: 250
-- Name: estatus_representacion_legal_id_estatus_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.estatus_representacion_legal_id_estatus_seq OWNED BY catalogos.estatus_representacion_legal.id_estatus;


--
-- TOC entry 251 (class 1259 OID 119532)
-- Name: personal; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.personal (
    id_personal bigint NOT NULL,
    id_persona bigint NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    activo boolean DEFAULT true
);


ALTER TABLE catalogos.personal OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 119537)
-- Name: personal_id_personal_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.personal_id_personal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.personal_id_personal_seq OWNER TO postgres;

--
-- TOC entry 5877 (class 0 OID 0)
-- Dependencies: 252
-- Name: personal_id_personal_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.personal_id_personal_seq OWNED BY catalogos.personal.id_personal;


--
-- TOC entry 253 (class 1259 OID 119538)
-- Name: personas; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.personas (
    id_persona bigint NOT NULL,
    id_direccion bigint,
    nombre character varying(255) NOT NULL,
    apellido_paterno character varying(255) NOT NULL,
    apellido_materno character varying(255),
    curp character varying(255),
    telefono character varying(255),
    comunidad character varying(255),
    rfc character varying(255),
    rec character varying(255),
    identificacion_oficial character varying(255),
    telefono_fijo character varying(255),
    numero_id_folio character varying(255),
    correo character varying(255),
    id_tipo_persona bigint,
    tipo_identificacion character varying(255),
    es_personal boolean DEFAULT false
);


ALTER TABLE catalogos.personas OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 119544)
-- Name: personas_id_persona_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.personas_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.personas_id_persona_seq OWNER TO postgres;

--
-- TOC entry 5878 (class 0 OID 0)
-- Dependencies: 254
-- Name: personas_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.personas_id_persona_seq OWNED BY catalogos.personas.id_persona;


--
-- TOC entry 364 (class 1259 OID 121004)
-- Name: refresh_tokens; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.refresh_tokens (
    id bigint NOT NULL,
    token character varying(500) NOT NULL,
    user_id bigint NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    revoked boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE catalogos.refresh_tokens OWNER TO postgres;

--
-- TOC entry 363 (class 1259 OID 121003)
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.refresh_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 5879 (class 0 OID 0)
-- Dependencies: 363
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.refresh_tokens_id_seq OWNED BY catalogos.refresh_tokens.id;


--
-- TOC entry 255 (class 1259 OID 119545)
-- Name: roles; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.roles (
    id_rol bigint NOT NULL,
    nombre_rol character varying(255) NOT NULL,
    descripcion character varying(255),
    url character varying(255),
    activo boolean DEFAULT true
);


ALTER TABLE catalogos.roles OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 119551)
-- Name: roles_id_rol_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.roles_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.roles_id_rol_seq OWNER TO postgres;

--
-- TOC entry 5880 (class 0 OID 0)
-- Dependencies: 256
-- Name: roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.roles_id_rol_seq OWNED BY catalogos.roles.id_rol;


--
-- TOC entry 257 (class 1259 OID 119552)
-- Name: tipo_acto_emitido; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.tipo_acto_emitido (
    id_tipo_acto_emitido bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE catalogos.tipo_acto_emitido OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 119555)
-- Name: tipo_acto_emitido_id_tipo_acto_emitido_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.tipo_acto_emitido_id_tipo_acto_emitido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.tipo_acto_emitido_id_tipo_acto_emitido_seq OWNER TO postgres;

--
-- TOC entry 5881 (class 0 OID 0)
-- Dependencies: 258
-- Name: tipo_acto_emitido_id_tipo_acto_emitido_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.tipo_acto_emitido_id_tipo_acto_emitido_seq OWNED BY catalogos.tipo_acto_emitido.id_tipo_acto_emitido;


--
-- TOC entry 259 (class 1259 OID 119556)
-- Name: tipo_correspondencia; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.tipo_correspondencia (
    id_tipo_correspondencia integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE catalogos.tipo_correspondencia OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 119559)
-- Name: tipo_correspondencia_id_tipo_correspondencia_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.tipo_correspondencia_id_tipo_correspondencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.tipo_correspondencia_id_tipo_correspondencia_seq OWNER TO postgres;

--
-- TOC entry 5882 (class 0 OID 0)
-- Dependencies: 260
-- Name: tipo_correspondencia_id_tipo_correspondencia_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.tipo_correspondencia_id_tipo_correspondencia_seq OWNED BY catalogos.tipo_correspondencia.id_tipo_correspondencia;


--
-- TOC entry 261 (class 1259 OID 119560)
-- Name: tipo_entrada; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.tipo_entrada (
    id_tipo_entrada bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE catalogos.tipo_entrada OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 119563)
-- Name: tipo_entrada_id_tipo_entrada_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.tipo_entrada_id_tipo_entrada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.tipo_entrada_id_tipo_entrada_seq OWNER TO postgres;

--
-- TOC entry 5883 (class 0 OID 0)
-- Dependencies: 262
-- Name: tipo_entrada_id_tipo_entrada_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.tipo_entrada_id_tipo_entrada_seq OWNED BY catalogos.tipo_entrada.id_tipo_entrada;


--
-- TOC entry 263 (class 1259 OID 119564)
-- Name: tipo_persona; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.tipo_persona (
    id_tipo_persona bigint NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE catalogos.tipo_persona OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 119567)
-- Name: tipo_persona_id_tipo_persona_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.tipo_persona_id_tipo_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.tipo_persona_id_tipo_persona_seq OWNER TO postgres;

--
-- TOC entry 5884 (class 0 OID 0)
-- Dependencies: 264
-- Name: tipo_persona_id_tipo_persona_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.tipo_persona_id_tipo_persona_seq OWNED BY catalogos.tipo_persona.id_tipo_persona;


--
-- TOC entry 265 (class 1259 OID 119568)
-- Name: tipo_tramite; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.tipo_tramite (
    id_tipo_tramite bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE catalogos.tipo_tramite OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 119571)
-- Name: tipo_tramite_id_tipo_tramite_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.tipo_tramite_id_tipo_tramite_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.tipo_tramite_id_tipo_tramite_seq OWNER TO postgres;

--
-- TOC entry 5885 (class 0 OID 0)
-- Dependencies: 266
-- Name: tipo_tramite_id_tipo_tramite_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.tipo_tramite_id_tipo_tramite_seq OWNED BY catalogos.tipo_tramite.id_tipo_tramite;


--
-- TOC entry 366 (class 1259 OID 121020)
-- Name: user_sessions; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.user_sessions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    session_id character varying(100) NOT NULL,
    ip_address character varying(45),
    user_agent character varying(500),
    last_active timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE catalogos.user_sessions OWNER TO postgres;

--
-- TOC entry 365 (class 1259 OID 121019)
-- Name: user_sessions_id_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.user_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.user_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 5886 (class 0 OID 0)
-- Dependencies: 365
-- Name: user_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.user_sessions_id_seq OWNED BY catalogos.user_sessions.id;


--
-- TOC entry 267 (class 1259 OID 119572)
-- Name: usuarios; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.usuarios (
    id_usuario bigint NOT NULL,
    id_persona bigint,
    id_area bigint,
    usuario_login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    correo_electronico character varying(255),
    fecha_registro_usuario timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP,
    activo boolean DEFAULT true,
    updated_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE catalogos.usuarios OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 119579)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 5887 (class 0 OID 0)
-- Dependencies: 268
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.usuarios_id_usuario_seq OWNED BY catalogos.usuarios.id_usuario;


--
-- TOC entry 269 (class 1259 OID 119580)
-- Name: usuarios_roles; Type: TABLE; Schema: catalogos; Owner: postgres
--

CREATE TABLE catalogos.usuarios_roles (
    id_usuario_rol bigint NOT NULL,
    id_usuario bigint NOT NULL,
    id_rol bigint NOT NULL,
    fecha_asignacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE catalogos.usuarios_roles OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 119584)
-- Name: usuarios_roles_id_usuario_rol_seq; Type: SEQUENCE; Schema: catalogos; Owner: postgres
--

CREATE SEQUENCE catalogos.usuarios_roles_id_usuario_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE catalogos.usuarios_roles_id_usuario_rol_seq OWNER TO postgres;

--
-- TOC entry 5888 (class 0 OID 0)
-- Dependencies: 270
-- Name: usuarios_roles_id_usuario_rol_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: postgres
--

ALTER SEQUENCE catalogos.usuarios_roles_id_usuario_rol_seq OWNED BY catalogos.usuarios_roles.id_usuario_rol;


--
-- TOC entry 271 (class 1259 OID 119585)
-- Name: acuse_correspondencia; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.acuse_correspondencia (
    id_acuse_correspondencia bigint NOT NULL,
    id_correspondencia bigint NOT NULL,
    id_usuario_revisor bigint NOT NULL,
    fecha_aceptacion date,
    hora_aceptacion time without time zone,
    es_del_area boolean
);


ALTER TABLE correspondencia.acuse_correspondencia OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 119588)
-- Name: acuse_correspondencia_id_acuse_correspondencia_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq OWNER TO postgres;

--
-- TOC entry 5889 (class 0 OID 0)
-- Dependencies: 272
-- Name: acuse_correspondencia_id_acuse_correspondencia_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq OWNED BY correspondencia.acuse_correspondencia.id_acuse_correspondencia;


--
-- TOC entry 273 (class 1259 OID 119589)
-- Name: acuse_memorandum; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.acuse_memorandum (
    id_acuse bigint NOT NULL,
    id_memorandum bigint NOT NULL,
    id_usuario_revisor bigint NOT NULL,
    fecha_aceptacion date,
    hora_aceptacion time without time zone,
    es_del_area boolean
);


ALTER TABLE correspondencia.acuse_memorandum OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 119592)
-- Name: acuse_oficio; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.acuse_oficio (
    id_acuse_oficio bigint NOT NULL,
    id_oficio bigint,
    id_usuario_revisor bigint,
    fecha_aceptacion date,
    hora_aceptacion time without time zone,
    es_del_area boolean
);


ALTER TABLE correspondencia.acuse_oficio OWNER TO postgres;

--
-- TOC entry 5890 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE acuse_oficio; Type: COMMENT; Schema: correspondencia; Owner: postgres
--

COMMENT ON TABLE correspondencia.acuse_oficio IS 'Tabla de acuse para oficios con ID autoincremental.';


--
-- TOC entry 275 (class 1259 OID 119595)
-- Name: acuse_oficio_id_acuse_oficio_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.acuse_oficio_id_acuse_oficio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.acuse_oficio_id_acuse_oficio_seq OWNER TO postgres;

--
-- TOC entry 5891 (class 0 OID 0)
-- Dependencies: 275
-- Name: acuse_oficio_id_acuse_oficio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.acuse_oficio_id_acuse_oficio_seq OWNED BY correspondencia.acuse_oficio.id_acuse_oficio;


--
-- TOC entry 276 (class 1259 OID 119596)
-- Name: acuserecibointerno_id_acuse_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.acuserecibointerno_id_acuse_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.acuserecibointerno_id_acuse_seq OWNER TO postgres;

--
-- TOC entry 5892 (class 0 OID 0)
-- Dependencies: 276
-- Name: acuserecibointerno_id_acuse_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.acuserecibointerno_id_acuse_seq OWNED BY correspondencia.acuse_memorandum.id_acuse;


--
-- TOC entry 277 (class 1259 OID 119597)
-- Name: alertas_seguimiento; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.alertas_seguimiento (
    id_alerta integer NOT NULL,
    id_turno integer,
    id_usuario_emisor integer,
    mensaje_urgencia text,
    fecha_alerta timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    leida boolean DEFAULT false
);


ALTER TABLE correspondencia.alertas_seguimiento OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 119604)
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.alertas_seguimiento_id_alerta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.alertas_seguimiento_id_alerta_seq OWNER TO postgres;

--
-- TOC entry 5893 (class 0 OID 0)
-- Dependencies: 278
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.alertas_seguimiento_id_alerta_seq OWNED BY correspondencia.alertas_seguimiento.id_alerta;


--
-- TOC entry 279 (class 1259 OID 119605)
-- Name: archivos_adjuntos; Type: TABLE; Schema: correspondencia; Owner: postgres
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


ALTER TABLE correspondencia.archivos_adjuntos OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 119611)
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.archivos_adjuntos_id_archivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.archivos_adjuntos_id_archivo_seq OWNER TO postgres;

--
-- TOC entry 5894 (class 0 OID 0)
-- Dependencies: 280
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.archivos_adjuntos_id_archivo_seq OWNED BY correspondencia.archivos_adjuntos.id_archivo;


--
-- TOC entry 281 (class 1259 OID 119612)
-- Name: auditoria_correspondencia; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.auditoria_correspondencia (
    id_log bigint NOT NULL,
    id_correspondencia bigint,
    id_usuario_accion bigint,
    estado_anterior integer,
    estado_nuevo integer,
    observaciones character varying(255),
    fecha_movimiento timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE correspondencia.auditoria_correspondencia OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 119616)
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.auditoria_correspondencia_id_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.auditoria_correspondencia_id_log_seq OWNER TO postgres;

--
-- TOC entry 5895 (class 0 OID 0)
-- Dependencies: 282
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.auditoria_correspondencia_id_log_seq OWNED BY correspondencia.auditoria_correspondencia.id_log;


--
-- TOC entry 283 (class 1259 OID 119617)
-- Name: correspondencia; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.correspondencia (
    id_correspondencia bigint NOT NULL,
    folio_unico character varying(255) NOT NULL,
    num_oficio_externo character varying(255),
    dependencia_remitente character varying(255),
    nombre_remitente character varying(255),
    asunto character varying(255),
    fecha_oficio date,
    fecha_recibido date,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    vigencia_desde date,
    termino_fatal date,
    id_estatus bigint,
    id_usuario_captura bigint,
    observaciones_validacion character varying(255),
    id_area bigint,
    id_tipo_correspondencia integer
);


ALTER TABLE correspondencia.correspondencia OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 119623)
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.correspondencia_id_folio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.correspondencia_id_folio_seq OWNER TO postgres;

--
-- TOC entry 5896 (class 0 OID 0)
-- Dependencies: 284
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.correspondencia_id_folio_seq OWNED BY correspondencia.correspondencia.id_correspondencia;


--
-- TOC entry 285 (class 1259 OID 119624)
-- Name: correspondencia_respuestas; Type: TABLE; Schema: correspondencia; Owner: postgres
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


ALTER TABLE correspondencia.correspondencia_respuestas OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 119629)
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.correspondencia_respuestas_id_respuesta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.correspondencia_respuestas_id_respuesta_seq OWNER TO postgres;

--
-- TOC entry 5897 (class 0 OID 0)
-- Dependencies: 286
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.correspondencia_respuestas_id_respuesta_seq OWNED BY correspondencia.correspondencia_respuestas.id_respuesta;


--
-- TOC entry 287 (class 1259 OID 119630)
-- Name: correspondencia_turnos; Type: TABLE; Schema: correspondencia; Owner: postgres
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


ALTER TABLE correspondencia.correspondencia_turnos OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 119634)
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.correspondencia_turnos_id_turno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.correspondencia_turnos_id_turno_seq OWNER TO postgres;

--
-- TOC entry 5898 (class 0 OID 0)
-- Dependencies: 288
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.correspondencia_turnos_id_turno_seq OWNED BY correspondencia.correspondencia_turnos.id_turno;


--
-- TOC entry 289 (class 1259 OID 119635)
-- Name: memorandums; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.memorandums (
    id_memo bigint NOT NULL,
    id_correspondencia bigint,
    num_memo character varying(255),
    instruccion_seguimiento character varying(255),
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_usuario_emisor bigint,
    folio_unico character varying(255),
    observaciones text,
    url_memorandum_generado character varying(255),
    id_plantilla bigint,
    id_area bigint,
    id_usuario_firmante bigint
);


ALTER TABLE correspondencia.memorandums OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 119641)
-- Name: memorandums_id_memo_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.memorandums_id_memo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.memorandums_id_memo_seq OWNER TO postgres;

--
-- TOC entry 5899 (class 0 OID 0)
-- Dependencies: 290
-- Name: memorandums_id_memo_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.memorandums_id_memo_seq OWNED BY correspondencia.memorandums.id_memo;


--
-- TOC entry 291 (class 1259 OID 119642)
-- Name: notificaciones; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.notificaciones (
    id_notificacion integer NOT NULL,
    id_usuario_destino integer,
    mensaje character varying(500),
    id_referencia integer,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    leida boolean DEFAULT false
);


ALTER TABLE correspondencia.notificaciones OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 119649)
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.notificaciones_id_notificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.notificaciones_id_notificacion_seq OWNER TO postgres;

--
-- TOC entry 5900 (class 0 OID 0)
-- Dependencies: 292
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.notificaciones_id_notificacion_seq OWNED BY correspondencia.notificaciones.id_notificacion;


--
-- TOC entry 293 (class 1259 OID 119650)
-- Name: oficio; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.oficio (
    id_oficio bigint NOT NULL,
    id_correspondencia bigint,
    num_oficio character varying(255),
    instruccion_seguimiento character varying(255),
    fecha_emision timestamp without time zone,
    id_usuario_emisor bigint,
    folio_unico character varying(255),
    observaciones text,
    url_memorandum_generado character varying(255),
    id_plantilla bigint,
    id_area bigint,
    id_usuario_firmante bigint
);


ALTER TABLE correspondencia.oficio OWNER TO postgres;

--
-- TOC entry 5901 (class 0 OID 0)
-- Dependencies: 293
-- Name: TABLE oficio; Type: COMMENT; Schema: correspondencia; Owner: postgres
--

COMMENT ON TABLE correspondencia.oficio IS 'Tabla para el registro de oficios generados en el sistema de correspondencia.';


--
-- TOC entry 294 (class 1259 OID 119655)
-- Name: oficio_contestacion; Type: TABLE; Schema: correspondencia; Owner: postgres
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


ALTER TABLE correspondencia.oficio_contestacion OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 119662)
-- Name: oficio_contestacion_externa; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.oficio_contestacion_externa (
    id_oficio_contestacion bigint NOT NULL,
    id_correspondencia bigint NOT NULL,
    id_usuario_emisor bigint NOT NULL,
    num_oficio_salida character varying(255) NOT NULL,
    asunto_contestacion character varying(255) NOT NULL,
    cuerpo_oficio_texto text NOT NULL,
    url_pdf_final character varying(255),
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE correspondencia.oficio_contestacion_externa OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 119668)
-- Name: oficio_contestacion_externa_id_oficio_contestacion_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq OWNER TO postgres;

--
-- TOC entry 5902 (class 0 OID 0)
-- Dependencies: 296
-- Name: oficio_contestacion_externa_id_oficio_contestacion_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq OWNED BY correspondencia.oficio_contestacion_externa.id_oficio_contestacion;


--
-- TOC entry 297 (class 1259 OID 119669)
-- Name: oficio_contestacion_id_contestacion_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.oficio_contestacion_id_contestacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.oficio_contestacion_id_contestacion_seq OWNER TO postgres;

--
-- TOC entry 5903 (class 0 OID 0)
-- Dependencies: 297
-- Name: oficio_contestacion_id_contestacion_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.oficio_contestacion_id_contestacion_seq OWNED BY correspondencia.oficio_contestacion.id_contestacion;


--
-- TOC entry 298 (class 1259 OID 119670)
-- Name: oficio_id_oficio_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.oficio_id_oficio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.oficio_id_oficio_seq OWNER TO postgres;

--
-- TOC entry 5904 (class 0 OID 0)
-- Dependencies: 298
-- Name: oficio_id_oficio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.oficio_id_oficio_seq OWNED BY correspondencia.oficio.id_oficio;


--
-- TOC entry 299 (class 1259 OID 119671)
-- Name: plantilla_memorandum; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.plantilla_memorandum (
    id_plantilla bigint NOT NULL,
    nombre_plantilla character varying(255) NOT NULL,
    url_plantilla_memorandum character varying(255),
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    activo boolean DEFAULT true
);


ALTER TABLE correspondencia.plantilla_memorandum OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 119678)
-- Name: plantilla_memorandum_id_plantilla_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.plantilla_memorandum_id_plantilla_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.plantilla_memorandum_id_plantilla_seq OWNER TO postgres;

--
-- TOC entry 5905 (class 0 OID 0)
-- Dependencies: 300
-- Name: plantilla_memorandum_id_plantilla_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.plantilla_memorandum_id_plantilla_seq OWNED BY correspondencia.plantilla_memorandum.id_plantilla;


--
-- TOC entry 301 (class 1259 OID 119679)
-- Name: seguimiento_correspondencia; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.seguimiento_correspondencia (
    id_seguimiento_correspondencia integer NOT NULL,
    id_correspondencia bigint NOT NULL,
    folio_respuesta character varying(100) NOT NULL,
    respuesta_seguimiento_correspondencia text,
    fecha_resolucion date NOT NULL,
    hora_resolucion time without time zone NOT NULL,
    archivo_adjunto character varying(255),
    id_usuario bigint NOT NULL,
    id_estatus integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    numero_oficio_contestacion character varying(100)
);


ALTER TABLE correspondencia.seguimiento_correspondencia OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 119685)
-- Name: seguimiento_correspondencia_id_seguimiento_correspondencia_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq OWNER TO postgres;

--
-- TOC entry 5906 (class 0 OID 0)
-- Dependencies: 302
-- Name: seguimiento_correspondencia_id_seguimiento_correspondencia_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq OWNED BY correspondencia.seguimiento_correspondencia.id_seguimiento_correspondencia;


--
-- TOC entry 303 (class 1259 OID 119686)
-- Name: seguimiento_memorandum; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.seguimiento_memorandum (
    id_seguimiento_memorandum bigint NOT NULL,
    id_memo bigint NOT NULL,
    folio_respuesta integer NOT NULL,
    respuesta_seguimiento_memorandum text,
    fecha_resolucion date NOT NULL,
    hora_resolucion time without time zone NOT NULL,
    archivo_adjunto character varying(255),
    id_usuario bigint NOT NULL,
    id_estatus integer NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    numero_oficio_contestacion character varying(100)
);


ALTER TABLE correspondencia.seguimiento_memorandum OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 119692)
-- Name: seguimiento_memorandum_folio_respuesta_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.seguimiento_memorandum_folio_respuesta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.seguimiento_memorandum_folio_respuesta_seq OWNER TO postgres;

--
-- TOC entry 5907 (class 0 OID 0)
-- Dependencies: 304
-- Name: seguimiento_memorandum_folio_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.seguimiento_memorandum_folio_respuesta_seq OWNED BY correspondencia.seguimiento_memorandum.folio_respuesta;


--
-- TOC entry 305 (class 1259 OID 119693)
-- Name: seguimiento_memorandum_id_seguimiento_memorandum_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq OWNER TO postgres;

--
-- TOC entry 5908 (class 0 OID 0)
-- Dependencies: 305
-- Name: seguimiento_memorandum_id_seguimiento_memorandum_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq OWNED BY correspondencia.seguimiento_memorandum.id_seguimiento_memorandum;


--
-- TOC entry 306 (class 1259 OID 119694)
-- Name: seguimiento_oficio; Type: TABLE; Schema: correspondencia; Owner: postgres
--

CREATE TABLE correspondencia.seguimiento_oficio (
    id_seguimiento_oficio integer NOT NULL,
    id_oficio bigint,
    folio_respuesta integer NOT NULL,
    respuesta_seguimiento_oficio text,
    fecha_resolucion date,
    hora_resolucion time without time zone,
    archivo_adjunto character varying(255),
    id_usuario bigint,
    id_estatus integer,
    fecha_registro timestamp without time zone,
    numero_oficio_contestacion character varying(100)
);


ALTER TABLE correspondencia.seguimiento_oficio OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 119699)
-- Name: seguimiento_oficio_folio_respuesta_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.seguimiento_oficio_folio_respuesta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.seguimiento_oficio_folio_respuesta_seq OWNER TO postgres;

--
-- TOC entry 5909 (class 0 OID 0)
-- Dependencies: 307
-- Name: seguimiento_oficio_folio_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.seguimiento_oficio_folio_respuesta_seq OWNED BY correspondencia.seguimiento_oficio.folio_respuesta;


--
-- TOC entry 308 (class 1259 OID 119700)
-- Name: seguimiento_oficio_id_seguimiento_oficio_seq; Type: SEQUENCE; Schema: correspondencia; Owner: postgres
--

CREATE SEQUENCE correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq OWNER TO postgres;

--
-- TOC entry 5910 (class 0 OID 0)
-- Dependencies: 308
-- Name: seguimiento_oficio_id_seguimiento_oficio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: postgres
--

ALTER SEQUENCE correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq OWNED BY correspondencia.seguimiento_oficio.id_seguimiento_oficio;


--
-- TOC entry 309 (class 1259 OID 119701)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 119706)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- TOC entry 311 (class 1259 OID 119709)
-- Name: plantilla_queja_ari; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plantilla_queja_ari (
    id_plantilla bigint NOT NULL,
    activo boolean,
    fecha_creacion timestamp(6) without time zone,
    nombre_plantilla character varying(255),
    url_plantilla_queja_ari character varying(255)
);


ALTER TABLE public.plantilla_queja_ari OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 119714)
-- Name: plantilla_queja_ari_id_plantilla_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.plantilla_queja_ari ALTER COLUMN id_plantilla ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.plantilla_queja_ari_id_plantilla_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 313 (class 1259 OID 119715)
-- Name: asesores; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.asesores (
    id_asesores bigint NOT NULL,
    id_persona bigint NOT NULL,
    especialidad character varying(255),
    carga_actual integer DEFAULT 0,
    ultima_asignacion_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    activo boolean DEFAULT true
);


ALTER TABLE sustantiva.asesores OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 119721)
-- Name: asesores_id_asesores_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.asesores_id_asesores_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.asesores_id_asesores_seq OWNER TO postgres;

--
-- TOC entry 5911 (class 0 OID 0)
-- Dependencies: 314
-- Name: asesores_id_asesores_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.asesores_id_asesores_seq OWNED BY sustantiva.asesores.id_asesores;


--
-- TOC entry 315 (class 1259 OID 119722)
-- Name: audiencia_celebrada; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.audiencia_celebrada (
    id_audiencia_celebrada integer NOT NULL,
    id_audiencia_espera integer NOT NULL,
    fecha_hora_celebracion timestamp without time zone NOT NULL,
    numero_oficio_acta character varying(100),
    sala_o_modalidad character varying(100),
    resultado_audiencia character varying(255) NOT NULL,
    asistio_autoridad boolean DEFAULT true NOT NULL,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    ruta_pdf_oficio character varying(500)
);


ALTER TABLE sustantiva.audiencia_celebrada OWNER TO postgres;

--
-- TOC entry 5912 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE audiencia_celebrada; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON TABLE sustantiva.audiencia_celebrada IS 'Registra las actas, resultados y detalles cuando la audiencia constitucional efectivamente se celebra.';


--
-- TOC entry 5913 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN audiencia_celebrada.ruta_pdf_oficio; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON COLUMN sustantiva.audiencia_celebrada.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF del acta de la audiencia.';


--
-- TOC entry 316 (class 1259 OID 119729)
-- Name: audiencia_celebrada_id_audiencia_celebrada_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.audiencia_celebrada_id_audiencia_celebrada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.audiencia_celebrada_id_audiencia_celebrada_seq OWNER TO postgres;

--
-- TOC entry 5914 (class 0 OID 0)
-- Dependencies: 316
-- Name: audiencia_celebrada_id_audiencia_celebrada_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.audiencia_celebrada_id_audiencia_celebrada_seq OWNED BY sustantiva.audiencia_celebrada.id_audiencia_celebrada;


--
-- TOC entry 317 (class 1259 OID 119730)
-- Name: audiencia_espera; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.audiencia_espera (
    id_audiencia_espera integer NOT NULL,
    id_demanda_amparo integer NOT NULL,
    numero_oficio_admision character varying(100) NOT NULL,
    fecha_notificacion_oficio date NOT NULL,
    fecha_hora_audiencia_prog timestamp without time zone NOT NULL,
    observaciones character varying(500),
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    ruta_pdf_oficio character varying(500)
);


ALTER TABLE sustantiva.audiencia_espera OWNER TO postgres;

--
-- TOC entry 5915 (class 0 OID 0)
-- Dependencies: 317
-- Name: TABLE audiencia_espera; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON TABLE sustantiva.audiencia_espera IS 'Almacena los datos cuando la demanda de amparo es admitida y se espera la fecha de audiencia constitucional.';


--
-- TOC entry 5916 (class 0 OID 0)
-- Dependencies: 317
-- Name: COLUMN audiencia_espera.fecha_hora_audiencia_prog; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON COLUMN sustantiva.audiencia_espera.fecha_hora_audiencia_prog IS 'Fecha y hora programada por el juzgado para celebrar la audiencia.';


--
-- TOC entry 5917 (class 0 OID 0)
-- Dependencies: 317
-- Name: COLUMN audiencia_espera.ruta_pdf_oficio; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON COLUMN sustantiva.audiencia_espera.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF del oficio de admisión.';


--
-- TOC entry 318 (class 1259 OID 119736)
-- Name: audiencia_espera_id_audiencia_espera_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.audiencia_espera_id_audiencia_espera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.audiencia_espera_id_audiencia_espera_seq OWNER TO postgres;

--
-- TOC entry 5918 (class 0 OID 0)
-- Dependencies: 318
-- Name: audiencia_espera_id_audiencia_espera_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.audiencia_espera_id_audiencia_espera_seq OWNED BY sustantiva.audiencia_espera.id_audiencia_espera;


--
-- TOC entry 319 (class 1259 OID 119737)
-- Name: bitacora_asignacion; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.bitacora_asignacion (
    id_bitacora integer NOT NULL,
    id_expediente integer NOT NULL,
    id_asesor_anterior integer,
    id_asesor_nuevo integer NOT NULL,
    id_usuario_asigno integer,
    fecha_asignacion timestamp without time zone DEFAULT now() NOT NULL,
    ip_origen character varying(45),
    motivo character varying(255)
);


ALTER TABLE sustantiva.bitacora_asignacion OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 119741)
-- Name: bitacora_asignacion_id_bitacora_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.bitacora_asignacion_id_bitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.bitacora_asignacion_id_bitacora_seq OWNER TO postgres;

--
-- TOC entry 5919 (class 0 OID 0)
-- Dependencies: 320
-- Name: bitacora_asignacion_id_bitacora_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.bitacora_asignacion_id_bitacora_seq OWNED BY sustantiva.bitacora_asignacion.id_bitacora;


--
-- TOC entry 321 (class 1259 OID 119742)
-- Name: cierre_expediente; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.cierre_expediente (
    id_cierre integer NOT NULL,
    id_expediente integer NOT NULL,
    medio_notificacion character varying(255) NOT NULL,
    ruta_archivo_acuerdo character varying(255) NOT NULL,
    fecha_cierre timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    usuario_cierre bigint NOT NULL
);


ALTER TABLE sustantiva.cierre_expediente OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 119748)
-- Name: cierre_expediente_id_cierre_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.cierre_expediente_id_cierre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.cierre_expediente_id_cierre_seq OWNER TO postgres;

--
-- TOC entry 5920 (class 0 OID 0)
-- Dependencies: 322
-- Name: cierre_expediente_id_cierre_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.cierre_expediente_id_cierre_seq OWNED BY sustantiva.cierre_expediente.id_cierre;


--
-- TOC entry 323 (class 1259 OID 119749)
-- Name: contribuyentes; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.contribuyentes (
    id_contribuyentes bigint NOT NULL,
    id_persona bigint NOT NULL,
    fecha_registro_sistema timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    observaciones_internas character varying(255)
);


ALTER TABLE sustantiva.contribuyentes OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 119753)
-- Name: contribuyentes_id_contribuyentes_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.contribuyentes_id_contribuyentes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.contribuyentes_id_contribuyentes_seq OWNER TO postgres;

--
-- TOC entry 5921 (class 0 OID 0)
-- Dependencies: 324
-- Name: contribuyentes_id_contribuyentes_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.contribuyentes_id_contribuyentes_seq OWNED BY sustantiva.contribuyentes.id_contribuyentes;


--
-- TOC entry 325 (class 1259 OID 119754)
-- Name: detalle_asesoria; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.detalle_asesoria (
    id_detalle_asesoria bigint NOT NULL,
    id_expediente bigint NOT NULL,
    id_tipo_acto_emitido bigint NOT NULL,
    id_autoridad bigint NOT NULL,
    calificacion_acto character varying(255),
    id_tipo_entrada bigint NOT NULL,
    problematica character varying(255),
    seguimiento character varying(255),
    id_estatus_detalle_expediente bigint NOT NULL,
    fecha_notificacion character varying(255),
    monto double precision
);


ALTER TABLE sustantiva.detalle_asesoria OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 119759)
-- Name: detalle_asesoria_id_detalle_asesoria_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.detalle_asesoria_id_detalle_asesoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.detalle_asesoria_id_detalle_asesoria_seq OWNER TO postgres;

--
-- TOC entry 5922 (class 0 OID 0)
-- Dependencies: 326
-- Name: detalle_asesoria_id_detalle_asesoria_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.detalle_asesoria_id_detalle_asesoria_seq OWNED BY sustantiva.detalle_asesoria.id_detalle_asesoria;


--
-- TOC entry 327 (class 1259 OID 119760)
-- Name: expedientes; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.expedientes (
    id_expediente integer NOT NULL,
    folio_gobierno character varying(255) NOT NULL,
    fecha_solicitud timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_municipio bigint NOT NULL,
    id_asesor bigint NOT NULL,
    id_contribuyente bigint NOT NULL,
    id_solicitante bigint NOT NULL,
    id_tipo_tramite bigint NOT NULL,
    id_estatus_expediente bigint NOT NULL,
    documento_acredita_personalidad character varying(255),
    archivo_documento_acredita_personalidad character varying(255),
    id_representante_legal bigint,
    bloqueado boolean DEFAULT false NOT NULL,
    fecha_cierre_automatico timestamp without time zone,
    fecha_envio_oficio_autoridad timestamp without time zone,
    fecha_limite_informe date,
    numero_oficio_respuesta character varying(255),
    fojas_informe integer,
    fecha_recepcion_informe timestamp without time zone,
    ruta_pdf_informe character varying(255),
    estado_alerta_5dias character varying(30),
    notificacion_vencimiento_enviada boolean DEFAULT false,
    estado_alerta_5_dias character varying(255)
);


ALTER TABLE sustantiva.expedientes OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 119768)
-- Name: expedientes_id_expediente_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.expedientes_id_expediente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.expedientes_id_expediente_seq OWNER TO postgres;

--
-- TOC entry 5923 (class 0 OID 0)
-- Dependencies: 328
-- Name: expedientes_id_expediente_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.expedientes_id_expediente_seq OWNED BY sustantiva.expedientes.id_expediente;


--
-- TOC entry 329 (class 1259 OID 119769)
-- Name: irl_demanda_amparo; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.irl_demanda_amparo (
    id_demanda_amparo integer NOT NULL,
    id_expediente integer NOT NULL,
    id_representacion_legal integer NOT NULL,
    autoridad_reclamada_municipio character varying(200),
    superficie_terreno numeric(10,2),
    superficie_construccion numeric(10,2),
    tipo_construccion character varying(10),
    zonificacion character varying(50),
    folio_recibo_pago character varying(100),
    monto_pago numeric(12,2),
    fecha_primer_pago date,
    incluye_multas_historicas boolean DEFAULT false,
    anios_multas_historicas character varying(200),
    argumentacion_falta_notificacion text,
    transcripcion_ley_ingresos text,
    ruta_pdf_demanda_generada character varying(500),
    fecha_generacion_demanda timestamp without time zone,
    ruta_pdf_demanda_presentada character varying(500),
    ruta_pdf_acuse_demanda character varying(500),
    fecha_presentacion_demanda date,
    fecha_registro timestamp without time zone DEFAULT now(),
    ultima_actualizacion timestamp without time zone DEFAULT now(),
    folio_recibo_pago_2 character varying(100),
    num_recibo_1 character varying(100),
    num_recibo_2 character varying(100),
    clave_predial character varying(100),
    num_cuenta character varying(100),
    domicilio_autoridad character varying(500),
    id_rl_cir integer,
    id_queja_rl_cir integer,
    CONSTRAINT chk_irl_demanda_amparo_flujo_cir CHECK ((NOT ((id_rl_cir IS NOT NULL) AND (id_queja_rl_cir IS NOT NULL))))
);


ALTER TABLE sustantiva.irl_demanda_amparo OWNER TO postgres;

--
-- TOC entry 330 (class 1259 OID 119778)
-- Name: irl_demanda_amparo_id_demanda_amparo_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.irl_demanda_amparo_id_demanda_amparo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.irl_demanda_amparo_id_demanda_amparo_seq OWNER TO postgres;

--
-- TOC entry 5924 (class 0 OID 0)
-- Dependencies: 330
-- Name: irl_demanda_amparo_id_demanda_amparo_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.irl_demanda_amparo_id_demanda_amparo_seq OWNED BY sustantiva.irl_demanda_amparo.id_demanda_amparo;


--
-- TOC entry 331 (class 1259 OID 119779)
-- Name: notificacion_sentencia_cumplida; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.notificacion_sentencia_cumplida (
    id_sentencia_cumplida integer NOT NULL,
    id_sentencia_ejecutoria integer NOT NULL,
    numero_oficio_cumplimiento character varying(100) NOT NULL,
    numero_oficio_archivo character varying(100) NOT NULL,
    fecha_notificacion_archivo date NOT NULL,
    observaciones_finales character varying(500),
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    ruta_pdf_oficio character varying(500)
);


ALTER TABLE sustantiva.notificacion_sentencia_cumplida OWNER TO postgres;

--
-- TOC entry 5925 (class 0 OID 0)
-- Dependencies: 331
-- Name: TABLE notificacion_sentencia_cumplida; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON TABLE sustantiva.notificacion_sentencia_cumplida IS 'Último hito del juicio: Notificación de cumplimiento por parte del juzgado y orden de archivo definitivo.';


--
-- TOC entry 5926 (class 0 OID 0)
-- Dependencies: 331
-- Name: COLUMN notificacion_sentencia_cumplida.ruta_pdf_oficio; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON COLUMN sustantiva.notificacion_sentencia_cumplida.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF del cumplimiento y archivo.';


--
-- TOC entry 332 (class 1259 OID 119785)
-- Name: notificacion_sentencia_cumplida_id_sentencia_cumplida_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.notificacion_sentencia_cumplida_id_sentencia_cumplida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.notificacion_sentencia_cumplida_id_sentencia_cumplida_seq OWNER TO postgres;

--
-- TOC entry 5927 (class 0 OID 0)
-- Dependencies: 332
-- Name: notificacion_sentencia_cumplida_id_sentencia_cumplida_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.notificacion_sentencia_cumplida_id_sentencia_cumplida_seq OWNED BY sustantiva.notificacion_sentencia_cumplida.id_sentencia_cumplida;


--
-- TOC entry 333 (class 1259 OID 119786)
-- Name: oficio_notificacion; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.oficio_notificacion (
    id_oficio_notificacion bigint NOT NULL,
    folio_expediente character varying(255) NOT NULL,
    id_autoridad bigint NOT NULL,
    num_oficio character varying(100) NOT NULL,
    fecha_acuerdo character varying(100) NOT NULL,
    fundamento text,
    iniciales_asesor character varying(50),
    ruta_pdf character varying(500),
    fecha_generacion timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE sustantiva.oficio_notificacion OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 119792)
-- Name: oficio_notificacion_id_oficio_notificacion_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.oficio_notificacion_id_oficio_notificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.oficio_notificacion_id_oficio_notificacion_seq OWNER TO postgres;

--
-- TOC entry 5928 (class 0 OID 0)
-- Dependencies: 334
-- Name: oficio_notificacion_id_oficio_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.oficio_notificacion_id_oficio_notificacion_seq OWNED BY sustantiva.oficio_notificacion.id_oficio_notificacion;


--
-- TOC entry 335 (class 1259 OID 119793)
-- Name: plantilla_queja_ari; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.plantilla_queja_ari (
    id_plantilla integer NOT NULL,
    nombre_plantilla character varying(150) NOT NULL,
    url_plantilla_queja_ari character varying(255) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    activo boolean DEFAULT true
);


ALTER TABLE sustantiva.plantilla_queja_ari OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 119798)
-- Name: plantilla_queja_ari_id_plantilla_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.plantilla_queja_ari_id_plantilla_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.plantilla_queja_ari_id_plantilla_seq OWNER TO postgres;

--
-- TOC entry 5929 (class 0 OID 0)
-- Dependencies: 336
-- Name: plantilla_queja_ari_id_plantilla_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.plantilla_queja_ari_id_plantilla_seq OWNED BY sustantiva.plantilla_queja_ari.id_plantilla;


--
-- TOC entry 337 (class 1259 OID 119799)
-- Name: queja_rl_cir; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.queja_rl_cir (
    id_queja_rl_cir bigint NOT NULL,
    id_resolucion_final bigint NOT NULL,
    fecha_emision timestamp(6) without time zone NOT NULL,
    motivos text,
    articulos text,
    observaciones text,
    id_asesor_remitente bigint NOT NULL,
    id_asesor_recibe bigint NOT NULL,
    director character varying(255),
    oficio character varying(255),
    ruta_pdf_queja_rl_cir character varying(255)
);


ALTER TABLE sustantiva.queja_rl_cir OWNER TO postgres;

--
-- TOC entry 338 (class 1259 OID 119804)
-- Name: queja_rl_cir_id_queja_rl_cir_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.queja_rl_cir_id_queja_rl_cir_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.queja_rl_cir_id_queja_rl_cir_seq OWNER TO postgres;

--
-- TOC entry 5930 (class 0 OID 0)
-- Dependencies: 338
-- Name: queja_rl_cir_id_queja_rl_cir_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.queja_rl_cir_id_queja_rl_cir_seq OWNED BY sustantiva.queja_rl_cir.id_queja_rl_cir;


--
-- TOC entry 339 (class 1259 OID 119805)
-- Name: quejas; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.quejas (
    id_queja integer NOT NULL,
    id_expediente integer NOT NULL,
    id_asesor bigint NOT NULL,
    id_detalle_asesoria bigint NOT NULL,
    id_estatus_queja bigint DEFAULT 1 NOT NULL,
    requisito_identificacion boolean DEFAULT false,
    requisito_actos_fiscales boolean DEFAULT false,
    requisito_narrativa_clara boolean DEFAULT false,
    requisito_competencia_cedecon boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ultima_actualizacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE sustantiva.quejas OWNER TO postgres;

--
-- TOC entry 340 (class 1259 OID 119815)
-- Name: quejas_acci; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.quejas_acci (
    id_acci integer NOT NULL,
    id_queja integer NOT NULL,
    id_oficio_autoridad bigint NOT NULL,
    justificacion_investigacion text NOT NULL,
    nuevos_requerimientos_autoridad text NOT NULL,
    plazo_dias_habiles integer DEFAULT 5,
    fecha_emision_acci timestamp(6) without time zone DEFAULT CURRENT_DATE NOT NULL,
    ruta_pdf_acci character varying(500) NOT NULL,
    concluido boolean DEFAULT false,
    fecha_conclusion timestamp without time zone
);


ALTER TABLE sustantiva.quejas_acci OWNER TO postgres;

--
-- TOC entry 341 (class 1259 OID 119823)
-- Name: quejas_acci_id_acci_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.quejas_acci_id_acci_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.quejas_acci_id_acci_seq OWNER TO postgres;

--
-- TOC entry 5931 (class 0 OID 0)
-- Dependencies: 341
-- Name: quejas_acci_id_acci_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.quejas_acci_id_acci_seq OWNED BY sustantiva.quejas_acci.id_acci;


--
-- TOC entry 342 (class 1259 OID 119824)
-- Name: quejas_ari; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.quejas_ari (
    id_ari bigint NOT NULL,
    id_queja bigint NOT NULL,
    id_cir bigint NOT NULL,
    num_expediente_oficial character varying(255) NOT NULL,
    sintesis_actos_omisiones text NOT NULL,
    nombre_encargado_firma character varying(255) NOT NULL,
    fecha_acuerdo timestamp(6) without time zone DEFAULT CURRENT_DATE NOT NULL,
    ruta_pdf_ari character varying(255) NOT NULL,
    id_plantilla_queja_ari bigint,
    multas_requerimientos text,
    multas_credito text,
    instituto character varying(255),
    siglas_abreviatura_encargado text
);


ALTER TABLE sustantiva.quejas_ari OWNER TO postgres;

--
-- TOC entry 343 (class 1259 OID 119830)
-- Name: quejas_ari_id_ari_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.quejas_ari_id_ari_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.quejas_ari_id_ari_seq OWNER TO postgres;

--
-- TOC entry 5932 (class 0 OID 0)
-- Dependencies: 343
-- Name: quejas_ari_id_ari_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.quejas_ari_id_ari_seq OWNED BY sustantiva.quejas_ari.id_ari;


--
-- TOC entry 344 (class 1259 OID 119831)
-- Name: quejas_cir; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.quejas_cir (
    id_cir bigint NOT NULL,
    id_queja integer NOT NULL,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ruta_pdf_cir character varying(500) NOT NULL,
    id_asesor_ejecutor bigint NOT NULL,
    id_expediente integer,
    id_area_recibe bigint,
    id_area_remite bigint,
    id_tipo_tramite bigint,
    fundamentos text,
    asesor_que_remite character varying(255),
    documentacion_remite text,
    fecha_actualizacion timestamp(6) without time zone,
    fecha_creacion timestamp(6) without time zone NOT NULL,
    motivos_remite text,
    observaciones text
);


ALTER TABLE sustantiva.quejas_cir OWNER TO postgres;

--
-- TOC entry 345 (class 1259 OID 119837)
-- Name: quejas_cir_id_cir_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.quejas_cir_id_cir_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.quejas_cir_id_cir_seq OWNER TO postgres;

--
-- TOC entry 5933 (class 0 OID 0)
-- Dependencies: 345
-- Name: quejas_cir_id_cir_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.quejas_cir_id_cir_seq OWNED BY sustantiva.quejas_cir.id_cir;


--
-- TOC entry 346 (class 1259 OID 119838)
-- Name: quejas_id_queja_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.quejas_id_queja_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.quejas_id_queja_seq OWNER TO postgres;

--
-- TOC entry 5934 (class 0 OID 0)
-- Dependencies: 346
-- Name: quejas_id_queja_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.quejas_id_queja_seq OWNED BY sustantiva.quejas.id_queja;


--
-- TOC entry 347 (class 1259 OID 119839)
-- Name: quejas_oficios_autoridad; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.quejas_oficios_autoridad (
    id_oficio_autoridad integer NOT NULL,
    id_ari bigint NOT NULL,
    num_oficio_comisionado character varying(50) NOT NULL,
    fecha_envio_oficio date NOT NULL,
    fecha_notificacion_quejoso date
);


ALTER TABLE sustantiva.quejas_oficios_autoridad OWNER TO postgres;

--
-- TOC entry 348 (class 1259 OID 119842)
-- Name: quejas_oficios_autoridad_id_oficio_autoridad_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.quejas_oficios_autoridad_id_oficio_autoridad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.quejas_oficios_autoridad_id_oficio_autoridad_seq OWNER TO postgres;

--
-- TOC entry 5935 (class 0 OID 0)
-- Dependencies: 348
-- Name: quejas_oficios_autoridad_id_oficio_autoridad_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.quejas_oficios_autoridad_id_oficio_autoridad_seq OWNED BY sustantiva.quejas_oficios_autoridad.id_oficio_autoridad;


--
-- TOC entry 349 (class 1259 OID 119843)
-- Name: quejas_respuestas_autoridad; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.quejas_respuestas_autoridad (
    id_respuesta_autoridad bigint NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_queja integer,
    folio_expediente character varying(255),
    numero_oficio character varying(255),
    id_autoridad integer,
    nombre_titular character varying(255),
    adjunto character varying(500),
    observaciones character varying(255),
    decision character varying(255),
    fecha_oficio timestamp(6) without time zone,
    ruta_pdf_informe character varying(255)
);


ALTER TABLE sustantiva.quejas_respuestas_autoridad OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 119849)
-- Name: quejas_respuestas_autoridad_id_respuesta_autoridad_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.quejas_respuestas_autoridad_id_respuesta_autoridad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.quejas_respuestas_autoridad_id_respuesta_autoridad_seq OWNER TO postgres;

--
-- TOC entry 5936 (class 0 OID 0)
-- Dependencies: 350
-- Name: quejas_respuestas_autoridad_id_respuesta_autoridad_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.quejas_respuestas_autoridad_id_respuesta_autoridad_seq OWNED BY sustantiva.quejas_respuestas_autoridad.id_respuesta_autoridad;


--
-- TOC entry 351 (class 1259 OID 119850)
-- Name: recurso_revision; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.recurso_revision (
    id_recurso_revision integer NOT NULL,
    id_sentencia integer NOT NULL,
    numero_oficio_interposicion character varying(100) NOT NULL,
    numero_expediente_revision character varying(100),
    tribunal_colegiado_asig character varying(255),
    fecha_interposicion date NOT NULL,
    observaciones_seguimiento character varying(500),
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    ruta_pdf_oficio character varying(500)
);


ALTER TABLE sustantiva.recurso_revision OWNER TO postgres;

--
-- TOC entry 5937 (class 0 OID 0)
-- Dependencies: 351
-- Name: TABLE recurso_revision; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON TABLE sustantiva.recurso_revision IS 'Seguimiento judicial del trámite del Recurso de Revisión ante el Tribunal Colegiado.';


--
-- TOC entry 5938 (class 0 OID 0)
-- Dependencies: 351
-- Name: COLUMN recurso_revision.ruta_pdf_oficio; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON COLUMN sustantiva.recurso_revision.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF del recurso de revisión.';


--
-- TOC entry 352 (class 1259 OID 119856)
-- Name: recurso_revision_id_recurso_revision_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.recurso_revision_id_recurso_revision_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.recurso_revision_id_recurso_revision_seq OWNER TO postgres;

--
-- TOC entry 5939 (class 0 OID 0)
-- Dependencies: 352
-- Name: recurso_revision_id_recurso_revision_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.recurso_revision_id_recurso_revision_seq OWNED BY sustantiva.recurso_revision.id_recurso_revision;


--
-- TOC entry 353 (class 1259 OID 119857)
-- Name: representacion_legal; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.representacion_legal (
    id integer NOT NULL,
    id_expediente integer,
    id_resolucion_final integer,
    id_queja_origen integer,
    es_evolucion boolean DEFAULT false NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_estatus integer
);


ALTER TABLE sustantiva.representacion_legal OWNER TO postgres;

--
-- TOC entry 354 (class 1259 OID 119862)
-- Name: representacion_legal_id_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.representacion_legal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.representacion_legal_id_seq OWNER TO postgres;

--
-- TOC entry 5940 (class 0 OID 0)
-- Dependencies: 354
-- Name: representacion_legal_id_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.representacion_legal_id_seq OWNED BY sustantiva.representacion_legal.id;


--
-- TOC entry 355 (class 1259 OID 119863)
-- Name: resolucion_final; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.resolucion_final (
    id_resolucion_final integer NOT NULL,
    fecha_emision_resolucion date NOT NULL,
    concepto_cobro character varying(255),
    contacto_via character varying(100),
    numero_credito integer,
    folio_credito character varying(50),
    id_expediente integer NOT NULL,
    id_ari integer NOT NULL,
    id_queja_respuesta_autoridad bigint NOT NULL,
    id_estatus_queja integer NOT NULL,
    ruta_resolucion_final character varying(500),
    fecha_emision timestamp(6) without time zone,
    id_estatus_expediente integer NOT NULL
);


ALTER TABLE sustantiva.resolucion_final OWNER TO postgres;

--
-- TOC entry 356 (class 1259 OID 119868)
-- Name: resolucion_final_id_resolucion_final_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.resolucion_final_id_resolucion_final_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.resolucion_final_id_resolucion_final_seq OWNER TO postgres;

--
-- TOC entry 5941 (class 0 OID 0)
-- Dependencies: 356
-- Name: resolucion_final_id_resolucion_final_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.resolucion_final_id_resolucion_final_seq OWNED BY sustantiva.resolucion_final.id_resolucion_final;


--
-- TOC entry 357 (class 1259 OID 119869)
-- Name: rl_cir; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.rl_cir (
    id_rl_cir bigint NOT NULL,
    id_expediente bigint NOT NULL,
    fecha_emision timestamp(6) without time zone NOT NULL,
    motivos text,
    articulos text,
    observaciones text,
    id_asesor_remitente bigint NOT NULL,
    id_asesor_recibe bigint NOT NULL,
    director character varying(255),
    ruta_pdf_rl_cir character varying(255)
);


ALTER TABLE sustantiva.rl_cir OWNER TO postgres;

--
-- TOC entry 358 (class 1259 OID 119874)
-- Name: rl_cir_id_rl_cir_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.rl_cir_id_rl_cir_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.rl_cir_id_rl_cir_seq OWNER TO postgres;

--
-- TOC entry 5942 (class 0 OID 0)
-- Dependencies: 358
-- Name: rl_cir_id_rl_cir_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.rl_cir_id_rl_cir_seq OWNED BY sustantiva.rl_cir.id_rl_cir;


--
-- TOC entry 359 (class 1259 OID 119875)
-- Name: sentencia_dictada; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.sentencia_dictada (
    id_sentencia integer NOT NULL,
    id_audiencia_celebrada integer NOT NULL,
    fecha_dictado date NOT NULL,
    fecha_notificacion_sentencia date NOT NULL,
    sentido_fallo character varying(255) NOT NULL,
    puntos_resolutivos text NOT NULL,
    numero_oficio_sentencia character varying(100),
    ruta_archivo_sentencia character varying(500),
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    ruta_pdf_oficio character varying(500)
);


ALTER TABLE sustantiva.sentencia_dictada OWNER TO postgres;

--
-- TOC entry 5943 (class 0 OID 0)
-- Dependencies: 359
-- Name: TABLE sentencia_dictada; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON TABLE sustantiva.sentencia_dictada IS 'Guarda el fallo final del juez, sentidos de resolución y documentos adjuntos de la sentencia dictada.';


--
-- TOC entry 5944 (class 0 OID 0)
-- Dependencies: 359
-- Name: COLUMN sentencia_dictada.ruta_pdf_oficio; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON COLUMN sustantiva.sentencia_dictada.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF de la sentencia.';


--
-- TOC entry 360 (class 1259 OID 119881)
-- Name: sentencia_dictada_id_sentencia_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.sentencia_dictada_id_sentencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.sentencia_dictada_id_sentencia_seq OWNER TO postgres;

--
-- TOC entry 5945 (class 0 OID 0)
-- Dependencies: 360
-- Name: sentencia_dictada_id_sentencia_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.sentencia_dictada_id_sentencia_seq OWNED BY sustantiva.sentencia_dictada.id_sentencia;


--
-- TOC entry 361 (class 1259 OID 119882)
-- Name: sentencia_ejecutoria; Type: TABLE; Schema: sustantiva; Owner: postgres
--

CREATE TABLE sustantiva.sentencia_ejecutoria (
    id_sentencia_ejecutoria integer NOT NULL,
    id_sentencia integer NOT NULL,
    id_recurso_revision integer,
    numero_oficio_ejecutoria character varying(100) NOT NULL,
    fecha_declaracion_ejecutoria date NOT NULL,
    requerimiento_cumplimiento character varying(500),
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    ruta_pdf_oficio character varying(500)
);


ALTER TABLE sustantiva.sentencia_ejecutoria OWNER TO postgres;

--
-- TOC entry 5946 (class 0 OID 0)
-- Dependencies: 361
-- Name: TABLE sentencia_ejecutoria; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON TABLE sustantiva.sentencia_ejecutoria IS 'Registra el momento en que la sentencia queda firme (Ejecutoria), ya sea por plazo o por resolución del recurso.';


--
-- TOC entry 5947 (class 0 OID 0)
-- Dependencies: 361
-- Name: COLUMN sentencia_ejecutoria.ruta_pdf_oficio; Type: COMMENT; Schema: sustantiva; Owner: postgres
--

COMMENT ON COLUMN sustantiva.sentencia_ejecutoria.ruta_pdf_oficio IS 'Ruta de almacenamiento del documento PDF del oficio de la ejecutoria.';


--
-- TOC entry 362 (class 1259 OID 119888)
-- Name: sentencia_ejecutoria_id_sentencia_ejecutoria_seq; Type: SEQUENCE; Schema: sustantiva; Owner: postgres
--

CREATE SEQUENCE sustantiva.sentencia_ejecutoria_id_sentencia_ejecutoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sustantiva.sentencia_ejecutoria_id_sentencia_ejecutoria_seq OWNER TO postgres;

--
-- TOC entry 5948 (class 0 OID 0)
-- Dependencies: 362
-- Name: sentencia_ejecutoria_id_sentencia_ejecutoria_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: postgres
--

ALTER SEQUENCE sustantiva.sentencia_ejecutoria_id_sentencia_ejecutoria_seq OWNED BY sustantiva.sentencia_ejecutoria.id_sentencia_ejecutoria;


--
-- TOC entry 5093 (class 2604 OID 119889)
-- Name: areas id_area; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.areas ALTER COLUMN id_area SET DEFAULT nextval('catalogos.areas_id_area_seq'::regclass);


--
-- TOC entry 5094 (class 2604 OID 119890)
-- Name: autoridades id_autoridad; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.autoridades ALTER COLUMN id_autoridad SET DEFAULT nextval('catalogos.autoridades_id_autoridad_seq'::regclass);


--
-- TOC entry 5095 (class 2604 OID 119891)
-- Name: cat_autoridades id_cat_autoridad; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_autoridades ALTER COLUMN id_cat_autoridad SET DEFAULT nextval('catalogos.cat_autoridades_id_cat_autoridad_seq'::regclass);


--
-- TOC entry 5096 (class 2604 OID 119892)
-- Name: cat_estados id_estado; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_estados ALTER COLUMN id_estado SET DEFAULT nextval('catalogos.cat_estados_id_estado_seq'::regclass);


--
-- TOC entry 5097 (class 2604 OID 119893)
-- Name: cat_estatus id_estatus; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_estatus ALTER COLUMN id_estatus SET DEFAULT nextval('catalogos.cat_estatus_id_estatus_seq'::regclass);


--
-- TOC entry 5098 (class 2604 OID 119894)
-- Name: cat_estatus_queja id_estatus_queja; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_estatus_queja ALTER COLUMN id_estatus_queja SET DEFAULT nextval('catalogos.cat_estatus_queja_id_estatus_queja_seq'::regclass);


--
-- TOC entry 5100 (class 2604 OID 119895)
-- Name: cat_estatus_sustantiva id_cat_estatus_sustantiva; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_estatus_sustantiva ALTER COLUMN id_cat_estatus_sustantiva SET DEFAULT nextval('catalogos.cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq'::regclass);


--
-- TOC entry 5101 (class 2604 OID 119896)
-- Name: cat_municipios id_municipio; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_municipios ALTER COLUMN id_municipio SET DEFAULT nextval('catalogos.cat_municipios_id_municipio_seq'::regclass);


--
-- TOC entry 5102 (class 2604 OID 119897)
-- Name: cat_tipo_proceso id_cat_tipo_proceso; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_tipo_proceso ALTER COLUMN id_cat_tipo_proceso SET DEFAULT nextval('catalogos.cat_tipo_proceso_id_cat_tipo_proceso_seq'::regclass);


--
-- TOC entry 5103 (class 2604 OID 119898)
-- Name: control_folios_config id_control_folios_config; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.control_folios_config ALTER COLUMN id_control_folios_config SET DEFAULT nextval('catalogos.control_folios_config_id_control_folios_config_seq'::regclass);


--
-- TOC entry 5105 (class 2604 OID 119899)
-- Name: dias_inhabiles id_dia_inhabil; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.dias_inhabiles ALTER COLUMN id_dia_inhabil SET DEFAULT nextval('catalogos.dias_inhabiles_id_dia_inhabil_seq'::regclass);


--
-- TOC entry 5107 (class 2604 OID 119900)
-- Name: direcciones id_direccion; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.direcciones ALTER COLUMN id_direccion SET DEFAULT nextval('catalogos.direcciones_id_direccion_seq'::regclass);


--
-- TOC entry 5108 (class 2604 OID 119901)
-- Name: empleados id_empleado; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.empleados ALTER COLUMN id_empleado SET DEFAULT nextval('catalogos.empleados_id_empleado_seq'::regclass);


--
-- TOC entry 5109 (class 2604 OID 119902)
-- Name: estatus_detalle_expediente id_estatus_detalle_expediente; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.estatus_detalle_expediente ALTER COLUMN id_estatus_detalle_expediente SET DEFAULT nextval('catalogos.estatus_detalle_expediente_id_estatus_detalle_expediente_seq'::regclass);


--
-- TOC entry 5110 (class 2604 OID 119903)
-- Name: estatus_expediente id_estatus_expediente; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.estatus_expediente ALTER COLUMN id_estatus_expediente SET DEFAULT nextval('catalogos.estatus_expediente_id_estatus_expediente_seq'::regclass);


--
-- TOC entry 5111 (class 2604 OID 119904)
-- Name: estatus_representacion_legal id_estatus; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.estatus_representacion_legal ALTER COLUMN id_estatus SET DEFAULT nextval('catalogos.estatus_representacion_legal_id_estatus_seq'::regclass);


--
-- TOC entry 5113 (class 2604 OID 119905)
-- Name: personal id_personal; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.personal ALTER COLUMN id_personal SET DEFAULT nextval('catalogos.personal_id_personal_seq'::regclass);


--
-- TOC entry 5116 (class 2604 OID 119906)
-- Name: personas id_persona; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.personas ALTER COLUMN id_persona SET DEFAULT nextval('catalogos.personas_id_persona_seq'::regclass);


--
-- TOC entry 5229 (class 2604 OID 121007)
-- Name: refresh_tokens id; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('catalogos.refresh_tokens_id_seq'::regclass);


--
-- TOC entry 5118 (class 2604 OID 119907)
-- Name: roles id_rol; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.roles ALTER COLUMN id_rol SET DEFAULT nextval('catalogos.roles_id_rol_seq'::regclass);


--
-- TOC entry 5120 (class 2604 OID 119908)
-- Name: tipo_acto_emitido id_tipo_acto_emitido; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_acto_emitido ALTER COLUMN id_tipo_acto_emitido SET DEFAULT nextval('catalogos.tipo_acto_emitido_id_tipo_acto_emitido_seq'::regclass);


--
-- TOC entry 5121 (class 2604 OID 119909)
-- Name: tipo_correspondencia id_tipo_correspondencia; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_correspondencia ALTER COLUMN id_tipo_correspondencia SET DEFAULT nextval('catalogos.tipo_correspondencia_id_tipo_correspondencia_seq'::regclass);


--
-- TOC entry 5122 (class 2604 OID 119910)
-- Name: tipo_entrada id_tipo_entrada; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_entrada ALTER COLUMN id_tipo_entrada SET DEFAULT nextval('catalogos.tipo_entrada_id_tipo_entrada_seq'::regclass);


--
-- TOC entry 5123 (class 2604 OID 119911)
-- Name: tipo_persona id_tipo_persona; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_persona ALTER COLUMN id_tipo_persona SET DEFAULT nextval('catalogos.tipo_persona_id_tipo_persona_seq'::regclass);


--
-- TOC entry 5124 (class 2604 OID 119912)
-- Name: tipo_tramite id_tipo_tramite; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_tramite ALTER COLUMN id_tipo_tramite SET DEFAULT nextval('catalogos.tipo_tramite_id_tipo_tramite_seq'::regclass);


--
-- TOC entry 5232 (class 2604 OID 121023)
-- Name: user_sessions id; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.user_sessions ALTER COLUMN id SET DEFAULT nextval('catalogos.user_sessions_id_seq'::regclass);


--
-- TOC entry 5125 (class 2604 OID 119913)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('catalogos.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 5129 (class 2604 OID 119914)
-- Name: usuarios_roles id_usuario_rol; Type: DEFAULT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios_roles ALTER COLUMN id_usuario_rol SET DEFAULT nextval('catalogos.usuarios_roles_id_usuario_rol_seq'::regclass);


--
-- TOC entry 5131 (class 2604 OID 119915)
-- Name: acuse_correspondencia id_acuse_correspondencia; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia ALTER COLUMN id_acuse_correspondencia SET DEFAULT nextval('correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq'::regclass);


--
-- TOC entry 5132 (class 2604 OID 119916)
-- Name: acuse_memorandum id_acuse; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_memorandum ALTER COLUMN id_acuse SET DEFAULT nextval('correspondencia.acuserecibointerno_id_acuse_seq'::regclass);


--
-- TOC entry 5133 (class 2604 OID 119917)
-- Name: acuse_oficio id_acuse_oficio; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_oficio ALTER COLUMN id_acuse_oficio SET DEFAULT nextval('correspondencia.acuse_oficio_id_acuse_oficio_seq'::regclass);


--
-- TOC entry 5134 (class 2604 OID 119918)
-- Name: alertas_seguimiento id_alerta; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento ALTER COLUMN id_alerta SET DEFAULT nextval('correspondencia.alertas_seguimiento_id_alerta_seq'::regclass);


--
-- TOC entry 5137 (class 2604 OID 119919)
-- Name: archivos_adjuntos id_archivo; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos ALTER COLUMN id_archivo SET DEFAULT nextval('correspondencia.archivos_adjuntos_id_archivo_seq'::regclass);


--
-- TOC entry 5139 (class 2604 OID 119920)
-- Name: auditoria_correspondencia id_log; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia ALTER COLUMN id_log SET DEFAULT nextval('correspondencia.auditoria_correspondencia_id_log_seq'::regclass);


--
-- TOC entry 5141 (class 2604 OID 119921)
-- Name: correspondencia id_correspondencia; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia ALTER COLUMN id_correspondencia SET DEFAULT nextval('correspondencia.correspondencia_id_folio_seq'::regclass);


--
-- TOC entry 5143 (class 2604 OID 119922)
-- Name: correspondencia_respuestas id_respuesta; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas ALTER COLUMN id_respuesta SET DEFAULT nextval('correspondencia.correspondencia_respuestas_id_respuesta_seq'::regclass);


--
-- TOC entry 5144 (class 2604 OID 119923)
-- Name: correspondencia_turnos id_turno; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos ALTER COLUMN id_turno SET DEFAULT nextval('correspondencia.correspondencia_turnos_id_turno_seq'::regclass);


--
-- TOC entry 5146 (class 2604 OID 119924)
-- Name: memorandums id_memo; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.memorandums ALTER COLUMN id_memo SET DEFAULT nextval('correspondencia.memorandums_id_memo_seq'::regclass);


--
-- TOC entry 5148 (class 2604 OID 119925)
-- Name: notificaciones id_notificacion; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.notificaciones ALTER COLUMN id_notificacion SET DEFAULT nextval('correspondencia.notificaciones_id_notificacion_seq'::regclass);


--
-- TOC entry 5151 (class 2604 OID 119926)
-- Name: oficio id_oficio; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio ALTER COLUMN id_oficio SET DEFAULT nextval('correspondencia.oficio_id_oficio_seq'::regclass);


--
-- TOC entry 5152 (class 2604 OID 119927)
-- Name: oficio_contestacion id_contestacion; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio_contestacion ALTER COLUMN id_contestacion SET DEFAULT nextval('correspondencia.oficio_contestacion_id_contestacion_seq'::regclass);


--
-- TOC entry 5155 (class 2604 OID 119928)
-- Name: oficio_contestacion_externa id_oficio_contestacion; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa ALTER COLUMN id_oficio_contestacion SET DEFAULT nextval('correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq'::regclass);


--
-- TOC entry 5157 (class 2604 OID 119929)
-- Name: plantilla_memorandum id_plantilla; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.plantilla_memorandum ALTER COLUMN id_plantilla SET DEFAULT nextval('correspondencia.plantilla_memorandum_id_plantilla_seq'::regclass);


--
-- TOC entry 5160 (class 2604 OID 119930)
-- Name: seguimiento_correspondencia id_seguimiento_correspondencia; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia ALTER COLUMN id_seguimiento_correspondencia SET DEFAULT nextval('correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq'::regclass);


--
-- TOC entry 5162 (class 2604 OID 119931)
-- Name: seguimiento_memorandum id_seguimiento_memorandum; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum ALTER COLUMN id_seguimiento_memorandum SET DEFAULT nextval('correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq'::regclass);


--
-- TOC entry 5163 (class 2604 OID 119932)
-- Name: seguimiento_memorandum folio_respuesta; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum ALTER COLUMN folio_respuesta SET DEFAULT nextval('correspondencia.seguimiento_memorandum_folio_respuesta_seq'::regclass);


--
-- TOC entry 5165 (class 2604 OID 119933)
-- Name: seguimiento_oficio id_seguimiento_oficio; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio ALTER COLUMN id_seguimiento_oficio SET DEFAULT nextval('correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq'::regclass);


--
-- TOC entry 5166 (class 2604 OID 119934)
-- Name: seguimiento_oficio folio_respuesta; Type: DEFAULT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio ALTER COLUMN folio_respuesta SET DEFAULT nextval('correspondencia.seguimiento_oficio_folio_respuesta_seq'::regclass);


--
-- TOC entry 5167 (class 2604 OID 119935)
-- Name: asesores id_asesores; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.asesores ALTER COLUMN id_asesores SET DEFAULT nextval('sustantiva.asesores_id_asesores_seq'::regclass);


--
-- TOC entry 5171 (class 2604 OID 119936)
-- Name: audiencia_celebrada id_audiencia_celebrada; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.audiencia_celebrada ALTER COLUMN id_audiencia_celebrada SET DEFAULT nextval('sustantiva.audiencia_celebrada_id_audiencia_celebrada_seq'::regclass);


--
-- TOC entry 5174 (class 2604 OID 119937)
-- Name: audiencia_espera id_audiencia_espera; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.audiencia_espera ALTER COLUMN id_audiencia_espera SET DEFAULT nextval('sustantiva.audiencia_espera_id_audiencia_espera_seq'::regclass);


--
-- TOC entry 5176 (class 2604 OID 119938)
-- Name: bitacora_asignacion id_bitacora; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.bitacora_asignacion ALTER COLUMN id_bitacora SET DEFAULT nextval('sustantiva.bitacora_asignacion_id_bitacora_seq'::regclass);


--
-- TOC entry 5178 (class 2604 OID 119939)
-- Name: cierre_expediente id_cierre; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.cierre_expediente ALTER COLUMN id_cierre SET DEFAULT nextval('sustantiva.cierre_expediente_id_cierre_seq'::regclass);


--
-- TOC entry 5180 (class 2604 OID 119940)
-- Name: contribuyentes id_contribuyentes; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.contribuyentes ALTER COLUMN id_contribuyentes SET DEFAULT nextval('sustantiva.contribuyentes_id_contribuyentes_seq'::regclass);


--
-- TOC entry 5182 (class 2604 OID 119941)
-- Name: detalle_asesoria id_detalle_asesoria; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.detalle_asesoria ALTER COLUMN id_detalle_asesoria SET DEFAULT nextval('sustantiva.detalle_asesoria_id_detalle_asesoria_seq'::regclass);


--
-- TOC entry 5183 (class 2604 OID 119942)
-- Name: expedientes id_expediente; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.expedientes ALTER COLUMN id_expediente SET DEFAULT nextval('sustantiva.expedientes_id_expediente_seq'::regclass);


--
-- TOC entry 5187 (class 2604 OID 119943)
-- Name: irl_demanda_amparo id_demanda_amparo; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.irl_demanda_amparo ALTER COLUMN id_demanda_amparo SET DEFAULT nextval('sustantiva.irl_demanda_amparo_id_demanda_amparo_seq'::regclass);


--
-- TOC entry 5191 (class 2604 OID 119944)
-- Name: notificacion_sentencia_cumplida id_sentencia_cumplida; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.notificacion_sentencia_cumplida ALTER COLUMN id_sentencia_cumplida SET DEFAULT nextval('sustantiva.notificacion_sentencia_cumplida_id_sentencia_cumplida_seq'::regclass);


--
-- TOC entry 5193 (class 2604 OID 119945)
-- Name: oficio_notificacion id_oficio_notificacion; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.oficio_notificacion ALTER COLUMN id_oficio_notificacion SET DEFAULT nextval('sustantiva.oficio_notificacion_id_oficio_notificacion_seq'::regclass);


--
-- TOC entry 5195 (class 2604 OID 119946)
-- Name: plantilla_queja_ari id_plantilla; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.plantilla_queja_ari ALTER COLUMN id_plantilla SET DEFAULT nextval('sustantiva.plantilla_queja_ari_id_plantilla_seq'::regclass);


--
-- TOC entry 5198 (class 2604 OID 119947)
-- Name: queja_rl_cir id_queja_rl_cir; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.queja_rl_cir ALTER COLUMN id_queja_rl_cir SET DEFAULT nextval('sustantiva.queja_rl_cir_id_queja_rl_cir_seq'::regclass);


--
-- TOC entry 5199 (class 2604 OID 119948)
-- Name: quejas id_queja; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas ALTER COLUMN id_queja SET DEFAULT nextval('sustantiva.quejas_id_queja_seq'::regclass);


--
-- TOC entry 5207 (class 2604 OID 119949)
-- Name: quejas_acci id_acci; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_acci ALTER COLUMN id_acci SET DEFAULT nextval('sustantiva.quejas_acci_id_acci_seq'::regclass);


--
-- TOC entry 5211 (class 2604 OID 119950)
-- Name: quejas_ari id_ari; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_ari ALTER COLUMN id_ari SET DEFAULT nextval('sustantiva.quejas_ari_id_ari_seq'::regclass);


--
-- TOC entry 5213 (class 2604 OID 119951)
-- Name: quejas_cir id_cir; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_cir ALTER COLUMN id_cir SET DEFAULT nextval('sustantiva.quejas_cir_id_cir_seq'::regclass);


--
-- TOC entry 5215 (class 2604 OID 119952)
-- Name: quejas_oficios_autoridad id_oficio_autoridad; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_oficios_autoridad ALTER COLUMN id_oficio_autoridad SET DEFAULT nextval('sustantiva.quejas_oficios_autoridad_id_oficio_autoridad_seq'::regclass);


--
-- TOC entry 5216 (class 2604 OID 119953)
-- Name: quejas_respuestas_autoridad id_respuesta_autoridad; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_respuestas_autoridad ALTER COLUMN id_respuesta_autoridad SET DEFAULT nextval('sustantiva.quejas_respuestas_autoridad_id_respuesta_autoridad_seq'::regclass);


--
-- TOC entry 5218 (class 2604 OID 119954)
-- Name: recurso_revision id_recurso_revision; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.recurso_revision ALTER COLUMN id_recurso_revision SET DEFAULT nextval('sustantiva.recurso_revision_id_recurso_revision_seq'::regclass);


--
-- TOC entry 5220 (class 2604 OID 119955)
-- Name: representacion_legal id; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.representacion_legal ALTER COLUMN id SET DEFAULT nextval('sustantiva.representacion_legal_id_seq'::regclass);


--
-- TOC entry 5223 (class 2604 OID 119956)
-- Name: resolucion_final id_resolucion_final; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.resolucion_final ALTER COLUMN id_resolucion_final SET DEFAULT nextval('sustantiva.resolucion_final_id_resolucion_final_seq'::regclass);


--
-- TOC entry 5224 (class 2604 OID 119957)
-- Name: rl_cir id_rl_cir; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.rl_cir ALTER COLUMN id_rl_cir SET DEFAULT nextval('sustantiva.rl_cir_id_rl_cir_seq'::regclass);


--
-- TOC entry 5225 (class 2604 OID 119958)
-- Name: sentencia_dictada id_sentencia; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.sentencia_dictada ALTER COLUMN id_sentencia SET DEFAULT nextval('sustantiva.sentencia_dictada_id_sentencia_seq'::regclass);


--
-- TOC entry 5227 (class 2604 OID 119959)
-- Name: sentencia_ejecutoria id_sentencia_ejecutoria; Type: DEFAULT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.sentencia_ejecutoria ALTER COLUMN id_sentencia_ejecutoria SET DEFAULT nextval('sustantiva.sentencia_ejecutoria_id_sentencia_ejecutoria_seq'::regclass);


--
-- TOC entry 5705 (class 0 OID 119454)
-- Dependencies: 219
-- Data for Name: areas; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.areas VALUES (1, 'Correspondencia', NULL);
INSERT INTO catalogos.areas VALUES (2, 'Planeación', NULL);
INSERT INTO catalogos.areas VALUES (3, 'Jurídica', NULL);
INSERT INTO catalogos.areas VALUES (4, 'Transparencia', NULL);
INSERT INTO catalogos.areas VALUES (5, 'Administrativa', NULL);
INSERT INTO catalogos.areas VALUES (6, 'Archivo', NULL);
INSERT INTO catalogos.areas VALUES (7, 'Recursos Materiales', NULL);


--
-- TOC entry 5707 (class 0 OID 119460)
-- Dependencies: 221
-- Data for Name: autoridades; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.autoridades VALUES (1, 'Junta Intermunicipal de Agua Potable y Alcantarillado de Zacatecas (JIAPAZ)');
INSERT INTO catalogos.autoridades VALUES (2, 'Secretaría de Finanzas del Estado de Zacatecas (SEFIN)');
INSERT INTO catalogos.autoridades VALUES (3, 'Secretaría General de Gobierno');
INSERT INTO catalogos.autoridades VALUES (4, 'Secretaría de Seguridad Pública');
INSERT INTO catalogos.autoridades VALUES (5, 'Secretaría de Administración');
INSERT INTO catalogos.autoridades VALUES (6, 'Secretaría de la Función Pública');
INSERT INTO catalogos.autoridades VALUES (7, 'Secretaría de Infraestructura (SINFRA)');
INSERT INTO catalogos.autoridades VALUES (8, 'Secretaría de Economía');
INSERT INTO catalogos.autoridades VALUES (9, 'Secretaría de Educación de Zacatecas (SEDUZAC)');
INSERT INTO catalogos.autoridades VALUES (10, 'Secretaría de Salud de Zacatecas (SSZ)');
INSERT INTO catalogos.autoridades VALUES (11, 'Secretaría de Desarrollo Urbano, Vivienda y Ordenamiento Territorial (SEDUVOT)');
INSERT INTO catalogos.autoridades VALUES (12, 'Secretaría de Agua y Medio Ambiente (SAMA)');
INSERT INTO catalogos.autoridades VALUES (13, 'H. Ayuntamiento de Zacatecas');
INSERT INTO catalogos.autoridades VALUES (14, 'H. Ayuntamiento de Guadalupe');
INSERT INTO catalogos.autoridades VALUES (15, 'H. Ayuntamiento de Fresnillo');
INSERT INTO catalogos.autoridades VALUES (16, 'H. Ayuntamiento de Jerez');
INSERT INTO catalogos.autoridades VALUES (17, 'H. Ayuntamiento de Calera');
INSERT INTO catalogos.autoridades VALUES (18, 'H. Ayuntamiento de Sombrerete');
INSERT INTO catalogos.autoridades VALUES (19, 'H. Ayuntamiento de Rio Grande');
INSERT INTO catalogos.autoridades VALUES (20, 'H. Ayuntamiento de Jalpa');
INSERT INTO catalogos.autoridades VALUES (21, 'H. Ayuntamiento de Juchipila');
INSERT INTO catalogos.autoridades VALUES (22, 'H. Ayuntamiento de Ojocaliente');
INSERT INTO catalogos.autoridades VALUES (23, 'H. Ayuntamiento de Noctistlán de Juárez');


--
-- TOC entry 5709 (class 0 OID 119464)
-- Dependencies: 223
-- Data for Name: cat_autoridades; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.cat_autoridades VALUES (1, 'Junta Intermunicipal de Agua Potable y Alcantarillado de Zacatecas (JIAPAZ)');
INSERT INTO catalogos.cat_autoridades VALUES (2, 'Secretaría de Finanzas del Estado de Zacatecas (SEFIN)');
INSERT INTO catalogos.cat_autoridades VALUES (3, 'Secretaría General de Gobierno');
INSERT INTO catalogos.cat_autoridades VALUES (4, 'Secretaría de Seguridad Pública');
INSERT INTO catalogos.cat_autoridades VALUES (5, 'Secretaría de Administración');
INSERT INTO catalogos.cat_autoridades VALUES (6, 'Secretaría de la Función Pública');
INSERT INTO catalogos.cat_autoridades VALUES (7, 'Secretaría de Infraestructura (SINFRA)');
INSERT INTO catalogos.cat_autoridades VALUES (8, 'Secretaría de Economía');
INSERT INTO catalogos.cat_autoridades VALUES (9, 'Secretaría de Educación de Zacatecas (SEDUZAC)');
INSERT INTO catalogos.cat_autoridades VALUES (10, 'Secretaría de Salud de Zacatecas (SSZ)');
INSERT INTO catalogos.cat_autoridades VALUES (11, 'Secretaría de Desarrollo Urbano, Vivienda y Ordenamiento Territorial (SEDUVOT)');
INSERT INTO catalogos.cat_autoridades VALUES (12, 'Secretaría de Agua y Medio Ambiente (SAMA)');
INSERT INTO catalogos.cat_autoridades VALUES (13, 'H. Ayuntamiento de Zacatecas');
INSERT INTO catalogos.cat_autoridades VALUES (14, 'H. Ayuntamiento de Guadalupe');
INSERT INTO catalogos.cat_autoridades VALUES (15, 'H. Ayuntamiento de Fresnillo');
INSERT INTO catalogos.cat_autoridades VALUES (16, 'H. Ayuntamiento de Jerez');
INSERT INTO catalogos.cat_autoridades VALUES (17, 'H. Ayuntamiento de Calera');
INSERT INTO catalogos.cat_autoridades VALUES (18, 'H. Ayuntamiento de Sombrerete');
INSERT INTO catalogos.cat_autoridades VALUES (19, 'H. Ayuntamiento de Rio Grande');
INSERT INTO catalogos.cat_autoridades VALUES (20, 'H. Ayuntamiento de Jalpa');
INSERT INTO catalogos.cat_autoridades VALUES (21, 'H. Ayuntamiento de Juchipila');
INSERT INTO catalogos.cat_autoridades VALUES (22, 'H. Ayuntamiento de Ojocaliente');
INSERT INTO catalogos.cat_autoridades VALUES (23, 'H. Ayuntamiento de Noctistlán de Juárez');


--
-- TOC entry 5711 (class 0 OID 119468)
-- Dependencies: 225
-- Data for Name: cat_estados; Type: TABLE DATA; Schema: catalogos; Owner: postgres
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
-- TOC entry 5713 (class 0 OID 119472)
-- Dependencies: 227
-- Data for Name: cat_estatus; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.cat_estatus VALUES (1, 'REGISTRADO', 'Existe el folio y el PDF, pero está en revisión de calidad.');
INSERT INTO catalogos.cat_estatus VALUES (2, 'VALIDADO', 'Validación por el administrador.');
INSERT INTO catalogos.cat_estatus VALUES (3, 'ASIGNADO', 'Tiene instrucción (Memo) y área asignada. (Archivo original bloqueado).');
INSERT INTO catalogos.cat_estatus VALUES (4, 'EN SEGUIMIENTO', 'El área ya confirmó que lo recibió en su buzón.');
INSERT INTO catalogos.cat_estatus VALUES (5, 'ATENDIDO', 'El área ya subió su informe y respuesta digitalizada.');
INSERT INTO catalogos.cat_estatus VALUES (6, 'CONCLUIDO', 'El administrador validó todo y el trámite se archiva.');


--
-- TOC entry 5715 (class 0 OID 119478)
-- Dependencies: 229
-- Data for Name: cat_estatus_queja; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.cat_estatus_queja VALUES (1, 'Asignada a Asesor', true, 1);
INSERT INTO catalogos.cat_estatus_queja VALUES (2, 'En Validación de Requisitos', true, 2);
INSERT INTO catalogos.cat_estatus_queja VALUES (3, 'CIR Generada (Constancia Interna de Remisión)', true, 3);
INSERT INTO catalogos.cat_estatus_queja VALUES (4, 'ARI Generado (Acuerdo con Requerimiento de Informe)', true, 4);
INSERT INTO catalogos.cat_estatus_queja VALUES (5, 'Oficio de Notificación Emitido', true, 5);
INSERT INTO catalogos.cat_estatus_queja VALUES (6, 'Contestación de Autoridad Recibida', true, 6);
INSERT INTO catalogos.cat_estatus_queja VALUES (7, 'ACCI Generado (Acuerdo de Informe de Investigación)', true, 7);
INSERT INTO catalogos.cat_estatus_queja VALUES (8, 'Informe de Resolución Emitido', true, 8);
INSERT INTO catalogos.cat_estatus_queja VALUES (9, 'En Proceso de Notificación Final', true, 9);
INSERT INTO catalogos.cat_estatus_queja VALUES (10, 'Cerrada / Concluida', true, 10);


--
-- TOC entry 5717 (class 0 OID 119483)
-- Dependencies: 231
-- Data for Name: cat_estatus_sustantiva; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--



--
-- TOC entry 5719 (class 0 OID 119487)
-- Dependencies: 233
-- Data for Name: cat_municipios; Type: TABLE DATA; Schema: catalogos; Owner: postgres
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
-- TOC entry 5721 (class 0 OID 119491)
-- Dependencies: 235
-- Data for Name: cat_tipo_proceso; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--



--
-- TOC entry 5723 (class 0 OID 119495)
-- Dependencies: 237
-- Data for Name: control_folios_config; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--



--
-- TOC entry 5725 (class 0 OID 119500)
-- Dependencies: 239
-- Data for Name: dias_inhabiles; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.dias_inhabiles VALUES (1, '2026-01-01', 'Año Nuevo', true);
INSERT INTO catalogos.dias_inhabiles VALUES (2, '2026-02-03', 'Aniversario Constitución', true);
INSERT INTO catalogos.dias_inhabiles VALUES (3, '2026-03-21', 'Natalicio Benito Juárez', true);
INSERT INTO catalogos.dias_inhabiles VALUES (4, '2026-05-01', 'Día del Trabajo', true);
INSERT INTO catalogos.dias_inhabiles VALUES (5, '2026-09-16', 'Independencia de México', true);
INSERT INTO catalogos.dias_inhabiles VALUES (6, '2026-11-02', 'Día de Muertos', true);
INSERT INTO catalogos.dias_inhabiles VALUES (7, '2026-11-16', 'Revolución Mexicana', true);
INSERT INTO catalogos.dias_inhabiles VALUES (8, '2026-12-25', 'Navidad', true);


--
-- TOC entry 5727 (class 0 OID 119505)
-- Dependencies: 241
-- Data for Name: direcciones; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.direcciones VALUES (1, 'Alameda Adolfo López Mateos', '18', NULL, 'Centro', '98600', 17, 32);


--
-- TOC entry 5729 (class 0 OID 119511)
-- Dependencies: 243
-- Data for Name: empleados; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--



--
-- TOC entry 5731 (class 0 OID 119517)
-- Dependencies: 245
-- Data for Name: estatus_detalle_expediente; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.estatus_detalle_expediente VALUES (1, 'Asesoría en Proceso');
INSERT INTO catalogos.estatus_detalle_expediente VALUES (2, 'Quejas y Reclamaciones');
INSERT INTO catalogos.estatus_detalle_expediente VALUES (3, 'Representación Legal');
INSERT INTO catalogos.estatus_detalle_expediente VALUES (4, 'Concluido');
INSERT INTO catalogos.estatus_detalle_expediente VALUES (5, 'Acuerdo Conclusivo');
INSERT INTO catalogos.estatus_detalle_expediente VALUES (6, 'Acuerdo Anticipado de Pago');


--
-- TOC entry 5733 (class 0 OID 119521)
-- Dependencies: 247
-- Data for Name: estatus_expediente; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.estatus_expediente VALUES (1, 'OFICIO ENVIADO');
INSERT INTO catalogos.estatus_expediente VALUES (2, 'INFORME RENDIDO');
INSERT INTO catalogos.estatus_expediente VALUES (3, 'DICTAMINACION');
INSERT INTO catalogos.estatus_expediente VALUES (4, 'RESOLUCION_EMITIDA_PENDIENTE_NOTIFICACION');
INSERT INTO catalogos.estatus_expediente VALUES (5, 'EXPEDIENTE CERRADO');


--
-- TOC entry 5735 (class 0 OID 119525)
-- Dependencies: 249
-- Data for Name: estatus_representacion_legal; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.estatus_representacion_legal VALUES (1, 'Asignado', 1, 'Caso asignado al representante legal.', '2026-06-29 15:52:20.712222');
INSERT INTO catalogos.estatus_representacion_legal VALUES (2, 'CIR generado', 2, 'Certificado de Información de Resultados (CIR) generado.', '2026-06-29 15:52:20.712222');
INSERT INTO catalogos.estatus_representacion_legal VALUES (3, 'Demanda presentada', 3, 'La demanda formal ha sido presentada ante la autoridad competente.', '2026-06-29 15:52:20.712222');
INSERT INTO catalogos.estatus_representacion_legal VALUES (4, 'Admitida en espera de audiencia', 4, 'La demanda ha sido admitida y se encuentra a la espera de la celebración de la audiencia.', '2026-06-29 15:52:20.712222');
INSERT INTO catalogos.estatus_representacion_legal VALUES (5, 'Audiencia celebrada', 5, 'Se ha llevado a cabo la audiencia correspondiente.', '2026-06-29 15:52:20.712222');
INSERT INTO catalogos.estatus_representacion_legal VALUES (6, 'Sentencia dictada', 6, 'La autoridad judicial ha emitido la sentencia en primera instancia.', '2026-06-29 15:52:20.712222');
INSERT INTO catalogos.estatus_representacion_legal VALUES (7, 'En recurso de revisión', 7, 'El proceso se encuentra impugnado mediante recurso de revisión u otra apelación.', '2026-06-29 15:52:20.712222');
INSERT INTO catalogos.estatus_representacion_legal VALUES (8, 'Sentencia Ejecutoria', 8, 'La sentencia ha quedado firme (causó ejecutoria) y es de cumplimiento obligatorio.', '2026-06-29 15:52:20.712222');
INSERT INTO catalogos.estatus_representacion_legal VALUES (9, 'Cumplimiento notificado', 9, 'Se ha informado y notificado formalmente el cumplimiento de la resolución.', '2026-06-29 15:52:20.712222');
INSERT INTO catalogos.estatus_representacion_legal VALUES (10, 'Concluido', 10, 'El caso de representación legal ha finalizado por completo.', '2026-06-29 15:52:20.712222');


--
-- TOC entry 5737 (class 0 OID 119532)
-- Dependencies: 251
-- Data for Name: personal; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--



--
-- TOC entry 5739 (class 0 OID 119538)
-- Dependencies: 253
-- Data for Name: personas; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.personas VALUES (1, 1, 'Jose David', 'Rivera', 'Sesma', 'RISD900512HZSVRS01', '4921234567', 'Centro', 'RISD900512AB1', NULL, 'INE', '4929211122', '982347123984', 'jose.rivera@correo.com', 1, 'Credencial para Votar', true);


--
-- TOC entry 5850 (class 0 OID 121004)
-- Dependencies: 364
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--



--
-- TOC entry 5741 (class 0 OID 119545)
-- Dependencies: 255
-- Data for Name: roles; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.roles VALUES (1, 'Administrador', 'Acceso total y configuración del sistema', '/admin/usuarios', true);
INSERT INTO catalogos.roles VALUES (2, 'Asesor', 'Atención a clientes y gestión de ventas', '/atencion-juridica/bandeja', true);
INSERT INTO catalogos.roles VALUES (3, 'Administrador Correspondencia', 'Gestión de correspondencia', '/correspondencia/registrar', true);
INSERT INTO catalogos.roles VALUES (4, 'Gestor de Correspondencia', 'Bandeja y acuses', '/correspondencia/bandeja', true);


--
-- TOC entry 5743 (class 0 OID 119552)
-- Dependencies: 257
-- Data for Name: tipo_acto_emitido; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.tipo_acto_emitido VALUES (1, 'Queja Ciudadana');
INSERT INTO catalogos.tipo_acto_emitido VALUES (2, 'Asesoría Jurídica');
INSERT INTO catalogos.tipo_acto_emitido VALUES (3, 'Solicitud de Apoyo / Gestión Social');
INSERT INTO catalogos.tipo_acto_emitido VALUES (4, 'Recurso de Inconformidad');
INSERT INTO catalogos.tipo_acto_emitido VALUES (5, 'Juicio de Nulidad / Contencioso Administrativo');
INSERT INTO catalogos.tipo_acto_emitido VALUES (6, 'Procedimiento de Mediación / Conciliación');
INSERT INTO catalogos.tipo_acto_emitido VALUES (7, 'Orientación Ciudadana');
INSERT INTO catalogos.tipo_acto_emitido VALUES (8, 'Solicitud de Acceso a la Información (Transparencia)');
INSERT INTO catalogos.tipo_acto_emitido VALUES (9, 'Denuncia por Responsabilidad Administrativa');
INSERT INTO catalogos.tipo_acto_emitido VALUES (10, 'Impuesto Predial');
INSERT INTO catalogos.tipo_acto_emitido VALUES (11, 'Derechos por Servicio de Aseo Público');
INSERT INTO catalogos.tipo_acto_emitido VALUES (12, 'Derechos por Agua Potable y Alcantarillado');
INSERT INTO catalogos.tipo_acto_emitido VALUES (13, 'Multa por Infracción de Tránsito / Vialidad');
INSERT INTO catalogos.tipo_acto_emitido VALUES (14, 'Multa por Falta de Licencia de Funcionamiento');
INSERT INTO catalogos.tipo_acto_emitido VALUES (15, 'Multa Fiscal (Omisión de Declaraciones / Impuestos)');
INSERT INTO catalogos.tipo_acto_emitido VALUES (16, 'Multa por Violación a Reglamentos de Ecología o Medio Ambiente');
INSERT INTO catalogos.tipo_acto_emitido VALUES (17, 'Multa por Comercio Informal o Invasión de Vía Pública');
INSERT INTO catalogos.tipo_acto_emitido VALUES (18, 'Multa por Construcción Clandestina o Sin Permiso');
INSERT INTO catalogos.tipo_acto_emitido VALUES (19, 'Requerimiento de Pago / Mandamiento de Ejecución');
INSERT INTO catalogos.tipo_acto_emitido VALUES (20, 'Orden de Visita de Inspección o Verificación');
INSERT INTO catalogos.tipo_acto_emitido VALUES (21, 'Notificación de Crédito Fiscal');
INSERT INTO catalogos.tipo_acto_emitido VALUES (22, 'Embargo precautorio de bienes o cuentas');
INSERT INTO catalogos.tipo_acto_emitido VALUES (23, 'Clausura Temporal de Establecimiento');
INSERT INTO catalogos.tipo_acto_emitido VALUES (24, 'Clausura Definitiva de Establecimiento');
INSERT INTO catalogos.tipo_acto_emitido VALUES (25, 'Revocación de Licencia o Permiso Municipal');
INSERT INTO catalogos.tipo_acto_emitido VALUES (26, 'Negativa Ficta (Falta de respuesta de la autoridad)');
INSERT INTO catalogos.tipo_acto_emitido VALUES (27, 'Resolución Negativa a una Solicitud o Trámite');
INSERT INTO catalogos.tipo_acto_emitido VALUES (28, 'Baja o Suspensión de Padrón de Proveedores / Contratistas');


--
-- TOC entry 5745 (class 0 OID 119556)
-- Dependencies: 259
-- Data for Name: tipo_correspondencia; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.tipo_correspondencia VALUES (1, 'externa');
INSERT INTO catalogos.tipo_correspondencia VALUES (2, 'interna');


--
-- TOC entry 5747 (class 0 OID 119560)
-- Dependencies: 261
-- Data for Name: tipo_entrada; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.tipo_entrada VALUES (1, 'Presencial');
INSERT INTO catalogos.tipo_entrada VALUES (2, 'Correo electrónico');
INSERT INTO catalogos.tipo_entrada VALUES (3, 'Telefónico');


--
-- TOC entry 5749 (class 0 OID 119564)
-- Dependencies: 263
-- Data for Name: tipo_persona; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.tipo_persona VALUES (1, 'Física');
INSERT INTO catalogos.tipo_persona VALUES (2, 'Moral');


--
-- TOC entry 5751 (class 0 OID 119568)
-- Dependencies: 265
-- Data for Name: tipo_tramite; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.tipo_tramite VALUES (1, 'Queja');
INSERT INTO catalogos.tipo_tramite VALUES (2, 'Representación legal');
INSERT INTO catalogos.tipo_tramite VALUES (3, 'Asesoría simplificada');


--
-- TOC entry 5852 (class 0 OID 121020)
-- Dependencies: 366
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--



--
-- TOC entry 5753 (class 0 OID 119572)
-- Dependencies: 267
-- Data for Name: usuarios; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.usuarios VALUES (1, 1, 5, 'jdavidrivera', '$2a$06$Gr7ykiKot24.Goc/badeBOpMSflZ376eCSHRZHhaaDMwQjFgf0qHK', 'sesma_mx@yahoo.com.mx', '2026-07-02 00:37:59.373274', true, '2026-07-07 21:38:40.689517');


--
-- TOC entry 5755 (class 0 OID 119580)
-- Dependencies: 269
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: catalogos; Owner: postgres
--

INSERT INTO catalogos.usuarios_roles VALUES (1, 1, 1, '2026-07-02 00:00:00');


--
-- TOC entry 5757 (class 0 OID 119585)
-- Dependencies: 271
-- Data for Name: acuse_correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5759 (class 0 OID 119589)
-- Dependencies: 273
-- Data for Name: acuse_memorandum; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5760 (class 0 OID 119592)
-- Dependencies: 274
-- Data for Name: acuse_oficio; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5763 (class 0 OID 119597)
-- Dependencies: 277
-- Data for Name: alertas_seguimiento; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5765 (class 0 OID 119605)
-- Dependencies: 279
-- Data for Name: archivos_adjuntos; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5767 (class 0 OID 119612)
-- Dependencies: 281
-- Data for Name: auditoria_correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5769 (class 0 OID 119617)
-- Dependencies: 283
-- Data for Name: correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5771 (class 0 OID 119624)
-- Dependencies: 285
-- Data for Name: correspondencia_respuestas; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5773 (class 0 OID 119630)
-- Dependencies: 287
-- Data for Name: correspondencia_turnos; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5775 (class 0 OID 119635)
-- Dependencies: 289
-- Data for Name: memorandums; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5777 (class 0 OID 119642)
-- Dependencies: 291
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5779 (class 0 OID 119650)
-- Dependencies: 293
-- Data for Name: oficio; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5780 (class 0 OID 119655)
-- Dependencies: 294
-- Data for Name: oficio_contestacion; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5781 (class 0 OID 119662)
-- Dependencies: 295
-- Data for Name: oficio_contestacion_externa; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5785 (class 0 OID 119671)
-- Dependencies: 299
-- Data for Name: plantilla_memorandum; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5787 (class 0 OID 119679)
-- Dependencies: 301
-- Data for Name: seguimiento_correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5789 (class 0 OID 119686)
-- Dependencies: 303
-- Data for Name: seguimiento_memorandum; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5792 (class 0 OID 119694)
-- Dependencies: 306
-- Data for Name: seguimiento_oficio; Type: TABLE DATA; Schema: correspondencia; Owner: postgres
--



--
-- TOC entry 5795 (class 0 OID 119701)
-- Dependencies: 309
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
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
INSERT INTO public.databasechangelog VALUES ('crear_estructura_datos_modulo2', 'ErickRivera', 'scripts/EDRM_000036_estructura_datos_modulo2.sql', '2026-05-15 14:10:15.279491', 45, 'EXECUTED', '8:910636b3761450b8ca379cf098b0ffd9', 'sql', '', NULL, '4.3.2', NULL, NULL, '8875815149');
INSERT INTO public.databasechangelog VALUES ('eliminar_esquema_atencion_juridica', 'ErickRivera', 'scripts/EDRM_000037_drop_esquema_asesoria.sql', '2026-05-15 14:10:15.294086', 46, 'EXECUTED', '8:ae42dca4e1831a77048a0ec28c38603a', 'sql', '', NULL, '4.3.2', NULL, NULL, '8875815149');
INSERT INTO public.databasechangelog VALUES ('eliminar_tablas_esquema_public', 'ErickRivera', 'scripts/EDRM_000038_eliminar_tablas_extras_esquema_public.sql', '2026-05-15 14:10:15.311633', 47, 'EXECUTED', '8:34299960f64233eb9a6e3f1a0c1a7e78', 'sql', '', NULL, '4.3.2', NULL, NULL, '8875815149');
INSERT INTO public.databasechangelog VALUES ('crear-catalogos-modulo2', 'ErickRivera', 'scripts/EDRM_000039_create_table_modulo2.sql', '2026-05-23 00:40:57.271609', 48, 'EXECUTED', '8:e5f1b5276963f96963cfbfa7de51c4d7', 'sql', 'Creacion de tablas maestras de catalogos para expedientes y detalles de asesoria.', NULL, '4.3.2', NULL, NULL, '9518457170');
INSERT INTO public.databasechangelog VALUES ('drop-tablas-viejas-sustantiva', 'ErickRivera', 'scripts/EDRM_000040_deop_tables_esquema_sustantiva.sql', '2026-05-23 00:40:57.291698', 49, 'EXECUTED', '8:e9f18ebd8cefca39788f90536629384d', 'sql', 'Eliminacion de tablas viejas de expedientes y detalles para reestructurar el modulo 2.', NULL, '4.3.2', NULL, NULL, '9518457170');
INSERT INTO public.databasechangelog VALUES ('crear-tabla-expedientes', 'ErickRivera', 'scripts/EDRM_000041_create_table_expediente.sql', '2026-05-23 00:40:57.374042', 50, 'EXECUTED', '8:6abf54313e29f26aaa2967497d051e81', 'sql', 'Creacion de la tabla maestra de expedientes con herencia e integridad referencial ajustada.', NULL, '4.3.2', NULL, NULL, '9518457170');
INSERT INTO public.databasechangelog VALUES ('crear-tabla-expedientes', 'ErickRivera', 'scripts/EDRM_000042_create_table_detalle_expediente.sql', '2026-05-23 00:40:57.379196', 51, 'EXECUTED', '8:6abf54313e29f26aaa2967497d051e81', 'sql', 'Creacion de la tabla maestra de expedientes con herencia e integridad referencial ajustada.', NULL, '4.3.2', NULL, NULL, '9518457170');
INSERT INTO public.databasechangelog VALUES ('agregar-monto-y-fecha-notificacion-v4', 'ErickRivera', 'scripts/EDRM_000043_alter_table_detalle_asesoria.sql', '2026-05-26 01:30:33.939833', 52, 'EXECUTED', '8:dafd14bd59acebc4d39cfbc2edb998ef', 'sql', 'Agregando campos usando la clausula nativa IF NOT EXISTS de Postgres para evitar conflictos con Liquibase.', NULL, '4.3.2', NULL, NULL, '9780633871');
INSERT INTO public.databasechangelog VALUES ('crear-tabla-detalle_asesoria', 'ErickRivera', 'scripts/EDRM_000042_create_table_detalle_expediente.sql', '2026-05-26 11:16:28.665002', 53, 'EXECUTED', '8:2c4d271ba7b13072a1ed02e83a744182', 'sql', 'Creacion de la tabla detalle asesoria.', NULL, '4.3.2', NULL, NULL, '9815788580');
INSERT INTO public.databasechangelog VALUES ('renombrado_forzado_v2_fijo', 'JoseJuanRiveraMerino', 'scripts/JJRM_000021_renombrado_tabla_acuse_memorandum.sql', '2026-06-01 11:21:18.565553', 54, 'MARK_RAN', '8:db0b7eff2f5f298a6bb8e63044c95a8e', 'sql', '', NULL, '4.3.2', NULL, NULL, '0334478492');
INSERT INTO public.databasechangelog VALUES ('alter_table_personas', 'JuanRivera', 'scripts/JJRM_000044_alter_table_personas.sql', '2026-06-01 11:21:18.740573', 55, 'EXECUTED', '8:821f3a7e7067628510f6cecbc8ae7eab', 'sql', 'Agregando campos y catálogos usando IF NOT EXISTS para evitar conflictos.', NULL, '4.3.2', NULL, NULL, '0334478492');
INSERT INTO public.databasechangelog VALUES ('alter_table_personas_fk', 'JuanRivera', 'scripts/JJRM_000044_alter_table_personas.sql', '2026-06-01 11:21:18.773582', 56, 'EXECUTED', '8:0337da9916505c2e95be14b4bd90c368', 'sql', 'Agregando llave foránea usando DO para evitar errores de Liquibase al partir sentencias.', NULL, '4.3.2', NULL, NULL, '0334478492');
INSERT INTO public.databasechangelog VALUES ('alter-tabla-expedientes', 'RodrigoRivera', 'scripts/RRM_000045_alter_table_expediente.sql', '2026-06-06 13:44:06.045995', 58, 'RERAN', '8:7e65b4a49775248dafdf8d48e09ba6a9', 'sql', 'Alteracion de la tabla expedientes.', NULL, '4.3.2', NULL, NULL, '0775045955');
INSERT INTO public.databasechangelog VALUES ('alter-table-personas', 'JuanRivera', 'scripts/JJRM_000046_create_dias_inhabiles_alter_personas.sql', '2026-06-06 13:44:06.060194', 59, 'EXECUTED', '8:9a28bbf9078e5d5ff5ca02e67230dc20', 'sql', 'Agrega columna tipo_identificacion si no existe.', NULL, '4.3.2', NULL, NULL, '0775045955');
INSERT INTO public.databasechangelog VALUES ('create-table-dias-inhabiles', 'JuanRivera', 'scripts/JJRM_000046_create_dias_inhabiles_alter_personas.sql', '2026-06-06 13:44:06.106635', 60, 'EXECUTED', '8:29eb608ac40bf26e5e7e9251ca95282d', 'sql', 'Creacion de la tabla dias inhabiles.', NULL, '4.3.2', NULL, NULL, '0775045955');
INSERT INTO public.databasechangelog VALUES ('1-crear-cat-estatus-queja', 'ErickRivera', 'scripts/EDRM_000047_create_table_cat_estatus_queja.sql', '2026-06-06 13:44:06.109841', 61, 'EXECUTED', '8:499bcc6839416f2f1c2a04f6e35a6755', 'sql', 'Creacion del catalogo de estatus para tramites de queja de forma idempotente.', NULL, '4.3.2', NULL, NULL, '0775045955');
INSERT INTO public.databasechangelog VALUES ('3-crear-tabla-sustantiva-quejas', 'ErickRivera', 'scripts/EDRM_000048_create_table_quejas.sql', '2026-06-06 13:44:06.113998', 62, 'EXECUTED', '8:f7a5908fe34094e76ebd4b7632fcda8a', 'sql', 'Creacion de la tabla core de quejas exactamente como fue provista.', NULL, '4.3.2', NULL, NULL, '0775045955');
INSERT INTO public.databasechangelog VALUES ('4-crear-tabla-sustantiva-quejas-cir', 'ErickRivera', 'scripts/EDRM_000049_create_table_quejas_cir.sql', '2026-06-06 13:44:06.116469', 63, 'EXECUTED', '8:cf4ba8a27b70e3f593cd30b3335ff8a4', 'sql', 'Creacion de la tabla quejas_cir exactamente como fue provista.', NULL, '4.3.2', NULL, NULL, '0775045955');
INSERT INTO public.databasechangelog VALUES ('5-crear-tabla-sustantiva-quejas-ari', 'ErickRivera', 'scripts/EDRM_000050_create_table_quejas_ari.sql', '2026-06-06 13:45:18.433132', 64, 'EXECUTED', '8:0da8bdc5ed8b4ee4bcd124d1d83f5c36', 'sql', 'Creacion de la tabla quejas_ari removiendo el error de sintaxis de la letra z.', NULL, '4.3.2', NULL, NULL, '0775118361');
INSERT INTO public.databasechangelog VALUES ('5-crear-tabla-sustantiva-quejas-ari', 'ErickRivera', 'scripts/EDRM_000051_create_table_quejas_oficio_autoridadi.sql', '2026-06-06 13:45:58.199557', 65, 'EXECUTED', '8:0da8bdc5ed8b4ee4bcd124d1d83f5c36', 'sql', 'Creacion de la tabla quejas_ari exactamente como fue provista.', NULL, '4.3.2', NULL, NULL, '0775158134');
INSERT INTO public.databasechangelog VALUES ('6-crear-tabla-sustantiva-quejas-respuestas-autoridad', 'ErickRivera', 'scripts/EDRM_000052_create_table_respuesta_autoridadi.sql', '2026-06-06 13:45:58.206095', 66, 'EXECUTED', '8:3db8b019ef4fd1b0cae795ed8079c11e', 'sql', 'Creacion de la tabla quejas_respuestas_autoridad exactamente como fue provista.', NULL, '4.3.2', NULL, NULL, '0775158134');
INSERT INTO public.databasechangelog VALUES ('raw', 'includeAll', 'scripts/EDRM_000053_create_table_acci.sql', '2026-06-06 13:45:58.209575', 67, 'EXECUTED', '8:f97be6dd5db5b21402bd2d3822bde6d1', 'sql', '', NULL, '4.3.2', NULL, NULL, '0775158134');
INSERT INTO public.databasechangelog VALUES ('7-crear-tabla-sustantiva-quejas-oficios-autoridad', 'ErickRivera', 'scripts/EDRM_000051_create_table_quejas_oficio_autoridadi.sql', '2026-06-06 14:36:30.869555', 68, 'EXECUTED', '8:74a3f39a7867a3e49142dc8141b9954e', 'sql', 'Creacion de la tabla quejas_oficios_autoridad exactamente como fue provista de forma idempotente.', NULL, '4.3.2', NULL, NULL, '0778190799');
INSERT INTO public.databasechangelog VALUES ('8-crear-tabla-sustantiva-quejas-acci', 'ErickRivera', 'scripts/EDRM_000053_create_table_acci.sql', '2026-06-07 22:30:18.250467', 69, 'EXECUTED', '8:bf34dda445dca68b6621ae85dbc75ab1', 'sql', 'Creacion de la tabla quejas_acci de forma totalmente idempotente con splitStatements desactivado.', NULL, '4.3.2', NULL, NULL, '0893018157');
INSERT INTO public.databasechangelog VALUES ('modificar_tabla_cat_estatus_queja', 'Erick_Rivera', 'scripts/EDRM_000054_alter_table_catalogo_estatusqueja.sql', '2026-06-12 16:14:45.980119', 70, 'EXECUTED', '8:79c71e8fcc6288bbbdbcb9a6dc5372ef', 'sql', 'Modificación de longitud de descripción y adición de columna orden sin errores en re-ejecución', NULL, '4.3.2', NULL, NULL, '1302485884');
INSERT INTO public.databasechangelog VALUES ('insertar_catalogo_estatus_queja', 'Erick_Rivera', 'scripts/EDRM_000055_insertar_datos_tabla_estatus_queja.sql', '2026-06-12 16:14:45.998592', 71, 'EXECUTED', '8:254670703059435e60022bf5c8d31889', 'sql', 'Inserción y actualización del catálogo de estatus de quejas sin duplicados ni errores', NULL, '4.3.2', NULL, NULL, '1302485884');
INSERT INTO public.databasechangelog VALUES ('1-crear-tabla-sustantiva-plantilla-queja-ari', 'RodrigoRivera', 'scripts/RRM_000054_create_table_plantilla_queja_ari.sql', '2026-06-12 16:21:56.426358', 72, 'EXECUTED', '8:dc9f73e7e51905f5712be494ba48c1cd', 'sql', 'Creacion de la tabla plantilla_queja_ari de forma totalmente idempotente con splitStatements desactivado.', NULL, '4.3.2', NULL, NULL, '1302916323');
INSERT INTO public.databasechangelog VALUES ('2-modificar-tabla-sustantiva-quejas-ari', 'RodrigoRivera', 'scripts/RRM_000054_create_table_plantilla_queja_ari.sql', '2026-06-12 16:21:56.454248', 73, 'EXECUTED', '8:533b8ac61d4141e507f60a5afdcb9fc8', 'sql', 'Modificacion de la tabla quejas_ari para agregar el campo id_plantilla_queja_ari de forma idempotente.', NULL, '4.3.2', NULL, NULL, '1302916323');
INSERT INTO public.databasechangelog VALUES ('3-agregar-campos-multas-quejas-ari', 'RodrigoRivera', 'scripts/RRM_000055_alter_table_quejas_ari.sql', '2026-06-12 16:21:56.459102', 74, 'EXECUTED', '8:97cf765808e08979bd145dacde382da5', 'sql', 'Adicion de los campos multas_requerimientos y multas_credito en la tabla quejas_ari de forma idempotente.', NULL, '4.3.2', NULL, NULL, '1302916323');
INSERT INTO public.databasechangelog VALUES ('alter-table-expedientes', 'JuanRivera', 'scripts/JJRM_000056_alter_expedientes.sql', '2026-06-12 16:21:56.462835', 75, 'EXECUTED', '8:702f4f640d7927c943ad2f6d720ab6e4', 'sql', 'Agrega columnas si no existen.', NULL, '4.3.2', NULL, NULL, '1302916323');
INSERT INTO public.databasechangelog VALUES ('ADRC-000057-alter-expediente-informe-autoridad', 'alan', 'scripts/ADRC_000057_alter_table_expediente_informe_autoridad.sql', '2026-06-12 16:21:56.475309', 76, 'EXECUTED', '8:44ea588b7d3da6daf6cb3b16a1257b17', 'sql', 'Agrega columnas para controlar el plazo de 5 dias habiles e informe de autoridad.', NULL, '4.3.2', NULL, NULL, '1302916323');
INSERT INTO public.databasechangelog VALUES ('alter-table-quejas_ari', 'rodrigoriveramacias', 'scripts/RRM_000058_alter_queja_ari.sql', '2026-06-12 16:21:56.478759', 77, 'EXECUTED', '8:bedaa97e6988a9167e8c9971236f8842', 'sql', 'Agrega la columna instituto a la tabla quejas_ari si no existe.', NULL, '4.3.2', NULL, NULL, '1302916323');
INSERT INTO public.databasechangelog VALUES ('modificar_tabla_cat_estatus_queja', 'Erick_Rivera', 'scripts/EDRM_000060_alter_table_catalogo_estatusqueja.sql', '2026-06-12 16:21:56.483754', 78, 'EXECUTED', '8:79c71e8fcc6288bbbdbcb9a6dc5372ef', 'sql', 'Modificación de longitud de descripción y adición de columna orden sin errores en re-ejecución', NULL, '4.3.2', NULL, NULL, '1302916323');
INSERT INTO public.databasechangelog VALUES ('insertar_catalogo_estatus_queja', 'Erick_Rivera', 'scripts/EDRM_000061_insertar_datos_tabla_estatus_queja.sql', '2026-06-12 16:21:56.489979', 79, 'EXECUTED', '8:254670703059435e60022bf5c8d31889', 'sql', 'Inserción y actualización del catálogo de estatus de quejas sin duplicados ni errores', NULL, '4.3.2', NULL, NULL, '1302916323');
INSERT INTO public.databasechangelog VALUES ('create_table_resolucion_final', 'hugoisaacriveramorales', 'scripts/HIRM_00062_crear_tabla_resolucion_final.sql', '2026-06-15 09:42:37.458521', 80, 'EXECUTED', '8:8cc2085f7008d3ee184e5acaa9b45d80', 'sql', 'crear e insertar datos a columna resolucion_final si no existe.', NULL, '4.3.2', NULL, NULL, '1538157238');
INSERT INTO public.databasechangelog VALUES ('create_table_cierre_expediente', 'anarosariveramorales', 'scripts/ARRM_000063_crear_tabla_cierre_expediente_actualizacion_estatus_expediente.sql', '2026-06-15 09:46:34.290466', 81, 'EXECUTED', '8:34cac1765651542051202d168efabe21', 'sql', 'crear tabla cierre expediente y añadir registro en estatus expediente para el cierre de este', NULL, '4.3.2', NULL, NULL, '1538394158');
INSERT INTO public.databasechangelog VALUES ('create_table_cierre_expediente_v2', 'anarosariveramorales', 'scripts/ARRM_000063_crear_tabla_cierre_expediente_actualizacion_estatus_expediente.sql', '2026-06-15 09:52:09.609978', 82, 'EXECUTED', '8:8554741514d116d5ed9bedef3cadc4f0', 'sql', 'crear tabla cierre expediente v2 para evadir checksum bloqueado', NULL, '4.3.2', NULL, NULL, '1538729536');
INSERT INTO public.databasechangelog VALUES ('add_fk_cierre_expediente_v2', 'anarosariveramorales', 'scripts/ARRM_000063_crear_tabla_cierre_expediente_actualizacion_estatus_expediente.sql', '2026-06-15 09:52:09.649328', 83, 'EXECUTED', '8:e21d4a2e7818acc41ddb80d0f81d136c', 'sql', 'añadir llaves foraneas usando bloque DO sin interferencia de particion de liquibase', NULL, '4.3.2', NULL, NULL, '1538729536');
INSERT INTO public.databasechangelog VALUES ('add_fks_cierre_expediente', 'anarosariveramorales', 'scripts/ARRM_000064_alter_tabla_cierre_expediente_actualizacion_estatus_expediente.sql', '2026-06-15 10:12:53.961395', 84, 'EXECUTED', '8:e21d4a2e7818acc41ddb80d0f81d136c', 'sql', 'Añadir llaves foraneas usando bloque DO aislado', NULL, '4.3.2', NULL, NULL, '1539973855');
INSERT INTO public.databasechangelog VALUES ('insert_estatus_cierre_v4', 'anarosariveramorales', 'scripts/ARRM_000065_insert_tabla_cierre_expediente_actualizacion_estatus_expediente.sql', '2026-06-15 10:15:16.278127', 85, 'EXECUTED', '8:43859ac057f02012b9e2a1a62e636f02', 'sql', 'Insertar registro en tabla estatus_expediente usando la columna correcta id_estatus_expediente', NULL, '4.3.2', NULL, NULL, '1540116171');
INSERT INTO public.databasechangelog VALUES ('alter-table-queja-ari', 'RodrigoRivera', 'scripts/RRM_000066_alter_acuse.sql', '2026-06-22 14:30:56.810842', 86, 'EXECUTED', '8:541304dace0cb75401a2f91d24793a63', 'sql', 'Borrar columna si no existen.', NULL, '4.3.2', NULL, NULL, '2160256710');
INSERT INTO public.databasechangelog VALUES ('create_bitacora_asignacion', 'JuanRivera', 'scripts/JJRM_000067_create_bitacora_asignacion.sql', '2026-06-22 14:30:56.904408', 87, 'EXECUTED', '8:e64bf272455fe5f8afe1933406cd5eea', 'sql', '', NULL, '4.3.2', NULL, NULL, '2160256710');
INSERT INTO public.databasechangelog VALUES ('rename_id_autoridad_to_id_detalle_asesoria', 'JuanRivera', 'scripts/JJRM_000068_rename_id_autoridad_to_id_detalle_asesoria.sql', '2026-06-22 14:30:56.936662', 88, 'EXECUTED', '8:7c1db9b0d3a3e5c066da8068881ed939', 'sql', '', NULL, '4.3.2', NULL, NULL, '2160256710');
INSERT INTO public.databasechangelog VALUES ('alter-table-quejas-ari-add-siglas', 'RodrigoRivera', 'scripts/RRM_000069_alter_ari_abreviatura.sql', '2026-06-22 14:30:56.939977', 89, 'EXECUTED', '8:4faac5ffd03eadea532c84c4ab42ce30', 'sql', 'Agregar columna siglas_abreviatura_encargado si no existe.', NULL, '4.3.2', NULL, NULL, '2160256710');
INSERT INTO public.databasechangelog VALUES ('drop_table_resolucion_final', 'hugoisaacriveramorales', 'scripts/HIRM_000070_drop_table_resolucion_final.sql', '2026-06-22 14:30:56.956041', 90, 'EXECUTED', '8:03c09564180aaae30e03e8d9c753beb8', 'sql', 'eliminar tabla resolución_final', NULL, '4.3.2', NULL, NULL, '2160256710');
INSERT INTO public.databasechangelog VALUES ('create_table_resolucion_final', 'hugoisaacriveramorales', 'scripts/HIRM_000071_create_table_resolucion_final.sql', '2026-06-22 14:30:56.965224', 91, 'EXECUTED', '8:b45fbf58f8e7717ca2a527fc6283699a', 'sql', 'crear tabla resolución final', NULL, '4.3.2', NULL, NULL, '2160256710');
INSERT INTO public.databasechangelog VALUES ('create_table_oficio_notificacion', 'JuanRivera', 'scripts/JJRM_000072_create_table_oficio_notificacion.sql', '2026-06-22 14:30:56.980962', 92, 'EXECUTED', '8:c55cd7af0fef50189b614488109b0af1', 'sql', '', NULL, '4.3.2', NULL, NULL, '2160256710');
INSERT INTO public.databasechangelog VALUES ('create_table_oficio_notificacion', 'JuanRivera', 'scripts/JJRM_000073_alter_quejas_respuestas.sql', '2026-06-22 14:30:56.983421', 93, 'EXECUTED', '8:7e41560d65c900b760ec1ca46063ee1d', 'sql', '', NULL, '4.3.2', NULL, NULL, '2160256710');
INSERT INTO public.databasechangelog VALUES ('alter_table_resolucion_final', 'hugoisaacriveramorales', 'scripts/HIRM_00074_alter_table_resolucion_final.sql', '2026-06-22 14:30:56.988907', 94, 'EXECUTED', '8:fc421503d6eac6ced5aa4f86cce897bd', 'sql', 'añadir campo ruta_resolucion_final', NULL, '4.3.2', NULL, NULL, '2160256710');
INSERT INTO public.databasechangelog VALUES ('alter_table_quejas_cir_fk', 'ADRC', 'scripts/ADRC_00075_alter_tabla_quejas_cir.sql', '2026-06-22 14:30:57.003029', 95, 'EXECUTED', '8:a33c01c0759aa3bea8547887a8d104d4', 'sql', 'Adición de campos faltantes y llaves foráneas a la tabla quejas_cir según nuevo modelo', NULL, '4.3.2', NULL, NULL, '2160256710');
INSERT INTO public.databasechangelog VALUES ('alter_acci_asesores', 'JuanRivera', 'scripts/JJRM_000076_alter_acci_asesores.sql', '2026-06-25 18:19:14.279588', 96, 'EXECUTED', '8:eae3a30e3173fff0a113aeff3b1dc999', 'sql', '', NULL, '4.3.2', NULL, NULL, '2433154145');
INSERT INTO public.databasechangelog VALUES ('crear-tabla-sustantiva-quejas-rl-cir', 'RodrigoRivera', 'scripts/RRM_000077_create_table_queja_rl_cir.sql', '2026-06-29 14:54:27.539324', 97, 'EXECUTED', '8:ab2b8f07ae49848748ae56cbd417fe40', 'sql', 'Creacion de la tabla quejas_rl_cir.', NULL, '4.3.2', NULL, NULL, '2766467356');
INSERT INTO public.databasechangelog VALUES ('crear-tabla-sustantiva-rl-cir', 'RodrigoRivera', 'scripts/RRM_000078_create_table_rl_cir.sql', '2026-06-29 14:54:27.563331', 98, 'EXECUTED', '8:0c8de9e9d01d617a74e646f1508ff4e2', 'sql', 'Creacion de la tabla rl_cir.', NULL, '4.3.2', NULL, NULL, '2766467356');
INSERT INTO public.databasechangelog VALUES ('add_column_es_personal_to_personas', 'anarivera', 'scripts/ARRM_00080_add_column_es_personal_to_personas.sql', '2026-06-29 14:54:27.589917', 100, 'EXECUTED', '8:cb764495e0bb59c3d6e7cfb75a28062b', 'sql', 'Se agrega columna es_personal a la tabla personas de forma segura', NULL, '4.3.2', NULL, NULL, '2766467356');
INSERT INTO public.databasechangelog VALUES ('create_table_personal', 'anarivera', 'scripts/ARRM_00081_create_table_personal.sql', '2026-06-29 14:54:27.606048', 101, 'EXECUTED', '8:de0c17e3df45d408cf2d7c9efca87ad3', 'sql', 'Creación de la tabla personal con validación IF NOT EXISTS', NULL, '4.3.2', NULL, NULL, '2766467356');
INSERT INTO public.databasechangelog VALUES ('create_table_amparo', 'JuanRivera', 'scripts/JJRM_000082_create_table_amparo.sql', '2026-06-29 14:54:27.619054', 102, 'EXECUTED', '8:8927d8cfb26c9caf0d9d1e5702c35fe4', 'sql', '', NULL, '4.3.2', NULL, NULL, '2766467356');
INSERT INTO public.databasechangelog VALUES ('create_estatus_representacion_legal', 'ADRC', 'scripts/ADRC_000083_estatus_representacion_legal.sql', '2026-06-29 15:52:20.740593', 103, 'EXECUTED', '8:7de6d4c8ab782663e56ac72e1837ee60', 'sql', '', NULL, '4.3.2', NULL, NULL, '2769940644');
INSERT INTO public.databasechangelog VALUES ('add_fk_representacion_legal', 'ADRC', 'scripts/ADRC_000083_estatus_representacion_legal.sql', '2026-06-29 15:52:20.763872', 104, 'EXECUTED', '8:1a92c66815473e3efb0b51dc731b8062', 'sql', '', NULL, '4.3.2', NULL, NULL, '2769940644');
INSERT INTO public.databasechangelog VALUES ('insert-roles-iniciales', 'JuanRivera', 'scripts/JJRM_000084_insert_roles.sql', '2026-06-29 19:12:18.719805', 105, 'EXECUTED', '8:8039af4491c51aee30eab38be8cf3c1c', 'sql', '', NULL, '4.3.2', NULL, NULL, '2781938625');
INSERT INTO public.databasechangelog VALUES ('insert-inicial-areas-catalogos', 'tu_usuario', 'scripts/EDRM_000085_insert_table_areas.sql', '2026-06-29 23:38:25.304108', 106, 'EXECUTED', '8:581ea60fbc508948c0ee549d0ef631da', 'sql', 'Inserción inicial de áreas en el esquema catalogos', NULL, '4.3.2', NULL, NULL, '2797905178');
INSERT INTO public.databasechangelog VALUES ('EDRM_000086_create_table_audiencia_espera', 'ErickRivera', 'scripts/EDRM_000086_create_table_audiencia_espera.sql', '2026-06-30 01:24:04.820059', 107, 'EXECUTED', '8:81ff5d76a1541c6d7f1dcbdfe9ef83c4', 'sql', 'Creación de la tabla audiencia_espera y comentarios de documentación', NULL, '4.3.2', NULL, NULL, '2804244728');
INSERT INTO public.databasechangelog VALUES ('EDRM_000087_create_table_audiencia_celebrada', 'ErickRivera', 'scripts/EDRM_000087_create_table_audiencia_celebrada.sql', '2026-06-30 01:24:04.83378', 108, 'EXECUTED', '8:6f13b1853d66fab2928a923680764339', 'sql', 'Creación de la tabla audiencia_celebrada y comentarios de documentación', NULL, '4.3.2', NULL, NULL, '2804244728');
INSERT INTO public.databasechangelog VALUES ('EDRM_000088_create_table_sentencia_dictada', 'ErickRivera', 'scripts/EDRM_000088_create_table_sentencia_dictada.sql', '2026-06-30 01:24:04.838087', 109, 'EXECUTED', '8:595ee882eb07940754ad13e0945cbde2', 'sql', 'Creación de la tabla sentencia_dictada y comentarios de documentación', NULL, '4.3.2', NULL, NULL, '2804244728');
INSERT INTO public.databasechangelog VALUES ('EDRM_000089_create_table_recurso_revision', 'ErickRivera', 'scripts/EDRM_000089_create_table_recurso_revision.sql', '2026-06-30 01:52:42.801035', 110, 'EXECUTED', '8:dc70f0dd9a02a064f34c91216e5ff060', 'sql', 'Creación de la tabla recurso_revision y comentarios de documentación', NULL, '4.3.2', NULL, NULL, '2805962721');
INSERT INTO public.databasechangelog VALUES ('EDRM_000090_create_table_sentencia_ejecutoria', 'ErickRivera', 'scripts/EDRM_000090_create_table_sentencia_ejecutoria.sql', '2026-06-30 01:52:42.808557', 111, 'EXECUTED', '8:74a200dcbc55a14f8beef8603792f63e', 'sql', 'Creación de la tabla sentencia_ejecutoria y comentarios de documentación', NULL, '4.3.2', NULL, NULL, '2805962721');
INSERT INTO public.databasechangelog VALUES ('EDRM_000091_create_table_notificacion_sentencia_cumplida', 'ErickRivera', 'scripts/EDRM_000091_create_table_notificacion_sentencia_cumplida.sql', '2026-06-30 01:52:42.812945', 112, 'EXECUTED', '8:d46da3979c5279da2e4cc05ec15eea12', 'sql', 'Creación de la tabla notificacion_sentencia_cumplida y comentarios de documentación', NULL, '4.3.2', NULL, NULL, '2805962721');
INSERT INTO public.databasechangelog VALUES ('alter_amparo', 'JuanRivera', 'scripts/JJRM_000092_alter_insert_amparo.sql', '2026-06-30 15:53:11.602719', 113, 'EXECUTED', '8:a12755901b9972c0613a1d9b5cb6462c', 'sql', '', NULL, '4.3.2', NULL, NULL, '2856391507');
INSERT INTO public.databasechangelog VALUES ('EDRM_000094_add_column_ruta_pdf_oficio', 'ErickRivera', 'scripts/EDRM_000094_add_column_ruta_pdf_oficio.sql', '2026-06-30 17:20:52.506616', 115, 'EXECUTED', '8:95a3e4842d87ebd11e969cadda41dc8c', 'sql', 'Agregar columna ruta_pdf_oficio a las tablas de hitos de amparo', NULL, '4.3.2', NULL, NULL, '2861652400');
INSERT INTO public.databasechangelog VALUES ('create_table_representacion_legal', 'aland', 'scripts/ADRC_000079_alter_table_representacion_legal.sql', '2026-06-29 14:54:27.575809', 99, 'EXECUTED', '8:4ffd153cb271d80f9f0c3b4e99be9771', 'sql', 'Creación de la tabla representacion_legal con llaves foráneas nombradas', NULL, '4.3.2', NULL, NULL, '2766467356');
INSERT INTO public.databasechangelog VALUES ('alter_amparo', 'JuanRivera', 'scripts/JJRM_000093_alter_id_cir_amparo.sql', '2026-06-30 15:53:11.679291', 114, 'EXECUTED', '8:c5d373088c7c4d7f2e1a2ea4110ebb03', 'sql', '', NULL, '4.3.2', NULL, NULL, '2856391507');
INSERT INTO public.databasechangelog VALUES ('alter_amparo', 'JuanRivera', 'scripts/JJRM_000095_alter_constraint_amparo.sql', '2026-07-01 23:34:41.921298', 116, 'EXECUTED', '8:11339e73e2f109df4aca243a9c59613c', 'sql', '', NULL, '4.3.2', NULL, NULL, '2970481792');


--
-- TOC entry 5796 (class 0 OID 119706)
-- Dependencies: 310
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);


--
-- TOC entry 5797 (class 0 OID 119709)
-- Dependencies: 311
-- Data for Name: plantilla_queja_ari; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5799 (class 0 OID 119715)
-- Dependencies: 313
-- Data for Name: asesores; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5801 (class 0 OID 119722)
-- Dependencies: 315
-- Data for Name: audiencia_celebrada; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5803 (class 0 OID 119730)
-- Dependencies: 317
-- Data for Name: audiencia_espera; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5805 (class 0 OID 119737)
-- Dependencies: 319
-- Data for Name: bitacora_asignacion; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5807 (class 0 OID 119742)
-- Dependencies: 321
-- Data for Name: cierre_expediente; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5809 (class 0 OID 119749)
-- Dependencies: 323
-- Data for Name: contribuyentes; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5811 (class 0 OID 119754)
-- Dependencies: 325
-- Data for Name: detalle_asesoria; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5813 (class 0 OID 119760)
-- Dependencies: 327
-- Data for Name: expedientes; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5815 (class 0 OID 119769)
-- Dependencies: 329
-- Data for Name: irl_demanda_amparo; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5817 (class 0 OID 119779)
-- Dependencies: 331
-- Data for Name: notificacion_sentencia_cumplida; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5819 (class 0 OID 119786)
-- Dependencies: 333
-- Data for Name: oficio_notificacion; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5821 (class 0 OID 119793)
-- Dependencies: 335
-- Data for Name: plantilla_queja_ari; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5823 (class 0 OID 119799)
-- Dependencies: 337
-- Data for Name: queja_rl_cir; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5825 (class 0 OID 119805)
-- Dependencies: 339
-- Data for Name: quejas; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5826 (class 0 OID 119815)
-- Dependencies: 340
-- Data for Name: quejas_acci; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5828 (class 0 OID 119824)
-- Dependencies: 342
-- Data for Name: quejas_ari; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5830 (class 0 OID 119831)
-- Dependencies: 344
-- Data for Name: quejas_cir; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5833 (class 0 OID 119839)
-- Dependencies: 347
-- Data for Name: quejas_oficios_autoridad; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5835 (class 0 OID 119843)
-- Dependencies: 349
-- Data for Name: quejas_respuestas_autoridad; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5837 (class 0 OID 119850)
-- Dependencies: 351
-- Data for Name: recurso_revision; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5839 (class 0 OID 119857)
-- Dependencies: 353
-- Data for Name: representacion_legal; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5841 (class 0 OID 119863)
-- Dependencies: 355
-- Data for Name: resolucion_final; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5843 (class 0 OID 119869)
-- Dependencies: 357
-- Data for Name: rl_cir; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5845 (class 0 OID 119875)
-- Dependencies: 359
-- Data for Name: sentencia_dictada; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5847 (class 0 OID 119882)
-- Dependencies: 361
-- Data for Name: sentencia_ejecutoria; Type: TABLE DATA; Schema: sustantiva; Owner: postgres
--



--
-- TOC entry 5949 (class 0 OID 0)
-- Dependencies: 220
-- Name: areas_id_area_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.areas_id_area_seq', 14, true);


--
-- TOC entry 5950 (class 0 OID 0)
-- Dependencies: 222
-- Name: autoridades_id_autoridad_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.autoridades_id_autoridad_seq', 23, true);


--
-- TOC entry 5951 (class 0 OID 0)
-- Dependencies: 224
-- Name: cat_autoridades_id_cat_autoridad_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.cat_autoridades_id_cat_autoridad_seq', 23, true);


--
-- TOC entry 5952 (class 0 OID 0)
-- Dependencies: 226
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.cat_estados_id_estado_seq', 32, true);


--
-- TOC entry 5953 (class 0 OID 0)
-- Dependencies: 228
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.cat_estatus_id_estatus_seq', 1, false);


--
-- TOC entry 5954 (class 0 OID 0)
-- Dependencies: 230
-- Name: cat_estatus_queja_id_estatus_queja_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.cat_estatus_queja_id_estatus_queja_seq', 10, true);


--
-- TOC entry 5955 (class 0 OID 0)
-- Dependencies: 232
-- Name: cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq', 1, false);


--
-- TOC entry 5956 (class 0 OID 0)
-- Dependencies: 234
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.cat_municipios_id_municipio_seq', 58, true);


--
-- TOC entry 5957 (class 0 OID 0)
-- Dependencies: 236
-- Name: cat_tipo_proceso_id_cat_tipo_proceso_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.cat_tipo_proceso_id_cat_tipo_proceso_seq', 1, false);


--
-- TOC entry 5958 (class 0 OID 0)
-- Dependencies: 238
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.control_folios_config_id_control_folios_config_seq', 1, false);


--
-- TOC entry 5959 (class 0 OID 0)
-- Dependencies: 240
-- Name: dias_inhabiles_id_dia_inhabil_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.dias_inhabiles_id_dia_inhabil_seq', 8, true);


--
-- TOC entry 5960 (class 0 OID 0)
-- Dependencies: 242
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.direcciones_id_direccion_seq', 1, true);


--
-- TOC entry 5961 (class 0 OID 0)
-- Dependencies: 244
-- Name: empleados_id_empleado_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.empleados_id_empleado_seq', 1, false);


--
-- TOC entry 5962 (class 0 OID 0)
-- Dependencies: 246
-- Name: estatus_detalle_expediente_id_estatus_detalle_expediente_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.estatus_detalle_expediente_id_estatus_detalle_expediente_seq', 6, true);


--
-- TOC entry 5963 (class 0 OID 0)
-- Dependencies: 248
-- Name: estatus_expediente_id_estatus_expediente_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.estatus_expediente_id_estatus_expediente_seq', 4, true);


--
-- TOC entry 5964 (class 0 OID 0)
-- Dependencies: 250
-- Name: estatus_representacion_legal_id_estatus_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.estatus_representacion_legal_id_estatus_seq', 10, true);


--
-- TOC entry 5965 (class 0 OID 0)
-- Dependencies: 252
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.personal_id_personal_seq', 1, false);


--
-- TOC entry 5966 (class 0 OID 0)
-- Dependencies: 254
-- Name: personas_id_persona_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.personas_id_persona_seq', 1, true);


--
-- TOC entry 5967 (class 0 OID 0)
-- Dependencies: 363
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.refresh_tokens_id_seq', 1, false);


--
-- TOC entry 5968 (class 0 OID 0)
-- Dependencies: 256
-- Name: roles_id_rol_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.roles_id_rol_seq', 1, false);


--
-- TOC entry 5969 (class 0 OID 0)
-- Dependencies: 258
-- Name: tipo_acto_emitido_id_tipo_acto_emitido_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.tipo_acto_emitido_id_tipo_acto_emitido_seq', 28, true);


--
-- TOC entry 5970 (class 0 OID 0)
-- Dependencies: 260
-- Name: tipo_correspondencia_id_tipo_correspondencia_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.tipo_correspondencia_id_tipo_correspondencia_seq', 6, true);


--
-- TOC entry 5971 (class 0 OID 0)
-- Dependencies: 262
-- Name: tipo_entrada_id_tipo_entrada_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.tipo_entrada_id_tipo_entrada_seq', 3, true);


--
-- TOC entry 5972 (class 0 OID 0)
-- Dependencies: 264
-- Name: tipo_persona_id_tipo_persona_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.tipo_persona_id_tipo_persona_seq', 2, true);


--
-- TOC entry 5973 (class 0 OID 0)
-- Dependencies: 266
-- Name: tipo_tramite_id_tipo_tramite_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.tipo_tramite_id_tipo_tramite_seq', 3, true);


--
-- TOC entry 5974 (class 0 OID 0)
-- Dependencies: 365
-- Name: user_sessions_id_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.user_sessions_id_seq', 1, false);


--
-- TOC entry 5975 (class 0 OID 0)
-- Dependencies: 268
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.usuarios_id_usuario_seq', 1, false);


--
-- TOC entry 5976 (class 0 OID 0)
-- Dependencies: 270
-- Name: usuarios_roles_id_usuario_rol_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: postgres
--

SELECT pg_catalog.setval('catalogos.usuarios_roles_id_usuario_rol_seq', 1, true);


--
-- TOC entry 5977 (class 0 OID 0)
-- Dependencies: 272
-- Name: acuse_correspondencia_id_acuse_correspondencia_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq', 1, false);


--
-- TOC entry 5978 (class 0 OID 0)
-- Dependencies: 275
-- Name: acuse_oficio_id_acuse_oficio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.acuse_oficio_id_acuse_oficio_seq', 1, false);


--
-- TOC entry 5979 (class 0 OID 0)
-- Dependencies: 276
-- Name: acuserecibointerno_id_acuse_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.acuserecibointerno_id_acuse_seq', 1, false);


--
-- TOC entry 5980 (class 0 OID 0)
-- Dependencies: 278
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.alertas_seguimiento_id_alerta_seq', 1, false);


--
-- TOC entry 5981 (class 0 OID 0)
-- Dependencies: 280
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.archivos_adjuntos_id_archivo_seq', 1, false);


--
-- TOC entry 5982 (class 0 OID 0)
-- Dependencies: 282
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.auditoria_correspondencia_id_log_seq', 1, false);


--
-- TOC entry 5983 (class 0 OID 0)
-- Dependencies: 284
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.correspondencia_id_folio_seq', 1, false);


--
-- TOC entry 5984 (class 0 OID 0)
-- Dependencies: 286
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.correspondencia_respuestas_id_respuesta_seq', 1, false);


--
-- TOC entry 5985 (class 0 OID 0)
-- Dependencies: 288
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.correspondencia_turnos_id_turno_seq', 1, false);


--
-- TOC entry 5986 (class 0 OID 0)
-- Dependencies: 290
-- Name: memorandums_id_memo_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.memorandums_id_memo_seq', 1, false);


--
-- TOC entry 5987 (class 0 OID 0)
-- Dependencies: 292
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.notificaciones_id_notificacion_seq', 1, false);


--
-- TOC entry 5988 (class 0 OID 0)
-- Dependencies: 296
-- Name: oficio_contestacion_externa_id_oficio_contestacion_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq', 1, false);


--
-- TOC entry 5989 (class 0 OID 0)
-- Dependencies: 297
-- Name: oficio_contestacion_id_contestacion_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.oficio_contestacion_id_contestacion_seq', 1, false);


--
-- TOC entry 5990 (class 0 OID 0)
-- Dependencies: 298
-- Name: oficio_id_oficio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.oficio_id_oficio_seq', 1, false);


--
-- TOC entry 5991 (class 0 OID 0)
-- Dependencies: 300
-- Name: plantilla_memorandum_id_plantilla_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.plantilla_memorandum_id_plantilla_seq', 1, false);


--
-- TOC entry 5992 (class 0 OID 0)
-- Dependencies: 302
-- Name: seguimiento_correspondencia_id_seguimiento_correspondencia_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq', 1, false);


--
-- TOC entry 5993 (class 0 OID 0)
-- Dependencies: 304
-- Name: seguimiento_memorandum_folio_respuesta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.seguimiento_memorandum_folio_respuesta_seq', 1, false);


--
-- TOC entry 5994 (class 0 OID 0)
-- Dependencies: 305
-- Name: seguimiento_memorandum_id_seguimiento_memorandum_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq', 1, false);


--
-- TOC entry 5995 (class 0 OID 0)
-- Dependencies: 307
-- Name: seguimiento_oficio_folio_respuesta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.seguimiento_oficio_folio_respuesta_seq', 1, false);


--
-- TOC entry 5996 (class 0 OID 0)
-- Dependencies: 308
-- Name: seguimiento_oficio_id_seguimiento_oficio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: postgres
--

SELECT pg_catalog.setval('correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq', 1, false);


--
-- TOC entry 5997 (class 0 OID 0)
-- Dependencies: 312
-- Name: plantilla_queja_ari_id_plantilla_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plantilla_queja_ari_id_plantilla_seq', 1, false);


--
-- TOC entry 5998 (class 0 OID 0)
-- Dependencies: 314
-- Name: asesores_id_asesores_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.asesores_id_asesores_seq', 1, false);


--
-- TOC entry 5999 (class 0 OID 0)
-- Dependencies: 316
-- Name: audiencia_celebrada_id_audiencia_celebrada_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.audiencia_celebrada_id_audiencia_celebrada_seq', 1, false);


--
-- TOC entry 6000 (class 0 OID 0)
-- Dependencies: 318
-- Name: audiencia_espera_id_audiencia_espera_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.audiencia_espera_id_audiencia_espera_seq', 1, false);


--
-- TOC entry 6001 (class 0 OID 0)
-- Dependencies: 320
-- Name: bitacora_asignacion_id_bitacora_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.bitacora_asignacion_id_bitacora_seq', 1, false);


--
-- TOC entry 6002 (class 0 OID 0)
-- Dependencies: 322
-- Name: cierre_expediente_id_cierre_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.cierre_expediente_id_cierre_seq', 1, false);


--
-- TOC entry 6003 (class 0 OID 0)
-- Dependencies: 324
-- Name: contribuyentes_id_contribuyentes_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.contribuyentes_id_contribuyentes_seq', 1, false);


--
-- TOC entry 6004 (class 0 OID 0)
-- Dependencies: 326
-- Name: detalle_asesoria_id_detalle_asesoria_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.detalle_asesoria_id_detalle_asesoria_seq', 1, false);


--
-- TOC entry 6005 (class 0 OID 0)
-- Dependencies: 328
-- Name: expedientes_id_expediente_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.expedientes_id_expediente_seq', 1, false);


--
-- TOC entry 6006 (class 0 OID 0)
-- Dependencies: 330
-- Name: irl_demanda_amparo_id_demanda_amparo_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.irl_demanda_amparo_id_demanda_amparo_seq', 1, false);


--
-- TOC entry 6007 (class 0 OID 0)
-- Dependencies: 332
-- Name: notificacion_sentencia_cumplida_id_sentencia_cumplida_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.notificacion_sentencia_cumplida_id_sentencia_cumplida_seq', 1, false);


--
-- TOC entry 6008 (class 0 OID 0)
-- Dependencies: 334
-- Name: oficio_notificacion_id_oficio_notificacion_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.oficio_notificacion_id_oficio_notificacion_seq', 1, false);


--
-- TOC entry 6009 (class 0 OID 0)
-- Dependencies: 336
-- Name: plantilla_queja_ari_id_plantilla_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.plantilla_queja_ari_id_plantilla_seq', 1, false);


--
-- TOC entry 6010 (class 0 OID 0)
-- Dependencies: 338
-- Name: queja_rl_cir_id_queja_rl_cir_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.queja_rl_cir_id_queja_rl_cir_seq', 1, false);


--
-- TOC entry 6011 (class 0 OID 0)
-- Dependencies: 341
-- Name: quejas_acci_id_acci_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.quejas_acci_id_acci_seq', 1, false);


--
-- TOC entry 6012 (class 0 OID 0)
-- Dependencies: 343
-- Name: quejas_ari_id_ari_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.quejas_ari_id_ari_seq', 1, false);


--
-- TOC entry 6013 (class 0 OID 0)
-- Dependencies: 345
-- Name: quejas_cir_id_cir_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.quejas_cir_id_cir_seq', 1, false);


--
-- TOC entry 6014 (class 0 OID 0)
-- Dependencies: 346
-- Name: quejas_id_queja_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.quejas_id_queja_seq', 1, false);


--
-- TOC entry 6015 (class 0 OID 0)
-- Dependencies: 348
-- Name: quejas_oficios_autoridad_id_oficio_autoridad_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.quejas_oficios_autoridad_id_oficio_autoridad_seq', 1, false);


--
-- TOC entry 6016 (class 0 OID 0)
-- Dependencies: 350
-- Name: quejas_respuestas_autoridad_id_respuesta_autoridad_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.quejas_respuestas_autoridad_id_respuesta_autoridad_seq', 1, false);


--
-- TOC entry 6017 (class 0 OID 0)
-- Dependencies: 352
-- Name: recurso_revision_id_recurso_revision_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.recurso_revision_id_recurso_revision_seq', 1, false);


--
-- TOC entry 6018 (class 0 OID 0)
-- Dependencies: 354
-- Name: representacion_legal_id_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.representacion_legal_id_seq', 1, false);


--
-- TOC entry 6019 (class 0 OID 0)
-- Dependencies: 356
-- Name: resolucion_final_id_resolucion_final_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.resolucion_final_id_resolucion_final_seq', 1, false);


--
-- TOC entry 6020 (class 0 OID 0)
-- Dependencies: 358
-- Name: rl_cir_id_rl_cir_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.rl_cir_id_rl_cir_seq', 1, false);


--
-- TOC entry 6021 (class 0 OID 0)
-- Dependencies: 360
-- Name: sentencia_dictada_id_sentencia_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.sentencia_dictada_id_sentencia_seq', 1, false);


--
-- TOC entry 6022 (class 0 OID 0)
-- Dependencies: 362
-- Name: sentencia_ejecutoria_id_sentencia_ejecutoria_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: postgres
--

SELECT pg_catalog.setval('sustantiva.sentencia_ejecutoria_id_sentencia_ejecutoria_seq', 1, false);


--
-- TOC entry 5237 (class 2606 OID 119961)
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id_area);


--
-- TOC entry 5239 (class 2606 OID 119963)
-- Name: autoridades autoridades_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.autoridades
    ADD CONSTRAINT autoridades_pkey PRIMARY KEY (id_autoridad);


--
-- TOC entry 5241 (class 2606 OID 119965)
-- Name: cat_autoridades cat_autoridades_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_autoridades
    ADD CONSTRAINT cat_autoridades_pkey PRIMARY KEY (id_cat_autoridad);


--
-- TOC entry 5243 (class 2606 OID 119967)
-- Name: cat_estados cat_estados_nombre_estado_key; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_estados
    ADD CONSTRAINT cat_estados_nombre_estado_key UNIQUE (nombre_estado);


--
-- TOC entry 5245 (class 2606 OID 119969)
-- Name: cat_estados cat_estados_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_estados
    ADD CONSTRAINT cat_estados_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 5247 (class 2606 OID 119971)
-- Name: cat_estatus cat_estatus_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_estatus
    ADD CONSTRAINT cat_estatus_pkey PRIMARY KEY (id_estatus);


--
-- TOC entry 5249 (class 2606 OID 119973)
-- Name: cat_estatus_queja cat_estatus_queja_descripcion_estatus_key; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_estatus_queja
    ADD CONSTRAINT cat_estatus_queja_descripcion_estatus_key UNIQUE (descripcion_estatus);


--
-- TOC entry 5251 (class 2606 OID 119975)
-- Name: cat_estatus_queja cat_estatus_queja_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_estatus_queja
    ADD CONSTRAINT cat_estatus_queja_pkey PRIMARY KEY (id_estatus_queja);


--
-- TOC entry 5253 (class 2606 OID 119977)
-- Name: cat_estatus_sustantiva cat_estatus_sustantiva_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_estatus_sustantiva
    ADD CONSTRAINT cat_estatus_sustantiva_pkey PRIMARY KEY (id_cat_estatus_sustantiva);


--
-- TOC entry 5255 (class 2606 OID 119979)
-- Name: cat_municipios cat_municipios_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_municipios
    ADD CONSTRAINT cat_municipios_pkey PRIMARY KEY (id_municipio);


--
-- TOC entry 5257 (class 2606 OID 119981)
-- Name: cat_tipo_proceso cat_tipo_proceso_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_tipo_proceso
    ADD CONSTRAINT cat_tipo_proceso_pkey PRIMARY KEY (id_cat_tipo_proceso);


--
-- TOC entry 5259 (class 2606 OID 119983)
-- Name: control_folios_config control_folios_config_anio_mes_key; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.control_folios_config
    ADD CONSTRAINT control_folios_config_anio_mes_key UNIQUE (anio, mes);


--
-- TOC entry 5261 (class 2606 OID 119985)
-- Name: control_folios_config control_folios_config_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.control_folios_config
    ADD CONSTRAINT control_folios_config_pkey PRIMARY KEY (id_control_folios_config);


--
-- TOC entry 5263 (class 2606 OID 119987)
-- Name: dias_inhabiles dias_inhabiles_fecha_key; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.dias_inhabiles
    ADD CONSTRAINT dias_inhabiles_fecha_key UNIQUE (fecha);


--
-- TOC entry 5265 (class 2606 OID 119989)
-- Name: dias_inhabiles dias_inhabiles_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.dias_inhabiles
    ADD CONSTRAINT dias_inhabiles_pkey PRIMARY KEY (id_dia_inhabil);


--
-- TOC entry 5267 (class 2606 OID 119991)
-- Name: direcciones direcciones_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.direcciones
    ADD CONSTRAINT direcciones_pkey PRIMARY KEY (id_direccion);


--
-- TOC entry 5269 (class 2606 OID 119993)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 5271 (class 2606 OID 119995)
-- Name: estatus_detalle_expediente estatus_detalle_expediente_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.estatus_detalle_expediente
    ADD CONSTRAINT estatus_detalle_expediente_pkey PRIMARY KEY (id_estatus_detalle_expediente);


--
-- TOC entry 5273 (class 2606 OID 119997)
-- Name: estatus_expediente estatus_expediente_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.estatus_expediente
    ADD CONSTRAINT estatus_expediente_pkey PRIMARY KEY (id_estatus_expediente);


--
-- TOC entry 5275 (class 2606 OID 119999)
-- Name: estatus_representacion_legal estatus_representacion_legal_nombre_estatus_key; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.estatus_representacion_legal
    ADD CONSTRAINT estatus_representacion_legal_nombre_estatus_key UNIQUE (nombre_estatus);


--
-- TOC entry 5277 (class 2606 OID 120001)
-- Name: estatus_representacion_legal estatus_representacion_legal_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.estatus_representacion_legal
    ADD CONSTRAINT estatus_representacion_legal_pkey PRIMARY KEY (id_estatus);


--
-- TOC entry 5279 (class 2606 OID 120003)
-- Name: personal personal_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (id_personal);


--
-- TOC entry 5281 (class 2606 OID 120005)
-- Name: personas personas_curp_key; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT personas_curp_key UNIQUE (curp);


--
-- TOC entry 5283 (class 2606 OID 120007)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id_persona);


--
-- TOC entry 5438 (class 2606 OID 121013)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 5285 (class 2606 OID 120009)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 5287 (class 2606 OID 120011)
-- Name: tipo_acto_emitido tipo_acto_emitido_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_acto_emitido
    ADD CONSTRAINT tipo_acto_emitido_pkey PRIMARY KEY (id_tipo_acto_emitido);


--
-- TOC entry 5289 (class 2606 OID 120013)
-- Name: tipo_correspondencia tipo_correspondencia_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_correspondencia
    ADD CONSTRAINT tipo_correspondencia_pkey PRIMARY KEY (id_tipo_correspondencia);


--
-- TOC entry 5293 (class 2606 OID 120015)
-- Name: tipo_entrada tipo_entrada_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_entrada
    ADD CONSTRAINT tipo_entrada_pkey PRIMARY KEY (id_tipo_entrada);


--
-- TOC entry 5295 (class 2606 OID 120017)
-- Name: tipo_persona tipo_persona_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_persona
    ADD CONSTRAINT tipo_persona_pkey PRIMARY KEY (id_tipo_persona);


--
-- TOC entry 5297 (class 2606 OID 120019)
-- Name: tipo_tramite tipo_tramite_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_tramite
    ADD CONSTRAINT tipo_tramite_pkey PRIMARY KEY (id_tipo_tramite);


--
-- TOC entry 5291 (class 2606 OID 120021)
-- Name: tipo_correspondencia uq_tipo_correspondencia_descripcion; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.tipo_correspondencia
    ADD CONSTRAINT uq_tipo_correspondencia_descripcion UNIQUE (descripcion);


--
-- TOC entry 5305 (class 2606 OID 120023)
-- Name: usuarios_roles uq_usuario_rol; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT uq_usuario_rol UNIQUE (id_usuario, id_rol);


--
-- TOC entry 5440 (class 2606 OID 121029)
-- Name: user_sessions user_sessions_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 5299 (class 2606 OID 120025)
-- Name: usuarios usuarios_correo_electronico_key; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_correo_electronico_key UNIQUE (correo_electronico);


--
-- TOC entry 5301 (class 2606 OID 120027)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 5307 (class 2606 OID 120029)
-- Name: usuarios_roles usuarios_roles_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (id_usuario_rol);


--
-- TOC entry 5303 (class 2606 OID 120031)
-- Name: usuarios usuarios_usuario_login_key; Type: CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_usuario_login_key UNIQUE (usuario_login);


--
-- TOC entry 5309 (class 2606 OID 120033)
-- Name: acuse_correspondencia acuse_correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT acuse_correspondencia_pkey PRIMARY KEY (id_acuse_correspondencia);


--
-- TOC entry 5317 (class 2606 OID 120035)
-- Name: acuse_oficio acuse_oficio_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_oficio
    ADD CONSTRAINT acuse_oficio_pkey PRIMARY KEY (id_acuse_oficio);


--
-- TOC entry 5313 (class 2606 OID 120037)
-- Name: acuse_memorandum acuserecibointerno_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT acuserecibointerno_pkey PRIMARY KEY (id_acuse);


--
-- TOC entry 5319 (class 2606 OID 120039)
-- Name: alertas_seguimiento alertas_seguimiento_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_pkey PRIMARY KEY (id_alerta);


--
-- TOC entry 5321 (class 2606 OID 120041)
-- Name: archivos_adjuntos archivos_adjuntos_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_pkey PRIMARY KEY (id_archivo);


--
-- TOC entry 5323 (class 2606 OID 120043)
-- Name: auditoria_correspondencia auditoria_correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_pkey PRIMARY KEY (id_log);


--
-- TOC entry 5325 (class 2606 OID 120045)
-- Name: correspondencia correspondencia_folio_unico_key; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_folio_unico_key UNIQUE (folio_unico);


--
-- TOC entry 5327 (class 2606 OID 120047)
-- Name: correspondencia correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_pkey PRIMARY KEY (id_correspondencia);


--
-- TOC entry 5329 (class 2606 OID 120049)
-- Name: correspondencia_respuestas correspondencia_respuestas_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_pkey PRIMARY KEY (id_respuesta);


--
-- TOC entry 5331 (class 2606 OID 120051)
-- Name: correspondencia_turnos correspondencia_turnos_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_pkey PRIMARY KEY (id_turno);


--
-- TOC entry 5333 (class 2606 OID 120053)
-- Name: memorandums memorandums_folio_unico_key; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_folio_unico_key UNIQUE (folio_unico);


--
-- TOC entry 5335 (class 2606 OID 120055)
-- Name: memorandums memorandums_num_memo_key; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_num_memo_key UNIQUE (num_memo);


--
-- TOC entry 5337 (class 2606 OID 120057)
-- Name: memorandums memorandums_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_pkey PRIMARY KEY (id_memo);


--
-- TOC entry 5339 (class 2606 OID 120059)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);


--
-- TOC entry 5343 (class 2606 OID 120061)
-- Name: oficio_contestacion oficio_contestacion_num_oficio_contestacion_key; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT oficio_contestacion_num_oficio_contestacion_key UNIQUE (num_oficio_contestacion);


--
-- TOC entry 5345 (class 2606 OID 120063)
-- Name: oficio_contestacion oficio_contestacion_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT oficio_contestacion_pkey PRIMARY KEY (id_contestacion);


--
-- TOC entry 5341 (class 2606 OID 120065)
-- Name: oficio oficio_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT oficio_pkey PRIMARY KEY (id_oficio);


--
-- TOC entry 5347 (class 2606 OID 120067)
-- Name: oficio_contestacion_externa pk_oficio_contestacion; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa
    ADD CONSTRAINT pk_oficio_contestacion PRIMARY KEY (id_oficio_contestacion);


--
-- TOC entry 5349 (class 2606 OID 120069)
-- Name: plantilla_memorandum plantilla_memorandum_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.plantilla_memorandum
    ADD CONSTRAINT plantilla_memorandum_pkey PRIMARY KEY (id_plantilla);


--
-- TOC entry 5351 (class 2606 OID 120071)
-- Name: seguimiento_correspondencia seguimiento_correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT seguimiento_correspondencia_pkey PRIMARY KEY (id_seguimiento_correspondencia);


--
-- TOC entry 5353 (class 2606 OID 120073)
-- Name: seguimiento_memorandum seguimiento_memorandum_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT seguimiento_memorandum_pkey PRIMARY KEY (id_seguimiento_memorandum);


--
-- TOC entry 5355 (class 2606 OID 120075)
-- Name: seguimiento_oficio seguimiento_oficio_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT seguimiento_oficio_pkey PRIMARY KEY (id_seguimiento_oficio);


--
-- TOC entry 5315 (class 2606 OID 120077)
-- Name: acuse_memorandum uq_acuse; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT uq_acuse UNIQUE (id_memorandum, id_usuario_revisor);


--
-- TOC entry 5311 (class 2606 OID 120079)
-- Name: acuse_correspondencia uq_acuse_correspondencia; Type: CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT uq_acuse_correspondencia UNIQUE (id_correspondencia, id_usuario_revisor);


--
-- TOC entry 5357 (class 2606 OID 120081)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 5359 (class 2606 OID 120083)
-- Name: plantilla_queja_ari plantilla_queja_ari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plantilla_queja_ari
    ADD CONSTRAINT plantilla_queja_ari_pkey PRIMARY KEY (id_plantilla);


--
-- TOC entry 5361 (class 2606 OID 120085)
-- Name: asesores asesores_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.asesores
    ADD CONSTRAINT asesores_pkey PRIMARY KEY (id_asesores);


--
-- TOC entry 5363 (class 2606 OID 120087)
-- Name: audiencia_celebrada audiencia_celebrada_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.audiencia_celebrada
    ADD CONSTRAINT audiencia_celebrada_pkey PRIMARY KEY (id_audiencia_celebrada);


--
-- TOC entry 5365 (class 2606 OID 120089)
-- Name: audiencia_espera audiencia_espera_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.audiencia_espera
    ADD CONSTRAINT audiencia_espera_pkey PRIMARY KEY (id_audiencia_espera);


--
-- TOC entry 5367 (class 2606 OID 120091)
-- Name: bitacora_asignacion bitacora_asignacion_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.bitacora_asignacion
    ADD CONSTRAINT bitacora_asignacion_pkey PRIMARY KEY (id_bitacora);


--
-- TOC entry 5370 (class 2606 OID 120093)
-- Name: cierre_expediente cierre_expediente_id_expediente_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.cierre_expediente
    ADD CONSTRAINT cierre_expediente_id_expediente_key UNIQUE (id_expediente);


--
-- TOC entry 5372 (class 2606 OID 120095)
-- Name: cierre_expediente cierre_expediente_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.cierre_expediente
    ADD CONSTRAINT cierre_expediente_pkey PRIMARY KEY (id_cierre);


--
-- TOC entry 5374 (class 2606 OID 120097)
-- Name: contribuyentes contribuyentes_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.contribuyentes
    ADD CONSTRAINT contribuyentes_pkey PRIMARY KEY (id_contribuyentes);


--
-- TOC entry 5376 (class 2606 OID 120099)
-- Name: detalle_asesoria detalle_asesoria_id_expediente_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT detalle_asesoria_id_expediente_key UNIQUE (id_expediente);


--
-- TOC entry 5378 (class 2606 OID 120101)
-- Name: detalle_asesoria detalle_asesoria_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT detalle_asesoria_pkey PRIMARY KEY (id_detalle_asesoria);


--
-- TOC entry 5380 (class 2606 OID 120103)
-- Name: expedientes expedientes_folio_gobierno_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT expedientes_folio_gobierno_key UNIQUE (folio_gobierno);


--
-- TOC entry 5382 (class 2606 OID 120105)
-- Name: expedientes expedientes_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT expedientes_pkey PRIMARY KEY (id_expediente);


--
-- TOC entry 5386 (class 2606 OID 120107)
-- Name: irl_demanda_amparo irl_demanda_amparo_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.irl_demanda_amparo
    ADD CONSTRAINT irl_demanda_amparo_pkey PRIMARY KEY (id_demanda_amparo);


--
-- TOC entry 5388 (class 2606 OID 120109)
-- Name: notificacion_sentencia_cumplida notificacion_sentencia_cumplida_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.notificacion_sentencia_cumplida
    ADD CONSTRAINT notificacion_sentencia_cumplida_pkey PRIMARY KEY (id_sentencia_cumplida);


--
-- TOC entry 5392 (class 2606 OID 120111)
-- Name: oficio_notificacion oficio_notificacion_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.oficio_notificacion
    ADD CONSTRAINT oficio_notificacion_pkey PRIMARY KEY (id_oficio_notificacion);


--
-- TOC entry 5394 (class 2606 OID 120113)
-- Name: plantilla_queja_ari plantilla_queja_ari_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.plantilla_queja_ari
    ADD CONSTRAINT plantilla_queja_ari_pkey PRIMARY KEY (id_plantilla);


--
-- TOC entry 5396 (class 2606 OID 120115)
-- Name: queja_rl_cir queja_rl_cir_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.queja_rl_cir
    ADD CONSTRAINT queja_rl_cir_pkey PRIMARY KEY (id_queja_rl_cir);


--
-- TOC entry 5402 (class 2606 OID 120117)
-- Name: quejas_acci quejas_acci_id_oficio_autoridad_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_acci
    ADD CONSTRAINT quejas_acci_id_oficio_autoridad_key UNIQUE (id_oficio_autoridad);


--
-- TOC entry 5404 (class 2606 OID 120119)
-- Name: quejas_acci quejas_acci_id_queja_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_acci
    ADD CONSTRAINT quejas_acci_id_queja_key UNIQUE (id_queja);


--
-- TOC entry 5406 (class 2606 OID 120121)
-- Name: quejas_acci quejas_acci_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_acci
    ADD CONSTRAINT quejas_acci_pkey PRIMARY KEY (id_acci);


--
-- TOC entry 5408 (class 2606 OID 120123)
-- Name: quejas_ari quejas_ari_id_cir_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_id_cir_key UNIQUE (id_cir);


--
-- TOC entry 5410 (class 2606 OID 120125)
-- Name: quejas_ari quejas_ari_id_queja_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_id_queja_key UNIQUE (id_queja);


--
-- TOC entry 5412 (class 2606 OID 120127)
-- Name: quejas_ari quejas_ari_num_expediente_oficial_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_num_expediente_oficial_key UNIQUE (num_expediente_oficial);


--
-- TOC entry 5414 (class 2606 OID 120129)
-- Name: quejas_ari quejas_ari_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_pkey PRIMARY KEY (id_ari);


--
-- TOC entry 5416 (class 2606 OID 120131)
-- Name: quejas_cir quejas_cir_id_queja_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT quejas_cir_id_queja_key UNIQUE (id_queja);


--
-- TOC entry 5418 (class 2606 OID 120133)
-- Name: quejas_cir quejas_cir_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT quejas_cir_pkey PRIMARY KEY (id_cir);


--
-- TOC entry 5398 (class 2606 OID 120135)
-- Name: quejas quejas_id_expediente_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_id_expediente_key UNIQUE (id_expediente);


--
-- TOC entry 5420 (class 2606 OID 120137)
-- Name: quejas_oficios_autoridad quejas_oficios_autoridad_num_oficio_comisionado_key; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_oficios_autoridad
    ADD CONSTRAINT quejas_oficios_autoridad_num_oficio_comisionado_key UNIQUE (num_oficio_comisionado);


--
-- TOC entry 5422 (class 2606 OID 120139)
-- Name: quejas_oficios_autoridad quejas_oficios_autoridad_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_oficios_autoridad
    ADD CONSTRAINT quejas_oficios_autoridad_pkey PRIMARY KEY (id_oficio_autoridad);


--
-- TOC entry 5400 (class 2606 OID 120141)
-- Name: quejas quejas_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_pkey PRIMARY KEY (id_queja);


--
-- TOC entry 5424 (class 2606 OID 120143)
-- Name: quejas_respuestas_autoridad quejas_respuestas_autoridad_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_respuestas_autoridad
    ADD CONSTRAINT quejas_respuestas_autoridad_pkey PRIMARY KEY (id_respuesta_autoridad);


--
-- TOC entry 5426 (class 2606 OID 120145)
-- Name: recurso_revision recurso_revision_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.recurso_revision
    ADD CONSTRAINT recurso_revision_pkey PRIMARY KEY (id_recurso_revision);


--
-- TOC entry 5428 (class 2606 OID 120147)
-- Name: representacion_legal representacion_legal_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.representacion_legal
    ADD CONSTRAINT representacion_legal_pkey PRIMARY KEY (id);


--
-- TOC entry 5430 (class 2606 OID 120149)
-- Name: resolucion_final resolucion_final_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.resolucion_final
    ADD CONSTRAINT resolucion_final_pkey PRIMARY KEY (id_resolucion_final);


--
-- TOC entry 5432 (class 2606 OID 120151)
-- Name: rl_cir rl_cir_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.rl_cir
    ADD CONSTRAINT rl_cir_pkey PRIMARY KEY (id_rl_cir);


--
-- TOC entry 5434 (class 2606 OID 120153)
-- Name: sentencia_dictada sentencia_dictada_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.sentencia_dictada
    ADD CONSTRAINT sentencia_dictada_pkey PRIMARY KEY (id_sentencia);


--
-- TOC entry 5436 (class 2606 OID 120155)
-- Name: sentencia_ejecutoria sentencia_ejecutoria_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.sentencia_ejecutoria
    ADD CONSTRAINT sentencia_ejecutoria_pkey PRIMARY KEY (id_sentencia_ejecutoria);


--
-- TOC entry 5368 (class 1259 OID 120156)
-- Name: idx_bitacora_expediente; Type: INDEX; Schema: sustantiva; Owner: postgres
--

CREATE INDEX idx_bitacora_expediente ON sustantiva.bitacora_asignacion USING btree (id_expediente);


--
-- TOC entry 5383 (class 1259 OID 120157)
-- Name: idx_demanda_amparo_queja_rl_cir; Type: INDEX; Schema: sustantiva; Owner: postgres
--

CREATE INDEX idx_demanda_amparo_queja_rl_cir ON sustantiva.irl_demanda_amparo USING btree (id_queja_rl_cir);


--
-- TOC entry 5384 (class 1259 OID 120158)
-- Name: idx_demanda_amparo_rl_cir; Type: INDEX; Schema: sustantiva; Owner: postgres
--

CREATE INDEX idx_demanda_amparo_rl_cir ON sustantiva.irl_demanda_amparo USING btree (id_rl_cir);


--
-- TOC entry 5389 (class 1259 OID 120159)
-- Name: idx_oficio_notif_autoridad; Type: INDEX; Schema: sustantiva; Owner: postgres
--

CREATE INDEX idx_oficio_notif_autoridad ON sustantiva.oficio_notificacion USING btree (id_autoridad);


--
-- TOC entry 5390 (class 1259 OID 120160)
-- Name: idx_oficio_notif_folio; Type: INDEX; Schema: sustantiva; Owner: postgres
--

CREATE INDEX idx_oficio_notif_folio ON sustantiva.oficio_notificacion USING btree (folio_expediente);


--
-- TOC entry 5441 (class 2606 OID 120161)
-- Name: cat_municipios cat_municipios_id_estado_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.cat_municipios
    ADD CONSTRAINT cat_municipios_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES catalogos.cat_estados(id_estado);


--
-- TOC entry 5442 (class 2606 OID 120166)
-- Name: direcciones direcciones_id_estado_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.direcciones
    ADD CONSTRAINT direcciones_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES catalogos.cat_estados(id_estado);


--
-- TOC entry 5443 (class 2606 OID 120171)
-- Name: direcciones direcciones_id_municipio_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.direcciones
    ADD CONSTRAINT direcciones_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES catalogos.cat_municipios(id_municipio);


--
-- TOC entry 5444 (class 2606 OID 120176)
-- Name: empleados fk_empleado_area; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.empleados
    ADD CONSTRAINT fk_empleado_area FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5445 (class 2606 OID 120181)
-- Name: personal fk_persona; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.personal
    ADD CONSTRAINT fk_persona FOREIGN KEY (id_persona) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5446 (class 2606 OID 120186)
-- Name: personas fk_personas_tipo_persona; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT fk_personas_tipo_persona FOREIGN KEY (id_tipo_persona) REFERENCES catalogos.tipo_persona(id_tipo_persona);


--
-- TOC entry 5560 (class 2606 OID 121014)
-- Name: refresh_tokens fk_refresh_tokens_usuarios; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.refresh_tokens
    ADD CONSTRAINT fk_refresh_tokens_usuarios FOREIGN KEY (user_id) REFERENCES catalogos.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 5450 (class 2606 OID 120191)
-- Name: usuarios_roles fk_rol; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT fk_rol FOREIGN KEY (id_rol) REFERENCES catalogos.roles(id_rol) ON DELETE CASCADE;


--
-- TOC entry 5561 (class 2606 OID 121030)
-- Name: user_sessions fk_user_sessions_usuarios; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.user_sessions
    ADD CONSTRAINT fk_user_sessions_usuarios FOREIGN KEY (user_id) REFERENCES catalogos.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 5451 (class 2606 OID 120196)
-- Name: usuarios_roles fk_usuario; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 5447 (class 2606 OID 120201)
-- Name: personas personas_id_direccion_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT personas_id_direccion_fkey FOREIGN KEY (id_direccion) REFERENCES catalogos.direcciones(id_direccion);


--
-- TOC entry 5448 (class 2606 OID 120206)
-- Name: usuarios usuarios_id_area_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_id_area_fkey FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5449 (class 2606 OID 120211)
-- Name: usuarios usuarios_id_persona_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: postgres
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5458 (class 2606 OID 120216)
-- Name: alertas_seguimiento alertas_seguimiento_id_turno_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES correspondencia.correspondencia_turnos(id_turno);


--
-- TOC entry 5459 (class 2606 OID 120221)
-- Name: alertas_seguimiento alertas_seguimiento_id_usuario_emisor_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_id_usuario_emisor_fkey FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5460 (class 2606 OID 120226)
-- Name: archivos_adjuntos archivos_adjuntos_id_usuario_subio_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_id_usuario_subio_fkey FOREIGN KEY (id_usuario_subio) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5462 (class 2606 OID 120231)
-- Name: auditoria_correspondencia auditoria_correspondencia_estado_anterior_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_estado_anterior_fkey FOREIGN KEY (estado_anterior) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5463 (class 2606 OID 120236)
-- Name: auditoria_correspondencia auditoria_correspondencia_estado_nuevo_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_estado_nuevo_fkey FOREIGN KEY (estado_nuevo) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5464 (class 2606 OID 120241)
-- Name: auditoria_correspondencia auditoria_correspondencia_id_usuario_accion_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_id_usuario_accion_fkey FOREIGN KEY (id_usuario_accion) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5466 (class 2606 OID 120246)
-- Name: correspondencia correspondencia_id_estatus_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_id_estatus_fkey FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5467 (class 2606 OID 120251)
-- Name: correspondencia correspondencia_id_usuario_captura_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_id_usuario_captura_fkey FOREIGN KEY (id_usuario_captura) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5470 (class 2606 OID 120256)
-- Name: correspondencia_respuestas correspondencia_respuestas_id_turno_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES correspondencia.correspondencia_turnos(id_turno);


--
-- TOC entry 5471 (class 2606 OID 120261)
-- Name: correspondencia_respuestas correspondencia_respuestas_id_usuario_responde_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_id_usuario_responde_fkey FOREIGN KEY (id_usuario_responde) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5472 (class 2606 OID 120266)
-- Name: correspondencia_turnos correspondencia_turnos_id_area_destino_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_area_destino_fkey FOREIGN KEY (id_area_destino) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5473 (class 2606 OID 120271)
-- Name: correspondencia_turnos correspondencia_turnos_id_estatus_individual_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_estatus_individual_fkey FOREIGN KEY (id_estatus_individual) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5474 (class 2606 OID 120276)
-- Name: correspondencia_turnos correspondencia_turnos_id_memo_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_memo_fkey FOREIGN KEY (id_memo) REFERENCES correspondencia.memorandums(id_memo);


--
-- TOC entry 5475 (class 2606 OID 120281)
-- Name: correspondencia_turnos correspondencia_turnos_id_usuario_responsable_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_usuario_responsable_fkey FOREIGN KEY (id_usuario_responsable) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5452 (class 2606 OID 120286)
-- Name: acuse_correspondencia fk_acuse_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT fk_acuse_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5454 (class 2606 OID 120291)
-- Name: acuse_memorandum fk_acuse_memorandum; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT fk_acuse_memorandum FOREIGN KEY (id_memorandum) REFERENCES correspondencia.memorandums(id_memo);


--
-- TOC entry 5456 (class 2606 OID 120296)
-- Name: acuse_oficio fk_acuse_oficio_rel_oficio; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_oficio
    ADD CONSTRAINT fk_acuse_oficio_rel_oficio FOREIGN KEY (id_oficio) REFERENCES correspondencia.oficio(id_oficio);


--
-- TOC entry 5457 (class 2606 OID 120301)
-- Name: acuse_oficio fk_acuse_oficio_usuario_revisor; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_oficio
    ADD CONSTRAINT fk_acuse_oficio_usuario_revisor FOREIGN KEY (id_usuario_revisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5455 (class 2606 OID 120306)
-- Name: acuse_memorandum fk_acuse_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT fk_acuse_usuario FOREIGN KEY (id_usuario_revisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5453 (class 2606 OID 120311)
-- Name: acuse_correspondencia fk_acuse_usuario_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT fk_acuse_usuario_correspondencia FOREIGN KEY (id_usuario_revisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5461 (class 2606 OID 120316)
-- Name: archivos_adjuntos fk_archivos_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos
    ADD CONSTRAINT fk_archivos_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5465 (class 2606 OID 120321)
-- Name: auditoria_correspondencia fk_auditoria_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT fk_auditoria_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5491 (class 2606 OID 120326)
-- Name: oficio_contestacion_externa fk_contestacion_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa
    ADD CONSTRAINT fk_contestacion_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia) ON DELETE CASCADE;


--
-- TOC entry 5488 (class 2606 OID 120331)
-- Name: oficio_contestacion fk_contestacion_seguimiento_corr; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT fk_contestacion_seguimiento_corr FOREIGN KEY (id_seguimiento_correspondencia) REFERENCES correspondencia.seguimiento_correspondencia(id_seguimiento_correspondencia);


--
-- TOC entry 5489 (class 2606 OID 120336)
-- Name: oficio_contestacion fk_contestacion_seguimiento_memo; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT fk_contestacion_seguimiento_memo FOREIGN KEY (id_seguimiento_memorandum) REFERENCES correspondencia.seguimiento_memorandum(id_seguimiento_memorandum);


--
-- TOC entry 5490 (class 2606 OID 120341)
-- Name: oficio_contestacion fk_contestacion_seguimiento_oficio; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT fk_contestacion_seguimiento_oficio FOREIGN KEY (id_seguimiento_oficio) REFERENCES correspondencia.seguimiento_oficio(id_seguimiento_oficio);


--
-- TOC entry 5492 (class 2606 OID 120346)
-- Name: oficio_contestacion_externa fk_contestacion_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa
    ADD CONSTRAINT fk_contestacion_usuario FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5493 (class 2606 OID 120351)
-- Name: seguimiento_correspondencia fk_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT fk_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5468 (class 2606 OID 120356)
-- Name: correspondencia fk_correspondencia_areas; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT fk_correspondencia_areas FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5469 (class 2606 OID 120361)
-- Name: correspondencia fk_correspondencia_tipo; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT fk_correspondencia_tipo FOREIGN KEY (id_tipo_correspondencia) REFERENCES catalogos.tipo_correspondencia(id_tipo_correspondencia);


--
-- TOC entry 5496 (class 2606 OID 120366)
-- Name: seguimiento_memorandum fk_estatus; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT fk_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5494 (class 2606 OID 120371)
-- Name: seguimiento_correspondencia fk_estatus; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT fk_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5477 (class 2606 OID 120376)
-- Name: memorandums fk_memo_area; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_area FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5478 (class 2606 OID 120381)
-- Name: memorandums fk_memo_emisor; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_emisor FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5479 (class 2606 OID 120386)
-- Name: memorandums fk_memo_firmante; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_firmante FOREIGN KEY (id_usuario_firmante) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5480 (class 2606 OID 120391)
-- Name: memorandums fk_memo_plantilla; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_plantilla FOREIGN KEY (id_plantilla) REFERENCES correspondencia.plantilla_memorandum(id_plantilla);


--
-- TOC entry 5497 (class 2606 OID 120396)
-- Name: seguimiento_memorandum fk_memorandum; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT fk_memorandum FOREIGN KEY (id_memo) REFERENCES correspondencia.memorandums(id_memo);


--
-- TOC entry 5481 (class 2606 OID 120401)
-- Name: memorandums fk_memorandums_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memorandums_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5484 (class 2606 OID 120406)
-- Name: oficio fk_oficio_area; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_area FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5485 (class 2606 OID 120411)
-- Name: oficio fk_oficio_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5486 (class 2606 OID 120416)
-- Name: oficio fk_oficio_usuario_emisor; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_usuario_emisor FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5487 (class 2606 OID 120421)
-- Name: oficio fk_oficio_usuario_firmante; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_usuario_firmante FOREIGN KEY (id_usuario_firmante) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5499 (class 2606 OID 120426)
-- Name: seguimiento_oficio fk_seguimiento_oficio_estatus; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT fk_seguimiento_oficio_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5500 (class 2606 OID 120431)
-- Name: seguimiento_oficio fk_seguimiento_oficio_oficio; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT fk_seguimiento_oficio_oficio FOREIGN KEY (id_oficio) REFERENCES correspondencia.oficio(id_oficio);


--
-- TOC entry 5501 (class 2606 OID 120436)
-- Name: seguimiento_oficio fk_seguimiento_oficio_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT fk_seguimiento_oficio_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5476 (class 2606 OID 120441)
-- Name: correspondencia_turnos fk_turnos_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT fk_turnos_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5495 (class 2606 OID 120446)
-- Name: seguimiento_correspondencia fk_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5498 (class 2606 OID 120451)
-- Name: seguimiento_memorandum fk_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5482 (class 2606 OID 120456)
-- Name: memorandums memorandums_id_usuario_emisor_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_id_usuario_emisor_fkey FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5483 (class 2606 OID 120461)
-- Name: notificaciones notificaciones_id_usuario_destino_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: postgres
--

ALTER TABLE ONLY correspondencia.notificaciones
    ADD CONSTRAINT notificaciones_id_usuario_destino_fkey FOREIGN KEY (id_usuario_destino) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5502 (class 2606 OID 120466)
-- Name: asesores fk_asesor_persona; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.asesores
    ADD CONSTRAINT fk_asesor_persona FOREIGN KEY (id_persona) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5503 (class 2606 OID 120471)
-- Name: audiencia_celebrada fk_aud_celebrada_espera; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.audiencia_celebrada
    ADD CONSTRAINT fk_aud_celebrada_espera FOREIGN KEY (id_audiencia_espera) REFERENCES sustantiva.audiencia_espera(id_audiencia_espera) ON DELETE CASCADE;


--
-- TOC entry 5504 (class 2606 OID 120476)
-- Name: audiencia_espera fk_aud_espera_demanda; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.audiencia_espera
    ADD CONSTRAINT fk_aud_espera_demanda FOREIGN KEY (id_demanda_amparo) REFERENCES sustantiva.irl_demanda_amparo(id_demanda_amparo) ON DELETE CASCADE;


--
-- TOC entry 5507 (class 2606 OID 120481)
-- Name: contribuyentes fk_contribuyente_persona; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.contribuyentes
    ADD CONSTRAINT fk_contribuyente_persona FOREIGN KEY (id_persona) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5523 (class 2606 OID 120486)
-- Name: notificacion_sentencia_cumplida fk_cumplida_ejecutoria; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.notificacion_sentencia_cumplida
    ADD CONSTRAINT fk_cumplida_ejecutoria FOREIGN KEY (id_sentencia_ejecutoria) REFERENCES sustantiva.sentencia_ejecutoria(id_sentencia_ejecutoria) ON DELETE CASCADE;


--
-- TOC entry 5519 (class 2606 OID 120491)
-- Name: irl_demanda_amparo fk_demanda_amparo_queja_rl_cir; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.irl_demanda_amparo
    ADD CONSTRAINT fk_demanda_amparo_queja_rl_cir FOREIGN KEY (id_queja_rl_cir) REFERENCES sustantiva.queja_rl_cir(id_queja_rl_cir);


--
-- TOC entry 5520 (class 2606 OID 120496)
-- Name: irl_demanda_amparo fk_demanda_amparo_rl_cir; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.irl_demanda_amparo
    ADD CONSTRAINT fk_demanda_amparo_rl_cir FOREIGN KEY (id_rl_cir) REFERENCES sustantiva.rl_cir(id_rl_cir);


--
-- TOC entry 5508 (class 2606 OID 120501)
-- Name: detalle_asesoria fk_det_autoridad; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT fk_det_autoridad FOREIGN KEY (id_autoridad) REFERENCES catalogos.autoridades(id_autoridad);


--
-- TOC entry 5509 (class 2606 OID 120506)
-- Name: detalle_asesoria fk_det_estatus_detalle; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT fk_det_estatus_detalle FOREIGN KEY (id_estatus_detalle_expediente) REFERENCES catalogos.estatus_detalle_expediente(id_estatus_detalle_expediente);


--
-- TOC entry 5510 (class 2606 OID 120511)
-- Name: detalle_asesoria fk_det_tipo_acto; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT fk_det_tipo_acto FOREIGN KEY (id_tipo_acto_emitido) REFERENCES catalogos.tipo_acto_emitido(id_tipo_acto_emitido);


--
-- TOC entry 5511 (class 2606 OID 120516)
-- Name: detalle_asesoria fk_det_tipo_entrada; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT fk_det_tipo_entrada FOREIGN KEY (id_tipo_entrada) REFERENCES catalogos.tipo_entrada(id_tipo_entrada);


--
-- TOC entry 5558 (class 2606 OID 120521)
-- Name: sentencia_ejecutoria fk_ejecutoria_revision; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.sentencia_ejecutoria
    ADD CONSTRAINT fk_ejecutoria_revision FOREIGN KEY (id_recurso_revision) REFERENCES sustantiva.recurso_revision(id_recurso_revision) ON DELETE SET NULL;


--
-- TOC entry 5559 (class 2606 OID 120526)
-- Name: sentencia_ejecutoria fk_ejecutoria_sentencia; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.sentencia_ejecutoria
    ADD CONSTRAINT fk_ejecutoria_sentencia FOREIGN KEY (id_sentencia) REFERENCES sustantiva.sentencia_dictada(id_sentencia) ON DELETE CASCADE;


--
-- TOC entry 5512 (class 2606 OID 120531)
-- Name: expedientes fk_exp_asesor; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_asesor FOREIGN KEY (id_asesor) REFERENCES sustantiva.asesores(id_asesores);


--
-- TOC entry 5513 (class 2606 OID 120536)
-- Name: expedientes fk_exp_contribuyente; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_contribuyente FOREIGN KEY (id_contribuyente) REFERENCES sustantiva.contribuyentes(id_contribuyentes);


--
-- TOC entry 5514 (class 2606 OID 120541)
-- Name: expedientes fk_exp_estatus; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_estatus FOREIGN KEY (id_estatus_expediente) REFERENCES catalogos.estatus_expediente(id_estatus_expediente);


--
-- TOC entry 5515 (class 2606 OID 120546)
-- Name: expedientes fk_exp_municipio; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_municipio FOREIGN KEY (id_municipio) REFERENCES catalogos.cat_municipios(id_municipio);


--
-- TOC entry 5516 (class 2606 OID 120551)
-- Name: expedientes fk_exp_solicitante; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_solicitante FOREIGN KEY (id_solicitante) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5517 (class 2606 OID 120556)
-- Name: expedientes fk_exp_tipo_tramite; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_tipo_tramite FOREIGN KEY (id_tipo_tramite) REFERENCES catalogos.tipo_tramite(id_tipo_tramite);


--
-- TOC entry 5505 (class 2606 OID 120561)
-- Name: cierre_expediente fk_expediente_cierre; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.cierre_expediente
    ADD CONSTRAINT fk_expediente_cierre FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);


--
-- TOC entry 5518 (class 2606 OID 120566)
-- Name: expedientes fk_expedientes_representante_legal; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_expedientes_representante_legal FOREIGN KEY (id_representante_legal) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5524 (class 2606 OID 120571)
-- Name: oficio_notificacion fk_oficio_notif_autoridad; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.oficio_notificacion
    ADD CONSTRAINT fk_oficio_notif_autoridad FOREIGN KEY (id_autoridad) REFERENCES catalogos.autoridades(id_autoridad) ON DELETE RESTRICT;


--
-- TOC entry 5525 (class 2606 OID 120576)
-- Name: oficio_notificacion fk_oficio_notif_expediente; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.oficio_notificacion
    ADD CONSTRAINT fk_oficio_notif_expediente FOREIGN KEY (folio_expediente) REFERENCES sustantiva.expedientes(folio_gobierno) ON DELETE RESTRICT;


--
-- TOC entry 5535 (class 2606 OID 120581)
-- Name: quejas_ari fk_quejas_ari_plantilla; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT fk_quejas_ari_plantilla FOREIGN KEY (id_plantilla_queja_ari) REFERENCES sustantiva.plantilla_queja_ari(id_plantilla) ON DELETE SET NULL;


--
-- TOC entry 5538 (class 2606 OID 120586)
-- Name: quejas_cir fk_quejas_cir_area_recibe; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT fk_quejas_cir_area_recibe FOREIGN KEY (id_area_recibe) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5539 (class 2606 OID 120591)
-- Name: quejas_cir fk_quejas_cir_area_remite; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT fk_quejas_cir_area_remite FOREIGN KEY (id_area_remite) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5540 (class 2606 OID 120596)
-- Name: quejas_cir fk_quejas_cir_expediente; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT fk_quejas_cir_expediente FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);


--
-- TOC entry 5541 (class 2606 OID 120601)
-- Name: quejas_cir fk_quejas_cir_tipo_tramite; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT fk_quejas_cir_tipo_tramite FOREIGN KEY (id_tipo_tramite) REFERENCES catalogos.tipo_tramite(id_tipo_tramite);


--
-- TOC entry 5546 (class 2606 OID 120606)
-- Name: representacion_legal fk_rep_legal_estatus; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.representacion_legal
    ADD CONSTRAINT fk_rep_legal_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.estatus_representacion_legal(id_estatus);


--
-- TOC entry 5550 (class 2606 OID 120611)
-- Name: resolucion_final fk_resolucion_ari; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.resolucion_final
    ADD CONSTRAINT fk_resolucion_ari FOREIGN KEY (id_ari) REFERENCES sustantiva.quejas_ari(id_ari);


--
-- TOC entry 5551 (class 2606 OID 120616)
-- Name: resolucion_final fk_resolucion_estatus_queja; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.resolucion_final
    ADD CONSTRAINT fk_resolucion_estatus_queja FOREIGN KEY (id_estatus_queja) REFERENCES catalogos.cat_estatus_queja(id_estatus_queja);


--
-- TOC entry 5552 (class 2606 OID 120621)
-- Name: resolucion_final fk_resolucion_expediente; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.resolucion_final
    ADD CONSTRAINT fk_resolucion_expediente FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);


--
-- TOC entry 5553 (class 2606 OID 120626)
-- Name: resolucion_final fk_resolucion_queja_respuesta; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.resolucion_final
    ADD CONSTRAINT fk_resolucion_queja_respuesta FOREIGN KEY (id_queja_respuesta_autoridad) REFERENCES sustantiva.quejas_respuestas_autoridad(id_respuesta_autoridad);


--
-- TOC entry 5545 (class 2606 OID 120631)
-- Name: recurso_revision fk_revision_sentencia; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.recurso_revision
    ADD CONSTRAINT fk_revision_sentencia FOREIGN KEY (id_sentencia) REFERENCES sustantiva.sentencia_dictada(id_sentencia) ON DELETE CASCADE;


--
-- TOC entry 5557 (class 2606 OID 120636)
-- Name: sentencia_dictada fk_sentencia_aud_celebrada; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.sentencia_dictada
    ADD CONSTRAINT fk_sentencia_aud_celebrada FOREIGN KEY (id_audiencia_celebrada) REFERENCES sustantiva.audiencia_celebrada(id_audiencia_celebrada) ON DELETE CASCADE;


--
-- TOC entry 5506 (class 2606 OID 120641)
-- Name: cierre_expediente fk_usuario_cierre; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.cierre_expediente
    ADD CONSTRAINT fk_usuario_cierre FOREIGN KEY (usuario_cierre) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5521 (class 2606 OID 120646)
-- Name: irl_demanda_amparo irl_demanda_amparo_id_expediente_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.irl_demanda_amparo
    ADD CONSTRAINT irl_demanda_amparo_id_expediente_fkey FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);


--
-- TOC entry 5522 (class 2606 OID 120651)
-- Name: irl_demanda_amparo irl_demanda_amparo_id_representacion_legal_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.irl_demanda_amparo
    ADD CONSTRAINT irl_demanda_amparo_id_representacion_legal_fkey FOREIGN KEY (id_representacion_legal) REFERENCES sustantiva.representacion_legal(id);


--
-- TOC entry 5526 (class 2606 OID 120656)
-- Name: queja_rl_cir queja_rl_cir_id_asesor_recibe_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.queja_rl_cir
    ADD CONSTRAINT queja_rl_cir_id_asesor_recibe_fkey FOREIGN KEY (id_asesor_recibe) REFERENCES sustantiva.asesores(id_asesores);


--
-- TOC entry 5527 (class 2606 OID 120661)
-- Name: queja_rl_cir queja_rl_cir_id_asesor_remitente_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.queja_rl_cir
    ADD CONSTRAINT queja_rl_cir_id_asesor_remitente_fkey FOREIGN KEY (id_asesor_remitente) REFERENCES sustantiva.asesores(id_asesores);


--
-- TOC entry 5528 (class 2606 OID 120666)
-- Name: queja_rl_cir queja_rl_cir_id_resolucion_final_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.queja_rl_cir
    ADD CONSTRAINT queja_rl_cir_id_resolucion_final_fkey FOREIGN KEY (id_resolucion_final) REFERENCES sustantiva.resolucion_final(id_resolucion_final);


--
-- TOC entry 5533 (class 2606 OID 120671)
-- Name: quejas_acci quejas_acci_id_oficio_notificacion_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_acci
    ADD CONSTRAINT quejas_acci_id_oficio_notificacion_fkey FOREIGN KEY (id_oficio_autoridad) REFERENCES sustantiva.oficio_notificacion(id_oficio_notificacion);


--
-- TOC entry 5534 (class 2606 OID 120676)
-- Name: quejas_acci quejas_acci_id_queja_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_acci
    ADD CONSTRAINT quejas_acci_id_queja_fkey FOREIGN KEY (id_queja) REFERENCES sustantiva.quejas(id_queja);


--
-- TOC entry 5536 (class 2606 OID 120681)
-- Name: quejas_ari quejas_ari_id_cir_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_id_cir_fkey FOREIGN KEY (id_cir) REFERENCES sustantiva.quejas_cir(id_cir);


--
-- TOC entry 5537 (class 2606 OID 120686)
-- Name: quejas_ari quejas_ari_id_queja_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_id_queja_fkey FOREIGN KEY (id_queja) REFERENCES sustantiva.quejas(id_queja);


--
-- TOC entry 5542 (class 2606 OID 120691)
-- Name: quejas_cir quejas_cir_id_asesor_ejecutor_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT quejas_cir_id_asesor_ejecutor_fkey FOREIGN KEY (id_asesor_ejecutor) REFERENCES sustantiva.asesores(id_asesores);


--
-- TOC entry 5543 (class 2606 OID 120696)
-- Name: quejas_cir quejas_cir_id_queja_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT quejas_cir_id_queja_fkey FOREIGN KEY (id_queja) REFERENCES sustantiva.quejas(id_queja);


--
-- TOC entry 5529 (class 2606 OID 120701)
-- Name: quejas quejas_id_asesor_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_id_asesor_fkey FOREIGN KEY (id_asesor) REFERENCES sustantiva.asesores(id_asesores);


--
-- TOC entry 5530 (class 2606 OID 120706)
-- Name: quejas quejas_id_detalle_asesoria_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_id_detalle_asesoria_fkey FOREIGN KEY (id_detalle_asesoria) REFERENCES sustantiva.detalle_asesoria(id_detalle_asesoria);


--
-- TOC entry 5531 (class 2606 OID 120711)
-- Name: quejas quejas_id_estatus_queja_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_id_estatus_queja_fkey FOREIGN KEY (id_estatus_queja) REFERENCES catalogos.cat_estatus_queja(id_estatus_queja);


--
-- TOC entry 5532 (class 2606 OID 120716)
-- Name: quejas quejas_id_expediente_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_id_expediente_fkey FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);


--
-- TOC entry 5544 (class 2606 OID 120721)
-- Name: quejas_oficios_autoridad quejas_oficios_autoridad_id_ari_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.quejas_oficios_autoridad
    ADD CONSTRAINT quejas_oficios_autoridad_id_ari_fkey FOREIGN KEY (id_ari) REFERENCES sustantiva.quejas_ari(id_ari);


--
-- TOC entry 5547 (class 2606 OID 120726)
-- Name: representacion_legal representacion_legal_id_expediente_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.representacion_legal
    ADD CONSTRAINT representacion_legal_id_expediente_fkey FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);


--
-- TOC entry 5548 (class 2606 OID 120731)
-- Name: representacion_legal representacion_legal_id_queja_origen_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.representacion_legal
    ADD CONSTRAINT representacion_legal_id_queja_origen_fkey FOREIGN KEY (id_queja_origen) REFERENCES sustantiva.quejas(id_queja);


--
-- TOC entry 5549 (class 2606 OID 120736)
-- Name: representacion_legal representacion_legal_id_resolucion_final_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.representacion_legal
    ADD CONSTRAINT representacion_legal_id_resolucion_final_fkey FOREIGN KEY (id_resolucion_final) REFERENCES sustantiva.resolucion_final(id_resolucion_final);


--
-- TOC entry 5554 (class 2606 OID 120741)
-- Name: rl_cir rl_cir_id_asesor_recibe_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.rl_cir
    ADD CONSTRAINT rl_cir_id_asesor_recibe_fkey FOREIGN KEY (id_asesor_recibe) REFERENCES sustantiva.asesores(id_asesores);


--
-- TOC entry 5555 (class 2606 OID 120746)
-- Name: rl_cir rl_cir_id_asesor_remitente_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.rl_cir
    ADD CONSTRAINT rl_cir_id_asesor_remitente_fkey FOREIGN KEY (id_asesor_remitente) REFERENCES sustantiva.asesores(id_asesores);


--
-- TOC entry 5556 (class 2606 OID 120751)
-- Name: rl_cir rl_cir_id_expediente_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: postgres
--

ALTER TABLE ONLY sustantiva.rl_cir
    ADD CONSTRAINT rl_cir_id_expediente_fkey FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);


-- Completed on 2026-07-07 22:12:34

--
-- PostgreSQL database dump complete
--

