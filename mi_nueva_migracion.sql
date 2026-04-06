--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: alertas_seguimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alertas_seguimiento (
    id_alerta integer NOT NULL,
    id_turno integer,
    id_usuario_emisor integer,
    mensaje_urgencia text,
    fecha_alerta timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    leida boolean DEFAULT false
);


ALTER TABLE public.alertas_seguimiento OWNER TO postgres;

--
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alertas_seguimiento_id_alerta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alertas_seguimiento_id_alerta_seq OWNER TO postgres;

--
-- Name: alertas_seguimiento_id_alerta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alertas_seguimiento_id_alerta_seq OWNED BY public.alertas_seguimiento.id_alerta;


--
-- Name: archivos_adjuntos; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.archivos_adjuntos OWNER TO postgres;

--
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archivos_adjuntos_id_archivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.archivos_adjuntos_id_archivo_seq OWNER TO postgres;

--
-- Name: archivos_adjuntos_id_archivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archivos_adjuntos_id_archivo_seq OWNED BY public.archivos_adjuntos.id_archivo;


--
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas (
    id_area integer NOT NULL,
    nombre_area character varying(150) NOT NULL,
    titular_area character varying(150),
    siglas_area character varying(10)
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- Name: areas_id_area_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.areas_id_area_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.areas_id_area_seq OWNER TO postgres;

--
-- Name: areas_id_area_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.areas_id_area_seq OWNED BY public.areas.id_area;


--
-- Name: auditoria_correspondencia; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.auditoria_correspondencia OWNER TO postgres;

--
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auditoria_correspondencia_id_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auditoria_correspondencia_id_log_seq OWNER TO postgres;

--
-- Name: auditoria_correspondencia_id_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auditoria_correspondencia_id_log_seq OWNED BY public.auditoria_correspondencia.id_log;


--
-- Name: cat_estados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_estados (
    id_estado integer NOT NULL,
    nombre_estado character varying(100) NOT NULL
);


ALTER TABLE public.cat_estados OWNER TO postgres;

--
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_estados_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_estados_id_estado_seq OWNER TO postgres;

--
-- Name: cat_estados_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_estados_id_estado_seq OWNED BY public.cat_estados.id_estado;


--
-- Name: cat_estatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_estatus (
    id_estatus integer NOT NULL,
    nombre_estatus character varying(50) NOT NULL
);


ALTER TABLE public.cat_estatus OWNER TO postgres;

--
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_estatus_id_estatus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_estatus_id_estatus_seq OWNER TO postgres;

--
-- Name: cat_estatus_id_estatus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_estatus_id_estatus_seq OWNED BY public.cat_estatus.id_estatus;


--
-- Name: cat_municipios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_municipios (
    id_municipio integer NOT NULL,
    id_estado integer,
    nombre_municipio character varying(100) NOT NULL
);


ALTER TABLE public.cat_municipios OWNER TO postgres;

--
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_municipios_id_municipio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_municipios_id_municipio_seq OWNER TO postgres;

--
-- Name: cat_municipios_id_municipio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_municipios_id_municipio_seq OWNED BY public.cat_municipios.id_municipio;


--
-- Name: correspondencia; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.correspondencia OWNER TO postgres;

--
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.correspondencia_id_folio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.correspondencia_id_folio_seq OWNER TO postgres;

--
-- Name: correspondencia_id_folio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.correspondencia_id_folio_seq OWNED BY public.correspondencia.id_folio;


--
-- Name: correspondencia_respuestas; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.correspondencia_respuestas OWNER TO postgres;

--
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.correspondencia_respuestas_id_respuesta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.correspondencia_respuestas_id_respuesta_seq OWNER TO postgres;

--
-- Name: correspondencia_respuestas_id_respuesta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.correspondencia_respuestas_id_respuesta_seq OWNED BY public.correspondencia_respuestas.id_respuesta;


--
-- Name: correspondencia_turnos; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.correspondencia_turnos OWNER TO postgres;

--
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.correspondencia_turnos_id_turno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.correspondencia_turnos_id_turno_seq OWNER TO postgres;

--
-- Name: correspondencia_turnos_id_turno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.correspondencia_turnos_id_turno_seq OWNED BY public.correspondencia_turnos.id_turno;


--
-- Name: direcciones; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.direcciones OWNER TO postgres;

--
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.direcciones_id_direccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.direcciones_id_direccion_seq OWNER TO postgres;

--
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.direcciones_id_direccion_seq OWNED BY public.direcciones.id_direccion;


--
-- Name: memorandums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.memorandums (
    id_memo integer NOT NULL,
    id_folio integer,
    num_memo character varying(100),
    instruccion_seguimiento text,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_usuario_emisor integer
);


ALTER TABLE public.memorandums OWNER TO postgres;

--
-- Name: memorandums_id_memo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.memorandums_id_memo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.memorandums_id_memo_seq OWNER TO postgres;

--
-- Name: memorandums_id_memo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.memorandums_id_memo_seq OWNED BY public.memorandums.id_memo;


--
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificaciones (
    id_notificacion integer NOT NULL,
    id_usuario_destino integer,
    mensaje character varying(500),
    id_referencia integer,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    leida boolean DEFAULT false
);


ALTER TABLE public.notificaciones OWNER TO postgres;

--
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notificaciones_id_notificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notificaciones_id_notificacion_seq OWNER TO postgres;

--
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notificaciones_id_notificacion_seq OWNED BY public.notificaciones.id_notificacion;


--
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.personas OWNER TO postgres;

--
-- Name: personas_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personas_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personas_id_persona_seq OWNER TO postgres;

--
-- Name: personas_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personas_id_persona_seq OWNED BY public.personas.id_persona;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id_rol integer NOT NULL,
    nombre_rol character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_rol_seq OWNER TO postgres;

--
-- Name: roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_rol_seq OWNED BY public.roles.id_rol;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- Name: alertas_seguimiento id_alerta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas_seguimiento ALTER COLUMN id_alerta SET DEFAULT nextval('public.alertas_seguimiento_id_alerta_seq'::regclass);


--
-- Name: archivos_adjuntos id_archivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivos_adjuntos ALTER COLUMN id_archivo SET DEFAULT nextval('public.archivos_adjuntos_id_archivo_seq'::regclass);


--
-- Name: areas id_area; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas ALTER COLUMN id_area SET DEFAULT nextval('public.areas_id_area_seq'::regclass);


--
-- Name: auditoria_correspondencia id_log; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria_correspondencia ALTER COLUMN id_log SET DEFAULT nextval('public.auditoria_correspondencia_id_log_seq'::regclass);


--
-- Name: cat_estados id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_estados ALTER COLUMN id_estado SET DEFAULT nextval('public.cat_estados_id_estado_seq'::regclass);


--
-- Name: cat_estatus id_estatus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_estatus ALTER COLUMN id_estatus SET DEFAULT nextval('public.cat_estatus_id_estatus_seq'::regclass);


--
-- Name: cat_municipios id_municipio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_municipios ALTER COLUMN id_municipio SET DEFAULT nextval('public.cat_municipios_id_municipio_seq'::regclass);


--
-- Name: correspondencia id_folio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia ALTER COLUMN id_folio SET DEFAULT nextval('public.correspondencia_id_folio_seq'::regclass);


--
-- Name: correspondencia_respuestas id_respuesta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_respuestas ALTER COLUMN id_respuesta SET DEFAULT nextval('public.correspondencia_respuestas_id_respuesta_seq'::regclass);


--
-- Name: correspondencia_turnos id_turno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_turnos ALTER COLUMN id_turno SET DEFAULT nextval('public.correspondencia_turnos_id_turno_seq'::regclass);


--
-- Name: direcciones id_direccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones ALTER COLUMN id_direccion SET DEFAULT nextval('public.direcciones_id_direccion_seq'::regclass);


--
-- Name: memorandums id_memo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memorandums ALTER COLUMN id_memo SET DEFAULT nextval('public.memorandums_id_memo_seq'::regclass);


--
-- Name: notificaciones id_notificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones ALTER COLUMN id_notificacion SET DEFAULT nextval('public.notificaciones_id_notificacion_seq'::regclass);


--
-- Name: personas id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas ALTER COLUMN id_persona SET DEFAULT nextval('public.personas_id_persona_seq'::regclass);


--
-- Name: roles id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id_rol SET DEFAULT nextval('public.roles_id_rol_seq'::regclass);


--
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- Name: alertas_seguimiento alertas_seguimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_pkey PRIMARY KEY (id_alerta);


--
-- Name: archivos_adjuntos archivos_adjuntos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_pkey PRIMARY KEY (id_archivo);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id_area);


--
-- Name: auditoria_correspondencia auditoria_correspondencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_pkey PRIMARY KEY (id_log);


--
-- Name: cat_estados cat_estados_nombre_estado_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_estados
    ADD CONSTRAINT cat_estados_nombre_estado_key UNIQUE (nombre_estado);


--
-- Name: cat_estados cat_estados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_estados
    ADD CONSTRAINT cat_estados_pkey PRIMARY KEY (id_estado);


--
-- Name: cat_estatus cat_estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_estatus
    ADD CONSTRAINT cat_estatus_pkey PRIMARY KEY (id_estatus);


--
-- Name: cat_municipios cat_municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_municipios
    ADD CONSTRAINT cat_municipios_pkey PRIMARY KEY (id_municipio);


--
-- Name: correspondencia correspondencia_folio_unico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia
    ADD CONSTRAINT correspondencia_folio_unico_key UNIQUE (folio_unico);


--
-- Name: correspondencia correspondencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia
    ADD CONSTRAINT correspondencia_pkey PRIMARY KEY (id_folio);


--
-- Name: correspondencia_respuestas correspondencia_respuestas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_pkey PRIMARY KEY (id_respuesta);


--
-- Name: correspondencia_turnos correspondencia_turnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_pkey PRIMARY KEY (id_turno);


--
-- Name: direcciones direcciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT direcciones_pkey PRIMARY KEY (id_direccion);


--
-- Name: memorandums memorandums_num_memo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memorandums
    ADD CONSTRAINT memorandums_num_memo_key UNIQUE (num_memo);


--
-- Name: memorandums memorandums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memorandums
    ADD CONSTRAINT memorandums_pkey PRIMARY KEY (id_memo);


--
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);


--
-- Name: personas personas_curp_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_curp_key UNIQUE (curp);


--
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id_persona);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);


--
-- Name: usuarios usuarios_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_electronico_key UNIQUE (correo_electronico);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: usuarios usuarios_usuario_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_login_key UNIQUE (usuario_login);


--
-- Name: alertas_seguimiento alertas_seguimiento_id_turno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES public.correspondencia_turnos(id_turno);


--
-- Name: alertas_seguimiento alertas_seguimiento_id_usuario_emisor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas_seguimiento
    ADD CONSTRAINT alertas_seguimiento_id_usuario_emisor_fkey FOREIGN KEY (id_usuario_emisor) REFERENCES public.usuarios(id_usuario);


--
-- Name: archivos_adjuntos archivos_adjuntos_id_folio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_id_folio_fkey FOREIGN KEY (id_folio) REFERENCES public.correspondencia(id_folio);


--
-- Name: archivos_adjuntos archivos_adjuntos_id_usuario_subio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivos_adjuntos
    ADD CONSTRAINT archivos_adjuntos_id_usuario_subio_fkey FOREIGN KEY (id_usuario_subio) REFERENCES public.usuarios(id_usuario);


--
-- Name: auditoria_correspondencia auditoria_correspondencia_estado_anterior_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_estado_anterior_fkey FOREIGN KEY (estado_anterior) REFERENCES public.cat_estatus(id_estatus);


--
-- Name: auditoria_correspondencia auditoria_correspondencia_estado_nuevo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_estado_nuevo_fkey FOREIGN KEY (estado_nuevo) REFERENCES public.cat_estatus(id_estatus);


--
-- Name: auditoria_correspondencia auditoria_correspondencia_id_folio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_id_folio_fkey FOREIGN KEY (id_folio) REFERENCES public.correspondencia(id_folio);


--
-- Name: auditoria_correspondencia auditoria_correspondencia_id_usuario_accion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria_correspondencia
    ADD CONSTRAINT auditoria_correspondencia_id_usuario_accion_fkey FOREIGN KEY (id_usuario_accion) REFERENCES public.usuarios(id_usuario);


--
-- Name: cat_municipios cat_municipios_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_municipios
    ADD CONSTRAINT cat_municipios_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES public.cat_estados(id_estado);


--
-- Name: correspondencia correspondencia_id_estatus_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia
    ADD CONSTRAINT correspondencia_id_estatus_fkey FOREIGN KEY (id_estatus) REFERENCES public.cat_estatus(id_estatus);


--
-- Name: correspondencia correspondencia_id_usuario_captura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia
    ADD CONSTRAINT correspondencia_id_usuario_captura_fkey FOREIGN KEY (id_usuario_captura) REFERENCES public.usuarios(id_usuario);


--
-- Name: correspondencia_respuestas correspondencia_respuestas_id_turno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES public.correspondencia_turnos(id_turno);


--
-- Name: correspondencia_respuestas correspondencia_respuestas_id_usuario_responde_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_respuestas
    ADD CONSTRAINT correspondencia_respuestas_id_usuario_responde_fkey FOREIGN KEY (id_usuario_responde) REFERENCES public.usuarios(id_usuario);


--
-- Name: correspondencia_turnos correspondencia_turnos_id_area_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_area_destino_fkey FOREIGN KEY (id_area_destino) REFERENCES public.areas(id_area);


--
-- Name: correspondencia_turnos correspondencia_turnos_id_estatus_individual_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_estatus_individual_fkey FOREIGN KEY (id_estatus_individual) REFERENCES public.cat_estatus(id_estatus);


--
-- Name: correspondencia_turnos correspondencia_turnos_id_folio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_folio_fkey FOREIGN KEY (id_folio) REFERENCES public.correspondencia(id_folio);


--
-- Name: correspondencia_turnos correspondencia_turnos_id_memo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_memo_fkey FOREIGN KEY (id_memo) REFERENCES public.memorandums(id_memo);


--
-- Name: correspondencia_turnos correspondencia_turnos_id_usuario_responsable_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correspondencia_turnos
    ADD CONSTRAINT correspondencia_turnos_id_usuario_responsable_fkey FOREIGN KEY (id_usuario_responsable) REFERENCES public.usuarios(id_usuario);


--
-- Name: direcciones direcciones_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT direcciones_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES public.cat_estados(id_estado);


--
-- Name: direcciones direcciones_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT direcciones_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES public.cat_municipios(id_municipio);


--
-- Name: memorandums memorandums_id_folio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memorandums
    ADD CONSTRAINT memorandums_id_folio_fkey FOREIGN KEY (id_folio) REFERENCES public.correspondencia(id_folio);


--
-- Name: memorandums memorandums_id_usuario_emisor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memorandums
    ADD CONSTRAINT memorandums_id_usuario_emisor_fkey FOREIGN KEY (id_usuario_emisor) REFERENCES public.usuarios(id_usuario);


--
-- Name: notificaciones notificaciones_id_usuario_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_id_usuario_destino_fkey FOREIGN KEY (id_usuario_destino) REFERENCES public.usuarios(id_usuario);


--
-- Name: personas personas_id_direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_id_direccion_fkey FOREIGN KEY (id_direccion) REFERENCES public.direcciones(id_direccion);


--
-- Name: usuarios usuarios_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.areas(id_area);


--
-- Name: usuarios usuarios_id_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.personas(id_persona);


--
-- Name: usuarios usuarios_id_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id_rol);


--
-- PostgreSQL database dump complete
--

