--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2026-03-27 22:02:13

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
-- TOC entry 5041 (class 1262 OID 53738)
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 238 (class 1259 OID 53942)
-- Name: alertas_seguimiento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alertas_seguimiento (
    id_alerta integer NOT NULL,
    id_turno integer,
    id_usuario_emisor integer,
    mensaje_urgencia text,
    fecha_alerta timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    leida boolean DEFAULT false
);


--
-- TOC entry 237 (class 1259 OID 53941)
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alertas_seguimiento_id_alerta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 237
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alertas_seguimiento_id_alerta_seq OWNED BY public.alertas_seguimiento.id_alerta;


--
-- TOC entry 230 (class 1259 OID 53848)
-- Name: archivos_adjuntos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.archivos_adjuntos (
    id_archivo integer NOT NULL,
    id_folio integer,
    id_usuario_subio integer,
    nombre_original character varying(255),
    ruta_servidor character varying(500),
    tipo_archivo character varying(100),
    categoria character varying(50),
    fecha_subida timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 229 (class 1259 OID 53847)
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.archivos_adjuntos_id_archivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 229
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.archivos_adjuntos_id_archivo_seq OWNED BY public.archivos_adjuntos.id_archivo;


--
-- TOC entry 220 (class 1259 OID 53767)
-- Name: areas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.areas (
    id_area integer NOT NULL,
    nombre_area character varying(150) NOT NULL,
    titular_area character varying(150),
    siglas_area character varying(10)
);


--
-- TOC entry 219 (class 1259 OID 53766)
-- Name: areas_id_area_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.areas_id_area_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 219
-- Name: areas_id_area_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.areas_id_area_seq OWNED BY public.areas.id_area;


--
-- TOC entry 242 (class 1259 OID 53979)
-- Name: auditoria_correspondencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auditoria_correspondencia (
    id_log integer NOT NULL,
    id_folio integer,
    id_usuario_accion integer,
    estado_anterior integer,
    estado_nuevo integer,
    observaciones text,
    fecha_movimiento timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 241 (class 1259 OID 53978)
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auditoria_correspondencia_id_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 241
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auditoria_correspondencia_id_log_seq OWNED BY public.auditoria_correspondencia.id_log;


--
-- TOC entry 244 (class 1259 OID 54010)
-- Name: cat_estados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cat_estados (
    id_estado integer NOT NULL,
    nombre_estado character varying(100) NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 54009)
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cat_estados_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 243
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cat_estados_id_estado_seq OWNED BY public.cat_estados.id_estado;


--
-- TOC entry 218 (class 1259 OID 53760)
-- Name: cat_estatus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cat_estatus (
    id_estatus integer NOT NULL,
    nombre_estatus character varying(50) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 53759)
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cat_estatus_id_estatus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 217
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cat_estatus_id_estatus_seq OWNED BY public.cat_estatus.id_estatus;


--
-- TOC entry 246 (class 1259 OID 54019)
-- Name: cat_municipios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cat_municipios (
    id_municipio integer NOT NULL,
    id_estado integer,
    nombre_municipio character varying(100) NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 54018)
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cat_municipios_id_municipio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 245
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cat_municipios_id_municipio_seq OWNED BY public.cat_municipios.id_municipio;


--
-- TOC entry 228 (class 1259 OID 53826)
-- Name: correspondencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.correspondencia (
    id_folio integer NOT NULL,
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
    observaciones_validacion text
);


--
-- TOC entry 227 (class 1259 OID 53825)
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.correspondencia_id_folio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 227
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.correspondencia_id_folio_seq OWNED BY public.correspondencia.id_folio;


--
-- TOC entry 236 (class 1259 OID 53923)
-- Name: correspondencia_respuestas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.correspondencia_respuestas (
    id_respuesta integer NOT NULL,
    id_turno integer,
    id_usuario_responde integer,
    descripcion_atencion text,
    num_oficio_salida character varying(100),
    fecha_despacho timestamp without time zone,
    resumen_atencion text
);


--
-- TOC entry 235 (class 1259 OID 53922)
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.correspondencia_respuestas_id_respuesta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 235
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.correspondencia_respuestas_id_respuesta_seq OWNED BY public.correspondencia_respuestas.id_respuesta;


--
-- TOC entry 234 (class 1259 OID 53890)
-- Name: correspondencia_turnos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.correspondencia_turnos (
    id_turno integer NOT NULL,
    id_folio integer,
    id_memo integer,
    id_area_destino integer,
    id_usuario_responsable integer,
    fecha_envio timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_acuse_recibo timestamp without time zone,
    id_estatus_individual integer
);


--
-- TOC entry 233 (class 1259 OID 53889)
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.correspondencia_turnos_id_turno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 233
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.correspondencia_turnos_id_turno_seq OWNED BY public.correspondencia_turnos.id_turno;


--
-- TOC entry 222 (class 1259 OID 53774)
-- Name: direcciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.direcciones (
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
-- TOC entry 221 (class 1259 OID 53773)
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.direcciones_id_direccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 221
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.direcciones_id_direccion_seq OWNED BY public.direcciones.id_direccion;


--
-- TOC entry 232 (class 1259 OID 53868)
-- Name: memorandums; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.memorandums (
    id_memo integer NOT NULL,
    id_folio integer,
    num_memo character varying(100),
    instruccion_seguimiento text,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_usuario_emisor integer
);


--
-- TOC entry 231 (class 1259 OID 53867)
-- Name: memorandums_id_memo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.memorandums_id_memo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 231
-- Name: memorandums_id_memo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.memorandums_id_memo_seq OWNED BY public.memorandums.id_memo;


--
-- TOC entry 240 (class 1259 OID 53963)
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notificaciones (
    id_notificacion integer NOT NULL,
    id_usuario_destino integer,
    mensaje character varying(500),
    id_referencia integer,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    leida boolean DEFAULT false
);


--
-- TOC entry 239 (class 1259 OID 53962)
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notificaciones_id_notificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 239
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notificaciones_id_notificacion_seq OWNED BY public.notificaciones.id_notificacion;


--
-- TOC entry 224 (class 1259 OID 53784)
-- Name: personas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personas (
    id_persona integer NOT NULL,
    id_direccion integer,
    nombre character varying(100) NOT NULL,
    apellido_paterno character varying(100) NOT NULL,
    apellido_materno character varying(100),
    curp character varying(18),
    telefono character varying(20)
);


--
-- TOC entry 223 (class 1259 OID 53783)
-- Name: personas_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personas_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 223
-- Name: personas_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personas_id_persona_seq OWNED BY public.personas.id_persona;


--
-- TOC entry 216 (class 1259 OID 53753)
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id_rol integer NOT NULL,
    nombre_rol character varying(50) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 53752)
-- Name: roles_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 215
-- Name: roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_rol_seq OWNED BY public.roles.id_rol;


--
-- TOC entry 226 (class 1259 OID 53798)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    id_persona integer,
    id_rol integer,
    id_area integer,
    usuario_login character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    correo_electronico character varying(150),
    fecha_registro_usuario timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    activo boolean DEFAULT true
);


--
-- TOC entry 225 (class 1259 OID 53797)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 225
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 4780 (class 2604 OID 53945)
-- Name: alertas_seguimiento id_alerta; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alertas_seguimiento ALTER COLUMN id_alerta SET DEFAULT nextval('public.alertas_seguimiento_id_alerta_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 53851)
-- Name: archivos_adjuntos id_archivo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.archivos_adjuntos ALTER COLUMN id_archivo SET DEFAULT nextval('public.archivos_adjuntos_id_archivo_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 53770)
-- Name: areas id_area; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.areas ALTER COLUMN id_area SET DEFAULT nextval('public.areas_id_area_seq'::regclass);


--
-- TOC entry 4786 (class 2604 OID 53982)
-- Name: auditoria_correspondencia id_log; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_correspondencia ALTER COLUMN id_log SET DEFAULT nextval('public.auditoria_correspondencia_id_log_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 54013)
-- Name: cat_estados id_estado; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat_estados ALTER COLUMN id_estado SET DEFAULT nextval('public.cat_estados_id_estado_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 53763)
-- Name: cat_estatus id_estatus; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat_estatus ALTER COLUMN id_estatus SET DEFAULT nextval('public.cat_estatus_id_estatus_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 54022)
-- Name: cat_municipios id_municipio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat_municipios ALTER COLUMN id_municipio SET DEFAULT nextval('public.cat_municipios_id_municipio_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 53829)
-- Name: correspondencia id_folio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia ALTER COLUMN id_folio SET DEFAULT nextval('public.correspondencia_id_folio_seq'::regclass);


--
-- TOC entry 4779 (class 2604 OID 53926)
-- Name: correspondencia_respuestas id_respuesta; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_respuestas ALTER COLUMN id_respuesta SET DEFAULT nextval('public.correspondencia_respuestas_id_respuesta_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 53893)
-- Name: correspondencia_turnos id_turno; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_turnos ALTER COLUMN id_turno SET DEFAULT nextval('public.correspondencia_turnos_id_turno_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 53777)
-- Name: direcciones id_direccion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direcciones ALTER COLUMN id_direccion SET DEFAULT nextval('public.direcciones_id_direccion_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 53871)
-- Name: memorandums id_memo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memorandums ALTER COLUMN id_memo SET DEFAULT nextval('public.memorandums_id_memo_seq'::regclass);


--
-- TOC entry 4783 (class 2604 OID 53966)
-- Name: notificaciones id_notificacion; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notificaciones ALTER COLUMN id_notificacion SET DEFAULT nextval('public.notificaciones_id_notificacion_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 53787)
-- Name: personas id_persona; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personas ALTER COLUMN id_persona SET DEFAULT nextval('public.personas_id_persona_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 53756)
-- Name: roles id_rol; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id_rol SET DEFAULT nextval('public.roles_id_rol_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 53801)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 5027 (class 0 OID 53942)
-- Dependencies: 238
-- Data for Name: alertas_seguimiento; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5019 (class 0 OID 53848)
-- Dependencies: 230
-- Data for Name: archivos_adjuntos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5009 (class 0 OID 53767)
-- Dependencies: 220
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5031 (class 0 OID 53979)
-- Dependencies: 242
-- Data for Name: auditoria_correspondencia; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5033 (class 0 OID 54010)
-- Dependencies: 244
-- Data for Name: cat_estados; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cat_estados VALUES (1, 'Aguascalientes');
INSERT INTO public.cat_estados VALUES (2, 'Baja California');
INSERT INTO public.cat_estados VALUES (3, 'Baja California Sur');
INSERT INTO public.cat_estados VALUES (4, 'Campeche');
INSERT INTO public.cat_estados VALUES (5, 'Chiapas');
INSERT INTO public.cat_estados VALUES (6, 'Chihuahua');
INSERT INTO public.cat_estados VALUES (7, 'Ciudad de México');
INSERT INTO public.cat_estados VALUES (8, 'Coahuila');
INSERT INTO public.cat_estados VALUES (9, 'Colima');
INSERT INTO public.cat_estados VALUES (10, 'Durango');
INSERT INTO public.cat_estados VALUES (11, 'Estado de México');
INSERT INTO public.cat_estados VALUES (12, 'Guanajuato');
INSERT INTO public.cat_estados VALUES (13, 'Guerrero');
INSERT INTO public.cat_estados VALUES (14, 'Hidalgo');
INSERT INTO public.cat_estados VALUES (15, 'Jalisco');
INSERT INTO public.cat_estados VALUES (16, 'Michoacán');
INSERT INTO public.cat_estados VALUES (17, 'Morelos');
INSERT INTO public.cat_estados VALUES (18, 'Nayarit');
INSERT INTO public.cat_estados VALUES (19, 'Nuevo León');
INSERT INTO public.cat_estados VALUES (20, 'Oaxaca');
INSERT INTO public.cat_estados VALUES (21, 'Puebla');
INSERT INTO public.cat_estados VALUES (22, 'Querétaro');
INSERT INTO public.cat_estados VALUES (23, 'Quintana Roo');
INSERT INTO public.cat_estados VALUES (24, 'San Luis Potosí');
INSERT INTO public.cat_estados VALUES (25, 'Sinaloa');
INSERT INTO public.cat_estados VALUES (26, 'Sonora');
INSERT INTO public.cat_estados VALUES (27, 'Tabasco');
INSERT INTO public.cat_estados VALUES (28, 'Tamaulipas');
INSERT INTO public.cat_estados VALUES (29, 'Tlaxcala');
INSERT INTO public.cat_estados VALUES (30, 'Veracruz');
INSERT INTO public.cat_estados VALUES (31, 'Yucatán');
INSERT INTO public.cat_estados VALUES (32, 'Zacatecas');


--
-- TOC entry 5007 (class 0 OID 53760)
-- Dependencies: 218
-- Data for Name: cat_estatus; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cat_estatus VALUES (1, 'REGISTRADO');
INSERT INTO public.cat_estatus VALUES (2, 'VALIDADO');
INSERT INTO public.cat_estatus VALUES (3, 'TURNADO');
INSERT INTO public.cat_estatus VALUES (4, 'EN GESTIÓN');
INSERT INTO public.cat_estatus VALUES (5, 'CONCLUIDO');
INSERT INTO public.cat_estatus VALUES (6, 'RECHAZADO');


--
-- TOC entry 5035 (class 0 OID 54019)
-- Dependencies: 246
-- Data for Name: cat_municipios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cat_municipios VALUES (1, 32, 'Apozol');
INSERT INTO public.cat_municipios VALUES (2, 32, 'Apulco');
INSERT INTO public.cat_municipios VALUES (3, 32, 'Atolinga');
INSERT INTO public.cat_municipios VALUES (4, 32, 'Benito Juárez');
INSERT INTO public.cat_municipios VALUES (5, 32, 'Calera');
INSERT INTO public.cat_municipios VALUES (6, 32, 'Cañitas de Felipe Pescador');
INSERT INTO public.cat_municipios VALUES (7, 32, 'Concepción del Oro');
INSERT INTO public.cat_municipios VALUES (8, 32, 'Cuauhtémoc');
INSERT INTO public.cat_municipios VALUES (9, 32, 'Chalchihuites');
INSERT INTO public.cat_municipios VALUES (10, 32, 'Fresnillo');
INSERT INTO public.cat_municipios VALUES (11, 32, 'Trinidad García de la Cadena');
INSERT INTO public.cat_municipios VALUES (12, 32, 'Genaro Codina');
INSERT INTO public.cat_municipios VALUES (13, 32, 'General Enrique Estrada');
INSERT INTO public.cat_municipios VALUES (14, 32, 'General Francisco R. Murguía');
INSERT INTO public.cat_municipios VALUES (15, 32, 'El Plateado de Joaquín Amaro');
INSERT INTO public.cat_municipios VALUES (16, 32, 'General Pánfilo Natera');
INSERT INTO public.cat_municipios VALUES (17, 32, 'Guadalupe');
INSERT INTO public.cat_municipios VALUES (18, 32, 'Huanusco');
INSERT INTO public.cat_municipios VALUES (19, 32, 'Jalpa');
INSERT INTO public.cat_municipios VALUES (20, 32, 'Jerez');
INSERT INTO public.cat_municipios VALUES (21, 32, 'Jiménez del Teul');
INSERT INTO public.cat_municipios VALUES (22, 32, 'Juan Aldama');
INSERT INTO public.cat_municipios VALUES (23, 32, 'Juchipila');
INSERT INTO public.cat_municipios VALUES (24, 32, 'Loreto');
INSERT INTO public.cat_municipios VALUES (25, 32, 'Luis Moya');
INSERT INTO public.cat_municipios VALUES (26, 32, 'Mazapil');
INSERT INTO public.cat_municipios VALUES (27, 32, 'Melchor Ocampo');
INSERT INTO public.cat_municipios VALUES (28, 32, 'Mezquital del Oro');
INSERT INTO public.cat_municipios VALUES (29, 32, 'Miguel Auza');
INSERT INTO public.cat_municipios VALUES (30, 32, 'Momax');
INSERT INTO public.cat_municipios VALUES (31, 32, 'Monte Escobedo');
INSERT INTO public.cat_municipios VALUES (32, 32, 'Morelos');
INSERT INTO public.cat_municipios VALUES (33, 32, 'Moyahua de Estrada');
INSERT INTO public.cat_municipios VALUES (34, 32, 'Nochistlán de Mejía');
INSERT INTO public.cat_municipios VALUES (35, 32, 'Noria de Ángeles');
INSERT INTO public.cat_municipios VALUES (36, 32, 'Ojocaliente');
INSERT INTO public.cat_municipios VALUES (37, 32, 'Pánuco');
INSERT INTO public.cat_municipios VALUES (38, 32, 'Pinos');
INSERT INTO public.cat_municipios VALUES (39, 32, 'Río Grande');
INSERT INTO public.cat_municipios VALUES (40, 32, 'Sain Alto');
INSERT INTO public.cat_municipios VALUES (41, 32, 'El Salvador');
INSERT INTO public.cat_municipios VALUES (42, 32, 'Sombrerete');
INSERT INTO public.cat_municipios VALUES (43, 32, 'Susticacán');
INSERT INTO public.cat_municipios VALUES (44, 32, 'Tabasco');
INSERT INTO public.cat_municipios VALUES (45, 32, 'Tepechitlán');
INSERT INTO public.cat_municipios VALUES (46, 32, 'Tepetongo');
INSERT INTO public.cat_municipios VALUES (47, 32, 'Teul de González Ortega');
INSERT INTO public.cat_municipios VALUES (48, 32, 'Tlaltenango de Sánchez Román');
INSERT INTO public.cat_municipios VALUES (49, 32, 'Valparaíso');
INSERT INTO public.cat_municipios VALUES (50, 32, 'Vetagrande');
INSERT INTO public.cat_municipios VALUES (51, 32, 'Villa de Cos');
INSERT INTO public.cat_municipios VALUES (52, 32, 'Villa García');
INSERT INTO public.cat_municipios VALUES (53, 32, 'Villa González Ortega');
INSERT INTO public.cat_municipios VALUES (54, 32, 'Villa Hidalgo');
INSERT INTO public.cat_municipios VALUES (55, 32, 'Villanueva');
INSERT INTO public.cat_municipios VALUES (56, 32, 'Zacatecas');
INSERT INTO public.cat_municipios VALUES (57, 32, 'Trancoso');
INSERT INTO public.cat_municipios VALUES (58, 32, 'Santa María de la Paz');


--
-- TOC entry 5017 (class 0 OID 53826)
-- Dependencies: 228
-- Data for Name: correspondencia; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5025 (class 0 OID 53923)
-- Dependencies: 236
-- Data for Name: correspondencia_respuestas; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5023 (class 0 OID 53890)
-- Dependencies: 234
-- Data for Name: correspondencia_turnos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5011 (class 0 OID 53774)
-- Dependencies: 222
-- Data for Name: direcciones; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5021 (class 0 OID 53868)
-- Dependencies: 232
-- Data for Name: memorandums; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5029 (class 0 OID 53963)
-- Dependencies: 240
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5013 (class 0 OID 53784)
-- Dependencies: 224
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5005 (class 0 OID 53753)
-- Dependencies: 216
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.roles VALUES (1, 'ADMINISTRADOR');
INSERT INTO public.roles VALUES (2, 'RECEPCIONISTA');
INSERT INTO public.roles VALUES (3, 'JEFE_AREA');
INSERT INTO public.roles VALUES (4, 'OPERATIVO');


--
-- TOC entry 5015 (class 0 OID 53798)
-- Dependencies: 226
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 237
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.alertas_seguimiento_id_alerta_seq', 1, false);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 229
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.archivos_adjuntos_id_archivo_seq', 1, false);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 219
-- Name: areas_id_area_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.areas_id_area_seq', 1, false);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 241
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auditoria_correspondencia_id_log_seq', 1, false);


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 243
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cat_estados_id_estado_seq', 32, true);


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 217
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cat_estatus_id_estatus_seq', 6, true);


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 245
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cat_municipios_id_municipio_seq', 58, true);


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 227
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.correspondencia_id_folio_seq', 1, false);


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 235
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.correspondencia_respuestas_id_respuesta_seq', 1, false);


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 233
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.correspondencia_turnos_id_turno_seq', 1, false);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 221
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.direcciones_id_direccion_seq', 1, false);


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 231
-- Name: memorandums_id_memo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.memorandums_id_memo_seq', 1, false);


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 239
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notificaciones_id_notificacion_seq', 1, false);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 223
-- Name: personas_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.personas_id_persona_seq', 1, false);


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 215
-- Name: roles_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_id_rol_seq', 4, true);


--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 225
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, false);


--
-- TOC entry 4823 (class 2606 OID 53951)
-- Name: alertas_seguimiento alertas_seguimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_pkey PRIMARY KEY (id_alerta);


--
-- TOC entry 4813 (class 2606 OID 53856)
-- Name: archivos_adjuntos archivos_adjuntos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_pkey PRIMARY KEY (id_archivo);


--
-- TOC entry 4795 (class 2606 OID 53772)
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id_area);


--
-- TOC entry 4827 (class 2606 OID 53987)
-- Name: auditoria_correspondencia auditoria_correspondencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_pkey PRIMARY KEY (id_log);


--
-- TOC entry 4829 (class 2606 OID 54017)
-- Name: cat_estados cat_estados_nombre_estado_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat_estados
    ADD CONSTRAINT cat_estados_nombre_estado_key UNIQUE (nombre_estado);


--
-- TOC entry 4831 (class 2606 OID 54015)
-- Name: cat_estados cat_estados_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat_estados
    ADD CONSTRAINT cat_estados_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 4793 (class 2606 OID 53765)
-- Name: cat_estatus cat_estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat_estatus
    ADD CONSTRAINT cat_estatus_pkey PRIMARY KEY (id_estatus);


--
-- TOC entry 4833 (class 2606 OID 54024)
-- Name: cat_municipios cat_municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat_municipios
    ADD CONSTRAINT cat_municipios_pkey PRIMARY KEY (id_municipio);


--
-- TOC entry 4809 (class 2606 OID 53836)
-- Name: correspondencia correspondencia_folio_unico_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia
    ADD CONSTRAINT correspondencia_folio_unico_key UNIQUE (folio_unico);


--
-- TOC entry 4811 (class 2606 OID 53834)
-- Name: correspondencia correspondencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia
    ADD CONSTRAINT correspondencia_pkey PRIMARY KEY (id_folio);


--
-- TOC entry 4821 (class 2606 OID 53930)
-- Name: correspondencia_respuestas correspondencia_respuestas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_pkey PRIMARY KEY (id_respuesta);


--
-- TOC entry 4819 (class 2606 OID 53896)
-- Name: correspondencia_turnos correspondencia_turnos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_pkey PRIMARY KEY (id_turno);


--
-- TOC entry 4797 (class 2606 OID 53782)
-- Name: direcciones direcciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT direcciones_pkey PRIMARY KEY (id_direccion);


--
-- TOC entry 4815 (class 2606 OID 53878)
-- Name: memorandums memorandums_num_memo_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memorandums
    ADD CONSTRAINT memorandums_num_memo_key UNIQUE (num_memo);


--
-- TOC entry 4817 (class 2606 OID 53876)
-- Name: memorandums memorandums_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memorandums
    ADD CONSTRAINT memorandums_pkey PRIMARY KEY (id_memo);


--
-- TOC entry 4825 (class 2606 OID 53972)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);


--
-- TOC entry 4799 (class 2606 OID 53791)
-- Name: personas personas_curp_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_curp_key UNIQUE (curp);


--
-- TOC entry 4801 (class 2606 OID 53789)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id_persona);


--
-- TOC entry 4791 (class 2606 OID 53758)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 4803 (class 2606 OID 53809)
-- Name: usuarios usuarios_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_electronico_key UNIQUE (correo_electronico);


--
-- TOC entry 4805 (class 2606 OID 53805)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4807 (class 2606 OID 53807)
-- Name: usuarios usuarios_usuario_login_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_login_key UNIQUE (usuario_login);


--
-- TOC entry 4853 (class 2606 OID 53952)
-- Name: alertas_seguimiento alertas_seguimiento_id_turno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES public.correspondencia_turnos(id_turno);


--
-- TOC entry 4854 (class 2606 OID 53957)
-- Name: alertas_seguimiento alertas_seguimiento_id_usuario_emisor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_id_usuario_emisor_fkey FOREIGN KEY (id_usuario_emisor) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4842 (class 2606 OID 53857)
-- Name: archivos_adjuntos archivos_adjuntos_id_folio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_id_folio_fkey FOREIGN KEY (id_folio) REFERENCES public.correspondencia(id_folio);


--
-- TOC entry 4843 (class 2606 OID 53862)
-- Name: archivos_adjuntos archivos_adjuntos_id_usuario_subio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_id_usuario_subio_fkey FOREIGN KEY (id_usuario_subio) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4856 (class 2606 OID 53998)
-- Name: auditoria_correspondencia auditoria_correspondencia_estado_anterior_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_estado_anterior_fkey FOREIGN KEY (estado_anterior) REFERENCES public.cat_estatus(id_estatus);


--
-- TOC entry 4857 (class 2606 OID 54003)
-- Name: auditoria_correspondencia auditoria_correspondencia_estado_nuevo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_estado_nuevo_fkey FOREIGN KEY (estado_nuevo) REFERENCES public.cat_estatus(id_estatus);


--
-- TOC entry 4858 (class 2606 OID 53988)
-- Name: auditoria_correspondencia auditoria_correspondencia_id_folio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_id_folio_fkey FOREIGN KEY (id_folio) REFERENCES public.correspondencia(id_folio);


--
-- TOC entry 4859 (class 2606 OID 53993)
-- Name: auditoria_correspondencia auditoria_correspondencia_id_usuario_accion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_id_usuario_accion_fkey FOREIGN KEY (id_usuario_accion) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4860 (class 2606 OID 54025)
-- Name: cat_municipios cat_municipios_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat_municipios
    ADD CONSTRAINT cat_municipios_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES public.cat_estados(id_estado);


--
-- TOC entry 4840 (class 2606 OID 53837)
-- Name: correspondencia correspondencia_id_estatus_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia
    ADD CONSTRAINT correspondencia_id_estatus_fkey FOREIGN KEY (id_estatus) REFERENCES public.cat_estatus(id_estatus);


--
-- TOC entry 4841 (class 2606 OID 53842)
-- Name: correspondencia correspondencia_id_usuario_captura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia
    ADD CONSTRAINT correspondencia_id_usuario_captura_fkey FOREIGN KEY (id_usuario_captura) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4851 (class 2606 OID 53931)
-- Name: correspondencia_respuestas correspondencia_respuestas_id_turno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES public.correspondencia_turnos(id_turno);


--
-- TOC entry 4852 (class 2606 OID 53936)
-- Name: correspondencia_respuestas correspondencia_respuestas_id_usuario_responde_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_id_usuario_responde_fkey FOREIGN KEY (id_usuario_responde) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4846 (class 2606 OID 53907)
-- Name: correspondencia_turnos correspondencia_turnos_id_area_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_area_destino_fkey FOREIGN KEY (id_area_destino) REFERENCES public.areas(id_area);


--
-- TOC entry 4847 (class 2606 OID 53917)
-- Name: correspondencia_turnos correspondencia_turnos_id_estatus_individual_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_estatus_individual_fkey FOREIGN KEY (id_estatus_individual) REFERENCES public.cat_estatus(id_estatus);


--
-- TOC entry 4848 (class 2606 OID 53897)
-- Name: correspondencia_turnos correspondencia_turnos_id_folio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_folio_fkey FOREIGN KEY (id_folio) REFERENCES public.correspondencia(id_folio);


--
-- TOC entry 4849 (class 2606 OID 53902)
-- Name: correspondencia_turnos correspondencia_turnos_id_memo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_memo_fkey FOREIGN KEY (id_memo) REFERENCES public.memorandums(id_memo);


--
-- TOC entry 4850 (class 2606 OID 53912)
-- Name: correspondencia_turnos correspondencia_turnos_id_usuario_responsable_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_usuario_responsable_fkey FOREIGN KEY (id_usuario_responsable) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4834 (class 2606 OID 54035)
-- Name: direcciones direcciones_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT direcciones_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES public.cat_estados(id_estado);


--
-- TOC entry 4835 (class 2606 OID 54030)
-- Name: direcciones direcciones_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT direcciones_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES public.cat_municipios(id_municipio);


--
-- TOC entry 4844 (class 2606 OID 53879)
-- Name: memorandums memorandums_id_folio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memorandums
    ADD CONSTRAINT memorandums_id_folio_fkey FOREIGN KEY (id_folio) REFERENCES public.correspondencia(id_folio);


--
-- TOC entry 4845 (class 2606 OID 53884)
-- Name: memorandums memorandums_id_usuario_emisor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.memorandums
    ADD CONSTRAINT memorandums_id_usuario_emisor_fkey FOREIGN KEY (id_usuario_emisor) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4855 (class 2606 OID 53973)
-- Name: notificaciones notificaciones_id_usuario_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_id_usuario_destino_fkey FOREIGN KEY (id_usuario_destino) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4836 (class 2606 OID 53792)
-- Name: personas personas_id_direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_id_direccion_fkey FOREIGN KEY (id_direccion) REFERENCES public.direcciones(id_direccion);


--
-- TOC entry 4837 (class 2606 OID 53820)
-- Name: usuarios usuarios_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.areas(id_area);


--
-- TOC entry 4838 (class 2606 OID 53810)
-- Name: usuarios usuarios_id_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.personas(id_persona);


--
-- TOC entry 4839 (class 2606 OID 53815)
-- Name: usuarios usuarios_id_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id_rol);


-- Completed on 2026-03-27 22:02:13

--
-- PostgreSQL database dump complete
--

