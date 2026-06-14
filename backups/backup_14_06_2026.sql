--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2026-06-14 17:29:12

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
-- TOC entry 5563 (class 1262 OID 83593)
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
-- TOC entry 6 (class 2615 OID 83595)
-- Name: catalogos; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA catalogos;


--
-- TOC entry 7 (class 2615 OID 83596)
-- Name: correspondencia; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA correspondencia;


--
-- TOC entry 8 (class 2615 OID 84381)
-- Name: sustantiva; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA sustantiva;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 83636)
-- Name: areas; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.areas (
    id_area integer NOT NULL,
    nombre_area character varying(150) NOT NULL,
    descripcion text
);


--
-- TOC entry 5564 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN areas.descripcion; Type: COMMENT; Schema: catalogos; Owner: -
--

COMMENT ON COLUMN catalogos.areas.descripcion IS 'Descripción detallada del área o función principal';


--
-- TOC entry 219 (class 1259 OID 83641)
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
-- TOC entry 5565 (class 0 OID 0)
-- Dependencies: 219
-- Name: areas_id_area_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.areas_id_area_seq OWNED BY catalogos.areas.id_area;


--
-- TOC entry 299 (class 1259 OID 84891)
-- Name: autoridades; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.autoridades (
    id_autoridad integer NOT NULL,
    nombre character varying(150) NOT NULL
);


--
-- TOC entry 298 (class 1259 OID 84890)
-- Name: autoridades_id_autoridad_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.autoridades_id_autoridad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5566 (class 0 OID 0)
-- Dependencies: 298
-- Name: autoridades_id_autoridad_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.autoridades_id_autoridad_seq OWNED BY catalogos.autoridades.id_autoridad;


--
-- TOC entry 287 (class 1259 OID 84397)
-- Name: cat_autoridades; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.cat_autoridades (
    id_cat_autoridad integer NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- TOC entry 286 (class 1259 OID 84396)
-- Name: cat_autoridades_id_cat_autoridad_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.cat_autoridades_id_cat_autoridad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5567 (class 0 OID 0)
-- Dependencies: 286
-- Name: cat_autoridades_id_cat_autoridad_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.cat_autoridades_id_cat_autoridad_seq OWNED BY catalogos.cat_autoridades.id_cat_autoridad;


--
-- TOC entry 220 (class 1259 OID 83642)
-- Name: cat_estados; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.cat_estados (
    id_estado integer NOT NULL,
    nombre_estado character varying(100) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 83645)
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
-- TOC entry 5568 (class 0 OID 0)
-- Dependencies: 221
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.cat_estados_id_estado_seq OWNED BY catalogos.cat_estados.id_estado;


--
-- TOC entry 222 (class 1259 OID 83646)
-- Name: cat_estatus; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.cat_estatus (
    id_estatus integer NOT NULL,
    nombre_estatus character varying(50) NOT NULL,
    descripcion text
);


--
-- TOC entry 223 (class 1259 OID 83651)
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
-- TOC entry 5569 (class 0 OID 0)
-- Dependencies: 223
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.cat_estatus_id_estatus_seq OWNED BY catalogos.cat_estatus.id_estatus;


--
-- TOC entry 311 (class 1259 OID 101254)
-- Name: cat_estatus_queja; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.cat_estatus_queja (
    id_estatus_queja integer NOT NULL,
    descripcion_estatus character varying(100) NOT NULL,
    activo boolean DEFAULT true,
    orden integer
);


--
-- TOC entry 5570 (class 0 OID 0)
-- Dependencies: 311
-- Name: COLUMN cat_estatus_queja.orden; Type: COMMENT; Schema: catalogos; Owner: -
--

COMMENT ON COLUMN catalogos.cat_estatus_queja.orden IS 'Indica la secuencia lógica del estatus en el flujo de la queja';


--
-- TOC entry 310 (class 1259 OID 101253)
-- Name: cat_estatus_queja_id_estatus_queja_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.cat_estatus_queja_id_estatus_queja_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5571 (class 0 OID 0)
-- Dependencies: 310
-- Name: cat_estatus_queja_id_estatus_queja_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.cat_estatus_queja_id_estatus_queja_seq OWNED BY catalogos.cat_estatus_queja.id_estatus_queja;


--
-- TOC entry 285 (class 1259 OID 84390)
-- Name: cat_estatus_sustantiva; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.cat_estatus_sustantiva (
    id_cat_estatus_sustantiva integer NOT NULL,
    nombre character varying(50) NOT NULL
);


--
-- TOC entry 284 (class 1259 OID 84389)
-- Name: cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5572 (class 0 OID 0)
-- Dependencies: 284
-- Name: cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq OWNED BY catalogos.cat_estatus_sustantiva.id_cat_estatus_sustantiva;


--
-- TOC entry 224 (class 1259 OID 83652)
-- Name: cat_municipios; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.cat_municipios (
    id_municipio integer NOT NULL,
    id_estado integer,
    nombre_municipio character varying(100) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 83655)
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
-- TOC entry 5573 (class 0 OID 0)
-- Dependencies: 225
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.cat_municipios_id_municipio_seq OWNED BY catalogos.cat_municipios.id_municipio;


--
-- TOC entry 283 (class 1259 OID 84383)
-- Name: cat_tipo_proceso; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.cat_tipo_proceso (
    id_cat_tipo_proceso integer NOT NULL,
    nombre character varying(50) NOT NULL
);


--
-- TOC entry 282 (class 1259 OID 84382)
-- Name: cat_tipo_proceso_id_cat_tipo_proceso_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.cat_tipo_proceso_id_cat_tipo_proceso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5574 (class 0 OID 0)
-- Dependencies: 282
-- Name: cat_tipo_proceso_id_cat_tipo_proceso_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.cat_tipo_proceso_id_cat_tipo_proceso_seq OWNED BY catalogos.cat_tipo_proceso.id_cat_tipo_proceso;


--
-- TOC entry 226 (class 1259 OID 83656)
-- Name: control_folios_config; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.control_folios_config (
    id_control_folios_config integer NOT NULL,
    anio integer NOT NULL,
    mes integer NOT NULL,
    consecutivo integer DEFAULT 0
);


--
-- TOC entry 227 (class 1259 OID 83660)
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
-- TOC entry 5575 (class 0 OID 0)
-- Dependencies: 227
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.control_folios_config_id_control_folios_config_seq OWNED BY catalogos.control_folios_config.id_control_folios_config;


--
-- TOC entry 325 (class 1259 OID 101470)
-- Name: dias_inhabiles; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.dias_inhabiles (
    id_dia_inhabil integer NOT NULL,
    fecha date NOT NULL,
    descripcion character varying(150),
    activo boolean DEFAULT true NOT NULL
);


--
-- TOC entry 324 (class 1259 OID 101469)
-- Name: dias_inhabiles_id_dia_inhabil_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.dias_inhabiles_id_dia_inhabil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5576 (class 0 OID 0)
-- Dependencies: 324
-- Name: dias_inhabiles_id_dia_inhabil_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.dias_inhabiles_id_dia_inhabil_seq OWNED BY catalogos.dias_inhabiles.id_dia_inhabil;


--
-- TOC entry 228 (class 1259 OID 83661)
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
-- TOC entry 229 (class 1259 OID 83664)
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
-- TOC entry 5577 (class 0 OID 0)
-- Dependencies: 229
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.direcciones_id_direccion_seq OWNED BY catalogos.direcciones.id_direccion;


--
-- TOC entry 230 (class 1259 OID 83665)
-- Name: empleados; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.empleados (
    id_empleado integer NOT NULL,
    nombre_completo character varying(255) NOT NULL,
    cargo character varying(150),
    id_area integer
);


--
-- TOC entry 231 (class 1259 OID 83668)
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
-- TOC entry 5578 (class 0 OID 0)
-- Dependencies: 231
-- Name: empleados_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.empleados_id_empleado_seq OWNED BY catalogos.empleados.id_empleado;


--
-- TOC entry 303 (class 1259 OID 84905)
-- Name: estatus_detalle_expediente; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.estatus_detalle_expediente (
    id_estatus_detalle_expediente integer NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- TOC entry 302 (class 1259 OID 84904)
-- Name: estatus_detalle_expediente_id_estatus_detalle_expediente_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.estatus_detalle_expediente_id_estatus_detalle_expediente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5579 (class 0 OID 0)
-- Dependencies: 302
-- Name: estatus_detalle_expediente_id_estatus_detalle_expediente_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.estatus_detalle_expediente_id_estatus_detalle_expediente_seq OWNED BY catalogos.estatus_detalle_expediente.id_estatus_detalle_expediente;


--
-- TOC entry 295 (class 1259 OID 84877)
-- Name: estatus_expediente; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.estatus_expediente (
    id_estatus_expediente integer NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- TOC entry 294 (class 1259 OID 84876)
-- Name: estatus_expediente_id_estatus_expediente_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.estatus_expediente_id_estatus_expediente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5580 (class 0 OID 0)
-- Dependencies: 294
-- Name: estatus_expediente_id_estatus_expediente_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.estatus_expediente_id_estatus_expediente_seq OWNED BY catalogos.estatus_expediente.id_estatus_expediente;


--
-- TOC entry 232 (class 1259 OID 83669)
-- Name: personas; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.personas (
    id_persona integer NOT NULL,
    id_direccion integer,
    nombre character varying(100) NOT NULL,
    apellido_paterno character varying(100) NOT NULL,
    apellido_materno character varying(100),
    curp character varying(18),
    telefono character varying(20),
    comunidad character varying(150),
    rfc character varying(13),
    rec character varying(20),
    identificacion_oficial character varying(50),
    telefono_fijo character varying(50),
    numero_id_folio character varying(30),
    correo character varying(100),
    id_tipo_persona integer,
    tipo_identificacion character varying(100)
);


--
-- TOC entry 233 (class 1259 OID 83672)
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
-- TOC entry 5581 (class 0 OID 0)
-- Dependencies: 233
-- Name: personas_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.personas_id_persona_seq OWNED BY catalogos.personas.id_persona;


--
-- TOC entry 234 (class 1259 OID 83673)
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
-- TOC entry 235 (class 1259 OID 83679)
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
-- TOC entry 5582 (class 0 OID 0)
-- Dependencies: 235
-- Name: roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.roles_id_rol_seq OWNED BY catalogos.roles.id_rol;


--
-- TOC entry 297 (class 1259 OID 84884)
-- Name: tipo_acto_emitido; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.tipo_acto_emitido (
    id_tipo_acto_emitido integer NOT NULL,
    nombre character varying(150) NOT NULL
);


--
-- TOC entry 296 (class 1259 OID 84883)
-- Name: tipo_acto_emitido_id_tipo_acto_emitido_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.tipo_acto_emitido_id_tipo_acto_emitido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5583 (class 0 OID 0)
-- Dependencies: 296
-- Name: tipo_acto_emitido_id_tipo_acto_emitido_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.tipo_acto_emitido_id_tipo_acto_emitido_seq OWNED BY catalogos.tipo_acto_emitido.id_tipo_acto_emitido;


--
-- TOC entry 236 (class 1259 OID 83680)
-- Name: tipo_correspondencia; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.tipo_correspondencia (
    id_tipo_correspondencia integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 83683)
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
-- TOC entry 5584 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipo_correspondencia_id_tipo_correspondencia_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.tipo_correspondencia_id_tipo_correspondencia_seq OWNED BY catalogos.tipo_correspondencia.id_tipo_correspondencia;


--
-- TOC entry 301 (class 1259 OID 84898)
-- Name: tipo_entrada; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.tipo_entrada (
    id_tipo_entrada integer NOT NULL,
    nombre character varying(50) NOT NULL
);


--
-- TOC entry 300 (class 1259 OID 84897)
-- Name: tipo_entrada_id_tipo_entrada_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.tipo_entrada_id_tipo_entrada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5585 (class 0 OID 0)
-- Dependencies: 300
-- Name: tipo_entrada_id_tipo_entrada_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.tipo_entrada_id_tipo_entrada_seq OWNED BY catalogos.tipo_entrada.id_tipo_entrada;


--
-- TOC entry 309 (class 1259 OID 93062)
-- Name: tipo_persona; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.tipo_persona (
    id_tipo_persona integer NOT NULL,
    nombre character varying(50) NOT NULL
);


--
-- TOC entry 308 (class 1259 OID 93061)
-- Name: tipo_persona_id_tipo_persona_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.tipo_persona_id_tipo_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5586 (class 0 OID 0)
-- Dependencies: 308
-- Name: tipo_persona_id_tipo_persona_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.tipo_persona_id_tipo_persona_seq OWNED BY catalogos.tipo_persona.id_tipo_persona;


--
-- TOC entry 293 (class 1259 OID 84870)
-- Name: tipo_tramite; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.tipo_tramite (
    id_tipo_tramite integer NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- TOC entry 292 (class 1259 OID 84869)
-- Name: tipo_tramite_id_tipo_tramite_seq; Type: SEQUENCE; Schema: catalogos; Owner: -
--

CREATE SEQUENCE catalogos.tipo_tramite_id_tipo_tramite_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5587 (class 0 OID 0)
-- Dependencies: 292
-- Name: tipo_tramite_id_tipo_tramite_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.tipo_tramite_id_tipo_tramite_seq OWNED BY catalogos.tipo_tramite.id_tipo_tramite;


--
-- TOC entry 238 (class 1259 OID 83684)
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
-- TOC entry 239 (class 1259 OID 83689)
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
-- TOC entry 5588 (class 0 OID 0)
-- Dependencies: 239
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.usuarios_id_usuario_seq OWNED BY catalogos.usuarios.id_usuario;


--
-- TOC entry 240 (class 1259 OID 83690)
-- Name: usuarios_roles; Type: TABLE; Schema: catalogos; Owner: -
--

CREATE TABLE catalogos.usuarios_roles (
    id_usuario_rol integer NOT NULL,
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL,
    fecha_asignacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 241 (class 1259 OID 83694)
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
-- TOC entry 5589 (class 0 OID 0)
-- Dependencies: 241
-- Name: usuarios_roles_id_usuario_rol_seq; Type: SEQUENCE OWNED BY; Schema: catalogos; Owner: -
--

ALTER SEQUENCE catalogos.usuarios_roles_id_usuario_rol_seq OWNED BY catalogos.usuarios_roles.id_usuario_rol;


--
-- TOC entry 242 (class 1259 OID 83695)
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
-- TOC entry 243 (class 1259 OID 83698)
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
-- TOC entry 5590 (class 0 OID 0)
-- Dependencies: 243
-- Name: acuse_correspondencia_id_acuse_correspondencia_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq OWNED BY correspondencia.acuse_correspondencia.id_acuse_correspondencia;


--
-- TOC entry 244 (class 1259 OID 83699)
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
-- TOC entry 245 (class 1259 OID 83702)
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
-- TOC entry 5591 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE acuse_oficio; Type: COMMENT; Schema: correspondencia; Owner: -
--

COMMENT ON TABLE correspondencia.acuse_oficio IS 'Tabla de acuse para oficios con ID autoincremental.';


--
-- TOC entry 246 (class 1259 OID 83705)
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
-- TOC entry 5592 (class 0 OID 0)
-- Dependencies: 246
-- Name: acuse_oficio_id_acuse_oficio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.acuse_oficio_id_acuse_oficio_seq OWNED BY correspondencia.acuse_oficio.id_acuse_oficio;


--
-- TOC entry 247 (class 1259 OID 83706)
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
-- TOC entry 5593 (class 0 OID 0)
-- Dependencies: 247
-- Name: acuserecibointerno_id_acuse_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.acuserecibointerno_id_acuse_seq OWNED BY correspondencia.acuse_memorandum.id_acuse;


--
-- TOC entry 248 (class 1259 OID 83707)
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
-- TOC entry 249 (class 1259 OID 83714)
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
-- TOC entry 5594 (class 0 OID 0)
-- Dependencies: 249
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.alertas_seguimiento_id_alerta_seq OWNED BY correspondencia.alertas_seguimiento.id_alerta;


--
-- TOC entry 250 (class 1259 OID 83715)
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
-- TOC entry 251 (class 1259 OID 83721)
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
-- TOC entry 5595 (class 0 OID 0)
-- Dependencies: 251
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.archivos_adjuntos_id_archivo_seq OWNED BY correspondencia.archivos_adjuntos.id_archivo;


--
-- TOC entry 252 (class 1259 OID 83722)
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
-- TOC entry 253 (class 1259 OID 83728)
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
-- TOC entry 5596 (class 0 OID 0)
-- Dependencies: 253
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.auditoria_correspondencia_id_log_seq OWNED BY correspondencia.auditoria_correspondencia.id_log;


--
-- TOC entry 254 (class 1259 OID 83729)
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
-- TOC entry 255 (class 1259 OID 83735)
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
-- TOC entry 5597 (class 0 OID 0)
-- Dependencies: 255
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.correspondencia_id_folio_seq OWNED BY correspondencia.correspondencia.id_correspondencia;


--
-- TOC entry 256 (class 1259 OID 83736)
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
-- TOC entry 257 (class 1259 OID 83741)
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
-- TOC entry 5598 (class 0 OID 0)
-- Dependencies: 257
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.correspondencia_respuestas_id_respuesta_seq OWNED BY correspondencia.correspondencia_respuestas.id_respuesta;


--
-- TOC entry 258 (class 1259 OID 83742)
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
-- TOC entry 259 (class 1259 OID 83746)
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
-- TOC entry 5599 (class 0 OID 0)
-- Dependencies: 259
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.correspondencia_turnos_id_turno_seq OWNED BY correspondencia.correspondencia_turnos.id_turno;


--
-- TOC entry 260 (class 1259 OID 83747)
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
-- TOC entry 261 (class 1259 OID 83753)
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
-- TOC entry 5600 (class 0 OID 0)
-- Dependencies: 261
-- Name: memorandums_id_memo_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.memorandums_id_memo_seq OWNED BY correspondencia.memorandums.id_memo;


--
-- TOC entry 262 (class 1259 OID 83754)
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
-- TOC entry 263 (class 1259 OID 83761)
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
-- TOC entry 5601 (class 0 OID 0)
-- Dependencies: 263
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.notificaciones_id_notificacion_seq OWNED BY correspondencia.notificaciones.id_notificacion;


--
-- TOC entry 264 (class 1259 OID 83762)
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
-- TOC entry 5602 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE oficio; Type: COMMENT; Schema: correspondencia; Owner: -
--

COMMENT ON TABLE correspondencia.oficio IS 'Tabla para el registro de oficios generados en el sistema de correspondencia.';


--
-- TOC entry 265 (class 1259 OID 83767)
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
-- TOC entry 266 (class 1259 OID 83774)
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
-- TOC entry 267 (class 1259 OID 83780)
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
-- TOC entry 5603 (class 0 OID 0)
-- Dependencies: 267
-- Name: oficio_contestacion_externa_id_oficio_contestacion_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq OWNED BY correspondencia.oficio_contestacion_externa.id_oficio_contestacion;


--
-- TOC entry 268 (class 1259 OID 83781)
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
-- TOC entry 5604 (class 0 OID 0)
-- Dependencies: 268
-- Name: oficio_contestacion_id_contestacion_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.oficio_contestacion_id_contestacion_seq OWNED BY correspondencia.oficio_contestacion.id_contestacion;


--
-- TOC entry 269 (class 1259 OID 83782)
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
-- TOC entry 5605 (class 0 OID 0)
-- Dependencies: 269
-- Name: oficio_id_oficio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.oficio_id_oficio_seq OWNED BY correspondencia.oficio.id_oficio;


--
-- TOC entry 270 (class 1259 OID 83783)
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
-- TOC entry 271 (class 1259 OID 83790)
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
-- TOC entry 5606 (class 0 OID 0)
-- Dependencies: 271
-- Name: plantilla_memorandum_id_plantilla_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.plantilla_memorandum_id_plantilla_seq OWNED BY correspondencia.plantilla_memorandum.id_plantilla;


--
-- TOC entry 272 (class 1259 OID 83791)
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
-- TOC entry 273 (class 1259 OID 83797)
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
-- TOC entry 5607 (class 0 OID 0)
-- Dependencies: 273
-- Name: seguimiento_correspondencia_id_seguimiento_correspondencia_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq OWNED BY correspondencia.seguimiento_correspondencia.id_seguimiento_correspondencia;


--
-- TOC entry 274 (class 1259 OID 83798)
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
-- TOC entry 275 (class 1259 OID 83804)
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
-- TOC entry 5608 (class 0 OID 0)
-- Dependencies: 275
-- Name: seguimiento_memorandum_folio_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.seguimiento_memorandum_folio_respuesta_seq OWNED BY correspondencia.seguimiento_memorandum.folio_respuesta;


--
-- TOC entry 276 (class 1259 OID 83805)
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
-- TOC entry 5609 (class 0 OID 0)
-- Dependencies: 276
-- Name: seguimiento_memorandum_id_seguimiento_memorandum_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq OWNED BY correspondencia.seguimiento_memorandum.id_seguimiento_memorandum;


--
-- TOC entry 277 (class 1259 OID 83806)
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
-- TOC entry 278 (class 1259 OID 83811)
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
-- TOC entry 5610 (class 0 OID 0)
-- Dependencies: 278
-- Name: seguimiento_oficio_folio_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.seguimiento_oficio_folio_respuesta_seq OWNED BY correspondencia.seguimiento_oficio.folio_respuesta;


--
-- TOC entry 279 (class 1259 OID 83812)
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
-- TOC entry 5611 (class 0 OID 0)
-- Dependencies: 279
-- Name: seguimiento_oficio_id_seguimiento_oficio_seq; Type: SEQUENCE OWNED BY; Schema: correspondencia; Owner: -
--

ALTER SEQUENCE correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq OWNED BY correspondencia.seguimiento_oficio.id_seguimiento_oficio;


--
-- TOC entry 280 (class 1259 OID 83836)
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
-- TOC entry 281 (class 1259 OID 83841)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- TOC entry 289 (class 1259 OID 84404)
-- Name: asesores; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.asesores (
    id_asesores integer NOT NULL,
    id_persona integer NOT NULL,
    especialidad character varying(100),
    carga_actual integer DEFAULT 0,
    ultima_asignacion_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 288 (class 1259 OID 84403)
-- Name: asesores_id_asesores_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.asesores_id_asesores_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5612 (class 0 OID 0)
-- Dependencies: 288
-- Name: asesores_id_asesores_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.asesores_id_asesores_seq OWNED BY sustantiva.asesores.id_asesores;


--
-- TOC entry 291 (class 1259 OID 84418)
-- Name: contribuyentes; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.contribuyentes (
    id_contribuyentes integer NOT NULL,
    id_persona integer NOT NULL,
    fecha_registro_sistema timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    observaciones_internas text
);


--
-- TOC entry 290 (class 1259 OID 84417)
-- Name: contribuyentes_id_contribuyentes_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.contribuyentes_id_contribuyentes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5613 (class 0 OID 0)
-- Dependencies: 290
-- Name: contribuyentes_id_contribuyentes_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.contribuyentes_id_contribuyentes_seq OWNED BY sustantiva.contribuyentes.id_contribuyentes;


--
-- TOC entry 305 (class 1259 OID 84955)
-- Name: detalle_asesoria; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.detalle_asesoria (
    id_detalle_asesoria integer NOT NULL,
    id_expediente integer NOT NULL,
    id_tipo_acto_emitido integer NOT NULL,
    id_autoridad integer NOT NULL,
    calificacion_acto text,
    id_tipo_entrada integer NOT NULL,
    problematica text,
    seguimiento text,
    id_estatus_detalle_expediente integer NOT NULL,
    fecha_notificacion date,
    monto numeric(15,2)
);


--
-- TOC entry 304 (class 1259 OID 84954)
-- Name: detalle_asesoria_id_detalle_asesoria_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.detalle_asesoria_id_detalle_asesoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5614 (class 0 OID 0)
-- Dependencies: 304
-- Name: detalle_asesoria_id_detalle_asesoria_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.detalle_asesoria_id_detalle_asesoria_seq OWNED BY sustantiva.detalle_asesoria.id_detalle_asesoria;


--
-- TOC entry 307 (class 1259 OID 84991)
-- Name: expedientes; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.expedientes (
    id_expediente integer NOT NULL,
    folio_gobierno character varying(30) NOT NULL,
    fecha_solicitud timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_municipio integer NOT NULL,
    id_asesor integer NOT NULL,
    id_contribuyente integer NOT NULL,
    id_solicitante integer NOT NULL,
    id_tipo_tramite integer NOT NULL,
    id_estatus_expediente integer NOT NULL,
    documento_acredita_personalidad character varying(255),
    archivo_documento_acredita_personalidad character varying(255),
    id_representante_legal integer,
    bloqueado boolean DEFAULT false NOT NULL,
    fecha_cierre_automatico timestamp without time zone,
    fecha_envio_oficio_autoridad timestamp without time zone,
    fecha_limite_informe date,
    numero_oficio_respuesta character varying(50),
    fojas_informe integer,
    fecha_recepcion_informe timestamp without time zone,
    ruta_pdf_informe character varying(500),
    estado_alerta_5dias character varying(30),
    notificacion_vencimiento_enviada boolean DEFAULT false
);


--
-- TOC entry 306 (class 1259 OID 84990)
-- Name: expedientes_id_expediente_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.expedientes_id_expediente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5615 (class 0 OID 0)
-- Dependencies: 306
-- Name: expedientes_id_expediente_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.expedientes_id_expediente_seq OWNED BY sustantiva.expedientes.id_expediente;


--
-- TOC entry 327 (class 1259 OID 101484)
-- Name: plantilla_queja_ari; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.plantilla_queja_ari (
    id_plantilla integer NOT NULL,
    nombre_plantilla character varying(150) NOT NULL,
    url_plantilla_queja_ari character varying(255) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    activo boolean DEFAULT true
);


--
-- TOC entry 326 (class 1259 OID 101483)
-- Name: plantilla_queja_ari_id_plantilla_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.plantilla_queja_ari_id_plantilla_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5616 (class 0 OID 0)
-- Dependencies: 326
-- Name: plantilla_queja_ari_id_plantilla_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.plantilla_queja_ari_id_plantilla_seq OWNED BY sustantiva.plantilla_queja_ari.id_plantilla;


--
-- TOC entry 313 (class 1259 OID 101332)
-- Name: quejas; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.quejas (
    id_queja integer NOT NULL,
    id_expediente integer NOT NULL,
    id_asesor integer NOT NULL,
    id_autoridad integer NOT NULL,
    id_estatus_queja integer DEFAULT 1 NOT NULL,
    requisito_identificacion boolean DEFAULT false,
    requisito_actos_fiscales boolean DEFAULT false,
    requisito_narrativa_clara boolean DEFAULT false,
    requisito_competencia_cedecon boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ultima_actualizacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 323 (class 1259 OID 101444)
-- Name: quejas_acci; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.quejas_acci (
    id_acci integer NOT NULL,
    id_queja integer NOT NULL,
    id_oficio_autoridad integer NOT NULL,
    justificacion_investigacion text NOT NULL,
    nuevos_requerimientos_autoridad text NOT NULL,
    plazo_dias_habiles integer DEFAULT 5,
    fecha_emision_acci date DEFAULT CURRENT_DATE NOT NULL,
    ruta_pdf_acci character varying(255) NOT NULL,
    concluido boolean DEFAULT false,
    fecha_conclusion timestamp without time zone
);


--
-- TOC entry 322 (class 1259 OID 101443)
-- Name: quejas_acci_id_acci_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.quejas_acci_id_acci_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5617 (class 0 OID 0)
-- Dependencies: 322
-- Name: quejas_acci_id_acci_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.quejas_acci_id_acci_seq OWNED BY sustantiva.quejas_acci.id_acci;


--
-- TOC entry 317 (class 1259 OID 101388)
-- Name: quejas_ari; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.quejas_ari (
    id_ari integer NOT NULL,
    id_queja integer NOT NULL,
    id_cir integer NOT NULL,
    num_expediente_oficial character varying(50) NOT NULL,
    sintesis_actos_omisiones text NOT NULL,
    articulos_vulnerados_autoridad text NOT NULL,
    nombre_encargado_firma character varying(150) NOT NULL,
    fecha_acuerdo date DEFAULT CURRENT_DATE NOT NULL,
    ruta_pdf_ari character varying(255) NOT NULL,
    id_plantilla_queja_ari integer,
    multas_requerimientos text,
    multas_credito text,
    instituto character varying(255)
);


--
-- TOC entry 316 (class 1259 OID 101387)
-- Name: quejas_ari_id_ari_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.quejas_ari_id_ari_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5618 (class 0 OID 0)
-- Dependencies: 316
-- Name: quejas_ari_id_ari_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.quejas_ari_id_ari_seq OWNED BY sustantiva.quejas_ari.id_ari;


--
-- TOC entry 315 (class 1259 OID 101368)
-- Name: quejas_cir; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.quejas_cir (
    id_cir integer NOT NULL,
    id_queja integer NOT NULL,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ruta_pdf_cir character varying(255) NOT NULL,
    id_asesor_ejecutor integer NOT NULL
);


--
-- TOC entry 314 (class 1259 OID 101367)
-- Name: quejas_cir_id_cir_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.quejas_cir_id_cir_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5619 (class 0 OID 0)
-- Dependencies: 314
-- Name: quejas_cir_id_cir_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.quejas_cir_id_cir_seq OWNED BY sustantiva.quejas_cir.id_cir;


--
-- TOC entry 312 (class 1259 OID 101331)
-- Name: quejas_id_queja_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.quejas_id_queja_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5620 (class 0 OID 0)
-- Dependencies: 312
-- Name: quejas_id_queja_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.quejas_id_queja_seq OWNED BY sustantiva.quejas.id_queja;


--
-- TOC entry 319 (class 1259 OID 101414)
-- Name: quejas_oficios_autoridad; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.quejas_oficios_autoridad (
    id_oficio_autoridad integer NOT NULL,
    id_ari integer NOT NULL,
    num_oficio_comisionado character varying(50) NOT NULL,
    fecha_envio_oficio date NOT NULL,
    fecha_notificacion_quejoso date
);


--
-- TOC entry 318 (class 1259 OID 101413)
-- Name: quejas_oficios_autoridad_id_oficio_autoridad_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.quejas_oficios_autoridad_id_oficio_autoridad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5621 (class 0 OID 0)
-- Dependencies: 318
-- Name: quejas_oficios_autoridad_id_oficio_autoridad_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.quejas_oficios_autoridad_id_oficio_autoridad_seq OWNED BY sustantiva.quejas_oficios_autoridad.id_oficio_autoridad;


--
-- TOC entry 321 (class 1259 OID 101428)
-- Name: quejas_respuestas_autoridad; Type: TABLE; Schema: sustantiva; Owner: -
--

CREATE TABLE sustantiva.quejas_respuestas_autoridad (
    id_respuesta_autoridad integer NOT NULL,
    id_oficio_autoridad integer NOT NULL,
    num_oficio_contestacion_autoridad character varying(50) NOT NULL,
    fecha_recepcion_oficialia date NOT NULL,
    informe_rendido boolean DEFAULT true,
    descripcion_analisis_asesor text,
    ruta_pdf_informe_autoridad character varying(255) NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 320 (class 1259 OID 101427)
-- Name: quejas_respuestas_autoridad_id_respuesta_autoridad_seq; Type: SEQUENCE; Schema: sustantiva; Owner: -
--

CREATE SEQUENCE sustantiva.quejas_respuestas_autoridad_id_respuesta_autoridad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5622 (class 0 OID 0)
-- Dependencies: 320
-- Name: quejas_respuestas_autoridad_id_respuesta_autoridad_seq; Type: SEQUENCE OWNED BY; Schema: sustantiva; Owner: -
--

ALTER SEQUENCE sustantiva.quejas_respuestas_autoridad_id_respuesta_autoridad_seq OWNED BY sustantiva.quejas_respuestas_autoridad.id_respuesta_autoridad;


--
-- TOC entry 4961 (class 2604 OID 83872)
-- Name: areas id_area; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.areas ALTER COLUMN id_area SET DEFAULT nextval('catalogos.areas_id_area_seq'::regclass);


--
-- TOC entry 5025 (class 2604 OID 84894)
-- Name: autoridades id_autoridad; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.autoridades ALTER COLUMN id_autoridad SET DEFAULT nextval('catalogos.autoridades_id_autoridad_seq'::regclass);


--
-- TOC entry 5016 (class 2604 OID 84400)
-- Name: cat_autoridades id_cat_autoridad; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_autoridades ALTER COLUMN id_cat_autoridad SET DEFAULT nextval('catalogos.cat_autoridades_id_cat_autoridad_seq'::regclass);


--
-- TOC entry 4962 (class 2604 OID 83873)
-- Name: cat_estados id_estado; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estados ALTER COLUMN id_estado SET DEFAULT nextval('catalogos.cat_estados_id_estado_seq'::regclass);


--
-- TOC entry 4963 (class 2604 OID 83874)
-- Name: cat_estatus id_estatus; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estatus ALTER COLUMN id_estatus SET DEFAULT nextval('catalogos.cat_estatus_id_estatus_seq'::regclass);


--
-- TOC entry 5034 (class 2604 OID 101257)
-- Name: cat_estatus_queja id_estatus_queja; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estatus_queja ALTER COLUMN id_estatus_queja SET DEFAULT nextval('catalogos.cat_estatus_queja_id_estatus_queja_seq'::regclass);


--
-- TOC entry 5015 (class 2604 OID 84393)
-- Name: cat_estatus_sustantiva id_cat_estatus_sustantiva; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estatus_sustantiva ALTER COLUMN id_cat_estatus_sustantiva SET DEFAULT nextval('catalogos.cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq'::regclass);


--
-- TOC entry 4964 (class 2604 OID 83875)
-- Name: cat_municipios id_municipio; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_municipios ALTER COLUMN id_municipio SET DEFAULT nextval('catalogos.cat_municipios_id_municipio_seq'::regclass);


--
-- TOC entry 5014 (class 2604 OID 84386)
-- Name: cat_tipo_proceso id_cat_tipo_proceso; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_tipo_proceso ALTER COLUMN id_cat_tipo_proceso SET DEFAULT nextval('catalogos.cat_tipo_proceso_id_cat_tipo_proceso_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 83876)
-- Name: control_folios_config id_control_folios_config; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.control_folios_config ALTER COLUMN id_control_folios_config SET DEFAULT nextval('catalogos.control_folios_config_id_control_folios_config_seq'::regclass);


--
-- TOC entry 5056 (class 2604 OID 101473)
-- Name: dias_inhabiles id_dia_inhabil; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.dias_inhabiles ALTER COLUMN id_dia_inhabil SET DEFAULT nextval('catalogos.dias_inhabiles_id_dia_inhabil_seq'::regclass);


--
-- TOC entry 4967 (class 2604 OID 83877)
-- Name: direcciones id_direccion; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.direcciones ALTER COLUMN id_direccion SET DEFAULT nextval('catalogos.direcciones_id_direccion_seq'::regclass);


--
-- TOC entry 4968 (class 2604 OID 83878)
-- Name: empleados id_empleado; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.empleados ALTER COLUMN id_empleado SET DEFAULT nextval('catalogos.empleados_id_empleado_seq'::regclass);


--
-- TOC entry 5027 (class 2604 OID 84908)
-- Name: estatus_detalle_expediente id_estatus_detalle_expediente; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.estatus_detalle_expediente ALTER COLUMN id_estatus_detalle_expediente SET DEFAULT nextval('catalogos.estatus_detalle_expediente_id_estatus_detalle_expediente_seq'::regclass);


--
-- TOC entry 5023 (class 2604 OID 84880)
-- Name: estatus_expediente id_estatus_expediente; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.estatus_expediente ALTER COLUMN id_estatus_expediente SET DEFAULT nextval('catalogos.estatus_expediente_id_estatus_expediente_seq'::regclass);


--
-- TOC entry 4969 (class 2604 OID 83879)
-- Name: personas id_persona; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.personas ALTER COLUMN id_persona SET DEFAULT nextval('catalogos.personas_id_persona_seq'::regclass);


--
-- TOC entry 4970 (class 2604 OID 83880)
-- Name: roles id_rol; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.roles ALTER COLUMN id_rol SET DEFAULT nextval('catalogos.roles_id_rol_seq'::regclass);


--
-- TOC entry 5024 (class 2604 OID 84887)
-- Name: tipo_acto_emitido id_tipo_acto_emitido; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_acto_emitido ALTER COLUMN id_tipo_acto_emitido SET DEFAULT nextval('catalogos.tipo_acto_emitido_id_tipo_acto_emitido_seq'::regclass);


--
-- TOC entry 4972 (class 2604 OID 83881)
-- Name: tipo_correspondencia id_tipo_correspondencia; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_correspondencia ALTER COLUMN id_tipo_correspondencia SET DEFAULT nextval('catalogos.tipo_correspondencia_id_tipo_correspondencia_seq'::regclass);


--
-- TOC entry 5026 (class 2604 OID 84901)
-- Name: tipo_entrada id_tipo_entrada; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_entrada ALTER COLUMN id_tipo_entrada SET DEFAULT nextval('catalogos.tipo_entrada_id_tipo_entrada_seq'::regclass);


--
-- TOC entry 5033 (class 2604 OID 93065)
-- Name: tipo_persona id_tipo_persona; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_persona ALTER COLUMN id_tipo_persona SET DEFAULT nextval('catalogos.tipo_persona_id_tipo_persona_seq'::regclass);


--
-- TOC entry 5022 (class 2604 OID 84873)
-- Name: tipo_tramite id_tipo_tramite; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_tramite ALTER COLUMN id_tipo_tramite SET DEFAULT nextval('catalogos.tipo_tramite_id_tipo_tramite_seq'::regclass);


--
-- TOC entry 4973 (class 2604 OID 83882)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('catalogos.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 4976 (class 2604 OID 83883)
-- Name: usuarios_roles id_usuario_rol; Type: DEFAULT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios_roles ALTER COLUMN id_usuario_rol SET DEFAULT nextval('catalogos.usuarios_roles_id_usuario_rol_seq'::regclass);


--
-- TOC entry 4978 (class 2604 OID 83884)
-- Name: acuse_correspondencia id_acuse_correspondencia; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia ALTER COLUMN id_acuse_correspondencia SET DEFAULT nextval('correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq'::regclass);


--
-- TOC entry 4979 (class 2604 OID 83885)
-- Name: acuse_memorandum id_acuse; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_memorandum ALTER COLUMN id_acuse SET DEFAULT nextval('correspondencia.acuserecibointerno_id_acuse_seq'::regclass);


--
-- TOC entry 4980 (class 2604 OID 83886)
-- Name: acuse_oficio id_acuse_oficio; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_oficio ALTER COLUMN id_acuse_oficio SET DEFAULT nextval('correspondencia.acuse_oficio_id_acuse_oficio_seq'::regclass);


--
-- TOC entry 4981 (class 2604 OID 83887)
-- Name: alertas_seguimiento id_alerta; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento ALTER COLUMN id_alerta SET DEFAULT nextval('correspondencia.alertas_seguimiento_id_alerta_seq'::regclass);


--
-- TOC entry 4984 (class 2604 OID 83888)
-- Name: archivos_adjuntos id_archivo; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos ALTER COLUMN id_archivo SET DEFAULT nextval('correspondencia.archivos_adjuntos_id_archivo_seq'::regclass);


--
-- TOC entry 4986 (class 2604 OID 83889)
-- Name: auditoria_correspondencia id_log; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia ALTER COLUMN id_log SET DEFAULT nextval('correspondencia.auditoria_correspondencia_id_log_seq'::regclass);


--
-- TOC entry 4988 (class 2604 OID 83890)
-- Name: correspondencia id_correspondencia; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia ALTER COLUMN id_correspondencia SET DEFAULT nextval('correspondencia.correspondencia_id_folio_seq'::regclass);


--
-- TOC entry 4990 (class 2604 OID 83891)
-- Name: correspondencia_respuestas id_respuesta; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas ALTER COLUMN id_respuesta SET DEFAULT nextval('correspondencia.correspondencia_respuestas_id_respuesta_seq'::regclass);


--
-- TOC entry 4991 (class 2604 OID 83892)
-- Name: correspondencia_turnos id_turno; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos ALTER COLUMN id_turno SET DEFAULT nextval('correspondencia.correspondencia_turnos_id_turno_seq'::regclass);


--
-- TOC entry 4993 (class 2604 OID 83893)
-- Name: memorandums id_memo; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums ALTER COLUMN id_memo SET DEFAULT nextval('correspondencia.memorandums_id_memo_seq'::regclass);


--
-- TOC entry 4995 (class 2604 OID 83894)
-- Name: notificaciones id_notificacion; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.notificaciones ALTER COLUMN id_notificacion SET DEFAULT nextval('correspondencia.notificaciones_id_notificacion_seq'::regclass);


--
-- TOC entry 4998 (class 2604 OID 83895)
-- Name: oficio id_oficio; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio ALTER COLUMN id_oficio SET DEFAULT nextval('correspondencia.oficio_id_oficio_seq'::regclass);


--
-- TOC entry 4999 (class 2604 OID 83896)
-- Name: oficio_contestacion id_contestacion; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion ALTER COLUMN id_contestacion SET DEFAULT nextval('correspondencia.oficio_contestacion_id_contestacion_seq'::regclass);


--
-- TOC entry 5002 (class 2604 OID 83897)
-- Name: oficio_contestacion_externa id_oficio_contestacion; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa ALTER COLUMN id_oficio_contestacion SET DEFAULT nextval('correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq'::regclass);


--
-- TOC entry 5004 (class 2604 OID 83898)
-- Name: plantilla_memorandum id_plantilla; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.plantilla_memorandum ALTER COLUMN id_plantilla SET DEFAULT nextval('correspondencia.plantilla_memorandum_id_plantilla_seq'::regclass);


--
-- TOC entry 5007 (class 2604 OID 83899)
-- Name: seguimiento_correspondencia id_seguimiento_correspondencia; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia ALTER COLUMN id_seguimiento_correspondencia SET DEFAULT nextval('correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq'::regclass);


--
-- TOC entry 5009 (class 2604 OID 83900)
-- Name: seguimiento_memorandum id_seguimiento_memorandum; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum ALTER COLUMN id_seguimiento_memorandum SET DEFAULT nextval('correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq'::regclass);


--
-- TOC entry 5010 (class 2604 OID 83901)
-- Name: seguimiento_memorandum folio_respuesta; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum ALTER COLUMN folio_respuesta SET DEFAULT nextval('correspondencia.seguimiento_memorandum_folio_respuesta_seq'::regclass);


--
-- TOC entry 5012 (class 2604 OID 83902)
-- Name: seguimiento_oficio id_seguimiento_oficio; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio ALTER COLUMN id_seguimiento_oficio SET DEFAULT nextval('correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq'::regclass);


--
-- TOC entry 5013 (class 2604 OID 83903)
-- Name: seguimiento_oficio folio_respuesta; Type: DEFAULT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio ALTER COLUMN folio_respuesta SET DEFAULT nextval('correspondencia.seguimiento_oficio_folio_respuesta_seq'::regclass);


--
-- TOC entry 5017 (class 2604 OID 84407)
-- Name: asesores id_asesores; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.asesores ALTER COLUMN id_asesores SET DEFAULT nextval('sustantiva.asesores_id_asesores_seq'::regclass);


--
-- TOC entry 5020 (class 2604 OID 84421)
-- Name: contribuyentes id_contribuyentes; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.contribuyentes ALTER COLUMN id_contribuyentes SET DEFAULT nextval('sustantiva.contribuyentes_id_contribuyentes_seq'::regclass);


--
-- TOC entry 5028 (class 2604 OID 84958)
-- Name: detalle_asesoria id_detalle_asesoria; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.detalle_asesoria ALTER COLUMN id_detalle_asesoria SET DEFAULT nextval('sustantiva.detalle_asesoria_id_detalle_asesoria_seq'::regclass);


--
-- TOC entry 5029 (class 2604 OID 84994)
-- Name: expedientes id_expediente; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.expedientes ALTER COLUMN id_expediente SET DEFAULT nextval('sustantiva.expedientes_id_expediente_seq'::regclass);


--
-- TOC entry 5058 (class 2604 OID 101487)
-- Name: plantilla_queja_ari id_plantilla; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.plantilla_queja_ari ALTER COLUMN id_plantilla SET DEFAULT nextval('sustantiva.plantilla_queja_ari_id_plantilla_seq'::regclass);


--
-- TOC entry 5036 (class 2604 OID 101335)
-- Name: quejas id_queja; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas ALTER COLUMN id_queja SET DEFAULT nextval('sustantiva.quejas_id_queja_seq'::regclass);


--
-- TOC entry 5052 (class 2604 OID 101447)
-- Name: quejas_acci id_acci; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_acci ALTER COLUMN id_acci SET DEFAULT nextval('sustantiva.quejas_acci_id_acci_seq'::regclass);


--
-- TOC entry 5046 (class 2604 OID 101391)
-- Name: quejas_ari id_ari; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_ari ALTER COLUMN id_ari SET DEFAULT nextval('sustantiva.quejas_ari_id_ari_seq'::regclass);


--
-- TOC entry 5044 (class 2604 OID 101371)
-- Name: quejas_cir id_cir; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_cir ALTER COLUMN id_cir SET DEFAULT nextval('sustantiva.quejas_cir_id_cir_seq'::regclass);


--
-- TOC entry 5048 (class 2604 OID 101417)
-- Name: quejas_oficios_autoridad id_oficio_autoridad; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_oficios_autoridad ALTER COLUMN id_oficio_autoridad SET DEFAULT nextval('sustantiva.quejas_oficios_autoridad_id_oficio_autoridad_seq'::regclass);


--
-- TOC entry 5049 (class 2604 OID 101431)
-- Name: quejas_respuestas_autoridad id_respuesta_autoridad; Type: DEFAULT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_respuestas_autoridad ALTER COLUMN id_respuesta_autoridad SET DEFAULT nextval('sustantiva.quejas_respuestas_autoridad_id_respuesta_autoridad_seq'::regclass);


--
-- TOC entry 5448 (class 0 OID 83636)
-- Dependencies: 218
-- Data for Name: areas; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.areas VALUES (1, 'Administración', NULL);
INSERT INTO catalogos.areas VALUES (2, 'Archivo', NULL);
INSERT INTO catalogos.areas VALUES (3, 'Transparencia', NULL);


--
-- TOC entry 5529 (class 0 OID 84891)
-- Dependencies: 299
-- Data for Name: autoridades; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5517 (class 0 OID 84397)
-- Dependencies: 287
-- Data for Name: cat_autoridades; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5450 (class 0 OID 83642)
-- Dependencies: 220
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
-- TOC entry 5452 (class 0 OID 83646)
-- Dependencies: 222
-- Data for Name: cat_estatus; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.cat_estatus VALUES (1, 'REGISTRADO', 'Existe el folio y el PDF, pero está en revisión de calidad.');
INSERT INTO catalogos.cat_estatus VALUES (2, 'VALIDADO', 'Validación por el administrador.');
INSERT INTO catalogos.cat_estatus VALUES (3, 'ASIGNADO', 'Tiene instrucción (Memo) y área asignada. (Archivo original bloqueado).');
INSERT INTO catalogos.cat_estatus VALUES (4, 'EN SEGUIMIENTO', 'El área ya confirmó que lo recibió en su buzón.');
INSERT INTO catalogos.cat_estatus VALUES (5, 'ATENDIDO', 'El área ya subió su informe y respuesta digitalizada.');
INSERT INTO catalogos.cat_estatus VALUES (6, 'CONCLUIDO', 'El administrador validó todo y el trámite se archiva.');


--
-- TOC entry 5541 (class 0 OID 101254)
-- Dependencies: 311
-- Data for Name: cat_estatus_queja; Type: TABLE DATA; Schema: catalogos; Owner: -
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
-- TOC entry 5515 (class 0 OID 84390)
-- Dependencies: 285
-- Data for Name: cat_estatus_sustantiva; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5454 (class 0 OID 83652)
-- Dependencies: 224
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
-- TOC entry 5513 (class 0 OID 84383)
-- Dependencies: 283
-- Data for Name: cat_tipo_proceso; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5456 (class 0 OID 83656)
-- Dependencies: 226
-- Data for Name: control_folios_config; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5555 (class 0 OID 101470)
-- Dependencies: 325
-- Data for Name: dias_inhabiles; Type: TABLE DATA; Schema: catalogos; Owner: -
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
-- TOC entry 5458 (class 0 OID 83661)
-- Dependencies: 228
-- Data for Name: direcciones; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.direcciones VALUES (1, 'Avenida Reforma', '123', 'A-10', 'Centro Histórico', '06000', 1, 9);


--
-- TOC entry 5460 (class 0 OID 83665)
-- Dependencies: 230
-- Data for Name: empleados; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5533 (class 0 OID 84905)
-- Dependencies: 303
-- Data for Name: estatus_detalle_expediente; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5525 (class 0 OID 84877)
-- Dependencies: 295
-- Data for Name: estatus_expediente; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.estatus_expediente VALUES (1, 'OFICIO ENVIADO');
INSERT INTO catalogos.estatus_expediente VALUES (2, 'INFORME RENDIDO');


--
-- TOC entry 5462 (class 0 OID 83669)
-- Dependencies: 232
-- Data for Name: personas; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.personas VALUES (6, 1, 'Juan', 'Pérez', 'García', 'PERG800101HDFRRR01', '5512345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO catalogos.personas VALUES (7, 1, 'María', 'López', 'Martínez', 'LOMM850510MDFSSN02', '5587654321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO catalogos.personas VALUES (8, NULL, 'Carlos', 'Ramírez', NULL, 'RANC900215HDFGGN03', '5544332211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 5464 (class 0 OID 83673)
-- Dependencies: 234
-- Data for Name: roles; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.roles VALUES (1, 'Administrador', 'Acceso total a todos los módulos del sistema y gestión de usuarios.', NULL, true);
INSERT INTO catalogos.roles VALUES (2, 'Operador', 'Acceso limitado a la captura de datos y consulta de reportes básicos.', NULL, true);
INSERT INTO catalogos.roles VALUES (3, 'Administrador', 'Control total sobre todos los módulos del sistema', '/admin/dashboard', true);
INSERT INTO catalogos.roles VALUES (4, 'Usuario', 'Acceso a funciones operativas y consultas generales', '/user/home', true);
INSERT INTO catalogos.roles VALUES (5, 'Invitado', 'Acceso limitado únicamente para visualización de reportes', '/guest/view', true);
INSERT INTO catalogos.roles VALUES (6, 'Soporte', 'Acceso a herramientas de diagnóstico y soporte técnico', '/support/tools', true);


--
-- TOC entry 5527 (class 0 OID 84884)
-- Dependencies: 297
-- Data for Name: tipo_acto_emitido; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5466 (class 0 OID 83680)
-- Dependencies: 236
-- Data for Name: tipo_correspondencia; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.tipo_correspondencia VALUES (1, 'externa');
INSERT INTO catalogos.tipo_correspondencia VALUES (2, 'interna');


--
-- TOC entry 5531 (class 0 OID 84898)
-- Dependencies: 301
-- Data for Name: tipo_entrada; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5539 (class 0 OID 93062)
-- Dependencies: 309
-- Data for Name: tipo_persona; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.tipo_persona VALUES (1, 'Física');
INSERT INTO catalogos.tipo_persona VALUES (2, 'Moral');


--
-- TOC entry 5523 (class 0 OID 84870)
-- Dependencies: 293
-- Data for Name: tipo_tramite; Type: TABLE DATA; Schema: catalogos; Owner: -
--



--
-- TOC entry 5468 (class 0 OID 83684)
-- Dependencies: 238
-- Data for Name: usuarios; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.usuarios VALUES (10, 8, 1, 'jperez', 'hash_seguro_123', 'juan.perez@empresa.com', '2026-04-25 13:33:21.566884', true);
INSERT INTO catalogos.usuarios VALUES (11, 6, 2, 'mlopez', 'clave_secreta_456', 'maria.lopez@empresa.com', '2026-04-25 13:33:21.566884', true);
INSERT INTO catalogos.usuarios VALUES (12, 7, NULL, 'cramirez', 'password_789', 'carlos.ram@correo.com', '2026-04-25 13:33:21.566884', true);


--
-- TOC entry 5470 (class 0 OID 83690)
-- Dependencies: 240
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: catalogos; Owner: -
--

INSERT INTO catalogos.usuarios_roles VALUES (1, 10, 1, '2026-05-13 15:37:23.785455');
INSERT INTO catalogos.usuarios_roles VALUES (2, 11, 2, '2026-05-13 15:37:23.785455');
INSERT INTO catalogos.usuarios_roles VALUES (3, 12, 6, '2026-05-13 15:37:23.785455');


--
-- TOC entry 5472 (class 0 OID 83695)
-- Dependencies: 242
-- Data for Name: acuse_correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5474 (class 0 OID 83699)
-- Dependencies: 244
-- Data for Name: acuse_memorandum; Type: TABLE DATA; Schema: correspondencia; Owner: -
--

INSERT INTO correspondencia.acuse_memorandum VALUES (4, 2, 11, '2026-04-25', '13:45:00', false);


--
-- TOC entry 5475 (class 0 OID 83702)
-- Dependencies: 245
-- Data for Name: acuse_oficio; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5478 (class 0 OID 83707)
-- Dependencies: 248
-- Data for Name: alertas_seguimiento; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5480 (class 0 OID 83715)
-- Dependencies: 250
-- Data for Name: archivos_adjuntos; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5482 (class 0 OID 83722)
-- Dependencies: 252
-- Data for Name: auditoria_correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5484 (class 0 OID 83729)
-- Dependencies: 254
-- Data for Name: correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: -
--

INSERT INTO correspondencia.correspondencia VALUES (5, 'FOL-2024-001', 'SEP-123-2024', 'Secretaría de Educación Pública', 'Lic. Roberto Gómez', 'Solicitud de becas para el periodo 2024-B', '2024-05-15', '2024-05-16 10:00:00', '2026-04-25 13:38:43.872641', '2024-05-16', '2024-06-16', 1, 10, 'Documentación completa y legible.', 1, NULL);
INSERT INTO correspondencia.correspondencia VALUES (6, 'FOL-2024-002', 'SAT-987-A', 'Servicio de Administración Tributaria', 'Ing. Ana Luz', 'Notificación de auditoría anual', '2024-05-18', '2026-04-25 13:38:43.872641', '2026-04-25 13:38:43.872641', '2024-05-20', '2024-05-30', 2, 11, NULL, 2, NULL);


--
-- TOC entry 5486 (class 0 OID 83736)
-- Dependencies: 256
-- Data for Name: correspondencia_respuestas; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5488 (class 0 OID 83742)
-- Dependencies: 258
-- Data for Name: correspondencia_turnos; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5490 (class 0 OID 83747)
-- Dependencies: 260
-- Data for Name: memorandums; Type: TABLE DATA; Schema: correspondencia; Owner: -
--

INSERT INTO correspondencia.memorandums VALUES (2, 5, 'MEMO-2026-005', 'Favor de revisar la solicitud y dar respuesta en un plazo de 3 días.', '2026-04-25 13:42:50.920047', 11, 'FOL-MEMO-9988', 'Se adjuntan documentos originales en físico.', 'https://servidor/docs/memo_005.pdf', 2, 1, 12);


--
-- TOC entry 5492 (class 0 OID 83754)
-- Dependencies: 262
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5494 (class 0 OID 83762)
-- Dependencies: 264
-- Data for Name: oficio; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5495 (class 0 OID 83767)
-- Dependencies: 265
-- Data for Name: oficio_contestacion; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5496 (class 0 OID 83774)
-- Dependencies: 266
-- Data for Name: oficio_contestacion_externa; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5500 (class 0 OID 83783)
-- Dependencies: 270
-- Data for Name: plantilla_memorandum; Type: TABLE DATA; Schema: correspondencia; Owner: -
--

INSERT INTO correspondencia.plantilla_memorandum VALUES (1, 'Plantilla Estándar Oficinas', '/assets/templates/memo_estandar_v1.docx', '2026-04-25 13:42:44.046661', true);
INSERT INTO correspondencia.plantilla_memorandum VALUES (2, 'Plantilla Urgente / Prioritaria', '/assets/templates/memo_urgente_v2.docx', '2026-04-25 13:42:44.046661', true);


--
-- TOC entry 5502 (class 0 OID 83791)
-- Dependencies: 272
-- Data for Name: seguimiento_correspondencia; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5504 (class 0 OID 83798)
-- Dependencies: 274
-- Data for Name: seguimiento_memorandum; Type: TABLE DATA; Schema: correspondencia; Owner: -
--

INSERT INTO correspondencia.seguimiento_memorandum VALUES (3, 2, 3, 'Se ha revisado la documentación y se procede con la firma.', '2026-04-27', '14:30:00', 'documento_final_v1.pdf', 10, 2, '2026-04-27 15:09:02.304282', NULL);
INSERT INTO correspondencia.seguimiento_memorandum VALUES (4, 2, 4, 'Prueba final de integración', '2026-04-27', '16:00:00', 'evidencia.pdf', 10, 2, '2026-04-27 16:04:55.619478', NULL);
INSERT INTO correspondencia.seguimiento_memorandum VALUES (5, 2, 5, 'Prueba final de integración', '2026-04-27', '16:00:00', 'evidencia.pdf', 10, 2, '2026-04-29 12:26:44.350989', NULL);
INSERT INTO correspondencia.seguimiento_memorandum VALUES (6, 2, 6, 'Prueba final de integración', '2026-04-27', '16:00:00', 'evidencia.pdf', 10, 2, '2026-04-29 12:31:40.544317', NULL);


--
-- TOC entry 5507 (class 0 OID 83806)
-- Dependencies: 277
-- Data for Name: seguimiento_oficio; Type: TABLE DATA; Schema: correspondencia; Owner: -
--



--
-- TOC entry 5510 (class 0 OID 83836)
-- Dependencies: 280
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


--
-- TOC entry 5511 (class 0 OID 83841)
-- Dependencies: 281
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);


--
-- TOC entry 5519 (class 0 OID 84404)
-- Dependencies: 289
-- Data for Name: asesores; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5521 (class 0 OID 84418)
-- Dependencies: 291
-- Data for Name: contribuyentes; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5535 (class 0 OID 84955)
-- Dependencies: 305
-- Data for Name: detalle_asesoria; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5537 (class 0 OID 84991)
-- Dependencies: 307
-- Data for Name: expedientes; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5557 (class 0 OID 101484)
-- Dependencies: 327
-- Data for Name: plantilla_queja_ari; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5543 (class 0 OID 101332)
-- Dependencies: 313
-- Data for Name: quejas; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5553 (class 0 OID 101444)
-- Dependencies: 323
-- Data for Name: quejas_acci; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5547 (class 0 OID 101388)
-- Dependencies: 317
-- Data for Name: quejas_ari; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5545 (class 0 OID 101368)
-- Dependencies: 315
-- Data for Name: quejas_cir; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5549 (class 0 OID 101414)
-- Dependencies: 319
-- Data for Name: quejas_oficios_autoridad; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5551 (class 0 OID 101428)
-- Dependencies: 321
-- Data for Name: quejas_respuestas_autoridad; Type: TABLE DATA; Schema: sustantiva; Owner: -
--



--
-- TOC entry 5623 (class 0 OID 0)
-- Dependencies: 219
-- Name: areas_id_area_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.areas_id_area_seq', 3, true);


--
-- TOC entry 5624 (class 0 OID 0)
-- Dependencies: 298
-- Name: autoridades_id_autoridad_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.autoridades_id_autoridad_seq', 1, false);


--
-- TOC entry 5625 (class 0 OID 0)
-- Dependencies: 286
-- Name: cat_autoridades_id_cat_autoridad_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.cat_autoridades_id_cat_autoridad_seq', 1, false);


--
-- TOC entry 5626 (class 0 OID 0)
-- Dependencies: 221
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.cat_estados_id_estado_seq', 32, true);


--
-- TOC entry 5627 (class 0 OID 0)
-- Dependencies: 223
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.cat_estatus_id_estatus_seq', 1, false);


--
-- TOC entry 5628 (class 0 OID 0)
-- Dependencies: 310
-- Name: cat_estatus_queja_id_estatus_queja_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.cat_estatus_queja_id_estatus_queja_seq', 10, true);


--
-- TOC entry 5629 (class 0 OID 0)
-- Dependencies: 284
-- Name: cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.cat_estatus_sustantiva_id_cat_estatus_sustantiva_seq', 1, false);


--
-- TOC entry 5630 (class 0 OID 0)
-- Dependencies: 225
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.cat_municipios_id_municipio_seq', 58, true);


--
-- TOC entry 5631 (class 0 OID 0)
-- Dependencies: 282
-- Name: cat_tipo_proceso_id_cat_tipo_proceso_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.cat_tipo_proceso_id_cat_tipo_proceso_seq', 1, false);


--
-- TOC entry 5632 (class 0 OID 0)
-- Dependencies: 227
-- Name: control_folios_config_id_control_folios_config_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.control_folios_config_id_control_folios_config_seq', 1, false);


--
-- TOC entry 5633 (class 0 OID 0)
-- Dependencies: 324
-- Name: dias_inhabiles_id_dia_inhabil_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.dias_inhabiles_id_dia_inhabil_seq', 8, true);


--
-- TOC entry 5634 (class 0 OID 0)
-- Dependencies: 229
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.direcciones_id_direccion_seq', 1, true);


--
-- TOC entry 5635 (class 0 OID 0)
-- Dependencies: 231
-- Name: empleados_id_empleado_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.empleados_id_empleado_seq', 1, false);


--
-- TOC entry 5636 (class 0 OID 0)
-- Dependencies: 302
-- Name: estatus_detalle_expediente_id_estatus_detalle_expediente_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.estatus_detalle_expediente_id_estatus_detalle_expediente_seq', 1, false);


--
-- TOC entry 5637 (class 0 OID 0)
-- Dependencies: 294
-- Name: estatus_expediente_id_estatus_expediente_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.estatus_expediente_id_estatus_expediente_seq', 2, true);


--
-- TOC entry 5638 (class 0 OID 0)
-- Dependencies: 233
-- Name: personas_id_persona_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.personas_id_persona_seq', 8, true);


--
-- TOC entry 5639 (class 0 OID 0)
-- Dependencies: 235
-- Name: roles_id_rol_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.roles_id_rol_seq', 6, true);


--
-- TOC entry 5640 (class 0 OID 0)
-- Dependencies: 296
-- Name: tipo_acto_emitido_id_tipo_acto_emitido_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.tipo_acto_emitido_id_tipo_acto_emitido_seq', 1, false);


--
-- TOC entry 5641 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipo_correspondencia_id_tipo_correspondencia_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.tipo_correspondencia_id_tipo_correspondencia_seq', 6, true);


--
-- TOC entry 5642 (class 0 OID 0)
-- Dependencies: 300
-- Name: tipo_entrada_id_tipo_entrada_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.tipo_entrada_id_tipo_entrada_seq', 1, false);


--
-- TOC entry 5643 (class 0 OID 0)
-- Dependencies: 308
-- Name: tipo_persona_id_tipo_persona_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.tipo_persona_id_tipo_persona_seq', 2, true);


--
-- TOC entry 5644 (class 0 OID 0)
-- Dependencies: 292
-- Name: tipo_tramite_id_tipo_tramite_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.tipo_tramite_id_tipo_tramite_seq', 1, false);


--
-- TOC entry 5645 (class 0 OID 0)
-- Dependencies: 239
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.usuarios_id_usuario_seq', 13, true);


--
-- TOC entry 5646 (class 0 OID 0)
-- Dependencies: 241
-- Name: usuarios_roles_id_usuario_rol_seq; Type: SEQUENCE SET; Schema: catalogos; Owner: -
--

SELECT pg_catalog.setval('catalogos.usuarios_roles_id_usuario_rol_seq', 3, true);


--
-- TOC entry 5647 (class 0 OID 0)
-- Dependencies: 243
-- Name: acuse_correspondencia_id_acuse_correspondencia_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.acuse_correspondencia_id_acuse_correspondencia_seq', 1, false);


--
-- TOC entry 5648 (class 0 OID 0)
-- Dependencies: 246
-- Name: acuse_oficio_id_acuse_oficio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.acuse_oficio_id_acuse_oficio_seq', 1, false);


--
-- TOC entry 5649 (class 0 OID 0)
-- Dependencies: 247
-- Name: acuserecibointerno_id_acuse_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.acuserecibointerno_id_acuse_seq', 4, true);


--
-- TOC entry 5650 (class 0 OID 0)
-- Dependencies: 249
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.alertas_seguimiento_id_alerta_seq', 1, false);


--
-- TOC entry 5651 (class 0 OID 0)
-- Dependencies: 251
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.archivos_adjuntos_id_archivo_seq', 1, false);


--
-- TOC entry 5652 (class 0 OID 0)
-- Dependencies: 253
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.auditoria_correspondencia_id_log_seq', 1, false);


--
-- TOC entry 5653 (class 0 OID 0)
-- Dependencies: 255
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.correspondencia_id_folio_seq', 6, true);


--
-- TOC entry 5654 (class 0 OID 0)
-- Dependencies: 257
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.correspondencia_respuestas_id_respuesta_seq', 2, true);


--
-- TOC entry 5655 (class 0 OID 0)
-- Dependencies: 259
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.correspondencia_turnos_id_turno_seq', 1, false);


--
-- TOC entry 5656 (class 0 OID 0)
-- Dependencies: 261
-- Name: memorandums_id_memo_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.memorandums_id_memo_seq', 3, true);


--
-- TOC entry 5657 (class 0 OID 0)
-- Dependencies: 263
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.notificaciones_id_notificacion_seq', 1, false);


--
-- TOC entry 5658 (class 0 OID 0)
-- Dependencies: 267
-- Name: oficio_contestacion_externa_id_oficio_contestacion_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.oficio_contestacion_externa_id_oficio_contestacion_seq', 1, false);


--
-- TOC entry 5659 (class 0 OID 0)
-- Dependencies: 268
-- Name: oficio_contestacion_id_contestacion_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.oficio_contestacion_id_contestacion_seq', 1, false);


--
-- TOC entry 5660 (class 0 OID 0)
-- Dependencies: 269
-- Name: oficio_id_oficio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.oficio_id_oficio_seq', 1, false);


--
-- TOC entry 5661 (class 0 OID 0)
-- Dependencies: 271
-- Name: plantilla_memorandum_id_plantilla_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.plantilla_memorandum_id_plantilla_seq', 2, true);


--
-- TOC entry 5662 (class 0 OID 0)
-- Dependencies: 273
-- Name: seguimiento_correspondencia_id_seguimiento_correspondencia_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.seguimiento_correspondencia_id_seguimiento_correspondencia_seq', 1, false);


--
-- TOC entry 5663 (class 0 OID 0)
-- Dependencies: 275
-- Name: seguimiento_memorandum_folio_respuesta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.seguimiento_memorandum_folio_respuesta_seq', 6, true);


--
-- TOC entry 5664 (class 0 OID 0)
-- Dependencies: 276
-- Name: seguimiento_memorandum_id_seguimiento_memorandum_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.seguimiento_memorandum_id_seguimiento_memorandum_seq', 6, true);


--
-- TOC entry 5665 (class 0 OID 0)
-- Dependencies: 278
-- Name: seguimiento_oficio_folio_respuesta_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.seguimiento_oficio_folio_respuesta_seq', 1, false);


--
-- TOC entry 5666 (class 0 OID 0)
-- Dependencies: 279
-- Name: seguimiento_oficio_id_seguimiento_oficio_seq; Type: SEQUENCE SET; Schema: correspondencia; Owner: -
--

SELECT pg_catalog.setval('correspondencia.seguimiento_oficio_id_seguimiento_oficio_seq', 1, false);


--
-- TOC entry 5667 (class 0 OID 0)
-- Dependencies: 288
-- Name: asesores_id_asesores_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.asesores_id_asesores_seq', 1, false);


--
-- TOC entry 5668 (class 0 OID 0)
-- Dependencies: 290
-- Name: contribuyentes_id_contribuyentes_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.contribuyentes_id_contribuyentes_seq', 1, false);


--
-- TOC entry 5669 (class 0 OID 0)
-- Dependencies: 304
-- Name: detalle_asesoria_id_detalle_asesoria_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.detalle_asesoria_id_detalle_asesoria_seq', 1, false);


--
-- TOC entry 5670 (class 0 OID 0)
-- Dependencies: 306
-- Name: expedientes_id_expediente_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.expedientes_id_expediente_seq', 1, false);


--
-- TOC entry 5671 (class 0 OID 0)
-- Dependencies: 326
-- Name: plantilla_queja_ari_id_plantilla_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.plantilla_queja_ari_id_plantilla_seq', 1, false);


--
-- TOC entry 5672 (class 0 OID 0)
-- Dependencies: 322
-- Name: quejas_acci_id_acci_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.quejas_acci_id_acci_seq', 1, false);


--
-- TOC entry 5673 (class 0 OID 0)
-- Dependencies: 316
-- Name: quejas_ari_id_ari_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.quejas_ari_id_ari_seq', 1, false);


--
-- TOC entry 5674 (class 0 OID 0)
-- Dependencies: 314
-- Name: quejas_cir_id_cir_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.quejas_cir_id_cir_seq', 1, false);


--
-- TOC entry 5675 (class 0 OID 0)
-- Dependencies: 312
-- Name: quejas_id_queja_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.quejas_id_queja_seq', 1, false);


--
-- TOC entry 5676 (class 0 OID 0)
-- Dependencies: 318
-- Name: quejas_oficios_autoridad_id_oficio_autoridad_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.quejas_oficios_autoridad_id_oficio_autoridad_seq', 1, false);


--
-- TOC entry 5677 (class 0 OID 0)
-- Dependencies: 320
-- Name: quejas_respuestas_autoridad_id_respuesta_autoridad_seq; Type: SEQUENCE SET; Schema: sustantiva; Owner: -
--

SELECT pg_catalog.setval('sustantiva.quejas_respuestas_autoridad_id_respuesta_autoridad_seq', 1, false);


--
-- TOC entry 5062 (class 2606 OID 83929)
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id_area);


--
-- TOC entry 5166 (class 2606 OID 84896)
-- Name: autoridades autoridades_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.autoridades
    ADD CONSTRAINT autoridades_pkey PRIMARY KEY (id_autoridad);


--
-- TOC entry 5154 (class 2606 OID 84402)
-- Name: cat_autoridades cat_autoridades_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_autoridades
    ADD CONSTRAINT cat_autoridades_pkey PRIMARY KEY (id_cat_autoridad);


--
-- TOC entry 5064 (class 2606 OID 83931)
-- Name: cat_estados cat_estados_nombre_estado_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estados
    ADD CONSTRAINT cat_estados_nombre_estado_key UNIQUE (nombre_estado);


--
-- TOC entry 5066 (class 2606 OID 83933)
-- Name: cat_estados cat_estados_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estados
    ADD CONSTRAINT cat_estados_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 5068 (class 2606 OID 83935)
-- Name: cat_estatus cat_estatus_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estatus
    ADD CONSTRAINT cat_estatus_pkey PRIMARY KEY (id_estatus);


--
-- TOC entry 5182 (class 2606 OID 101500)
-- Name: cat_estatus_queja cat_estatus_queja_descripcion_estatus_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estatus_queja
    ADD CONSTRAINT cat_estatus_queja_descripcion_estatus_key UNIQUE (descripcion_estatus);


--
-- TOC entry 5184 (class 2606 OID 101260)
-- Name: cat_estatus_queja cat_estatus_queja_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estatus_queja
    ADD CONSTRAINT cat_estatus_queja_pkey PRIMARY KEY (id_estatus_queja);


--
-- TOC entry 5152 (class 2606 OID 84395)
-- Name: cat_estatus_sustantiva cat_estatus_sustantiva_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_estatus_sustantiva
    ADD CONSTRAINT cat_estatus_sustantiva_pkey PRIMARY KEY (id_cat_estatus_sustantiva);


--
-- TOC entry 5070 (class 2606 OID 83937)
-- Name: cat_municipios cat_municipios_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_municipios
    ADD CONSTRAINT cat_municipios_pkey PRIMARY KEY (id_municipio);


--
-- TOC entry 5150 (class 2606 OID 84388)
-- Name: cat_tipo_proceso cat_tipo_proceso_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_tipo_proceso
    ADD CONSTRAINT cat_tipo_proceso_pkey PRIMARY KEY (id_cat_tipo_proceso);


--
-- TOC entry 5072 (class 2606 OID 83939)
-- Name: control_folios_config control_folios_config_anio_mes_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.control_folios_config
    ADD CONSTRAINT control_folios_config_anio_mes_key UNIQUE (anio, mes);


--
-- TOC entry 5074 (class 2606 OID 83941)
-- Name: control_folios_config control_folios_config_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.control_folios_config
    ADD CONSTRAINT control_folios_config_pkey PRIMARY KEY (id_control_folios_config);


--
-- TOC entry 5214 (class 2606 OID 101478)
-- Name: dias_inhabiles dias_inhabiles_fecha_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.dias_inhabiles
    ADD CONSTRAINT dias_inhabiles_fecha_key UNIQUE (fecha);


--
-- TOC entry 5216 (class 2606 OID 101476)
-- Name: dias_inhabiles dias_inhabiles_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.dias_inhabiles
    ADD CONSTRAINT dias_inhabiles_pkey PRIMARY KEY (id_dia_inhabil);


--
-- TOC entry 5076 (class 2606 OID 83943)
-- Name: direcciones direcciones_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.direcciones
    ADD CONSTRAINT direcciones_pkey PRIMARY KEY (id_direccion);


--
-- TOC entry 5078 (class 2606 OID 83945)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 5170 (class 2606 OID 84910)
-- Name: estatus_detalle_expediente estatus_detalle_expediente_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.estatus_detalle_expediente
    ADD CONSTRAINT estatus_detalle_expediente_pkey PRIMARY KEY (id_estatus_detalle_expediente);


--
-- TOC entry 5162 (class 2606 OID 84882)
-- Name: estatus_expediente estatus_expediente_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.estatus_expediente
    ADD CONSTRAINT estatus_expediente_pkey PRIMARY KEY (id_estatus_expediente);


--
-- TOC entry 5080 (class 2606 OID 83947)
-- Name: personas personas_curp_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT personas_curp_key UNIQUE (curp);


--
-- TOC entry 5082 (class 2606 OID 83949)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id_persona);


--
-- TOC entry 5084 (class 2606 OID 83951)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 5164 (class 2606 OID 84889)
-- Name: tipo_acto_emitido tipo_acto_emitido_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_acto_emitido
    ADD CONSTRAINT tipo_acto_emitido_pkey PRIMARY KEY (id_tipo_acto_emitido);


--
-- TOC entry 5086 (class 2606 OID 83953)
-- Name: tipo_correspondencia tipo_correspondencia_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_correspondencia
    ADD CONSTRAINT tipo_correspondencia_pkey PRIMARY KEY (id_tipo_correspondencia);


--
-- TOC entry 5168 (class 2606 OID 84903)
-- Name: tipo_entrada tipo_entrada_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_entrada
    ADD CONSTRAINT tipo_entrada_pkey PRIMARY KEY (id_tipo_entrada);


--
-- TOC entry 5180 (class 2606 OID 93067)
-- Name: tipo_persona tipo_persona_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_persona
    ADD CONSTRAINT tipo_persona_pkey PRIMARY KEY (id_tipo_persona);


--
-- TOC entry 5160 (class 2606 OID 84875)
-- Name: tipo_tramite tipo_tramite_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_tramite
    ADD CONSTRAINT tipo_tramite_pkey PRIMARY KEY (id_tipo_tramite);


--
-- TOC entry 5088 (class 2606 OID 83955)
-- Name: tipo_correspondencia uq_tipo_correspondencia_descripcion; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.tipo_correspondencia
    ADD CONSTRAINT uq_tipo_correspondencia_descripcion UNIQUE (descripcion);


--
-- TOC entry 5096 (class 2606 OID 83957)
-- Name: usuarios_roles uq_usuario_rol; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT uq_usuario_rol UNIQUE (id_usuario, id_rol);


--
-- TOC entry 5090 (class 2606 OID 83959)
-- Name: usuarios usuarios_correo_electronico_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_correo_electronico_key UNIQUE (correo_electronico);


--
-- TOC entry 5092 (class 2606 OID 83961)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 5098 (class 2606 OID 83963)
-- Name: usuarios_roles usuarios_roles_pkey; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (id_usuario_rol);


--
-- TOC entry 5094 (class 2606 OID 83965)
-- Name: usuarios usuarios_usuario_login_key; Type: CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_usuario_login_key UNIQUE (usuario_login);


--
-- TOC entry 5100 (class 2606 OID 83967)
-- Name: acuse_correspondencia acuse_correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT acuse_correspondencia_pkey PRIMARY KEY (id_acuse_correspondencia);


--
-- TOC entry 5108 (class 2606 OID 83969)
-- Name: acuse_oficio acuse_oficio_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_oficio
    ADD CONSTRAINT acuse_oficio_pkey PRIMARY KEY (id_acuse_oficio);


--
-- TOC entry 5104 (class 2606 OID 83971)
-- Name: acuse_memorandum acuserecibointerno_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT acuserecibointerno_pkey PRIMARY KEY (id_acuse);


--
-- TOC entry 5110 (class 2606 OID 83973)
-- Name: alertas_seguimiento alertas_seguimiento_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_pkey PRIMARY KEY (id_alerta);


--
-- TOC entry 5112 (class 2606 OID 83975)
-- Name: archivos_adjuntos archivos_adjuntos_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_pkey PRIMARY KEY (id_archivo);


--
-- TOC entry 5114 (class 2606 OID 83977)
-- Name: auditoria_correspondencia auditoria_correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_pkey PRIMARY KEY (id_log);


--
-- TOC entry 5116 (class 2606 OID 83979)
-- Name: correspondencia correspondencia_folio_unico_key; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_folio_unico_key UNIQUE (folio_unico);


--
-- TOC entry 5118 (class 2606 OID 83981)
-- Name: correspondencia correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_pkey PRIMARY KEY (id_correspondencia);


--
-- TOC entry 5120 (class 2606 OID 83983)
-- Name: correspondencia_respuestas correspondencia_respuestas_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_pkey PRIMARY KEY (id_respuesta);


--
-- TOC entry 5122 (class 2606 OID 83985)
-- Name: correspondencia_turnos correspondencia_turnos_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_pkey PRIMARY KEY (id_turno);


--
-- TOC entry 5124 (class 2606 OID 83987)
-- Name: memorandums memorandums_folio_unico_key; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_folio_unico_key UNIQUE (folio_unico);


--
-- TOC entry 5126 (class 2606 OID 83989)
-- Name: memorandums memorandums_num_memo_key; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_num_memo_key UNIQUE (num_memo);


--
-- TOC entry 5128 (class 2606 OID 83991)
-- Name: memorandums memorandums_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_pkey PRIMARY KEY (id_memo);


--
-- TOC entry 5130 (class 2606 OID 83993)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);


--
-- TOC entry 5134 (class 2606 OID 83995)
-- Name: oficio_contestacion oficio_contestacion_num_oficio_contestacion_key; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT oficio_contestacion_num_oficio_contestacion_key UNIQUE (num_oficio_contestacion);


--
-- TOC entry 5136 (class 2606 OID 83997)
-- Name: oficio_contestacion oficio_contestacion_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT oficio_contestacion_pkey PRIMARY KEY (id_contestacion);


--
-- TOC entry 5132 (class 2606 OID 83999)
-- Name: oficio oficio_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT oficio_pkey PRIMARY KEY (id_oficio);


--
-- TOC entry 5138 (class 2606 OID 84001)
-- Name: oficio_contestacion_externa pk_oficio_contestacion; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa
    ADD CONSTRAINT pk_oficio_contestacion PRIMARY KEY (id_oficio_contestacion);


--
-- TOC entry 5140 (class 2606 OID 84003)
-- Name: plantilla_memorandum plantilla_memorandum_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.plantilla_memorandum
    ADD CONSTRAINT plantilla_memorandum_pkey PRIMARY KEY (id_plantilla);


--
-- TOC entry 5142 (class 2606 OID 84005)
-- Name: seguimiento_correspondencia seguimiento_correspondencia_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT seguimiento_correspondencia_pkey PRIMARY KEY (id_seguimiento_correspondencia);


--
-- TOC entry 5144 (class 2606 OID 84007)
-- Name: seguimiento_memorandum seguimiento_memorandum_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT seguimiento_memorandum_pkey PRIMARY KEY (id_seguimiento_memorandum);


--
-- TOC entry 5146 (class 2606 OID 84009)
-- Name: seguimiento_oficio seguimiento_oficio_pkey; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT seguimiento_oficio_pkey PRIMARY KEY (id_seguimiento_oficio);


--
-- TOC entry 5106 (class 2606 OID 84011)
-- Name: acuse_memorandum uq_acuse; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT uq_acuse UNIQUE (id_memorandum, id_usuario_revisor);


--
-- TOC entry 5102 (class 2606 OID 84013)
-- Name: acuse_correspondencia uq_acuse_correspondencia; Type: CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT uq_acuse_correspondencia UNIQUE (id_correspondencia, id_usuario_revisor);


--
-- TOC entry 5148 (class 2606 OID 84027)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 5156 (class 2606 OID 84411)
-- Name: asesores asesores_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.asesores
    ADD CONSTRAINT asesores_pkey PRIMARY KEY (id_asesores);


--
-- TOC entry 5158 (class 2606 OID 84426)
-- Name: contribuyentes contribuyentes_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.contribuyentes
    ADD CONSTRAINT contribuyentes_pkey PRIMARY KEY (id_contribuyentes);


--
-- TOC entry 5172 (class 2606 OID 84964)
-- Name: detalle_asesoria detalle_asesoria_id_expediente_key; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT detalle_asesoria_id_expediente_key UNIQUE (id_expediente);


--
-- TOC entry 5174 (class 2606 OID 84962)
-- Name: detalle_asesoria detalle_asesoria_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT detalle_asesoria_pkey PRIMARY KEY (id_detalle_asesoria);


--
-- TOC entry 5176 (class 2606 OID 85001)
-- Name: expedientes expedientes_folio_gobierno_key; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT expedientes_folio_gobierno_key UNIQUE (folio_gobierno);


--
-- TOC entry 5178 (class 2606 OID 84999)
-- Name: expedientes expedientes_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT expedientes_pkey PRIMARY KEY (id_expediente);


--
-- TOC entry 5218 (class 2606 OID 101491)
-- Name: plantilla_queja_ari plantilla_queja_ari_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.plantilla_queja_ari
    ADD CONSTRAINT plantilla_queja_ari_pkey PRIMARY KEY (id_plantilla);


--
-- TOC entry 5208 (class 2606 OID 101458)
-- Name: quejas_acci quejas_acci_id_oficio_autoridad_key; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_acci
    ADD CONSTRAINT quejas_acci_id_oficio_autoridad_key UNIQUE (id_oficio_autoridad);


--
-- TOC entry 5210 (class 2606 OID 101456)
-- Name: quejas_acci quejas_acci_id_queja_key; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_acci
    ADD CONSTRAINT quejas_acci_id_queja_key UNIQUE (id_queja);


--
-- TOC entry 5212 (class 2606 OID 101454)
-- Name: quejas_acci quejas_acci_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_acci
    ADD CONSTRAINT quejas_acci_pkey PRIMARY KEY (id_acci);


--
-- TOC entry 5194 (class 2606 OID 101400)
-- Name: quejas_ari quejas_ari_id_cir_key; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_id_cir_key UNIQUE (id_cir);


--
-- TOC entry 5196 (class 2606 OID 101398)
-- Name: quejas_ari quejas_ari_id_queja_key; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_id_queja_key UNIQUE (id_queja);


--
-- TOC entry 5198 (class 2606 OID 101402)
-- Name: quejas_ari quejas_ari_num_expediente_oficial_key; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_num_expediente_oficial_key UNIQUE (num_expediente_oficial);


--
-- TOC entry 5200 (class 2606 OID 101396)
-- Name: quejas_ari quejas_ari_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_pkey PRIMARY KEY (id_ari);


--
-- TOC entry 5190 (class 2606 OID 101376)
-- Name: quejas_cir quejas_cir_id_queja_key; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT quejas_cir_id_queja_key UNIQUE (id_queja);


--
-- TOC entry 5192 (class 2606 OID 101374)
-- Name: quejas_cir quejas_cir_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT quejas_cir_pkey PRIMARY KEY (id_cir);


--
-- TOC entry 5186 (class 2606 OID 101346)
-- Name: quejas quejas_id_expediente_key; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_id_expediente_key UNIQUE (id_expediente);


--
-- TOC entry 5202 (class 2606 OID 101421)
-- Name: quejas_oficios_autoridad quejas_oficios_autoridad_num_oficio_comisionado_key; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_oficios_autoridad
    ADD CONSTRAINT quejas_oficios_autoridad_num_oficio_comisionado_key UNIQUE (num_oficio_comisionado);


--
-- TOC entry 5204 (class 2606 OID 101419)
-- Name: quejas_oficios_autoridad quejas_oficios_autoridad_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_oficios_autoridad
    ADD CONSTRAINT quejas_oficios_autoridad_pkey PRIMARY KEY (id_oficio_autoridad);


--
-- TOC entry 5188 (class 2606 OID 101344)
-- Name: quejas quejas_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_pkey PRIMARY KEY (id_queja);


--
-- TOC entry 5206 (class 2606 OID 101437)
-- Name: quejas_respuestas_autoridad quejas_respuestas_autoridad_pkey; Type: CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_respuestas_autoridad
    ADD CONSTRAINT quejas_respuestas_autoridad_pkey PRIMARY KEY (id_respuesta_autoridad);


--
-- TOC entry 5219 (class 2606 OID 84061)
-- Name: cat_municipios cat_municipios_id_estado_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.cat_municipios
    ADD CONSTRAINT cat_municipios_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES catalogos.cat_estados(id_estado);


--
-- TOC entry 5220 (class 2606 OID 84066)
-- Name: direcciones direcciones_id_estado_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.direcciones
    ADD CONSTRAINT direcciones_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES catalogos.cat_estados(id_estado);


--
-- TOC entry 5221 (class 2606 OID 84071)
-- Name: direcciones direcciones_id_municipio_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.direcciones
    ADD CONSTRAINT direcciones_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES catalogos.cat_municipios(id_municipio);


--
-- TOC entry 5222 (class 2606 OID 84076)
-- Name: empleados fk_empleado_area; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.empleados
    ADD CONSTRAINT fk_empleado_area FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5223 (class 2606 OID 93070)
-- Name: personas fk_personas_tipo_persona; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT fk_personas_tipo_persona FOREIGN KEY (id_tipo_persona) REFERENCES catalogos.tipo_persona(id_tipo_persona);


--
-- TOC entry 5227 (class 2606 OID 84081)
-- Name: usuarios_roles fk_rol; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT fk_rol FOREIGN KEY (id_rol) REFERENCES catalogos.roles(id_rol) ON DELETE CASCADE;


--
-- TOC entry 5228 (class 2606 OID 84086)
-- Name: usuarios_roles fk_usuario; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios_roles
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 5224 (class 2606 OID 84091)
-- Name: personas personas_id_direccion_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.personas
    ADD CONSTRAINT personas_id_direccion_fkey FOREIGN KEY (id_direccion) REFERENCES catalogos.direcciones(id_direccion);


--
-- TOC entry 5225 (class 2606 OID 84096)
-- Name: usuarios usuarios_id_area_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_id_area_fkey FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5226 (class 2606 OID 84101)
-- Name: usuarios usuarios_id_persona_fkey; Type: FK CONSTRAINT; Schema: catalogos; Owner: -
--

ALTER TABLE ONLY catalogos.usuarios
    ADD CONSTRAINT usuarios_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5235 (class 2606 OID 84106)
-- Name: alertas_seguimiento alertas_seguimiento_id_turno_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES correspondencia.correspondencia_turnos(id_turno);


--
-- TOC entry 5236 (class 2606 OID 84111)
-- Name: alertas_seguimiento alertas_seguimiento_id_usuario_emisor_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_id_usuario_emisor_fkey FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5237 (class 2606 OID 84116)
-- Name: archivos_adjuntos archivos_adjuntos_id_usuario_subio_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_id_usuario_subio_fkey FOREIGN KEY (id_usuario_subio) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5239 (class 2606 OID 84121)
-- Name: auditoria_correspondencia auditoria_correspondencia_estado_anterior_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_estado_anterior_fkey FOREIGN KEY (estado_anterior) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5240 (class 2606 OID 84126)
-- Name: auditoria_correspondencia auditoria_correspondencia_estado_nuevo_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_estado_nuevo_fkey FOREIGN KEY (estado_nuevo) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5241 (class 2606 OID 84131)
-- Name: auditoria_correspondencia auditoria_correspondencia_id_usuario_accion_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_id_usuario_accion_fkey FOREIGN KEY (id_usuario_accion) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5243 (class 2606 OID 84136)
-- Name: correspondencia correspondencia_id_estatus_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_id_estatus_fkey FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5244 (class 2606 OID 84141)
-- Name: correspondencia correspondencia_id_usuario_captura_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT correspondencia_id_usuario_captura_fkey FOREIGN KEY (id_usuario_captura) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5247 (class 2606 OID 84146)
-- Name: correspondencia_respuestas correspondencia_respuestas_id_turno_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES correspondencia.correspondencia_turnos(id_turno);


--
-- TOC entry 5248 (class 2606 OID 84151)
-- Name: correspondencia_respuestas correspondencia_respuestas_id_usuario_responde_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_id_usuario_responde_fkey FOREIGN KEY (id_usuario_responde) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5249 (class 2606 OID 84156)
-- Name: correspondencia_turnos correspondencia_turnos_id_area_destino_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_area_destino_fkey FOREIGN KEY (id_area_destino) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5250 (class 2606 OID 84161)
-- Name: correspondencia_turnos correspondencia_turnos_id_estatus_individual_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_estatus_individual_fkey FOREIGN KEY (id_estatus_individual) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5251 (class 2606 OID 84166)
-- Name: correspondencia_turnos correspondencia_turnos_id_memo_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_memo_fkey FOREIGN KEY (id_memo) REFERENCES correspondencia.memorandums(id_memo);


--
-- TOC entry 5252 (class 2606 OID 84171)
-- Name: correspondencia_turnos correspondencia_turnos_id_usuario_responsable_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_usuario_responsable_fkey FOREIGN KEY (id_usuario_responsable) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5229 (class 2606 OID 84176)
-- Name: acuse_correspondencia fk_acuse_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT fk_acuse_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5231 (class 2606 OID 84181)
-- Name: acuse_memorandum fk_acuse_memorandum; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT fk_acuse_memorandum FOREIGN KEY (id_memorandum) REFERENCES correspondencia.memorandums(id_memo);


--
-- TOC entry 5233 (class 2606 OID 84186)
-- Name: acuse_oficio fk_acuse_oficio_rel_oficio; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_oficio
    ADD CONSTRAINT fk_acuse_oficio_rel_oficio FOREIGN KEY (id_oficio) REFERENCES correspondencia.oficio(id_oficio);


--
-- TOC entry 5234 (class 2606 OID 84191)
-- Name: acuse_oficio fk_acuse_oficio_usuario_revisor; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_oficio
    ADD CONSTRAINT fk_acuse_oficio_usuario_revisor FOREIGN KEY (id_usuario_revisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5232 (class 2606 OID 84196)
-- Name: acuse_memorandum fk_acuse_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_memorandum
    ADD CONSTRAINT fk_acuse_usuario FOREIGN KEY (id_usuario_revisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5230 (class 2606 OID 84201)
-- Name: acuse_correspondencia fk_acuse_usuario_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.acuse_correspondencia
    ADD CONSTRAINT fk_acuse_usuario_correspondencia FOREIGN KEY (id_usuario_revisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5238 (class 2606 OID 84206)
-- Name: archivos_adjuntos fk_archivos_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.archivos_adjuntos
    ADD CONSTRAINT fk_archivos_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5242 (class 2606 OID 84211)
-- Name: auditoria_correspondencia fk_auditoria_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.auditoria_correspondencia
    ADD CONSTRAINT fk_auditoria_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5268 (class 2606 OID 84216)
-- Name: oficio_contestacion_externa fk_contestacion_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa
    ADD CONSTRAINT fk_contestacion_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia) ON DELETE CASCADE;


--
-- TOC entry 5265 (class 2606 OID 84221)
-- Name: oficio_contestacion fk_contestacion_seguimiento_corr; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT fk_contestacion_seguimiento_corr FOREIGN KEY (id_seguimiento_correspondencia) REFERENCES correspondencia.seguimiento_correspondencia(id_seguimiento_correspondencia);


--
-- TOC entry 5266 (class 2606 OID 84226)
-- Name: oficio_contestacion fk_contestacion_seguimiento_memo; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT fk_contestacion_seguimiento_memo FOREIGN KEY (id_seguimiento_memorandum) REFERENCES correspondencia.seguimiento_memorandum(id_seguimiento_memorandum);


--
-- TOC entry 5267 (class 2606 OID 84231)
-- Name: oficio_contestacion fk_contestacion_seguimiento_oficio; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion
    ADD CONSTRAINT fk_contestacion_seguimiento_oficio FOREIGN KEY (id_seguimiento_oficio) REFERENCES correspondencia.seguimiento_oficio(id_seguimiento_oficio);


--
-- TOC entry 5269 (class 2606 OID 84236)
-- Name: oficio_contestacion_externa fk_contestacion_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio_contestacion_externa
    ADD CONSTRAINT fk_contestacion_usuario FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5270 (class 2606 OID 84241)
-- Name: seguimiento_correspondencia fk_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT fk_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5245 (class 2606 OID 84246)
-- Name: correspondencia fk_correspondencia_areas; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT fk_correspondencia_areas FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5246 (class 2606 OID 84251)
-- Name: correspondencia fk_correspondencia_tipo; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia
    ADD CONSTRAINT fk_correspondencia_tipo FOREIGN KEY (id_tipo_correspondencia) REFERENCES catalogos.tipo_correspondencia(id_tipo_correspondencia);


--
-- TOC entry 5273 (class 2606 OID 84256)
-- Name: seguimiento_memorandum fk_estatus; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT fk_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5271 (class 2606 OID 84261)
-- Name: seguimiento_correspondencia fk_estatus; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT fk_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5254 (class 2606 OID 84266)
-- Name: memorandums fk_memo_area; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_area FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5255 (class 2606 OID 84271)
-- Name: memorandums fk_memo_emisor; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_emisor FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5256 (class 2606 OID 84276)
-- Name: memorandums fk_memo_firmante; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_firmante FOREIGN KEY (id_usuario_firmante) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5257 (class 2606 OID 84281)
-- Name: memorandums fk_memo_plantilla; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memo_plantilla FOREIGN KEY (id_plantilla) REFERENCES correspondencia.plantilla_memorandum(id_plantilla);


--
-- TOC entry 5274 (class 2606 OID 84286)
-- Name: seguimiento_memorandum fk_memorandum; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT fk_memorandum FOREIGN KEY (id_memo) REFERENCES correspondencia.memorandums(id_memo);


--
-- TOC entry 5258 (class 2606 OID 84291)
-- Name: memorandums fk_memorandums_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT fk_memorandums_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5261 (class 2606 OID 84296)
-- Name: oficio fk_oficio_area; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_area FOREIGN KEY (id_area) REFERENCES catalogos.areas(id_area);


--
-- TOC entry 5262 (class 2606 OID 84301)
-- Name: oficio fk_oficio_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5263 (class 2606 OID 84306)
-- Name: oficio fk_oficio_usuario_emisor; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_usuario_emisor FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5264 (class 2606 OID 84311)
-- Name: oficio fk_oficio_usuario_firmante; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.oficio
    ADD CONSTRAINT fk_oficio_usuario_firmante FOREIGN KEY (id_usuario_firmante) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5276 (class 2606 OID 84316)
-- Name: seguimiento_oficio fk_seguimiento_oficio_estatus; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT fk_seguimiento_oficio_estatus FOREIGN KEY (id_estatus) REFERENCES catalogos.cat_estatus(id_estatus);


--
-- TOC entry 5277 (class 2606 OID 84321)
-- Name: seguimiento_oficio fk_seguimiento_oficio_oficio; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT fk_seguimiento_oficio_oficio FOREIGN KEY (id_oficio) REFERENCES correspondencia.oficio(id_oficio);


--
-- TOC entry 5278 (class 2606 OID 84326)
-- Name: seguimiento_oficio fk_seguimiento_oficio_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_oficio
    ADD CONSTRAINT fk_seguimiento_oficio_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5253 (class 2606 OID 84331)
-- Name: correspondencia_turnos fk_turnos_correspondencia; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.correspondencia_turnos
    ADD CONSTRAINT fk_turnos_correspondencia FOREIGN KEY (id_correspondencia) REFERENCES correspondencia.correspondencia(id_correspondencia);


--
-- TOC entry 5275 (class 2606 OID 84336)
-- Name: seguimiento_memorandum fk_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_memorandum
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5272 (class 2606 OID 84341)
-- Name: seguimiento_correspondencia fk_usuario; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.seguimiento_correspondencia
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5259 (class 2606 OID 84346)
-- Name: memorandums memorandums_id_usuario_emisor_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.memorandums
    ADD CONSTRAINT memorandums_id_usuario_emisor_fkey FOREIGN KEY (id_usuario_emisor) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5260 (class 2606 OID 84351)
-- Name: notificaciones notificaciones_id_usuario_destino_fkey; Type: FK CONSTRAINT; Schema: correspondencia; Owner: -
--

ALTER TABLE ONLY correspondencia.notificaciones
    ADD CONSTRAINT notificaciones_id_usuario_destino_fkey FOREIGN KEY (id_usuario_destino) REFERENCES catalogos.usuarios(id_usuario);


--
-- TOC entry 5279 (class 2606 OID 84412)
-- Name: asesores fk_asesor_persona; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.asesores
    ADD CONSTRAINT fk_asesor_persona FOREIGN KEY (id_persona) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5280 (class 2606 OID 84427)
-- Name: contribuyentes fk_contribuyente_persona; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.contribuyentes
    ADD CONSTRAINT fk_contribuyente_persona FOREIGN KEY (id_persona) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5281 (class 2606 OID 84975)
-- Name: detalle_asesoria fk_det_autoridad; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT fk_det_autoridad FOREIGN KEY (id_autoridad) REFERENCES catalogos.autoridades(id_autoridad);


--
-- TOC entry 5282 (class 2606 OID 84985)
-- Name: detalle_asesoria fk_det_estatus_detalle; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT fk_det_estatus_detalle FOREIGN KEY (id_estatus_detalle_expediente) REFERENCES catalogos.estatus_detalle_expediente(id_estatus_detalle_expediente);


--
-- TOC entry 5283 (class 2606 OID 84970)
-- Name: detalle_asesoria fk_det_tipo_acto; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT fk_det_tipo_acto FOREIGN KEY (id_tipo_acto_emitido) REFERENCES catalogos.tipo_acto_emitido(id_tipo_acto_emitido);


--
-- TOC entry 5284 (class 2606 OID 84980)
-- Name: detalle_asesoria fk_det_tipo_entrada; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.detalle_asesoria
    ADD CONSTRAINT fk_det_tipo_entrada FOREIGN KEY (id_tipo_entrada) REFERENCES catalogos.tipo_entrada(id_tipo_entrada);


--
-- TOC entry 5285 (class 2606 OID 85007)
-- Name: expedientes fk_exp_asesor; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_asesor FOREIGN KEY (id_asesor) REFERENCES sustantiva.asesores(id_asesores);


--
-- TOC entry 5286 (class 2606 OID 85012)
-- Name: expedientes fk_exp_contribuyente; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_contribuyente FOREIGN KEY (id_contribuyente) REFERENCES sustantiva.contribuyentes(id_contribuyentes);


--
-- TOC entry 5287 (class 2606 OID 85027)
-- Name: expedientes fk_exp_estatus; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_estatus FOREIGN KEY (id_estatus_expediente) REFERENCES catalogos.estatus_expediente(id_estatus_expediente);


--
-- TOC entry 5288 (class 2606 OID 85002)
-- Name: expedientes fk_exp_municipio; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_municipio FOREIGN KEY (id_municipio) REFERENCES catalogos.cat_municipios(id_municipio);


--
-- TOC entry 5289 (class 2606 OID 85017)
-- Name: expedientes fk_exp_solicitante; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_solicitante FOREIGN KEY (id_solicitante) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5290 (class 2606 OID 85022)
-- Name: expedientes fk_exp_tipo_tramite; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_exp_tipo_tramite FOREIGN KEY (id_tipo_tramite) REFERENCES catalogos.tipo_tramite(id_tipo_tramite);


--
-- TOC entry 5291 (class 2606 OID 93075)
-- Name: expedientes fk_expedientes_representante_legal; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.expedientes
    ADD CONSTRAINT fk_expedientes_representante_legal FOREIGN KEY (id_representante_legal) REFERENCES catalogos.personas(id_persona);


--
-- TOC entry 5298 (class 2606 OID 101492)
-- Name: quejas_ari fk_quejas_ari_plantilla; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT fk_quejas_ari_plantilla FOREIGN KEY (id_plantilla_queja_ari) REFERENCES sustantiva.plantilla_queja_ari(id_plantilla) ON DELETE SET NULL;


--
-- TOC entry 5303 (class 2606 OID 101464)
-- Name: quejas_acci quejas_acci_id_oficio_autoridad_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_acci
    ADD CONSTRAINT quejas_acci_id_oficio_autoridad_fkey FOREIGN KEY (id_oficio_autoridad) REFERENCES sustantiva.quejas_oficios_autoridad(id_oficio_autoridad);


--
-- TOC entry 5304 (class 2606 OID 101459)
-- Name: quejas_acci quejas_acci_id_queja_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_acci
    ADD CONSTRAINT quejas_acci_id_queja_fkey FOREIGN KEY (id_queja) REFERENCES sustantiva.quejas(id_queja);


--
-- TOC entry 5299 (class 2606 OID 101408)
-- Name: quejas_ari quejas_ari_id_cir_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_id_cir_fkey FOREIGN KEY (id_cir) REFERENCES sustantiva.quejas_cir(id_cir);


--
-- TOC entry 5300 (class 2606 OID 101403)
-- Name: quejas_ari quejas_ari_id_queja_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_ari
    ADD CONSTRAINT quejas_ari_id_queja_fkey FOREIGN KEY (id_queja) REFERENCES sustantiva.quejas(id_queja);


--
-- TOC entry 5296 (class 2606 OID 101382)
-- Name: quejas_cir quejas_cir_id_asesor_ejecutor_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT quejas_cir_id_asesor_ejecutor_fkey FOREIGN KEY (id_asesor_ejecutor) REFERENCES sustantiva.asesores(id_asesores);


--
-- TOC entry 5297 (class 2606 OID 101377)
-- Name: quejas_cir quejas_cir_id_queja_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_cir
    ADD CONSTRAINT quejas_cir_id_queja_fkey FOREIGN KEY (id_queja) REFERENCES sustantiva.quejas(id_queja);


--
-- TOC entry 5292 (class 2606 OID 101352)
-- Name: quejas quejas_id_asesor_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_id_asesor_fkey FOREIGN KEY (id_asesor) REFERENCES sustantiva.asesores(id_asesores);


--
-- TOC entry 5293 (class 2606 OID 101357)
-- Name: quejas quejas_id_autoridad_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_id_autoridad_fkey FOREIGN KEY (id_autoridad) REFERENCES catalogos.autoridades(id_autoridad);


--
-- TOC entry 5294 (class 2606 OID 101362)
-- Name: quejas quejas_id_estatus_queja_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_id_estatus_queja_fkey FOREIGN KEY (id_estatus_queja) REFERENCES catalogos.cat_estatus_queja(id_estatus_queja);


--
-- TOC entry 5295 (class 2606 OID 101347)
-- Name: quejas quejas_id_expediente_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas
    ADD CONSTRAINT quejas_id_expediente_fkey FOREIGN KEY (id_expediente) REFERENCES sustantiva.expedientes(id_expediente);


--
-- TOC entry 5301 (class 2606 OID 101422)
-- Name: quejas_oficios_autoridad quejas_oficios_autoridad_id_ari_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_oficios_autoridad
    ADD CONSTRAINT quejas_oficios_autoridad_id_ari_fkey FOREIGN KEY (id_ari) REFERENCES sustantiva.quejas_ari(id_ari);


--
-- TOC entry 5302 (class 2606 OID 101438)
-- Name: quejas_respuestas_autoridad quejas_respuestas_autoridad_id_oficio_autoridad_fkey; Type: FK CONSTRAINT; Schema: sustantiva; Owner: -
--

ALTER TABLE ONLY sustantiva.quejas_respuestas_autoridad
    ADD CONSTRAINT quejas_respuestas_autoridad_id_oficio_autoridad_fkey FOREIGN KEY (id_oficio_autoridad) REFERENCES sustantiva.quejas_oficios_autoridad(id_oficio_autoridad);


-- Completed on 2026-06-14 17:29:13

--
-- PostgreSQL database dump complete
--

