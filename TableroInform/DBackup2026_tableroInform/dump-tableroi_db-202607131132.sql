--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.24
-- Dumped by pg_dump version 17.0

-- Started on 2026-07-13 11:32:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE tableroi_db;
--
-- TOC entry 3034 (class 1262 OID 16389)
-- Name: tableroi_db; Type: DATABASE; Schema: -; Owner: tableroi_informgt
--

CREATE DATABASE tableroi_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE tableroi_db OWNER TO tableroi_informgt;

\connect tableroi_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 176 (class 1259 OID 16421)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO tableroi_informgt;

--
-- TOC entry 175 (class 1259 OID 16419)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 175
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 178 (class 1259 OID 16431)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO tableroi_informgt;

--
-- TOC entry 177 (class 1259 OID 16429)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 177
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 174 (class 1259 OID 16413)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO tableroi_informgt;

--
-- TOC entry 173 (class 1259 OID 16411)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 180 (class 1259 OID 16439)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO tableroi_informgt;

--
-- TOC entry 182 (class 1259 OID 16449)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO tableroi_informgt;

--
-- TOC entry 181 (class 1259 OID 16447)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_groups_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 181
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 179 (class 1259 OID 16437)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 179
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 184 (class 1259 OID 16457)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO tableroi_informgt;

--
-- TOC entry 183 (class 1259 OID 16455)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 183
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 186 (class 1259 OID 16517)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO tableroi_informgt;

--
-- TOC entry 185 (class 1259 OID 16515)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 172 (class 1259 OID 16403)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO tableroi_informgt;

--
-- TOC entry 171 (class 1259 OID 16401)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 171
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 170 (class 1259 OID 16392)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO tableroi_informgt;

--
-- TOC entry 169 (class 1259 OID 16390)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 169
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 195 (class 1259 OID 16606)
-- Name: django_session; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO tableroi_informgt;

--
-- TOC entry 188 (class 1259 OID 16550)
-- Name: home_conred; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.home_conred (
    index integer NOT NULL,
    codigo bigint NOT NULL,
    departamento text NOT NULL,
    cod_municipio bigint NOT NULL,
    municipio text NOT NULL,
    eventos_naturales numeric(10,4) NOT NULL,
    degradacion_ambiental numeric(10,4) NOT NULL,
    inform_humano numeric(10,4) NOT NULL,
    inform_natural numeric(10,4) NOT NULL,
    peligro_y_exposicion numeric(10,4) NOT NULL,
    desarrollo_economico numeric(10,4) NOT NULL,
    desigualdad numeric(10,4) NOT NULL,
    desarrollo_y_pobreza numeric(10,4) NOT NULL,
    poblacion_en_dependencia numeric(10,4) NOT NULL,
    poblacion_desprotegida numeric(10,4) NOT NULL,
    socioeconomica numeric(10,4) NOT NULL,
    grupos_vulnerables numeric(10,4) NOT NULL,
    vulnerabilidades numeric(10,4) NOT NULL,
    rrd numeric(10,4) NOT NULL,
    gestion_municipal numeric(10,4) NOT NULL,
    comunicacion numeric(10,4) NOT NULL,
    infraestructura numeric(10,4) NOT NULL,
    salud numeric(10,4) NOT NULL,
    inform_institucional numeric(10,4) NOT NULL,
    inform_infraestrucutra numeric(10,4) NOT NULL,
    falta_capacidad_respuesta numeric(10,4) NOT NULL,
    inform_risk numeric(10,4) NOT NULL,
    ranking bigint NOT NULL,
    missing_indicators bigint NOT NULL,
    missing_data_p numeric(10,4) NOT NULL,
    ranking_dep bigint
);


ALTER TABLE public.home_conred OWNER TO tableroi_informgt;

--
-- TOC entry 187 (class 1259 OID 16548)
-- Name: home_conred_index_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.home_conred_index_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_conred_index_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 187
-- Name: home_conred_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.home_conred_index_seq OWNED BY public.home_conred.index;


--
-- TOC entry 192 (class 1259 OID 16572)
-- Name: home_indicador; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.home_indicador (
    id integer NOT NULL,
    name text NOT NULL,
    name_db text NOT NULL,
    nivel_id integer
);


ALTER TABLE public.home_indicador OWNER TO tableroi_informgt;

--
-- TOC entry 191 (class 1259 OID 16570)
-- Name: home_indicador_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.home_indicador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_indicador_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 191
-- Name: home_indicador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.home_indicador_id_seq OWNED BY public.home_indicador.id;


--
-- TOC entry 194 (class 1259 OID 16583)
-- Name: home_nivel; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.home_nivel (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.home_nivel OWNER TO tableroi_informgt;

--
-- TOC entry 193 (class 1259 OID 16581)
-- Name: home_nivel_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.home_nivel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_nivel_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 193
-- Name: home_nivel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.home_nivel_id_seq OWNED BY public.home_nivel.id;


--
-- TOC entry 190 (class 1259 OID 16561)
-- Name: home_riesgo; Type: TABLE; Schema: public; Owner: tableroi_informgt
--

CREATE TABLE public.home_riesgo (
    id integer NOT NULL,
    name text NOT NULL,
    min_ri numeric(10,4) NOT NULL,
    max_ri numeric(10,4) NOT NULL,
    color_ri text,
    min_pelyexp numeric(10,4) NOT NULL,
    max_pelyexp numeric(10,4) NOT NULL,
    color_pelyexp text,
    min_vul numeric(10,4) NOT NULL,
    max_vul numeric(10,4) NOT NULL,
    color_vul text,
    min_capres numeric(10,4) NOT NULL,
    max_capres numeric(10,4) NOT NULL,
    color_capres text
);


ALTER TABLE public.home_riesgo OWNER TO tableroi_informgt;

--
-- TOC entry 189 (class 1259 OID 16559)
-- Name: home_riesgo_id_seq; Type: SEQUENCE; Schema: public; Owner: tableroi_informgt
--

CREATE SEQUENCE public.home_riesgo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_riesgo_id_seq OWNER TO tableroi_informgt;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 189
-- Name: home_riesgo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tableroi_informgt
--

ALTER SEQUENCE public.home_riesgo_id_seq OWNED BY public.home_riesgo.id;


--
-- TOC entry 2819 (class 2604 OID 16424)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2820 (class 2604 OID 16434)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2818 (class 2604 OID 16416)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2821 (class 2604 OID 16442)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2822 (class 2604 OID 16452)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2823 (class 2604 OID 16460)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2824 (class 2604 OID 16520)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2817 (class 2604 OID 16406)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2816 (class 2604 OID 16395)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2825 (class 2604 OID 16553)
-- Name: home_conred index; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.home_conred ALTER COLUMN index SET DEFAULT nextval('public.home_conred_index_seq'::regclass);


--
-- TOC entry 2827 (class 2604 OID 16575)
-- Name: home_indicador id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.home_indicador ALTER COLUMN id SET DEFAULT nextval('public.home_indicador_id_seq'::regclass);


--
-- TOC entry 2828 (class 2604 OID 16586)
-- Name: home_nivel id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.home_nivel ALTER COLUMN id SET DEFAULT nextval('public.home_nivel_id_seq'::regclass);


--
-- TOC entry 2826 (class 2604 OID 16564)
-- Name: home_riesgo id; Type: DEFAULT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.home_riesgo ALTER COLUMN id SET DEFAULT nextval('public.home_riesgo_id_seq'::regclass);


--
-- TOC entry 3009 (class 0 OID 16421)
-- Dependencies: 176
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--



--
-- TOC entry 3011 (class 0 OID 16431)
-- Dependencies: 178
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--



--
-- TOC entry 3007 (class 0 OID 16413)
-- Dependencies: 174
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission VALUES (25, 'Can add conred', 7, 'add_conred');
INSERT INTO public.auth_permission VALUES (26, 'Can change conred', 7, 'change_conred');
INSERT INTO public.auth_permission VALUES (27, 'Can delete conred', 7, 'delete_conred');
INSERT INTO public.auth_permission VALUES (28, 'Can view conred', 7, 'view_conred');
INSERT INTO public.auth_permission VALUES (29, 'Can add riesgo', 8, 'add_riesgo');
INSERT INTO public.auth_permission VALUES (30, 'Can change riesgo', 8, 'change_riesgo');
INSERT INTO public.auth_permission VALUES (31, 'Can delete riesgo', 8, 'delete_riesgo');
INSERT INTO public.auth_permission VALUES (32, 'Can view riesgo', 8, 'view_riesgo');
INSERT INTO public.auth_permission VALUES (33, 'Can add indicador', 9, 'add_indicador');
INSERT INTO public.auth_permission VALUES (34, 'Can change indicador', 9, 'change_indicador');
INSERT INTO public.auth_permission VALUES (35, 'Can delete indicador', 9, 'delete_indicador');
INSERT INTO public.auth_permission VALUES (36, 'Can view indicador', 9, 'view_indicador');
INSERT INTO public.auth_permission VALUES (37, 'Can add nivel', 10, 'add_nivel');
INSERT INTO public.auth_permission VALUES (38, 'Can change nivel', 10, 'change_nivel');
INSERT INTO public.auth_permission VALUES (39, 'Can delete nivel', 10, 'delete_nivel');
INSERT INTO public.auth_permission VALUES (40, 'Can view nivel', 10, 'view_nivel');


--
-- TOC entry 3013 (class 0 OID 16439)
-- Dependencies: 180
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--



--
-- TOC entry 3015 (class 0 OID 16449)
-- Dependencies: 182
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--



--
-- TOC entry 3017 (class 0 OID 16457)
-- Dependencies: 184
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--



--
-- TOC entry 3019 (class 0 OID 16517)
-- Dependencies: 186
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--



--
-- TOC entry 3005 (class 0 OID 16403)
-- Dependencies: 172
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (7, 'home', 'conred');
INSERT INTO public.django_content_type VALUES (8, 'home', 'riesgo');
INSERT INTO public.django_content_type VALUES (9, 'home', 'indicador');
INSERT INTO public.django_content_type VALUES (10, 'home', 'nivel');


--
-- TOC entry 3003 (class 0 OID 16392)
-- Dependencies: 170
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2025-05-26 17:16:48.777953+02');
INSERT INTO public.django_migrations VALUES (2, 'auth', '0001_initial', '2025-05-26 17:16:48.889371+02');
INSERT INTO public.django_migrations VALUES (3, 'admin', '0001_initial', '2025-05-26 17:16:48.932207+02');
INSERT INTO public.django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2025-05-26 17:16:48.952247+02');
INSERT INTO public.django_migrations VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2025-05-26 17:16:48.973554+02');
INSERT INTO public.django_migrations VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2025-05-26 17:16:49.01933+02');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2025-05-26 17:16:49.045759+02');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0003_alter_user_email_max_length', '2025-05-26 17:16:49.070221+02');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0004_alter_user_username_opts', '2025-05-26 17:16:49.089872+02');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0005_alter_user_last_login_null', '2025-05-26 17:16:49.107028+02');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0006_require_contenttypes_0002', '2025-05-26 17:16:49.11097+02');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2025-05-26 17:16:49.132785+02');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0008_alter_user_username_max_length', '2025-05-26 17:16:49.154454+02');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2025-05-26 17:16:49.173059+02');
INSERT INTO public.django_migrations VALUES (15, 'auth', '0010_alter_group_name_max_length', '2025-05-26 17:16:49.193463+02');
INSERT INTO public.django_migrations VALUES (16, 'auth', '0011_update_proxy_permissions', '2025-05-26 17:16:49.209314+02');
INSERT INTO public.django_migrations VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2025-05-26 17:16:49.223322+02');
INSERT INTO public.django_migrations VALUES (18, 'home', '0001_initial', '2025-05-26 17:16:49.241495+02');
INSERT INTO public.django_migrations VALUES (19, 'home', '0002_riesgo', '2025-05-26 17:16:49.257125+02');
INSERT INTO public.django_migrations VALUES (20, 'home', '0003_indicador_nivel', '2025-05-26 17:16:49.281137+02');
INSERT INTO public.django_migrations VALUES (21, 'home', '0004_indicador_nivel', '2025-05-26 17:16:49.305787+02');
INSERT INTO public.django_migrations VALUES (22, 'home', '0005_conred_ranking_dep', '2025-05-26 17:16:49.316357+02');
INSERT INTO public.django_migrations VALUES (23, 'sessions', '0001_initial', '2025-05-26 17:16:49.340331+02');


--
-- TOC entry 3028 (class 0 OID 16606)
-- Dependencies: 195
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--



--
-- TOC entry 3021 (class 0 OID 16550)
-- Dependencies: 188
-- Data for Name: home_conred; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--

INSERT INTO public.home_conred VALUES (1, 1, 'Guatemala', 101, 'Guatemala', 9.3000, 8.2000, 4.8000, 8.8000, 7.3000, 7.3565, 2.0310, 2.8000, 0.2517, 2.1000, 4.5000, 1.2000, 3.0000, 0.7000, 3.5000, 0.6000, 2.9000, 0.0000, 2.2000, 1.2000, 1.7000, 3.3000, 339, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (2, 1, 'Guatemala', 102, 'Santa Catarina Pinula', 3.0000, 7.1000, 3.1000, 5.4000, 4.3000, 8.8065, 3.9585, 5.1000, 6.5030, 6.5000, 6.5000, 6.5000, 6.5000, 7.2000, 3.0000, 9.4000, 3.8000, 8.8000, 5.5000, 8.0000, 6.9000, 5.8000, 63, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (3, 1, 'Guatemala', 103, 'San José Pinula', 1.1000, 8.2000, 2.9000, 5.7000, 4.4000, 8.1935, 4.0347, 5.2000, 6.9201, 5.1000, 6.2000, 6.1000, 6.2000, 7.1000, 5.5000, 8.9000, 3.1000, 5.6000, 6.4000, 6.5000, 6.5000, 5.6000, 94, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (4, 1, 'Guatemala', 104, 'San José Del Golfo', 0.0000, 6.1000, 4.3000, 3.6000, 4.0000, 8.5205, 3.9534, 4.0000, 2.7047, 2.1000, 6.0000, 2.4000, 4.4000, 7.3000, 5.3000, 6.3000, 3.0000, 3.1000, 6.4000, 4.3000, 5.4000, 4.6000, 292, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (5, 1, 'Guatemala', 105, 'Palencia', 2.3000, 8.2000, 3.2000, 6.0000, 4.8000, 8.1351, 4.2632, 4.7000, 5.5430, 3.0000, 6.0000, 4.4000, 5.3000, 2.5000, 3.1000, 9.0000, 1.6000, 5.7000, 2.8000, 6.3000, 4.8000, 5.0000, 224, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (6, 1, 'Guatemala', 106, 'Chinautla', 4.9000, 4.4000, 2.9000, 4.7000, 3.9000, 8.4345, 4.0005, 4.0000, 1.4423, 4.4000, 6.0000, 3.1000, 4.7000, 7.3000, 5.1000, 2.3000, 1.8000, 6.9000, 6.3000, 4.1000, 5.3000, 4.6000, 292, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (7, 1, 'Guatemala', 107, 'San Pedro Ayampuc', 6.4000, 6.0000, 3.3000, 6.2000, 4.9000, 7.6876, 7.5581, 4.9000, 0.4626, 4.4000, 6.9000, 2.7000, 5.2000, 7.2000, 7.7000, 8.4000, 3.6000, 7.6000, 7.5000, 7.0000, 7.3000, 5.7000, 80, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (8, 1, 'Guatemala', 108, 'Mixco', 5.7000, 9.4000, 4.6000, 8.1000, 6.7000, 8.2333, 3.7673, 4.8000, 2.9312, 4.0000, 6.0000, 3.5000, 4.9000, 7.6000, 3.9000, 8.0000, 3.4000, 6.5000, 6.1000, 6.3000, 6.2000, 5.9000, 43, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (9, 1, 'Guatemala', 109, 'San Pedro Sacatepéquez', 0.1000, 7.4000, 5.3000, 4.7000, 5.0000, 6.6791, 5.8012, 3.2000, 2.3191, 1.3000, 5.4000, 1.8000, 3.8000, 6.2000, 6.6000, 3.7000, 3.6000, 4.9000, 6.4000, 4.1000, 5.4000, 4.7000, 282, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (10, 1, 'Guatemala', 110, 'San Juan Sacatepéquez', 3.3000, 8.1000, 2.9000, 6.3000, 4.8000, 9.7746, 5.2445, 6.3000, 5.9341, 4.1000, 7.8000, 5.1000, 6.6000, 7.8000, 5.8000, 9.8000, 5.5000, 7.7000, 6.9000, 8.2000, 7.6000, 6.2000, 16, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (11, 1, 'Guatemala', 111, 'San Raymundo', 0.1000, 7.9000, 2.9000, 5.2000, 4.1000, 9.2848, 3.8283, 5.3000, 5.9227, 3.7000, 6.9000, 4.9000, 6.0000, 7.5000, 7.6000, 9.3000, 3.2000, 6.1000, 7.6000, 7.0000, 7.3000, 5.6000, 94, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (12, 1, 'Guatemala', 112, 'Chuarrancho', 0.3000, 7.1000, 3.6000, 4.5000, 4.1000, 8.5005, 6.1925, 5.3000, 4.8682, 3.1000, 6.9000, 4.0000, 5.6000, 5.8000, 6.9000, 8.9000, 3.0000, 4.7000, 6.4000, 6.2000, 6.3000, 5.2000, 181, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (13, 1, 'Guatemala', 113, 'Fraijanes', 1.4000, 7.1000, 5.3000, 4.9000, 5.1000, 7.6561, 9.8837, 4.1000, 2.7963, 2.1000, 8.0000, 2.5000, 5.9000, 7.0000, 4.0000, 6.6000, 3.2000, 5.7000, 5.7000, 5.3000, 5.5000, 5.5000, 114, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (14, 1, 'Guatemala', 114, 'Amatitlán', 4.3000, 7.3000, 2.9000, 6.0000, 4.6000, 7.8768, 0.1163, 4.1000, 4.0870, 4.3000, 4.8000, 4.2000, 4.5000, 2.1000, 6.2000, 7.3000, 4.9000, 1.8000, 4.5000, 5.1000, 4.8000, 4.6000, 292, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (15, 1, 'Guatemala', 115, 'Villa Nueva', 6.7000, 8.5000, 3.8000, 7.7000, 6.1000, 8.6797, 4.4761, 5.4000, 3.9607, 4.2000, 6.6000, 4.1000, 5.5000, 3.1000, 5.5000, 8.2000, 3.3000, 3.5000, 4.4000, 5.5000, 5.0000, 5.5000, 114, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (16, 1, 'Guatemala', 116, 'Villa Canales', 4.7000, 7.4000, 3.5000, 6.2000, 5.0000, 9.1665, 6.3265, 5.0000, 3.8379, 5.2000, 7.3000, 4.6000, 6.1000, 3.0000, 3.7000, 7.5000, 1.9000, 6.8000, 3.4000, 5.9000, 4.8000, 5.3000, 157, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (17, 1, 'Guatemala', 117, 'San Miguel Petapa', 2.6000, 6.6000, 3.2000, 4.9000, 4.1000, 8.8751, 5.1163, 5.7000, 4.7491, 4.0000, 6.9000, 4.4000, 5.8000, 3.9000, 6.2000, 8.4000, 2.4000, 8.7000, 5.2000, 7.3000, 6.4000, 5.3000, 157, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (18, 2, 'El Progreso', 201, 'Guastatoya', 4.9000, 5.9000, 4.3000, 5.4000, 4.9000, 8.7170, 5.1686, 5.0000, 3.5290, 2.8000, 6.7000, 3.2000, 5.2000, 6.6000, 5.2000, 8.1000, 2.6000, 0.3000, 5.9000, 4.6000, 5.3000, 5.1000, 199, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (19, 2, 'El Progreso', 202, 'Morazán', 2.5000, 7.0000, 3.5000, 5.2000, 4.4000, 7.4440, 0.0000, 4.0000, 0.1193, 5.3000, 4.5000, 3.1000, 3.8000, 7.0000, 8.3000, 8.0000, 3.7000, 4.3000, 7.7000, 5.7000, 6.8000, 4.8000, 265, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (20, 2, 'El Progreso', 203, 'San Agustín Acasaguastlán', 3.7000, 8.9000, 4.2000, 7.1000, 5.8000, 7.6700, 7.8171, 4.6000, 3.5243, 3.0000, 6.9000, 3.3000, 5.4000, 7.1000, 8.9000, 8.2000, 3.9000, 5.7000, 8.1000, 6.3000, 7.3000, 6.1000, 23, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (21, 2, 'El Progreso', 204, 'San Cristóbal Acasaguastlán', 1.0000, 5.7000, 3.4000, 3.7000, 3.6000, 7.8654, 3.6539, 4.1000, 2.6783, 2.9000, 5.6000, 2.8000, 4.3000, 8.1000, 5.0000, 5.1000, 2.8000, 2.6000, 6.8000, 3.6000, 5.4000, 4.4000, 307, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (22, 2, 'El Progreso', 205, 'El Jícaro', 0.1000, 4.8000, 4.3000, 2.8000, 3.6000, 8.5188, 5.0372, 5.2000, 4.1168, 2.8000, 6.6000, 3.5000, 5.3000, 8.9000, 6.6000, 8.4000, 3.7000, 4.2000, 8.0000, 5.9000, 7.1000, 5.1000, 199, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (23, 2, 'El Progreso', 206, 'Sansare', 1.1000, 6.3000, 5.8000, 4.2000, 5.1000, 5.5247, 4.8903, 3.8000, 1.0497, 3.4000, 4.8000, 2.3000, 3.7000, 7.0000, 3.9000, 7.0000, 2.3000, 4.7000, 5.7000, 5.0000, 5.4000, 4.7000, 282, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (24, 2, 'El Progreso', 207, 'Sanarate', 4.3000, 6.7000, 2.9000, 5.6000, 4.4000, 10.0000, 1.8942, 6.0000, 1.3532, 7.0000, 7.4000, 4.8000, 6.3000, 7.3000, 8.1000, 8.5000, 5.4000, 4.9000, 7.7000, 6.6000, 7.2000, 5.8000, 63, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (25, 2, 'El Progreso', 208, 'San Antonio La Paz', 0.8000, 8.0000, 3.3000, 5.4000, 4.4000, 9.6018, 6.2453, 5.5000, 3.9877, 4.3000, 7.7000, 4.1000, 6.2000, 7.4000, 3.5000, 8.9000, 2.8000, 5.2000, 5.8000, 6.3000, 6.1000, 5.5000, 114, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (26, 3, 'Sacatepéquez', 301, 'Antigua Guatemala', 5.7000, 7.0000, 3.9000, 6.4000, 5.3000, 8.4619, 5.4359, 2.8000, 0.7947, 2.1000, 6.1000, 1.5000, 4.2000, 6.8000, 5.1000, 0.8000, 1.6000, 0.0000, 6.0000, 0.8000, 3.9000, 4.4000, 307, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (27, 3, 'Sacatepéquez', 302, 'Jocotenango', 2.3000, 7.0000, 3.5000, 5.1000, 4.3000, 7.2165, 4.4729, 4.6000, 2.7133, 2.4000, 5.6000, 2.6000, 4.3000, 7.4000, 3.9000, 8.1000, 3.8000, 7.2000, 5.9000, 6.7000, 6.3000, 4.9000, 246, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (28, 3, 'Sacatepéquez', 303, 'Pastores', 2.5000, 8.2000, 3.1000, 6.1000, 4.8000, 9.4618, 5.8670, 5.7000, 6.0494, 4.4000, 7.5000, 5.3000, 6.5000, 7.5000, 6.0000, 8.8000, 3.2000, 6.6000, 6.8000, 6.8000, 6.8000, 6.0000, 28, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (29, 3, 'Sacatepéquez', 304, 'Sumpango', 1.6000, 8.3000, 3.8000, 5.9000, 4.9000, 8.6236, 4.5255, 4.9000, 4.2975, 3.0000, 6.4000, 3.7000, 5.2000, 7.2000, 6.5000, 8.5000, 3.7000, 5.4000, 6.9000, 6.3000, 6.6000, 5.5000, 114, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (30, 3, 'Sacatepéquez', 305, 'Santo Domingo Xenacoj', 0.1000, 7.4000, 3.4000, 4.7000, 4.1000, 8.4542, 2.6234, 4.0000, 2.1254, 2.4000, 5.7000, 2.3000, 4.2000, 7.4000, 7.0000, 7.2000, 2.1000, 7.2000, 7.2000, 5.9000, 6.6000, 4.8000, 265, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (31, 3, 'Sacatepéquez', 306, 'Santiago Sacatepéquez', 0.1000, 8.0000, 4.0000, 5.3000, 4.7000, 8.8819, 4.6527, 4.5000, 2.6783, 1.2000, 6.5000, 2.0000, 4.6000, 7.5000, 3.1000, 7.6000, 2.9000, 5.6000, 5.7000, 5.7000, 5.7000, 5.0000, 224, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (32, 3, 'Sacatepéquez', 307, 'San Bartolomé Milpas Altas', 0.1000, 6.1000, 3.9000, 3.7000, 3.8000, 7.2645, 3.2558, 3.1000, 1.9262, 1.8000, 4.9000, 1.9000, 3.5000, 7.9000, 5.6000, 5.2000, 3.2000, 5.9000, 6.9000, 4.9000, 6.0000, 4.3000, 315, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (33, 3, 'Sacatepéquez', 308, 'San Lucas Sacatepéquez', 2.0000, 7.9000, 3.0000, 5.7000, 4.5000, 8.3420, 4.3647, 3.8000, 5.1478, 2.5000, 6.0000, 3.9000, 5.0000, 7.3000, 8.5000, 8.4000, 2.8000, 6.9000, 8.0000, 6.6000, 7.4000, 5.5000, 114, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (34, 3, 'Sacatepéquez', 309, 'Santa Lucía Milpas Altas', 1.5000, 6.1000, 3.3000, 4.2000, 3.8000, 9.1557, 5.7307, 4.1000, 1.1020, 2.5000, 6.9000, 1.8000, 4.8000, 8.0000, 4.9000, 4.5000, 3.6000, 6.8000, 6.7000, 5.1000, 6.0000, 4.8000, 265, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (35, 3, 'Sacatepéquez', 310, 'Magdalena Milpas Altas', 0.1000, 7.7000, 3.4000, 5.0000, 4.2000, 8.6278, 4.4729, 4.7000, 3.3619, 1.5000, 6.4000, 2.5000, 4.7000, 8.2000, 6.2000, 7.4000, 2.7000, 7.2000, 7.3000, 6.2000, 6.8000, 5.1000, 199, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (36, 3, 'Sacatepéquez', 311, 'Santa María De Jesús', 0.0000, 7.0000, 4.3000, 4.4000, 4.4000, 8.4459, 4.6527, 4.3000, 2.6245, 1.8000, 6.2000, 2.2000, 4.5000, 6.8000, 3.6000, 6.6000, 2.4000, 7.9000, 5.4000, 6.1000, 5.8000, 4.9000, 246, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (37, 3, 'Sacatepéquez', 312, 'Ciudad Vieja', 1.8000, 6.0000, 3.0000, 4.2000, 3.6000, 9.1656, 3.7726, 5.8000, 9.2094, 5.5000, 6.9000, 7.8000, 7.4000, 7.7000, 8.1000, 10.0000, 3.7000, 7.2000, 7.9000, 7.9000, 7.9000, 5.9000, 43, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (38, 3, 'Sacatepéquez', 313, 'San Miguel Dueñas', 0.0000, 6.3000, 3.5000, 3.8000, 3.7000, 8.3441, 6.5699, 4.8000, 4.1381, 3.5000, 6.8000, 3.8000, 5.5000, 8.0000, 5.0000, 7.9000, 2.6000, 6.5000, 6.8000, 6.1000, 6.5000, 5.1000, 199, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (39, 3, 'Sacatepéquez', 314, 'San Juan Alotenango', 5.8000, 6.8000, 4.2000, 6.3000, 5.3000, 8.0925, 5.9990, 4.2000, 2.2142, 1.4000, 6.4000, 1.8000, 4.5000, 6.1000, 6.4000, 7.3000, 1.9000, 5.0000, 6.3000, 5.1000, 5.7000, 5.1000, 199, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (40, 3, 'Sacatepéquez', 315, 'San Antonio Aguas Calientes', 0.0000, 8.0000, 2.9000, 5.2000, 4.1000, 8.8339, 4.1616, 5.4000, 7.5570, 3.9000, 6.6000, 6.0000, 6.3000, 8.2000, 2.7000, 8.6000, 2.5000, 6.7000, 6.2000, 6.5000, 6.4000, 5.5000, 114, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (41, 3, 'Sacatepéquez', 316, 'Santa Catarina Barahona', 0.1000, 5.6000, 3.1000, 3.3000, 3.2000, 9.3943, 4.3018, 5.5000, 7.0747, 3.6000, 7.1000, 5.6000, 6.4000, 9.0000, 5.6000, 9.4000, 2.9000, 5.6000, 7.7000, 6.8000, 7.3000, 5.3000, 157, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (42, 4, 'Chimaltenango', 401, 'Chimaltenango', 4.6000, 8.8000, 4.1000, 7.2000, 5.9000, 9.0469, 4.1339, 3.6000, 1.6530, 2.8000, 6.3000, 2.2000, 4.6000, 6.8000, 3.8000, 3.9000, 1.9000, 1.0000, 5.5000, 2.4000, 4.1000, 4.8000, 265, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (43, 4, 'Chimaltenango', 402, 'San José Poaquil', 1.0000, 4.7000, 3.4000, 3.1000, 3.3000, 9.1006, 6.1887, 5.5000, 4.7374, 6.1000, 7.3000, 5.5000, 6.5000, 6.5000, 3.5000, 7.4000, 3.1000, 5.4000, 5.2000, 5.6000, 5.4000, 4.9000, 246, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (44, 4, 'Chimaltenango', 403, 'San Martín Jilotepeque', 1.3000, 5.2000, 3.7000, 3.5000, 3.6000, 8.3579, 5.2796, 4.4000, 1.9690, 3.7000, 6.4000, 2.9000, 4.9000, 6.4000, 4.1000, 5.3000, 1.6000, 6.1000, 5.4000, 4.6000, 5.0000, 4.5000, 302, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (45, 4, 'Chimaltenango', 404, 'San Juan Comalapa', 0.9000, 5.0000, 3.6000, 3.2000, 3.4000, 8.9821, 4.0297, 3.7000, 1.3680, 3.9000, 6.3000, 2.7000, 4.7000, 6.7000, 4.8000, 5.6000, 2.1000, 6.0000, 5.8000, 4.8000, 5.3000, 4.4000, 307, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (46, 4, 'Chimaltenango', 405, 'Santa Apolonia', 1.8000, 3.3000, 3.3000, 2.6000, 3.0000, 7.8017, 3.6008, 4.5000, 2.5377, 2.9000, 5.6000, 2.7000, 4.3000, 6.7000, 6.6000, 7.6000, 2.5000, 6.4000, 6.7000, 5.9000, 6.3000, 4.3000, 315, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (47, 4, 'Chimaltenango', 406, 'Tecpán Guatemala', 4.4000, 6.4000, 3.2000, 5.5000, 4.4000, 9.3027, 5.3898, 5.4000, 2.7607, 5.2000, 7.2000, 4.1000, 5.9000, 6.1000, 5.5000, 8.1000, 2.5000, 4.0000, 5.8000, 5.4000, 5.6000, 5.3000, 157, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (48, 4, 'Chimaltenango', 407, 'Patzún', 1.7000, 7.7000, 2.9000, 5.4000, 4.3000, 8.7259, 3.6844, 5.1000, 7.8206, 5.7000, 6.4000, 6.9000, 6.7000, 7.1000, 5.9000, 8.6000, 2.8000, 6.0000, 6.5000, 6.4000, 6.5000, 5.7000, 80, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (49, 4, 'Chimaltenango', 408, 'San Miguel Pochuta', 0.1000, 7.2000, 3.6000, 4.5000, 4.1000, 9.0762, 4.0530, 6.2000, 4.0460, 2.2000, 7.0000, 3.2000, 5.4000, 7.0000, 3.2000, 7.8000, 3.3000, 3.7000, 5.4000, 5.3000, 5.4000, 4.9000, 246, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (50, 4, 'Chimaltenango', 409, 'Patzicía', 0.4000, 6.9000, 3.0000, 4.4000, 3.7000, 6.8227, 4.7709, 4.6000, 8.3222, 5.4000, 5.5000, 7.1000, 6.4000, 7.2000, 6.9000, 9.2000, 3.5000, 6.0000, 7.1000, 6.9000, 7.0000, 5.5000, 114, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (51, 4, 'Chimaltenango', 410, 'Santa Cruz Balanyá', 0.1000, 8.2000, 3.3000, 5.4000, 4.4000, 8.1938, 2.1071, 4.5000, 3.3993, 3.1000, 5.5000, 3.3000, 4.5000, 8.0000, 5.9000, 5.9000, 3.0000, 5.4000, 7.1000, 4.9000, 6.1000, 4.9000, 246, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (52, 4, 'Chimaltenango', 411, 'Acatenango', 1.8000, 7.4000, 4.3000, 5.2000, 4.8000, 8.2938, 4.2077, 5.0000, 3.2155, 2.6000, 6.2000, 2.9000, 4.8000, 5.0000, 5.3000, 8.4000, 2.3000, 5.3000, 5.2000, 5.9000, 5.6000, 5.1000, 199, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (53, 4, 'Chimaltenango', 412, 'San Pedro Yepocapa', 7.2000, 5.9000, 3.4000, 6.6000, 5.2000, 8.1754, 3.4828, 4.5000, 1.4584, 3.2000, 5.8000, 2.4000, 4.3000, 3.3000, 5.2000, 6.4000, 3.1000, 5.9000, 4.3000, 5.3000, 4.8000, 4.8000, 265, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (54, 4, 'Chimaltenango', 413, 'San Andrés Itzapa', 1.1000, 7.3000, 3.3000, 4.9000, 4.1000, 8.1846, 3.4105, 4.3000, 2.7589, 3.4000, 5.8000, 3.1000, 4.6000, 7.4000, 3.1000, 7.7000, 1.9000, 6.2000, 5.7000, 5.7000, 5.7000, 4.8000, 265, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (55, 4, 'Chimaltenango', 414, 'Parramos', 0.0000, 7.1000, 3.1000, 4.4000, 3.8000, 8.3660, 3.2482, 4.7000, 3.4601, 3.0000, 5.9000, 3.2000, 4.7000, 8.2000, 4.9000, 7.0000, 3.8000, 6.7000, 6.9000, 6.0000, 6.5000, 4.9000, 246, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (56, 4, 'Chimaltenango', 415, 'Zaragoza', 0.0000, 8.2000, 2.9000, 5.4000, 4.3000, 7.9226, 3.7209, 5.6000, 6.1981, 5.2000, 6.0000, 5.7000, 5.9000, 7.2000, 4.2000, 9.2000, 3.9000, 6.0000, 5.9000, 7.0000, 6.5000, 5.5000, 114, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (57, 4, 'Chimaltenango', 416, 'El Tejar', 0.5000, 7.4000, 3.2000, 4.8000, 4.0000, 9.5542, 3.6996, 4.9000, 2.4793, 3.5000, 7.0000, 3.0000, 5.3000, 8.2000, 4.6000, 6.0000, 2.4000, 7.1000, 6.8000, 5.5000, 6.2000, 5.1000, 199, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (58, 5, 'Escuintla', 501, 'Escuintla', 8.6000, 6.2000, 3.0000, 7.6000, 5.8000, 8.5712, 1.5721, 4.5000, 2.7114, 5.3000, 5.7000, 4.1000, 5.0000, 1.8000, 5.3000, 8.7000, 3.6000, 1.0000, 3.8000, 5.4000, 4.6000, 5.1000, 199, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (59, 5, 'Escuintla', 502, 'Santa Lucía Cotzumalguapa', 4.0000, 1.6000, 4.3000, 2.9000, 3.6000, 8.8801, 3.4865, 4.3000, 2.6764, 4.2000, 6.2000, 3.5000, 5.0000, 3.7000, 6.4000, 6.0000, 2.5000, 7.0000, 5.2000, 5.5000, 5.4000, 4.6000, 292, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (60, 5, 'Escuintla', 503, 'La Democracia', 0.1000, 5.5000, 3.3000, 3.3000, 3.3000, 7.9540, 2.6316, 5.1000, 3.7970, 2.9000, 5.7000, 3.4000, 4.7000, 5.7000, 8.3000, 8.2000, 3.9000, 3.1000, 7.2000, 5.6000, 6.5000, 4.7000, 282, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (61, 5, 'Escuintla', 504, 'Siquinalá', 2.6000, 7.1000, 5.4000, 5.3000, 5.4000, 8.9187, 5.6848, 4.4000, 3.9874, 3.4000, 6.8000, 3.7000, 5.5000, 3.8000, 6.4000, 8.8000, 4.3000, 6.2000, 5.2000, 6.9000, 6.1000, 5.7000, 80, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (62, 5, 'Escuintla', 505, 'Masagua', 3.5000, 4.6000, 3.0000, 4.1000, 3.6000, 8.4413, 2.1308, 5.2000, 7.1073, 6.6000, 5.9000, 6.9000, 6.4000, 7.3000, 9.0000, 9.6000, 3.2000, 5.9000, 8.3000, 7.1000, 7.8000, 5.6000, 94, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (63, 5, 'Escuintla', 506, 'Tiquisate', 1.8000, 6.0000, 5.4000, 4.2000, 4.8000, 3.0786, 3.9483, 3.0000, 0.6820, 3.1000, 3.4000, 2.0000, 2.7000, 6.7000, 0.8000, 1.4000, 2.7000, 1.9000, 4.4000, 2.0000, 3.3000, 3.5000, 336, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (64, 5, 'Escuintla', 507, 'La Gomera', 3.8000, 5.5000, 3.7000, 4.7000, 4.2000, 9.0811, 9.5349, 6.2000, 5.0672, 5.0000, 8.6000, 5.0000, 7.2000, 4.1000, 5.1000, 8.7000, 4.3000, 5.5000, 4.6000, 6.6000, 5.7000, 5.6000, 94, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (65, 5, 'Escuintla', 508, 'Guanagazapa', 0.2000, 6.8000, 3.9000, 4.3000, 4.1000, 7.8940, 4.0720, 5.3000, 2.7482, 3.5000, 6.0000, 3.1000, 4.7000, 6.8000, 6.0000, 6.7000, 3.1000, 4.9000, 6.4000, 5.1000, 5.8000, 4.8000, 265, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (66, 5, 'Escuintla', 509, 'San José', 5.1000, 4.2000, 3.1000, 4.7000, 3.9000, 8.0545, 1.6914, 4.2000, 1.7946, 5.7000, 5.3000, 4.0000, 4.7000, 6.6000, 4.9000, 7.8000, 4.0000, 6.1000, 5.8000, 6.2000, 6.0000, 4.8000, 265, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (67, 5, 'Escuintla', 510, 'Iztapa', 3.9000, 6.8000, 3.4000, 5.5000, 4.5000, 6.3491, 3.5721, 4.0000, 3.8515, 5.3000, 4.8000, 4.6000, 4.7000, 6.9000, 4.2000, 8.1000, 2.9000, 5.3000, 5.7000, 5.9000, 5.8000, 5.0000, 224, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (68, 5, 'Escuintla', 511, 'Palín', 1.7000, 6.1000, 3.9000, 4.2000, 4.1000, 7.8272, 5.6702, 3.4000, 0.9536, 3.6000, 5.9000, 2.4000, 4.4000, 7.0000, 4.8000, 3.9000, 4.1000, 7.0000, 6.0000, 5.2000, 5.6000, 4.7000, 282, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (69, 5, 'Escuintla', 512, 'San Vicente Pacaya', 1.5000, 7.4000, 3.0000, 5.1000, 4.1000, 9.6879, 5.2720, 6.6000, 7.7082, 5.1000, 7.8000, 6.6000, 7.2000, 4.3000, 6.8000, 9.8000, 3.0000, 4.8000, 5.7000, 7.0000, 6.4000, 5.7000, 80, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (70, 5, 'Escuintla', 513, 'Nueva Concepción', 7.6000, 6.1000, 3.1000, 6.9000, 5.3000, 9.6171, 5.9947, 6.0000, 6.7926, 6.9000, 7.7000, 6.8000, 7.3000, 4.1000, 7.8000, 9.1000, 4.4000, 6.2000, 6.3000, 7.1000, 6.7000, 6.4000, 5, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (71, 5, 'Escuintla', 514, 'Sipacate', 1.7000, 7.6000, 3.3000, 5.4000, 4.4000, 8.9168, 4.4927, 5.4000, 5.2467, 5.5000, 6.8000, 5.4000, 6.1000, 4.8000, 5.7000, 8.9000, 2.5000, 5.7000, 5.3000, 6.4000, 5.9000, 5.4000, 143, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (72, 6, 'Santa Rosa', 601, 'Cuilapa', 7.2000, 6.6000, 3.8000, 6.9000, 5.6000, 8.2150, 5.5732, 5.0000, 3.6343, 5.2000, 6.5000, 4.5000, 5.6000, 6.9000, 4.3000, 8.7000, 2.6000, 0.0000, 5.8000, 5.0000, 5.4000, 5.5000, 114, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (73, 6, 'Santa Rosa', 602, 'Barberena', 1.9000, 7.9000, 3.0000, 5.7000, 4.5000, 8.8862, 3.3316, 5.7000, 6.3765, 4.8000, 6.6000, 5.6000, 6.1000, 5.7000, 6.5000, 8.8000, 2.4000, 5.6000, 6.1000, 6.3000, 6.2000, 5.5000, 114, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (74, 6, 'Santa Rosa', 603, 'Santa Rosa De Lima', 0.2000, 7.3000, 3.4000, 4.7000, 4.1000, 6.5631, 4.6287, 4.9000, 3.1676, 2.9000, 5.4000, 3.0000, 4.3000, 7.0000, 4.5000, 7.4000, 3.0000, 4.0000, 5.9000, 5.1000, 5.5000, 4.6000, 292, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (75, 6, 'Santa Rosa', 604, 'Casillas', 1.5000, 6.8000, 3.1000, 4.7000, 3.9000, 9.5396, 5.5821, 5.9000, 3.8690, 6.0000, 7.5000, 5.0000, 6.4000, 7.5000, 5.0000, 8.5000, 2.7000, 3.3000, 6.4000, 5.6000, 6.0000, 5.3000, 157, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (76, 6, 'Santa Rosa', 605, 'San Rafael Las Flores', 0.1000, 8.0000, 4.2000, 5.3000, 4.8000, 8.3592, 8.6295, 5.2000, 5.8459, 4.4000, 7.7000, 5.2000, 6.6000, 7.2000, 7.3000, 8.8000, 2.8000, 3.5000, 7.3000, 5.8000, 6.6000, 5.9000, 43, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (77, 6, 'Santa Rosa', 606, 'Oratorio', 3.6000, 3.9000, 3.5000, 3.8000, 3.7000, 9.6818, 3.1907, 5.8000, 4.2524, 3.6000, 7.2000, 3.9000, 5.8000, 7.3000, 5.4000, 7.9000, 2.9000, 5.1000, 6.4000, 5.7000, 6.1000, 5.1000, 199, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (78, 6, 'Santa Rosa', 607, 'San Juan Tecuaco', 0.1000, 6.1000, 3.2000, 3.7000, 3.5000, 8.8795, 3.6290, 5.8000, 4.2504, 2.3000, 6.7000, 3.3000, 5.2000, 8.7000, 4.4000, 9.3000, 4.7000, 3.2000, 7.1000, 6.6000, 6.9000, 5.0000, 224, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (79, 6, 'Santa Rosa', 608, 'Chiquimulilla', 7.3000, 7.1000, 4.2000, 7.2000, 5.9000, 8.7124, 5.3282, 4.8000, 3.2611, 4.5000, 6.7000, 3.9000, 5.5000, 6.5000, 5.4000, 6.4000, 3.0000, 4.6000, 6.0000, 4.8000, 5.4000, 5.6000, 94, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (80, 6, 'Santa Rosa', 609, 'Taxisco', 5.2000, 6.0000, 5.0000, 5.6000, 5.3000, 5.7249, 4.0698, 3.4000, 0.8351, 3.5000, 4.5000, 2.3000, 3.5000, 4.4000, 5.1000, 1.7000, 2.9000, 4.4000, 4.8000, 3.1000, 4.0000, 4.2000, 323, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (81, 6, 'Santa Rosa', 610, 'Santa María Ixhuatán', 4.8000, 4.1000, 6.2000, 4.5000, 5.4000, 9.1995, 4.3960, 5.0000, 1.9684, 3.0000, 6.8000, 2.5000, 5.0000, 6.4000, 5.4000, 6.4000, 2.5000, 4.4000, 5.9000, 4.6000, 5.3000, 5.2000, 181, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (82, 6, 'Santa Rosa', 611, 'Guazacapán', 0.2000, 3.9000, 3.1000, 2.2000, 2.7000, 9.7205, 4.8511, 6.0000, 5.9291, 5.2000, 7.6000, 5.6000, 6.7000, 5.5000, 4.8000, 8.2000, 4.2000, 3.9000, 5.2000, 5.9000, 5.6000, 4.7000, 282, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (83, 6, 'Santa Rosa', 612, 'Santa Cruz Naranjo', 1.2000, 6.8000, 4.3000, 4.6000, 4.5000, 9.1552, 4.1356, 4.8000, 3.3355, 4.4000, 6.7000, 3.9000, 5.5000, 7.5000, 6.8000, 6.9000, 2.2000, 4.6000, 7.2000, 4.9000, 6.2000, 5.4000, 143, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (84, 6, 'Santa Rosa', 613, 'Pueblo Nuevo Viñas', 1.5000, 6.8000, 2.9000, 4.7000, 3.9000, 9.1256, 4.7709, 6.0000, 7.3781, 6.2000, 7.1000, 6.8000, 7.0000, 5.6000, 4.1000, 9.6000, 3.0000, 4.9000, 4.9000, 6.9000, 6.0000, 5.5000, 114, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (85, 6, 'Santa Rosa', 614, 'Nueva Santa Rosa', 1.3000, 7.1000, 2.9000, 4.8000, 3.9000, 9.2836, 4.1254, 5.1000, 4.1109, 5.2000, 6.9000, 4.7000, 5.9000, 5.6000, 5.2000, 7.9000, 2.7000, 4.8000, 5.4000, 5.6000, 5.5000, 5.0000, 224, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (86, 7, 'Sololá', 701, 'Sololá', 7.8000, 7.7000, 3.6000, 7.8000, 6.1000, 7.9365, 4.3348, 4.6000, 3.2802, 3.1000, 5.9000, 3.2000, 4.7000, 6.7000, 4.2000, 8.2000, 2.7000, 1.3000, 5.6000, 4.9000, 5.3000, 5.3000, 157, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (87, 7, 'Sololá', 702, 'San José Chacayá', 3.4000, 8.5000, 3.3000, 6.6000, 5.2000, 9.1025, 2.7706, 6.3000, 4.3363, 4.4000, 6.8000, 4.4000, 5.7000, 8.1000, 5.6000, 8.9000, 3.7000, 3.6000, 7.0000, 6.1000, 6.6000, 5.8000, 63, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (88, 7, 'Sololá', 703, 'Santa María Visitación', 2.7000, 7.3000, 6.8000, 5.4000, 6.1000, 8.9216, 4.1555, 4.7000, 2.8547, 3.1000, 6.5000, 3.0000, 5.0000, 8.8000, 4.4000, 7.4000, 2.8000, 2.3000, 7.2000, 4.6000, 6.1000, 5.7000, 80, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (89, 7, 'Sololá', 704, 'Santa Lucía Utatlán', 7.3000, 8.2000, 3.8000, 7.8000, 6.2000, 8.3755, 5.5181, 4.9000, 2.9168, 3.0000, 6.5000, 3.0000, 5.0000, 7.2000, 6.1000, 7.6000, 3.2000, 4.2000, 6.7000, 5.3000, 6.0000, 5.7000, 80, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (90, 7, 'Sololá', 705, 'Nahualá', 8.8000, 7.2000, 3.8000, 8.1000, 6.4000, 9.3801, 3.4437, 7.3000, 6.5514, 6.2000, 7.4000, 6.4000, 6.9000, 5.2000, 2.8000, 9.4000, 3.4000, 5.0000, 4.1000, 6.8000, 5.6000, 6.3000, 10, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (91, 7, 'Sololá', 706, 'Santa Catarina Ixtahuacán', 7.8000, 7.2000, 3.1000, 7.5000, 5.7000, 8.7989, 8.6295, 5.7000, 4.7395, 4.8000, 8.0000, 4.8000, 6.7000, 4.1000, 6.9000, 8.8000, 2.2000, 4.7000, 5.7000, 6.0000, 5.9000, 6.1000, 23, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (92, 7, 'Sololá', 707, 'Santa Clara La Laguna', 4.9000, 8.5000, 3.1000, 7.1000, 5.4000, 9.4597, 2.5693, 6.1000, 6.5463, 5.2000, 7.0000, 5.9000, 6.5000, 8.2000, 4.0000, 9.5000, 6.1000, 4.5000, 6.6000, 7.3000, 7.0000, 6.3000, 10, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (93, 7, 'Sololá', 708, 'Concepción', 3.1000, 7.9000, 3.2000, 6.0000, 4.8000, 8.4021, 1.8261, 4.9000, 4.5205, 2.9000, 5.7000, 3.8000, 4.8000, 7.0000, 3.4000, 7.1000, 3.6000, 2.6000, 5.5000, 4.8000, 5.2000, 4.9000, 246, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (94, 7, 'Sololá', 709, 'San Andrés Semetabaj', 3.8000, 5.7000, 3.3000, 4.8000, 4.1000, 9.6453, 6.0830, 5.4000, 5.0977, 4.3000, 7.6000, 4.7000, 6.4000, 7.6000, 4.3000, 7.8000, 1.4000, 3.0000, 6.2000, 4.7000, 5.5000, 5.2000, 181, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (95, 7, 'Sololá', 710, 'Panajachel', 3.6000, 8.8000, 5.5000, 6.9000, 6.3000, 8.4468, 2.6768, 4.6000, 2.9820, 1.7000, 5.8000, 2.4000, 4.3000, 8.4000, 6.3000, 8.6000, 3.6000, 3.3000, 7.5000, 5.8000, 6.7000, 5.7000, 80, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (96, 7, 'Sololá', 711, 'Santa Catarina Palopó', 0.0000, 5.8000, 3.1000, 3.4000, 3.3000, 9.1144, 3.3235, 5.4000, 3.3552, 4.4000, 6.6000, 3.9000, 5.4000, 9.1000, 5.9000, 8.6000, 4.3000, 4.2000, 7.9000, 6.2000, 7.1000, 5.0000, 224, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (97, 7, 'Sololá', 712, 'San Antonio Palopó', 2.0000, 6.8000, 3.9000, 4.8000, 4.4000, 9.2285, 4.8919, 6.2000, 5.6075, 4.3000, 7.3000, 5.0000, 6.3000, 8.1000, 7.2000, 9.3000, 4.7000, 4.8000, 7.7000, 6.9000, 7.3000, 5.9000, 43, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (98, 7, 'Sololá', 713, 'San Lucas Tolimán', 2.9000, 8.3000, 3.5000, 6.3000, 5.1000, 9.0634, 4.2643, 6.6000, 5.9246, 4.8000, 7.1000, 5.4000, 6.3000, 7.5000, 2.9000, 9.4000, 3.5000, 4.5000, 5.7000, 6.7000, 6.2000, 5.8000, 63, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (99, 7, 'Sololá', 714, 'Santa Cruz La Laguna', 2.7000, 6.6000, 3.3000, 5.0000, 4.2000, 8.8598, 4.2620, 5.4000, 2.1695, 2.7000, 6.7000, 2.4000, 4.9000, 7.7000, 5.9000, 6.0000, 3.8000, 2.9000, 6.9000, 4.4000, 5.8000, 4.9000, 246, 6, 0.1579, NULL);
INSERT INTO public.home_conred VALUES (100, 7, 'Sololá', 715, 'San Pablo La Laguna', 1.7000, 6.8000, 3.1000, 4.7000, 3.9000, 8.3931, 3.8582, 5.4000, 3.5427, 3.4000, 6.3000, 3.5000, 5.1000, 8.8000, 7.7000, 7.7000, 2.5000, 3.0000, 8.3000, 4.9000, 6.9000, 5.2000, 181, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (101, 7, 'Sololá', 716, 'San Marcos La Laguna', 1.5000, 5.0000, 3.8000, 3.4000, 3.6000, 8.4739, 3.3036, 4.6000, 2.9137, 2.2000, 6.0000, 2.6000, 4.5000, 8.8000, 5.3000, 7.5000, 2.9000, 2.5000, 7.4000, 4.8000, 6.3000, 4.7000, 282, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (102, 7, 'Sololá', 717, 'San Juan La Laguna', 4.2000, 7.1000, 2.9000, 5.8000, 4.5000, 9.1641, 3.0670, 5.4000, 6.8566, 4.9000, 6.6000, 6.0000, 6.3000, 7.8000, 6.4000, 9.8000, 2.1000, 4.7000, 7.2000, 6.9000, 7.1000, 5.9000, 43, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (103, 7, 'Sololá', 718, 'San Pedro La Laguna', 1.2000, 7.2000, 3.2000, 4.9000, 4.1000, 8.6926, 4.3773, 4.7000, 4.8289, 3.1000, 6.4000, 4.0000, 5.3000, 8.9000, 5.9000, 8.4000, 4.0000, 3.5000, 7.7000, 5.8000, 6.9000, 5.3000, 157, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (104, 7, 'Sololá', 719, 'Santiago Atitlán', 1.4000, 7.8000, 3.3000, 5.4000, 4.4000, 8.8447, 8.5279, 5.3000, 5.9632, 4.9000, 7.9000, 5.5000, 6.9000, 7.8000, 6.9000, 8.7000, 2.4000, 4.2000, 7.4000, 5.9000, 6.7000, 5.9000, 43, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (105, 8, 'Totonicapán', 801, 'Totonicapán', 8.4000, 9.7000, 3.3000, 9.2000, 7.2000, 9.4199, 4.4761, 6.5000, 4.8825, 5.5000, 7.4000, 5.2000, 6.4000, 6.7000, 8.3000, 9.1000, 3.3000, 1.3000, 7.6000, 5.7000, 6.8000, 6.8000, 1, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (106, 8, 'Totonicapán', 802, 'San Cristóbal Totonicapán', 3.1000, 8.3000, 3.0000, 6.4000, 4.9000, 9.1968, 5.2726, 5.3000, 5.1768, 5.0000, 7.1000, 5.1000, 6.2000, 7.9000, 7.4000, 8.6000, 3.6000, 4.1000, 7.7000, 6.0000, 6.9000, 5.9000, 43, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (107, 8, 'Totonicapán', 803, 'San Francisco El Alto', 5.7000, 8.2000, 3.1000, 7.1000, 5.4000, 9.0481, 6.1541, 5.2000, 4.6647, 4.9000, 7.2000, 4.8000, 6.1000, 7.3000, 6.4000, 9.1000, 2.8000, 4.4000, 6.9000, 6.3000, 6.6000, 6.0000, 28, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (108, 8, 'Totonicapán', 804, 'San Andrés Xecul', 0.0000, 8.0000, 3.4000, 5.2000, 4.4000, 8.6601, 3.2737, 5.3000, 2.9268, 3.6000, 6.3000, 3.3000, 5.0000, 7.7000, 4.3000, 8.7000, 1.9000, 3.3000, 6.3000, 5.5000, 5.9000, 5.1000, 199, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (109, 8, 'Totonicapán', 805, 'Momostenango', 6.0000, 7.9000, 3.0000, 7.1000, 5.4000, 9.1881, 3.6539, 5.4000, 6.6829, 4.4000, 6.8000, 5.7000, 6.3000, 6.9000, 3.6000, 8.5000, 2.1000, 5.1000, 5.5000, 5.9000, 5.7000, 5.8000, 63, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (110, 8, 'Totonicapán', 806, 'Santa María Chiquimula', 3.2000, 9.1000, 3.3000, 7.1000, 5.5000, 8.9769, 3.8005, 4.8000, 3.8245, 3.2000, 6.5000, 3.5000, 5.2000, 6.6000, 6.7000, 7.9000, 5.0000, 4.6000, 6.7000, 6.1000, 6.4000, 5.7000, 80, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (111, 8, 'Totonicapán', 807, 'Santa Lucía La Reforma', 0.1000, 2.5000, 4.0000, 1.4000, 2.8000, 5.1350, 4.5349, 3.3000, 2.0393, 2.0000, 4.4000, 2.0000, 3.3000, 7.2000, 2.2000, 3.6000, 2.3000, 3.7000, 5.2000, 3.2000, 4.3000, 3.4000, 338, 6, 0.1579, NULL);
INSERT INTO public.home_conred VALUES (112, 8, 'Totonicapán', 808, 'San Bartolo Aguas Calientes', 3.0000, 7.2000, 3.9000, 5.5000, 4.8000, 8.0953, 5.1174, 4.4000, 2.8940, 3.4000, 6.2000, 3.2000, 4.9000, 8.0000, 5.2000, 7.5000, 2.5000, 3.0000, 6.8000, 4.8000, 5.9000, 5.2000, 181, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (113, 9, 'Quetzaltenango', 901, 'Quetzaltenango', 8.9000, 7.7000, 3.7000, 8.4000, 6.6000, 8.4525, 3.8005, 4.3000, 3.2387, 3.5000, 6.0000, 3.4000, 4.8000, 7.9000, 6.6000, 7.0000, 4.0000, 0.5000, 7.3000, 4.3000, 6.0000, 5.7000, 80, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (114, 9, 'Quetzaltenango', 902, 'Salcajá', 0.7000, 6.1000, 3.2000, 3.9000, 3.6000, 8.6403, 3.5383, 4.9000, 4.9729, 4.2000, 6.2000, 4.6000, 5.5000, 8.2000, 7.0000, 9.2000, 4.0000, 5.3000, 7.7000, 6.8000, 7.3000, 5.2000, 181, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (115, 9, 'Quetzaltenango', 903, 'Olintepeque', 3.6000, 6.2000, 4.7000, 5.0000, 4.9000, 8.1331, 3.8865, 4.2000, 2.7574, 3.2000, 5.8000, 3.0000, 4.5000, 7.2000, 6.2000, 6.5000, 3.2000, 5.9000, 6.7000, 5.4000, 6.1000, 5.1000, 199, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (116, 9, 'Quetzaltenango', 904, 'San Carlos Sija', 5.3000, 4.8000, 3.7000, 5.1000, 4.4000, 4.1885, 3.5709, 3.4000, 1.4696, 1.2000, 3.7000, 1.3000, 2.6000, 7.3000, 5.3000, 4.6000, 1.8000, 4.8000, 6.4000, 3.9000, 5.3000, 3.9000, 330, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (117, 9, 'Quetzaltenango', 905, 'Sibilia', 5.5000, 5.3000, 3.1000, 5.4000, 4.3000, 8.0866, 1.5116, 4.3000, 1.2911, 2.5000, 5.3000, 1.9000, 3.8000, 7.3000, 4.8000, 6.3000, 3.4000, 2.8000, 6.2000, 4.4000, 5.4000, 4.5000, 302, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (118, 9, 'Quetzaltenango', 906, 'Cabricán', 3.7000, 5.2000, 3.4000, 4.5000, 4.0000, 8.2161, 5.6702, 3.2000, 1.3474, 2.1000, 6.1000, 1.7000, 4.2000, 6.7000, 4.5000, 1.5000, 3.7000, 4.3000, 5.7000, 3.3000, 4.6000, 4.3000, 315, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (119, 9, 'Quetzaltenango', 907, 'Cajolá', 3.2000, 4.5000, 5.3000, 3.9000, 4.6000, 4.9922, 3.9601, 3.5000, 1.8665, 2.1000, 4.2000, 2.0000, 3.2000, 7.9000, 5.4000, 5.4000, 3.7000, 4.6000, 6.8000, 4.6000, 5.8000, 4.4000, 307, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (120, 9, 'Quetzaltenango', 908, 'San Miguel Siguilá', 3.2000, 8.7000, 2.9000, 6.7000, 5.1000, 9.5330, 3.0030, 5.9000, 6.9960, 5.4000, 7.1000, 6.3000, 6.7000, 8.2000, 8.4000, 9.6000, 3.8000, 5.6000, 8.3000, 7.2000, 7.8000, 6.4000, 5, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (121, 9, 'Quetzaltenango', 909, 'San Juan Ostuncalco', 7.1000, 5.8000, 2.9000, 6.5000, 5.0000, 9.1504, 2.6385, 6.0000, 8.4028, 5.0000, 6.7000, 7.0000, 6.9000, 7.3000, 4.7000, 8.3000, 3.3000, 5.2000, 6.2000, 6.0000, 6.1000, 5.9000, 43, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (122, 9, 'Quetzaltenango', 910, 'San Mateo', 2.3000, 5.5000, 3.7000, 4.1000, 3.9000, 8.5041, 4.5605, 4.6000, 3.1395, 2.8000, 6.3000, 3.0000, 4.9000, 8.8000, 4.5000, 8.5000, 3.1000, 6.3000, 7.2000, 6.5000, 6.9000, 5.1000, 199, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (123, 9, 'Quetzaltenango', 911, 'Concepción Chiquirichapa', 4.0000, 7.5000, 3.2000, 6.0000, 4.8000, 6.9854, 3.2663, 3.6000, 3.9096, 3.6000, 4.9000, 3.8000, 4.4000, 7.4000, 6.3000, 7.9000, 2.7000, 6.6000, 6.9000, 6.2000, 6.6000, 5.2000, 181, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (124, 9, 'Quetzaltenango', 912, 'San Martín Sacatepéquez', 6.3000, 7.8000, 3.1000, 7.1000, 5.4000, 9.4641, 4.4761, 6.5000, 6.1050, 3.7000, 7.4000, 5.0000, 6.3000, 7.8000, 6.8000, 9.3000, 4.1000, 5.4000, 7.3000, 6.9000, 7.1000, 6.2000, 16, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (125, 9, 'Quetzaltenango', 913, 'Almolonga', 1.5000, 6.4000, 3.1000, 4.4000, 3.8000, 9.6918, 3.7726, 5.7000, 2.8907, 3.6000, 7.3000, 3.3000, 5.7000, 9.2000, 6.5000, 6.7000, 2.5000, 6.6000, 8.1000, 5.6000, 7.0000, 5.3000, 157, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (126, 9, 'Quetzaltenango', 914, 'Cantel', 3.2000, 9.3000, 3.1000, 7.3000, 5.6000, 8.7988, 3.9952, 5.6000, 3.0750, 4.2000, 6.6000, 3.7000, 5.3000, 7.4000, 6.5000, 8.1000, 3.4000, 5.3000, 7.0000, 6.0000, 6.5000, 5.8000, 63, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (127, 9, 'Quetzaltenango', 915, 'Huitán', 3.3000, 7.2000, 2.9000, 5.6000, 4.4000, 9.5560, 5.6248, 6.3000, 6.8369, 4.7000, 7.7000, 5.9000, 6.9000, 8.3000, 6.7000, 8.9000, 4.2000, 4.1000, 7.6000, 6.4000, 7.0000, 6.0000, 28, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (128, 9, 'Quetzaltenango', 916, 'Zunil', 5.2000, 6.9000, 2.9000, 6.1000, 4.7000, 9.1844, 5.0074, 6.0000, 6.3382, 4.2000, 7.2000, 5.4000, 6.4000, 5.9000, 7.0000, 9.4000, 3.7000, 5.0000, 6.5000, 6.8000, 6.7000, 5.9000, 43, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (129, 9, 'Quetzaltenango', 917, 'Colomba Costa Cuca', 7.5000, 4.8000, 4.2000, 6.3000, 5.3000, 6.8888, 5.1686, 4.9000, 3.2635, 2.9000, 5.7000, 3.1000, 4.5000, 7.2000, 4.7000, 8.4000, 2.5000, 6.5000, 6.1000, 6.4000, 6.3000, 5.3000, 157, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (130, 9, 'Quetzaltenango', 918, 'San Francisco La Unión', 2.1000, 6.3000, 4.5000, 4.5000, 4.5000, 7.5128, 5.6848, 4.3000, 3.2137, 3.5000, 6.0000, 3.4000, 4.8000, 8.1000, 7.1000, 8.9000, 5.5000, 3.6000, 7.6000, 6.6000, 7.1000, 5.4000, 143, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (131, 9, 'Quetzaltenango', 919, 'El Palmar', 5.5000, 6.9000, 4.0000, 6.3000, 5.3000, 6.7241, 3.7035, 4.9000, 3.2311, 2.7000, 5.2000, 3.0000, 4.2000, 2.9000, 6.0000, 7.5000, 2.8000, 5.4000, 4.6000, 5.6000, 5.1000, 4.8000, 265, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (132, 9, 'Quetzaltenango', 920, 'Coatepeque', 6.7000, 7.2000, 4.1000, 7.0000, 5.7000, 8.4675, 4.7632, 5.3000, 3.8385, 2.4000, 6.5000, 3.2000, 5.1000, 4.2000, 6.3000, 9.1000, 3.2000, 1.4000, 5.3000, 5.7000, 5.5000, 5.4000, 143, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (133, 9, 'Quetzaltenango', 921, 'Génova Costa Cuca', 3.0000, 5.6000, 3.4000, 4.4000, 3.9000, 7.1950, 1.8605, 5.8000, 6.3533, 3.4000, 5.3000, 5.1000, 5.2000, 6.6000, 8.6000, 7.0000, 4.3000, 5.1000, 7.7000, 5.6000, 6.8000, 5.2000, 181, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (134, 9, 'Quetzaltenango', 922, 'Flores Costa Cuca', 4.5000, 4.7000, 3.4000, 4.6000, 4.0000, 8.9465, 3.8263, 4.7000, 2.9033, 2.0000, 6.5000, 2.5000, 4.8000, 8.9000, 6.6000, 6.4000, 2.6000, 5.2000, 8.0000, 4.9000, 6.7000, 5.0000, 224, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (135, 9, 'Quetzaltenango', 923, 'La Esperanza', 3.2000, 6.0000, 4.1000, 4.8000, 4.5000, 8.9428, 3.9989, 5.2000, 3.7514, 2.6000, 6.6000, 3.2000, 5.1000, 7.9000, 7.0000, 7.8000, 4.4000, 7.0000, 7.5000, 6.6000, 7.1000, 5.5000, 114, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (136, 9, 'Quetzaltenango', 924, 'Palestina De Los Altos', 7.1000, 5.8000, 6.3000, 6.5000, 6.4000, 5.2640, 4.2979, 3.0000, 1.5833, 2.8000, 4.2000, 2.2000, 3.3000, 7.6000, 5.4000, 4.7000, 2.3000, 5.1000, 6.6000, 4.1000, 5.5000, 4.9000, 246, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (137, 10, 'Suchitepéquez', 1001, 'Mazatenango', 7.7000, 5.1000, 3.0000, 6.6000, 5.1000, 9.1500, 6.4635, 5.2000, 7.6415, 5.6000, 7.3000, 6.7000, 7.0000, 6.5000, 5.5000, 8.7000, 2.9000, 0.8000, 6.0000, 5.2000, 5.6000, 5.8000, 63, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (138, 10, 'Suchitepéquez', 1002, 'Cuyotenango', 4.6000, 4.1000, 3.7000, 4.4000, 4.1000, 8.6036, 4.6080, 4.9000, 2.7393, 4.3000, 6.4000, 3.6000, 5.2000, 7.3000, 6.2000, 6.2000, 2.7000, 5.4000, 6.8000, 4.9000, 5.9000, 5.0000, 224, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (139, 10, 'Suchitepéquez', 1003, 'San Francisco Zapotitlán', 3.3000, 3.5000, 4.1000, 3.4000, 3.8000, 7.7413, 4.7001, 4.5000, 3.1054, 3.3000, 5.9000, 3.2000, 4.7000, 8.9000, 5.6000, 8.2000, 2.6000, 9.8000, 7.6000, 7.9000, 7.8000, 5.2000, 181, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (140, 10, 'Suchitepéquez', 1004, 'San Bernardino', 1.2000, 4.0000, 3.1000, 2.7000, 2.9000, 9.2960, 3.4198, 6.4000, 6.6952, 5.5000, 7.1000, 6.1000, 6.6000, 8.8000, 6.4000, 8.6000, 4.1000, 10.0000, 7.8000, 8.4000, 8.1000, 5.4000, 143, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (141, 10, 'Suchitepéquez', 1005, 'San José El Ídolo', 2.1000, 7.7000, 3.1000, 5.6000, 4.5000, 9.2224, 3.9655, 7.0000, 7.0623, 5.6000, 7.3000, 6.4000, 6.9000, 8.1000, 5.0000, 9.0000, 5.3000, 4.5000, 6.8000, 6.8000, 6.8000, 6.0000, 28, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (142, 10, 'Suchitepéquez', 1006, 'Santo Domingo Suchitepéquez', 5.9000, 4.3000, 3.0000, 5.2000, 4.2000, 7.5371, 4.9192, 5.2000, 4.8079, 6.0000, 6.0000, 5.4000, 5.7000, 6.6000, 4.1000, 8.5000, 4.2000, 6.2000, 5.5000, 6.7000, 6.1000, 5.3000, 157, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (143, 10, 'Suchitepéquez', 1007, 'San Lorenzo', 5.1000, 2.6000, 5.3000, 4.0000, 4.7000, 8.2686, 4.2576, 4.3000, 1.6308, 3.2000, 6.0000, 2.5000, 4.5000, 6.9000, 4.0000, 3.4000, 2.4000, 10.0000, 5.6000, 6.9000, 6.3000, 5.1000, 199, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (144, 10, 'Suchitepéquez', 1008, 'Samayac', 3.9000, 4.0000, 2.9000, 4.0000, 3.5000, 9.8817, 5.6853, 6.7000, 5.4401, 6.0000, 8.0000, 5.7000, 7.0000, 8.6000, 8.2000, 9.5000, 4.4000, 5.4000, 8.4000, 7.2000, 7.9000, 5.8000, 63, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (145, 10, 'Suchitepéquez', 1009, 'San Pablo Jocopilas', 2.1000, 2.9000, 4.7000, 2.5000, 3.7000, 8.2472, 3.5709, 4.9000, 2.0916, 2.4000, 6.0000, 2.2000, 4.4000, 8.1000, 6.2000, 5.8000, 2.6000, 8.5000, 7.3000, 6.2000, 6.8000, 4.8000, 265, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (146, 10, 'Suchitepéquez', 1010, 'San Antonio Suchitepéquez', 4.5000, 4.7000, 4.0000, 4.6000, 4.3000, 8.9320, 6.2545, 4.3000, 2.6889, 3.9000, 6.9000, 3.3000, 5.4000, 7.7000, 6.3000, 8.0000, 2.9000, 5.6000, 7.1000, 5.9000, 6.5000, 5.3000, 157, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (147, 10, 'Suchitepéquez', 1011, 'San Miguel Panán', 1.5000, 7.0000, 3.8000, 4.8000, 4.3000, 8.3527, 2.3455, 5.2000, 2.9711, 4.2000, 5.9000, 3.6000, 4.9000, 8.1000, 5.4000, 7.2000, 4.3000, 9.0000, 7.0000, 7.3000, 7.2000, 5.3000, 157, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (148, 10, 'Suchitepéquez', 1012, 'San Gabriel', 1.9000, 5.1000, 4.2000, 3.7000, 4.0000, 7.8907, 3.2928, 5.2000, 2.6937, 3.0000, 5.8000, 2.8000, 4.5000, 8.9000, 5.9000, 8.4000, 2.0000, 7.5000, 7.7000, 6.6000, 7.2000, 5.1000, 199, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (149, 10, 'Suchitepéquez', 1013, 'Chicacao', 6.7000, 6.1000, 2.9000, 6.4000, 4.9000, 9.7140, 4.2216, 6.5000, 4.5197, 4.0000, 7.6000, 4.3000, 6.2000, 7.4000, 5.7000, 9.5000, 5.2000, 6.8000, 6.6000, 7.7000, 7.2000, 6.0000, 28, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (150, 10, 'Suchitepéquez', 1014, 'Patulul', 3.3000, 4.5000, 3.2000, 3.9000, 3.6000, 9.0748, 3.9734, 5.1000, 3.0585, 4.0000, 6.7000, 3.5000, 5.3000, 7.1000, 7.5000, 7.5000, 4.6000, 5.0000, 7.3000, 5.9000, 6.7000, 5.0000, 224, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (151, 10, 'Suchitepéquez', 1015, 'Santa Bárbara', 6.0000, 5.0000, 3.9000, 5.5000, 4.8000, 5.5693, 5.4425, 4.2000, 1.7202, 2.5000, 5.1000, 2.1000, 3.8000, 6.3000, 4.6000, 5.2000, 3.4000, 5.7000, 5.5000, 4.8000, 5.2000, 4.6000, 292, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (152, 10, 'Suchitepéquez', 1016, 'San Juan Bautista', 1.2000, 5.4000, 3.6000, 3.6000, 3.6000, 9.1501, 4.6968, 6.3000, 4.5633, 2.6000, 7.2000, 3.6000, 5.7000, 10.0000, 6.3000, 8.7000, 4.0000, 7.1000, 8.8000, 7.0000, 8.0000, 5.5000, 114, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (153, 10, 'Suchitepéquez', 1017, 'Santo Tomás La Unión', 2.5000, 7.5000, 2.9000, 5.5000, 4.3000, 8.6719, 2.7142, 5.5000, 7.5928, 5.6000, 6.2000, 6.7000, 6.5000, 7.9000, 8.9000, 9.4000, 4.7000, 3.7000, 8.4000, 6.8000, 7.7000, 6.0000, 28, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (154, 10, 'Suchitepéquez', 1018, 'Zunilito', 2.3000, 7.2000, 3.2000, 5.2000, 4.3000, 9.2472, 4.2620, 5.9000, 5.6669, 3.5000, 7.1000, 4.7000, 6.0000, 7.6000, 6.8000, 8.7000, 3.7000, 8.0000, 7.2000, 7.3000, 7.3000, 5.7000, 80, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (155, 10, 'Suchitepéquez', 1019, 'Pueblo Nuevo', 4.7000, 4.7000, 2.9000, 4.7000, 3.9000, 9.6642, 6.4074, 4.3000, 7.3951, 5.3000, 7.5000, 6.5000, 7.0000, 8.9000, 5.5000, 9.2000, 5.0000, 4.1000, 7.6000, 6.8000, 7.2000, 5.8000, 63, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (156, 10, 'Suchitepéquez', 1020, 'Río Bravo', 3.1000, 4.9000, 3.4000, 4.1000, 3.8000, 8.6416, 3.9159, 5.4000, 4.4441, 3.9000, 6.4000, 4.2000, 5.4000, 7.6000, 6.6000, 8.6000, 4.5000, 6.3000, 7.1000, 6.8000, 7.0000, 5.2000, 181, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (157, 10, 'Suchitepéquez', 1021, 'San José La Máquina', 2.7000, 3.9000, 2.9000, 3.3000, 3.1000, 9.4184, 2.1951, 5.6000, 3.9126, 4.2000, 6.7000, 4.1000, 5.5000, 7.6000, 8.3000, 8.5000, 4.7000, 6.3000, 8.0000, 6.8000, 7.4000, 5.0000, 224, 6, 0.1579, NULL);
INSERT INTO public.home_conred VALUES (158, 11, 'Retalhuleu', 1101, 'Retalhuleu', 9.0000, 6.5000, 3.9000, 8.0000, 6.4000, 8.9951, 4.0754, 5.2000, 2.8257, 5.1000, 6.7000, 4.1000, 5.5000, 4.5000, 4.2000, 7.6000, 2.1000, 1.7000, 4.4000, 4.4000, 4.4000, 5.4000, 143, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (159, 11, 'Retalhuleu', 1102, 'San Sebastián', 3.6000, 7.9000, 4.3000, 6.2000, 5.3000, 8.6622, 10.0000, 5.3000, 3.9228, 4.1000, 8.6000, 4.0000, 6.9000, 5.1000, 5.8000, 8.3000, 3.1000, 6.8000, 5.5000, 6.5000, 6.0000, 6.0000, 28, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (160, 11, 'Retalhuleu', 1103, 'Santa Cruz Muluá', 3.3000, 0.8000, 3.1000, 2.1000, 2.6000, 7.8944, 1.8189, 3.0000, 0.3541, 4.4000, 4.9000, 2.6000, 3.8000, 7.8000, 2.8000, 4.4000, 2.2000, 4.5000, 5.9000, 3.8000, 4.9000, 3.6000, 335, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (161, 11, 'Retalhuleu', 1104, 'San Martín Zapotitlán', 3.0000, 4.8000, 3.1000, 4.0000, 3.6000, 8.6670, 3.0897, 6.1000, 4.2454, 2.5000, 6.5000, 3.4000, 5.1000, 8.9000, 6.1000, 8.7000, 3.1000, 5.0000, 7.8000, 6.2000, 7.1000, 5.1000, 199, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (162, 11, 'Retalhuleu', 1105, 'San Felipe', 5.0000, 7.0000, 4.6000, 6.1000, 5.4000, 8.7558, 9.7674, 5.6000, 4.0864, 3.4000, 8.5000, 3.8000, 6.7000, 4.7000, 5.5000, 8.4000, 3.2000, 7.3000, 5.1000, 6.8000, 6.0000, 6.0000, 28, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (163, 11, 'Retalhuleu', 1106, 'San Andrés Villa Seca', 6.3000, 4.4000, 3.1000, 5.4000, 4.3000, 8.8251, 3.7252, 4.8000, 3.6695, 5.1000, 6.4000, 4.4000, 5.5000, 7.7000, 4.6000, 6.4000, 3.2000, 6.0000, 6.4000, 5.4000, 5.9000, 5.2000, 181, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (164, 11, 'Retalhuleu', 1107, 'Champerico', 8.1000, 3.9000, 3.8000, 6.5000, 5.3000, 6.7301, 8.7310, 4.0000, 2.8979, 3.4000, 6.9000, 3.2000, 5.3000, 3.0000, 4.0000, 7.3000, 2.7000, 4.7000, 3.5000, 5.2000, 4.4000, 5.0000, 224, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (165, 11, 'Retalhuleu', 1108, 'Nuevo San Carlos', 4.5000, 0.8000, 3.6000, 2.9000, 3.3000, 7.0130, 1.3735, 3.5000, 1.6824, 3.2000, 4.4000, 2.5000, 3.5000, 7.7000, 4.6000, 5.4000, 2.7000, 6.0000, 6.4000, 4.8000, 5.7000, 4.0000, 326, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (166, 11, 'Retalhuleu', 1109, 'El Asintal', 3.8000, 7.3000, 3.5000, 5.8000, 4.8000, 8.7237, 4.6937, 5.3000, 3.8922, 4.1000, 6.6000, 4.0000, 5.4000, 6.8000, 3.3000, 6.7000, 4.8000, 5.8000, 5.3000, 5.8000, 5.6000, 5.3000, 157, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (167, 12, 'San Marcos', 1201, 'San Marcos', 8.7000, 8.0000, 3.1000, 8.4000, 6.5000, 8.8039, 3.4477, 5.3000, 5.7305, 5.0000, 6.4000, 5.4000, 5.9000, 7.2000, 4.8000, 9.1000, 5.8000, 0.0000, 6.1000, 6.2000, 6.2000, 6.2000, 16, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (168, 12, 'San Marcos', 1202, 'San Pedro Sacatepéquez', 8.3000, 8.3000, 3.8000, 8.3000, 6.6000, 8.3186, 3.7197, 4.5000, 3.5330, 3.6000, 6.0000, 3.6000, 4.9000, 7.1000, 5.4000, 7.9000, 2.9000, 6.3000, 6.3000, 6.1000, 6.2000, 5.9000, 43, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (169, 12, 'San Marcos', 1203, 'San Antonio Sacatepéquez', 7.7000, 4.3000, 4.5000, 6.3000, 5.5000, 7.7162, 4.0719, 5.0000, 3.2513, 4.1000, 5.8000, 3.7000, 4.8000, 7.0000, 2.5000, 7.5000, 2.3000, 4.9000, 5.2000, 5.3000, 5.3000, 5.2000, 181, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (170, 12, 'San Marcos', 1204, 'Comitancillo', 7.6000, 5.6000, 3.0000, 6.7000, 5.1000, 9.0987, 4.4782, 6.3000, 6.1598, 6.6000, 7.1000, 6.4000, 6.8000, 2.9000, 7.2000, 9.5000, 2.6000, 5.1000, 5.4000, 6.8000, 6.1000, 6.0000, 28, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (171, 12, 'San Marcos', 1205, 'San Miguel Ixtahuacán', 5.4000, 8.2000, 3.0000, 7.0000, 5.3000, 9.4359, 3.1552, 6.4000, 6.1774, 6.1000, 7.1000, 6.1000, 6.6000, 2.4000, 7.8000, 9.3000, 4.2000, 5.2000, 5.7000, 6.9000, 6.3000, 6.0000, 28, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (172, 12, 'San Marcos', 1206, 'Concepción Tutuapa', 7.6000, 7.4000, 3.1000, 7.5000, 5.7000, 9.1831, 4.1378, 5.5000, 4.4577, 5.7000, 6.9000, 5.1000, 6.1000, 3.6000, 7.3000, 8.0000, 2.5000, 5.4000, 5.8000, 5.8000, 5.8000, 5.9000, 43, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (173, 12, 'San Marcos', 1207, 'Tacaná', 7.6000, 6.8000, 3.4000, 7.2000, 5.6000, 8.5760, 3.7768, 5.9000, 3.2419, 4.4000, 6.5000, 3.8000, 5.3000, 6.9000, 6.1000, 7.4000, 2.4000, 4.3000, 6.5000, 5.1000, 5.8000, 5.6000, 94, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (174, 12, 'San Marcos', 1208, 'Sibinal', 7.6000, 5.2000, 5.5000, 6.6000, 6.1000, 7.4349, 3.7548, 5.1000, 3.0691, 3.8000, 5.7000, 3.4000, 4.7000, 7.2000, 5.8000, 8.1000, 3.3000, 3.0000, 6.6000, 5.4000, 6.0000, 5.6000, 94, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (175, 12, 'San Marcos', 1209, 'Tajumulco', 8.0000, 7.5000, 2.9000, 7.8000, 5.9000, 9.6151, 3.0670, 5.6000, 6.5117, 6.4000, 7.1000, 6.5000, 6.8000, 7.3000, 5.8000, 8.4000, 1.6000, 4.8000, 6.6000, 5.7000, 6.2000, 6.3000, 10, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (176, 12, 'San Marcos', 1210, 'Tejutla', 6.4000, 5.9000, 4.1000, 6.2000, 5.2000, 8.3354, 3.3570, 5.5000, 4.8405, 4.3000, 6.2000, 4.6000, 5.5000, 2.5000, 5.3000, 8.7000, 4.6000, 3.9000, 4.0000, 6.3000, 5.3000, 5.3000, 157, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (177, 12, 'San Marcos', 1211, 'San Rafael Pie De La Cuesta', 5.0000, 8.0000, 3.2000, 6.8000, 5.3000, 9.4304, 4.2957, 5.8000, 4.9660, 5.5000, 7.2000, 5.2000, 6.3000, 7.5000, 5.1000, 9.2000, 3.6000, 3.3000, 6.5000, 6.3000, 6.4000, 6.0000, 28, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (178, 12, 'San Marcos', 1212, 'Nuevo Progreso', 6.3000, 4.7000, 3.0000, 5.6000, 4.4000, 9.5199, 3.5188, 6.0000, 4.1967, 5.5000, 7.2000, 4.9000, 6.2000, 7.1000, 5.6000, 9.1000, 3.0000, 4.8000, 6.4000, 6.4000, 6.4000, 5.6000, 94, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (179, 12, 'San Marcos', 1213, 'El Tumbador', 5.8000, 5.4000, 3.1000, 5.6000, 4.5000, 9.1522, 4.0719, 6.2000, 2.7512, 5.1000, 7.0000, 4.0000, 5.7000, 6.9000, 4.4000, 8.8000, 3.9000, 5.3000, 5.8000, 6.5000, 6.2000, 5.4000, 143, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (180, 12, 'San Marcos', 1214, 'San José El Rodeo', 5.0000, 4.0000, 3.1000, 4.5000, 3.8000, 8.4667, 5.0755, 5.3000, 5.1497, 3.7000, 6.6000, 4.5000, 5.7000, 7.8000, 5.5000, 7.8000, 3.6000, 4.4000, 6.8000, 5.6000, 6.2000, 5.1000, 199, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (181, 12, 'San Marcos', 1215, 'Malacatán', 6.2000, 5.7000, 3.3000, 6.0000, 4.8000, 8.8901, 4.3960, 5.7000, 2.8167, 4.3000, 6.8000, 3.6000, 5.4000, 6.4000, 5.8000, 8.5000, 3.8000, 2.3000, 6.1000, 5.6000, 5.9000, 5.3000, 157, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (182, 12, 'San Marcos', 1216, 'Catarina', 3.9000, 3.9000, 4.2000, 3.9000, 4.1000, 8.1335, 4.0806, 4.7000, 3.5690, 3.6000, 6.0000, 3.6000, 4.9000, 7.2000, 4.9000, 7.3000, 3.2000, 5.4000, 6.2000, 5.5000, 5.9000, 4.9000, 246, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (183, 12, 'San Marcos', 1217, 'Ayutla (Tecún Umán)', 2.8000, 3.3000, 3.8000, 3.1000, 3.5000, 8.1877, 4.4057, 5.1000, 3.4031, 4.7000, 6.2000, 4.1000, 5.2000, 8.0000, 4.0000, 6.7000, 2.8000, 4.8000, 6.4000, 5.0000, 5.7000, 4.7000, 282, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (184, 12, 'San Marcos', 1218, 'Ocós', 2.6000, 5.5000, 3.1000, 4.2000, 3.7000, 9.5703, 3.7252, 5.8000, 5.3667, 6.5000, 7.2000, 6.0000, 6.6000, 8.1000, 7.6000, 9.1000, 2.9000, 3.2000, 7.9000, 6.0000, 7.1000, 5.6000, 94, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (185, 12, 'San Marcos', 1219, 'San Pablo', 6.2000, 5.9000, 5.1000, 6.1000, 5.6000, 5.3493, 4.7524, 3.3000, 0.8965, 2.6000, 4.5000, 1.8000, 3.3000, 6.5000, 2.9000, 2.2000, 2.8000, 5.0000, 5.0000, 3.4000, 4.2000, 4.3000, 315, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (186, 12, 'San Marcos', 1220, 'El Quetzal', 5.5000, 6.9000, 3.4000, 6.3000, 5.0000, 9.0001, 4.6968, 6.3000, 6.6800, 3.7000, 7.1000, 5.4000, 6.3000, 8.1000, 4.6000, 8.8000, 4.3000, 4.3000, 6.7000, 6.4000, 6.6000, 5.9000, 43, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (187, 12, 'San Marcos', 1221, 'La Reforma', 5.9000, 6.4000, 3.0000, 6.2000, 4.8000, 9.2237, 2.5377, 6.1000, 3.3020, 5.6000, 6.8000, 4.6000, 5.8000, 7.2000, 7.5000, 9.8000, 2.9000, 4.2000, 7.4000, 6.9000, 7.2000, 5.9000, 43, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (188, 12, 'San Marcos', 1222, 'Pajapita', 1.7000, 3.2000, 3.3000, 2.5000, 2.9000, 9.4551, 2.9359, 5.4000, 3.5436, 5.1000, 6.9000, 4.4000, 5.8000, 7.3000, 7.8000, 8.4000, 2.1000, 4.5000, 7.6000, 5.7000, 6.8000, 4.9000, 246, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (189, 12, 'San Marcos', 1223, 'Ixchiguán', 7.9000, 2.9000, 4.5000, 6.0000, 5.3000, 6.8084, 3.2904, 4.2000, 1.6529, 2.5000, 5.0000, 2.1000, 3.7000, 6.3000, 5.0000, 6.8000, 2.8000, 3.5000, 5.7000, 4.6000, 5.2000, 4.7000, 282, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (190, 12, 'San Marcos', 1224, 'San José Ojetenam', 7.5000, 5.0000, 3.2000, 6.4000, 5.0000, 8.5684, 0.9915, 5.4000, 6.0686, 5.9000, 5.8000, 6.0000, 5.9000, 7.2000, 6.7000, 9.6000, 5.0000, 3.9000, 7.0000, 7.1000, 7.1000, 5.9000, 43, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (191, 12, 'San Marcos', 1225, 'San Cristóbal Cucho', 7.2000, 3.6000, 3.2000, 5.7000, 4.6000, 8.5951, 8.6047, 6.1000, 4.6024, 4.9000, 7.9000, 4.8000, 6.6000, 6.7000, 6.5000, 8.7000, 3.0000, 5.1000, 6.6000, 6.2000, 6.4000, 5.8000, 63, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (192, 12, 'San Marcos', 1226, 'Sipacapa', 5.6000, 7.8000, 3.4000, 6.8000, 5.3000, 9.6582, 3.2431, 5.9000, 3.0549, 4.0000, 7.2000, 3.5000, 5.7000, 5.6000, 5.9000, 7.6000, 2.6000, 4.2000, 5.8000, 5.2000, 5.5000, 5.5000, 114, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (193, 12, 'San Marcos', 1227, 'Esquipulas Palo Gordo', 6.9000, 6.1000, 4.8000, 6.5000, 5.7000, 8.0855, 6.4077, 3.7000, 1.7415, 4.0000, 6.4000, 2.9000, 4.9000, 7.1000, 6.6000, 2.8000, 4.2000, 4.7000, 6.9000, 3.9000, 5.6000, 5.4000, 143, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (194, 12, 'San Marcos', 1228, 'Río Blanco', 2.6000, 4.8000, 3.4000, 3.8000, 3.6000, 9.2838, 1.2626, 5.5000, 1.9191, 3.5000, 6.5000, 2.7000, 4.9000, 8.8000, 6.9000, 7.0000, 4.1000, 4.8000, 8.0000, 5.4000, 6.9000, 5.0000, 224, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (195, 12, 'San Marcos', 1229, 'San Lorenzo', 2.2000, 7.0000, 3.4000, 5.1000, 4.3000, 9.0878, 5.7166, 5.2000, 4.4112, 5.3000, 7.1000, 4.9000, 6.1000, 7.0000, 4.5000, 6.7000, 3.5000, 3.4000, 5.9000, 4.7000, 5.3000, 5.2000, 181, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (196, 12, 'San Marcos', 1230, 'La Blanca', 1.6000, 4.6000, 3.9000, 3.2000, 3.6000, 6.8327, 5.7145, 3.6000, 1.9306, 2.6000, 5.5000, 2.3000, 4.1000, 3.3000, 5.3000, 5.8000, 2.7000, 3.2000, 4.4000, 4.0000, 4.2000, 4.0000, 326, 7, 0.1842, NULL);
INSERT INTO public.home_conred VALUES (197, 13, 'Huehuetenango', 1301, 'Huehuetenango', 8.2000, 9.4000, 3.0000, 8.9000, 6.9000, 8.3251, 3.9535, 5.4000, 6.9548, 5.5000, 6.3000, 6.3000, 6.3000, 6.6000, 5.0000, 8.8000, 2.9000, 0.7000, 5.9000, 5.3000, 5.6000, 6.2000, 16, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (198, 13, 'Huehuetenango', 1302, 'Chiantla', 7.8000, 8.0000, 4.9000, 7.9000, 6.6000, 9.2187, 3.7299, 4.7000, 3.1150, 3.5000, 6.6000, 3.3000, 5.2000, 6.6000, 3.2000, 6.6000, 2.2000, 5.3000, 5.1000, 5.0000, 5.1000, 5.6000, 94, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (199, 13, 'Huehuetenango', 1303, 'Malacatancito', 4.7000, 8.7000, 3.2000, 7.2000, 5.5000, 8.3741, 7.4110, 5.2000, 4.3821, 4.8000, 7.2000, 4.6000, 6.1000, 7.1000, 5.2000, 8.1000, 3.4000, 5.2000, 6.2000, 6.0000, 6.1000, 5.9000, 43, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (200, 13, 'Huehuetenango', 1304, 'Cuilco', 9.1000, 7.8000, 3.6000, 8.5000, 6.7000, 8.4231, 3.9735, 5.2000, 4.4184, 2.5000, 6.3000, 3.5000, 5.1000, 6.4000, 7.0000, 8.3000, 2.6000, 4.4000, 6.7000, 5.7000, 6.2000, 6.0000, 28, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (201, 13, 'Huehuetenango', 1305, 'Nentón', 3.5000, 6.1000, 5.2000, 4.9000, 5.1000, 4.8509, 4.2576, 3.8000, 0.0000, 2.0000, 4.3000, 1.0000, 2.8000, 6.4000, 3.9000, 2.6000, 2.6000, 4.9000, 5.3000, 3.4000, 4.4000, 4.0000, 326, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (202, 13, 'Huehuetenango', 1306, 'San Pedro Necta', 6.9000, 6.6000, 3.0000, 6.8000, 5.2000, 9.4853, 3.4054, 5.6000, 4.9790, 4.8000, 7.0000, 4.9000, 6.1000, 7.3000, 5.2000, 9.0000, 3.5000, 2.5000, 6.4000, 5.9000, 6.2000, 5.8000, 63, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (203, 13, 'Huehuetenango', 1307, 'Jacaltenango', 2.6000, 8.3000, 3.8000, 6.2000, 5.1000, 8.1870, 4.3544, 4.6000, 3.8650, 4.1000, 6.1000, 4.0000, 5.1000, 6.8000, 3.9000, 8.5000, 4.5000, 4.9000, 5.5000, 6.4000, 6.0000, 5.4000, 143, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (204, 13, 'Huehuetenango', 1308, 'San Pedro Soloma', 4.1000, 6.7000, 4.4000, 5.5000, 5.0000, 8.7422, 3.0507, 4.7000, 3.1714, 3.1000, 6.1000, 3.1000, 4.8000, 6.6000, 8.0000, 4.8000, 4.1000, 5.0000, 7.4000, 4.6000, 6.2000, 5.3000, 157, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (205, 13, 'Huehuetenango', 1309, 'San Ildefonso Ixtahuacán', 6.5000, 6.8000, 2.9000, 6.7000, 5.1000, 9.1050, 2.8906, 5.8000, 5.8560, 5.7000, 6.7000, 5.8000, 6.3000, 7.0000, 7.8000, 8.9000, 3.6000, 5.6000, 7.4000, 6.6000, 7.0000, 6.1000, 23, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (206, 13, 'Huehuetenango', 1310, 'Santa Bárbara', 0.1000, 5.3000, 3.5000, 3.1000, 3.3000, 8.2096, 4.0889, 5.0000, 2.1969, 2.5000, 6.1000, 2.3000, 4.5000, 6.8000, 5.7000, 5.0000, 2.8000, 5.2000, 6.3000, 4.4000, 5.4000, 4.3000, 315, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (207, 13, 'Huehuetenango', 1311, 'La Libertad', 4.5000, 8.4000, 3.7000, 6.9000, 5.5000, 4.8945, 3.5383, 5.1000, 4.7390, 3.7000, 4.5000, 4.2000, 4.4000, 6.3000, 6.4000, 9.0000, 5.6000, 5.4000, 6.4000, 7.1000, 6.8000, 5.5000, 114, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (208, 13, 'Huehuetenango', 1312, 'La Democracia', 6.2000, 5.9000, 3.2000, 6.1000, 4.8000, 9.2726, 3.0922, 4.2000, 1.6474, 3.2000, 6.4000, 2.5000, 4.7000, 6.9000, 4.4000, 4.6000, 3.1000, 4.9000, 5.8000, 4.2000, 5.1000, 4.9000, 246, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (209, 13, 'Huehuetenango', 1313, 'San Miguel Acatán', 0.9000, 7.3000, 3.1000, 4.9000, 4.1000, 8.3586, 4.4662, 5.6000, 9.0389, 4.2000, 6.5000, 7.3000, 6.9000, 6.8000, 4.0000, 9.2000, 3.4000, 5.0000, 5.6000, 6.6000, 6.1000, 5.6000, 94, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (210, 13, 'Huehuetenango', 1314, 'San Rafael La Independencia', 0.0000, 6.6000, 5.0000, 4.0000, 4.5000, 4.2506, 4.2320, 3.7000, 1.2840, 1.2000, 4.1000, 1.2000, 2.8000, 8.3000, 4.0000, 5.8000, 3.1000, 3.3000, 6.6000, 4.2000, 5.5000, 4.1000, 325, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (211, 13, 'Huehuetenango', 1315, 'Todos Santos Cuchumatán', 5.8000, 6.6000, 6.3000, 6.2000, 6.3000, 8.8234, 4.1957, 4.7000, 2.1702, 2.2000, 6.4000, 2.2000, 4.6000, 6.4000, 6.5000, 6.6000, 2.2000, 5.1000, 6.5000, 4.9000, 5.8000, 5.5000, 114, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (212, 13, 'Huehuetenango', 1316, 'San Juan Atitán', 5.4000, 8.6000, 3.0000, 7.3000, 5.6000, 8.7704, 3.3316, 6.6000, 4.9958, 5.2000, 6.8000, 5.1000, 6.0000, 7.3000, 6.6000, 9.8000, 3.9000, 5.2000, 7.0000, 7.3000, 7.2000, 6.2000, 16, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (213, 13, 'Huehuetenango', 1317, 'Santa Eulalia', 2.3000, 5.3000, 3.5000, 4.0000, 3.8000, 9.6032, 3.0226, 5.8000, 3.1316, 3.7000, 7.1000, 3.4000, 5.5000, 6.8000, 7.2000, 5.2000, 2.9000, 5.0000, 7.0000, 4.4000, 5.9000, 5.0000, 224, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (214, 13, 'Huehuetenango', 1318, 'San Mateo Ixtatán', 2.0000, 7.1000, 3.9000, 5.1000, 4.5000, 8.4168, 3.8005, 5.5000, 3.9262, 3.8000, 6.3000, 3.9000, 5.2000, 6.4000, 6.6000, 6.8000, 3.3000, 5.2000, 6.5000, 5.3000, 5.9000, 5.2000, 181, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (215, 13, 'Huehuetenango', 1319, 'Colotenango', 4.9000, 6.0000, 5.2000, 5.5000, 5.4000, 5.1577, 5.6702, 3.3000, 0.8865, 2.3000, 4.8000, 1.6000, 3.4000, 6.8000, 2.3000, 0.0000, 4.3000, 5.0000, 4.9000, 3.4000, 4.2000, 4.3000, 315, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (216, 13, 'Huehuetenango', 1320, 'San Sebastián Huehuetenango', 7.0000, 7.8000, 4.8000, 7.4000, 6.3000, 8.5174, 4.4686, 5.5000, 3.2488, 3.8000, 6.5000, 3.5000, 5.2000, 7.4000, 1.6000, 7.0000, 3.1000, 5.1000, 5.2000, 5.3000, 5.3000, 5.6000, 94, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (217, 13, 'Huehuetenango', 1321, 'Tectitán', 8.1000, 6.8000, 3.1000, 7.5000, 5.7000, 9.0141, 2.1951, 5.8000, 3.4661, 5.9000, 6.5000, 4.8000, 5.7000, 6.8000, 5.8000, 8.5000, 3.3000, 3.0000, 6.3000, 5.6000, 6.0000, 5.8000, 63, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (218, 13, 'Huehuetenango', 1322, 'Concepción Huista', 0.1000, 3.6000, 4.2000, 2.0000, 3.2000, 6.5083, 6.2171, 3.0000, 1.0933, 1.6000, 5.4000, 1.3000, 3.6000, 7.2000, 3.1000, 2.7000, 3.4000, 4.4000, 5.5000, 3.5000, 4.6000, 3.8000, 332, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (219, 13, 'Huehuetenango', 1323, 'San Juan Ixcoy', 4.6000, 6.4000, 6.4000, 5.6000, 6.0000, 9.5063, 5.1093, 4.1000, 1.6760, 3.2000, 7.0000, 2.5000, 5.2000, 8.1000, 3.8000, 4.6000, 2.6000, 5.2000, 6.4000, 4.2000, 5.4000, 5.5000, 114, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (220, 13, 'Huehuetenango', 1324, 'San Antonio Huista', 1.7000, 6.2000, 3.5000, 4.3000, 3.9000, 9.1115, 6.0608, 5.0000, 2.5414, 3.6000, 7.2000, 3.1000, 5.5000, 7.0000, 6.8000, 7.7000, 3.4000, 4.7000, 6.9000, 5.6000, 6.3000, 5.1000, 199, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (221, 13, 'Huehuetenango', 1325, 'San Sebastián Coatán', 0.1000, 7.9000, 4.0000, 5.2000, 4.6000, 9.4272, 3.5135, 7.4000, 6.7394, 4.1000, 7.5000, 5.6000, 6.7000, 6.6000, 3.7000, 9.5000, 4.5000, 5.6000, 5.3000, 7.2000, 6.3000, 5.8000, 63, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (222, 13, 'Huehuetenango', 1326, 'Santa Cruz Barillas', 3.5000, 9.3000, 2.9000, 7.4000, 5.6000, 8.4131, 4.1254, 5.0000, 3.2319, 3.6000, 6.2000, 3.4000, 5.0000, 7.0000, 7.2000, 7.8000, 3.0000, 3.7000, 7.1000, 5.3000, 6.3000, 5.6000, 94, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (223, 13, 'Huehuetenango', 1327, 'Aguacatán', 5.6000, 6.6000, 2.9000, 6.1000, 4.7000, 9.3753, 3.2434, 6.4000, 10.0000, 5.3000, 7.1000, 8.6000, 7.9000, 6.8000, 6.9000, 9.8000, 3.0000, 4.6000, 6.9000, 7.0000, 7.0000, 6.4000, 5, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (224, 13, 'Huehuetenango', 1328, 'San Rafael Petzal', 3.6000, 7.0000, 4.1000, 5.6000, 4.9000, 9.0418, 5.5732, 5.1000, 2.1447, 3.0000, 7.0000, 2.6000, 5.2000, 8.0000, 5.9000, 7.7000, 3.0000, 4.7000, 7.1000, 5.5000, 6.4000, 5.5000, 114, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (225, 13, 'Huehuetenango', 1329, 'San Gaspar Ixchil', 3.4000, 4.4000, 3.6000, 3.9000, 3.8000, 8.1316, 4.1466, 5.4000, 2.7936, 3.5000, 6.2000, 3.2000, 4.9000, 7.1000, 7.0000, 6.8000, 4.2000, 4.3000, 7.1000, 5.2000, 6.2000, 4.9000, 246, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (226, 13, 'Huehuetenango', 1330, 'Santiago Chimaltenango', 4.5000, 4.6000, 2.9000, 4.6000, 3.8000, 9.5321, 1.7437, 5.6000, 4.8528, 5.8000, 6.8000, 5.3000, 6.1000, 9.0000, 7.4000, 8.4000, 2.8000, 4.6000, 8.3000, 5.8000, 7.2000, 5.5000, 114, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (227, 13, 'Huehuetenango', 1331, 'Santa Ana Huista', 3.2000, 5.4000, 3.2000, 4.4000, 3.8000, 8.2921, 3.5709, 5.2000, 3.0854, 2.3000, 6.1000, 2.7000, 4.6000, 8.3000, 6.7000, 8.9000, 2.6000, 3.8000, 7.6000, 5.9000, 6.8000, 4.9000, 246, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (228, 13, 'Huehuetenango', 1332, 'Unión Cantinil', 5.2000, 3.0000, 5.1000, 4.2000, 4.7000, 5.3145, 4.8761, 2.9000, 0.5865, 2.0000, 4.4000, 1.3000, 3.0000, 6.8000, 1.5000, 0.5000, 3.0000, 5.1000, 4.7000, 3.1000, 3.9000, 3.8000, 332, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (229, 13, 'Huehuetenango', 1333, 'Petatán', 0.1000, 7.8000, 3.6000, 5.1000, 4.4000, 7.0327, 4.3338, 4.3000, 2.9447, 1.6000, 5.4000, 2.3000, 4.0000, 8.6000, 4.0000, 8.3000, 3.4000, 4.2000, 6.9000, 5.8000, 6.4000, 4.8000, 265, 12, 0.3158, NULL);
INSERT INTO public.home_conred VALUES (230, 14, 'Quiché', 1401, 'Santa Cruz Del Quiché', 6.0000, 6.2000, 3.6000, 6.1000, 5.0000, 9.4012, 2.4665, 7.3000, 6.9320, 6.1000, 7.3000, 6.5000, 6.9000, 6.9000, 3.1000, 9.3000, 5.3000, 0.9000, 5.3000, 6.4000, 5.9000, 5.9000, 43, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (231, 14, 'Quiché', 1402, 'Chiché', 1.1000, 5.9000, 2.9000, 3.9000, 3.4000, 9.3245, 3.3493, 6.1000, 8.0702, 5.6000, 7.0000, 7.0000, 7.0000, 7.3000, 4.7000, 9.3000, 4.1000, 4.5000, 6.2000, 6.7000, 6.5000, 5.4000, 143, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (232, 14, 'Quiché', 1403, 'Chinique', 0.3000, 5.6000, 6.3000, 3.4000, 5.0000, 8.0635, 4.0312, 4.1000, 2.6260, 2.2000, 5.8000, 2.4000, 4.3000, 7.9000, 4.5000, 5.2000, 3.6000, 3.9000, 6.5000, 4.3000, 5.5000, 4.9000, 246, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (233, 14, 'Quiché', 1404, 'Zacualpa', 0.1000, 8.2000, 3.3000, 5.4000, 4.4000, 9.7840, 2.5128, 5.2000, 2.8076, 3.7000, 7.0000, 3.3000, 5.4000, 7.1000, 5.8000, 6.3000, 2.6000, 5.3000, 6.5000, 4.9000, 5.8000, 5.2000, 181, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (234, 14, 'Quiché', 1405, 'Chajul', 4.4000, 5.9000, 4.0000, 5.2000, 4.6000, 8.4001, 4.0530, 5.0000, 3.0959, 3.2000, 6.2000, 3.1000, 4.8000, 1.5000, 7.2000, 6.2000, 3.4000, 3.2000, 5.0000, 4.4000, 4.7000, 4.7000, 282, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (235, 14, 'Quiché', 1406, 'Santo Tomás Chichicastenango', 6.6000, 8.1000, 3.0000, 7.4000, 5.6000, 9.3766, 4.3018, 6.3000, 7.2526, 5.7000, 7.3000, 6.5000, 6.9000, 6.4000, 7.9000, 9.9000, 3.8000, 5.5000, 7.2000, 7.4000, 7.3000, 6.6000, 2, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (236, 14, 'Quiché', 1407, 'Patzité', 1.7000, 6.1000, 2.9000, 4.2000, 3.6000, 8.2596, 6.4971, 5.2000, 4.4865, 3.8000, 6.8000, 4.2000, 5.7000, 7.5000, 5.9000, 8.3000, 4.5000, 4.1000, 6.8000, 6.0000, 6.4000, 5.1000, 199, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (237, 14, 'Quiché', 1408, 'San Antonio Ilotenango', 0.3000, 4.0000, 3.1000, 2.3000, 2.7000, 9.5925, 5.1694, 6.2000, 7.0015, 4.8000, 7.6000, 6.0000, 6.9000, 7.9000, 5.5000, 8.0000, 4.4000, 4.2000, 6.9000, 5.9000, 6.4000, 4.9000, 246, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (238, 14, 'Quiché', 1409, 'San Pedro Jocopilas', 1.6000, 8.5000, 2.9000, 6.1000, 4.7000, 9.1424, 5.8916, 5.8000, 5.8457, 6.1000, 7.3000, 6.0000, 6.7000, 6.9000, 8.9000, 9.7000, 3.7000, 5.7000, 8.1000, 7.3000, 7.7000, 6.2000, 16, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (239, 14, 'Quiché', 1410, 'Cunén', 5.6000, 7.3000, 3.1000, 6.5000, 5.0000, 9.4974, 4.3441, 5.9000, 4.1074, 5.9000, 7.3000, 5.1000, 6.3000, 7.3000, 8.4000, 9.4000, 4.3000, 5.4000, 7.9000, 7.1000, 7.5000, 6.2000, 16, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (240, 14, 'Quiché', 1411, 'San Juan Cotzal', 6.4000, 5.8000, 3.1000, 6.1000, 4.8000, 9.5836, 3.3562, 6.2000, 5.0598, 5.0000, 7.2000, 5.0000, 6.2000, 1.9000, 3.2000, 9.0000, 6.4000, 3.2000, 2.6000, 6.8000, 5.1000, 5.3000, 157, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (241, 14, 'Quiché', 1412, 'Joyabaj', 1.9000, 4.9000, 5.7000, 3.5000, 4.7000, 6.0406, 4.3338, 4.1000, 2.0394, 3.1000, 4.9000, 2.6000, 3.8000, 6.0000, 3.5000, 5.8000, 2.9000, 3.5000, 4.9000, 4.2000, 4.6000, 4.3000, 315, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (242, 14, 'Quiché', 1413, 'Nebaj', 6.3000, 8.2000, 3.1000, 7.4000, 5.7000, 8.4276, 2.8351, 5.9000, 4.5261, 4.8000, 6.2000, 4.7000, 5.5000, 0.9000, 4.3000, 9.0000, 2.5000, 2.0000, 2.8000, 5.6000, 4.3000, 5.1000, 199, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (243, 14, 'Quiché', 1414, 'San Andrés Sajcabajá', 2.4000, 5.3000, 3.4000, 4.0000, 3.7000, 8.2313, 3.0233, 5.6000, 4.0226, 4.4000, 6.1000, 4.2000, 5.2000, 6.6000, 5.4000, 8.1000, 4.0000, 4.6000, 6.0000, 5.9000, 6.0000, 4.9000, 246, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (244, 14, 'Quiché', 1415, 'San Miguel Uspantán', 7.6000, 7.4000, 3.3000, 7.5000, 5.8000, 8.3185, 8.3249, 4.9000, 3.8208, 4.5000, 7.5000, 4.2000, 6.1000, 6.9000, 4.8000, 6.7000, 2.9000, 2.9000, 6.0000, 4.4000, 5.3000, 5.7000, 80, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (245, 14, 'Quiché', 1416, 'Sacapulas', 2.9000, 7.3000, 3.7000, 5.5000, 4.7000, 8.8990, 4.4927, 5.5000, 2.8591, 3.5000, 6.8000, 3.2000, 5.3000, 6.3000, 3.4000, 7.4000, 2.2000, 4.9000, 5.0000, 5.2000, 5.1000, 5.0000, 224, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (246, 14, 'Quiché', 1417, 'San Bartolomé Jocotenango', 0.6000, 8.1000, 3.0000, 5.5000, 4.4000, 9.6505, 4.9298, 6.4000, 5.7965, 5.7000, 7.6000, 5.7000, 6.8000, 7.0000, 5.4000, 9.2000, 5.0000, 3.0000, 6.3000, 6.6000, 6.5000, 5.8000, 63, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (247, 14, 'Quiché', 1418, 'Canillá', 3.0000, 7.8000, 3.9000, 5.9000, 5.0000, 8.8035, 3.6746, 5.6000, 3.4568, 3.5000, 6.6000, 3.5000, 5.3000, 7.2000, 5.4000, 8.5000, 4.5000, 3.4000, 6.4000, 6.0000, 6.2000, 5.5000, 114, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (248, 14, 'Quiché', 1419, 'Chicamán', 3.2000, 8.8000, 2.9000, 6.8000, 5.2000, 9.7146, 3.6709, 6.3000, 4.7631, 5.8000, 7.4000, 5.3000, 6.5000, 6.7000, 8.2000, 9.7000, 5.1000, 4.9000, 7.5000, 7.4000, 7.5000, 6.3000, 10, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (249, 14, 'Quiché', 1420, 'Playa Grande-Ixcán', 5.9000, 7.3000, 3.0000, 6.7000, 5.1000, 9.2113, 3.8608, 5.7000, 4.7540, 6.3000, 6.9000, 5.6000, 6.3000, 6.1000, 8.2000, 8.8000, 3.9000, 2.5000, 7.3000, 5.9000, 6.7000, 6.0000, 28, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (250, 14, 'Quiché', 1421, 'Pachalum', 0.9000, 2.5000, 4.7000, 1.7000, 3.3000, 9.0769, 4.2357, 5.1000, 1.5568, 3.4000, 6.7000, 2.5000, 4.9000, 7.5000, 5.3000, 7.9000, 3.7000, 3.3000, 6.5000, 5.4000, 6.0000, 4.6000, 292, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (251, 15, 'Baja Verapaz', 1501, 'Salamá', 3.5000, 9.9000, 3.0000, 8.1000, 6.2000, 9.1575, 4.4577, 5.8000, 7.0487, 5.4000, 7.0000, 6.3000, 6.7000, 7.4000, 3.1000, 9.6000, 5.0000, 1.0000, 5.7000, 6.6000, 6.2000, 6.4000, 5, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (252, 15, 'Baja Verapaz', 1502, 'San Miguel Chicaj', 1.4000, 8.9000, 3.3000, 6.5000, 5.1000, 8.6583, 2.3304, 6.0000, 4.0519, 4.2000, 6.3000, 4.1000, 5.3000, 3.8000, 6.6000, 7.7000, 3.3000, 4.7000, 5.4000, 5.6000, 5.5000, 5.3000, 157, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (253, 15, 'Baja Verapaz', 1503, 'Rabinal', 2.6000, 9.0000, 2.9000, 6.9000, 5.2000, 9.5195, 4.4782, 6.4000, 8.0182, 5.8000, 7.4000, 7.1000, 7.3000, 3.2000, 8.1000, 9.0000, 3.7000, 1.7000, 6.2000, 5.8000, 6.0000, 6.1000, 23, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (254, 15, 'Baja Verapaz', 1504, 'Cubulco', 2.2000, 9.2000, 3.3000, 7.0000, 5.4000, 9.3234, 3.4348, 4.0000, 5.9527, 5.4000, 6.5000, 5.7000, 6.1000, 3.0000, 3.4000, 9.0000, 5.7000, 4.4000, 3.2000, 6.9000, 5.3000, 5.6000, 94, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (255, 15, 'Baja Verapaz', 1505, 'Granados', 1.5000, 5.6000, 3.4000, 3.8000, 3.6000, 8.9798, 3.3041, 5.6000, 2.7522, 2.3000, 6.6000, 2.5000, 4.9000, 3.2000, 4.1000, 7.9000, 2.6000, 3.7000, 3.7000, 5.2000, 4.5000, 4.3000, 315, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (256, 15, 'Baja Verapaz', 1506, 'Santa Cruz El Chol', 1.5000, 5.7000, 2.9000, 3.9000, 3.4000, 9.3247, 2.5265, 6.0000, 6.2657, 5.2000, 6.8000, 5.8000, 6.3000, 7.4000, 6.8000, 9.3000, 3.4000, 4.5000, 7.1000, 6.6000, 6.9000, 5.3000, 157, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (257, 15, 'Baja Verapaz', 1507, 'San Jerónimo', 2.5000, 9.4000, 4.0000, 7.3000, 5.9000, 8.7514, 4.4620, 4.9000, 3.6522, 2.6000, 6.5000, 3.1000, 5.0000, 6.9000, 5.2000, 7.6000, 2.3000, 3.3000, 6.1000, 4.9000, 5.5000, 5.5000, 114, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (258, 15, 'Baja Verapaz', 1508, 'Purulhá', 3.8000, 7.5000, 3.1000, 6.0000, 4.7000, 8.4043, 5.7863, 4.6000, 4.9474, 4.1000, 6.6000, 4.5000, 5.7000, 7.0000, 4.0000, 7.6000, 4.5000, 5.5000, 5.7000, 6.0000, 5.9000, 5.4000, 143, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (259, 16, 'Alta Verapaz', 1601, 'Cobán', 7.6000, 7.1000, 3.1000, 7.4000, 5.7000, 9.6150, 4.9784, 5.8000, 1.0454, 6.3000, 7.5000, 4.2000, 6.1000, 3.4000, 4.8000, 8.1000, 2.6000, 1.7000, 4.1000, 4.9000, 4.5000, 5.4000, 143, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (260, 16, 'Alta Verapaz', 1602, 'Santa Cruz Verapaz', 4.7000, 7.1000, 3.3000, 6.0000, 4.8000, 8.3380, 4.0889, 5.7000, 5.8897, 3.3000, 6.4000, 4.7000, 5.6000, 6.8000, 6.2000, 8.5000, 3.8000, 4.5000, 6.5000, 6.1000, 6.3000, 5.5000, 114, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (261, 16, 'Alta Verapaz', 1603, 'San Cristóbal Verapaz', 6.9000, 7.4000, 4.4000, 7.2000, 6.0000, 8.2921, 3.9088, 4.7000, 2.5605, 3.9000, 6.0000, 3.3000, 4.8000, 7.0000, 4.7000, 7.3000, 3.5000, 4.3000, 6.0000, 5.3000, 5.7000, 5.5000, 114, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (262, 16, 'Alta Verapaz', 1604, 'Tactic', 5.0000, 5.7000, 3.0000, 5.4000, 4.3000, 9.4052, 4.5664, 5.3000, 4.7627, 6.2000, 7.1000, 5.5000, 6.4000, 7.3000, 6.6000, 9.0000, 3.0000, 4.9000, 7.0000, 6.4000, 6.7000, 5.7000, 80, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (263, 16, 'Alta Verapaz', 1605, 'Tamahú', 3.7000, 7.3000, 3.6000, 5.8000, 4.8000, 8.0403, 7.9187, 5.0000, 4.1521, 4.5000, 7.2000, 4.3000, 5.9000, 7.7000, 5.4000, 8.6000, 3.9000, 4.3000, 6.7000, 6.1000, 6.4000, 5.7000, 80, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (264, 16, 'Alta Verapaz', 1606, 'San Miguel Tucurú', 3.7000, 6.4000, 5.7000, 5.2000, 5.5000, 7.7214, 4.1070, 4.2000, 2.9151, 2.9000, 5.6000, 2.9000, 4.4000, 6.3000, 6.6000, 5.7000, 3.0000, 4.8000, 6.5000, 4.6000, 5.6000, 5.1000, 199, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (265, 16, 'Alta Verapaz', 1607, 'Panzós', 7.6000, 5.6000, 4.3000, 6.7000, 5.6000, 7.3005, 3.2415, 4.9000, 1.8372, 3.7000, 5.4000, 2.8000, 4.2000, 2.4000, 4.2000, 8.2000, 2.2000, 4.5000, 3.4000, 5.6000, 4.6000, 4.8000, 265, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (266, 16, 'Alta Verapaz', 1608, 'Senahú', 4.5000, 4.2000, 4.7000, 4.4000, 4.6000, 7.7912, 4.1957, 3.8000, 1.3492, 3.6000, 5.6000, 2.5000, 4.2000, 6.1000, 3.2000, 4.0000, 1.8000, 5.4000, 4.8000, 3.9000, 4.4000, 4.4000, 307, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (267, 16, 'Alta Verapaz', 1609, 'San Pedro Carchá', 5.2000, 7.3000, 4.2000, 6.4000, 5.4000, 7.9817, 3.4581, 4.5000, 2.2977, 4.4000, 5.7000, 3.4000, 4.7000, 1.7000, 6.2000, 6.6000, 3.3000, 6.0000, 4.3000, 5.5000, 4.9000, 5.0000, 224, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (268, 16, 'Alta Verapaz', 1610, 'San Juan Chamelco', 6.4000, 6.7000, 2.9000, 6.6000, 5.0000, 8.1878, 3.2094, 5.1000, 5.7454, 6.0000, 5.9000, 5.9000, 5.9000, 7.0000, 8.1000, 9.2000, 2.3000, 5.1000, 7.6000, 6.5000, 7.1000, 5.9000, 43, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (269, 16, 'Alta Verapaz', 1611, 'Lanquín', 1.3000, 7.0000, 3.3000, 4.8000, 4.1000, 9.5489, 2.3841, 4.1000, 6.5553, 4.7000, 6.5000, 5.7000, 6.1000, 8.0000, 6.8000, 8.8000, 3.3000, 4.9000, 7.4000, 6.3000, 6.9000, 5.6000, 94, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (270, 16, 'Alta Verapaz', 1612, 'Santa María Cahabón', 4.1000, 8.1000, 4.1000, 6.5000, 5.4000, 5.3566, 3.6008, 4.9000, 4.3729, 4.6000, 4.7000, 4.5000, 4.6000, 6.7000, 5.3000, 9.1000, 2.6000, 5.1000, 6.0000, 6.4000, 6.2000, 5.4000, 143, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (271, 16, 'Alta Verapaz', 1613, 'Chisec', 7.6000, 7.0000, 5.6000, 7.3000, 6.5000, 8.2500, 3.3599, 5.4000, 4.1718, 5.0000, 6.1000, 4.6000, 5.4000, 1.0000, 4.5000, 9.0000, 2.2000, 5.1000, 2.9000, 6.3000, 4.8000, 5.5000, 114, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (272, 16, 'Alta Verapaz', 1614, 'Chahal', 2.6000, 6.9000, 3.4000, 5.1000, 4.3000, 7.7584, 2.3256, 4.3000, 1.9487, 3.9000, 5.3000, 3.0000, 4.2000, 1.7000, 3.2000, 3.9000, 2.4000, 4.4000, 2.5000, 3.6000, 3.1000, 3.8000, 332, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (273, 16, 'Alta Verapaz', 1615, 'Fray Bartolomé De Las Casas', 3.7000, 7.2000, 3.3000, 5.7000, 4.6000, 9.4567, 3.9069, 6.0000, 4.8840, 6.0000, 7.2000, 5.5000, 6.4000, 6.1000, 2.6000, 7.9000, 4.3000, 2.8000, 4.6000, 5.4000, 5.0000, 5.3000, 157, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (274, 16, 'Alta Verapaz', 1616, 'Santa Catalina La Tinta', 4.1000, 6.3000, 5.4000, 5.3000, 5.4000, 0.0000, 3.2928, 4.4000, 2.1862, 3.3000, 2.8000, 2.8000, 2.8000, 2.3000, 4.0000, 8.1000, 2.8000, 3.0000, 3.2000, 5.2000, 4.3000, 4.0000, 326, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (275, 16, 'Alta Verapaz', 1617, 'Raxruhá', 5.6000, 7.9000, 3.1000, 6.9000, 5.3000, 9.2962, 2.0478, 6.3000, 3.8485, 5.0000, 6.8000, 4.4000, 5.7000, 2.6000, 2.9000, 8.7000, 2.7000, 6.3000, 2.8000, 6.5000, 4.9000, 5.3000, 157, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (276, 17, 'Petén', 1701, 'Flores', 3.5000, 9.2000, 3.1000, 7.3000, 5.6000, 8.7147, 5.7130, 5.0000, 5.0020, 4.5000, 6.8000, 4.8000, 5.9000, 7.1000, 3.5000, 8.0000, 3.7000, 0.8000, 5.6000, 4.9000, 5.3000, 5.6000, 94, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (277, 17, 'Petén', 1702, 'San José', 0.2000, 7.2000, 3.1000, 4.6000, 3.9000, 9.5044, 4.7848, 5.2000, 3.3242, 4.1000, 7.2000, 3.7000, 5.7000, 7.6000, 3.9000, 7.0000, 3.7000, 2.9000, 6.1000, 4.8000, 5.5000, 5.0000, 224, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (278, 17, 'Petén', 1703, 'San Benito', 4.1000, 7.7000, 5.2000, 6.2000, 5.7000, 6.9231, 3.7035, 4.4000, 2.9534, 3.4000, 5.2000, 3.2000, 4.3000, 5.0000, 6.7000, 7.5000, 3.9000, 0.9000, 5.9000, 4.7000, 5.3000, 5.1000, 199, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (279, 17, 'Petén', 1704, 'San Andrés', 1.5000, 9.0000, 3.9000, 6.6000, 5.4000, 6.6603, 5.0755, 3.6000, 2.9784, 3.7000, 5.2000, 3.3000, 4.3000, 7.4000, 3.6000, 4.4000, 3.0000, 6.5000, 5.8000, 4.8000, 5.3000, 5.0000, 224, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (280, 17, 'Petén', 1705, 'La Libertad', 6.6000, 9.6000, 3.0000, 8.5000, 6.5000, 8.9873, 4.3647, 5.2000, 6.4823, 5.8000, 6.7000, 6.2000, 6.5000, 7.2000, 3.7000, 9.1000, 3.2000, 3.9000, 5.7000, 6.3000, 6.0000, 6.3000, 10, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (281, 17, 'Petén', 1706, 'San Francisco', 1.6000, 8.3000, 4.5000, 5.9000, 5.2000, 9.2936, 4.0806, 5.4000, 3.1441, 4.0000, 6.9000, 3.6000, 5.5000, 7.6000, 4.2000, 8.2000, 4.1000, 5.2000, 6.2000, 6.2000, 6.2000, 5.6000, 94, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (282, 17, 'Petén', 1707, 'Santa Ana', 3.0000, 6.4000, 4.2000, 4.9000, 4.6000, 7.0295, 2.2328, 4.1000, 1.5184, 4.9000, 4.8000, 3.4000, 4.1000, 7.5000, 5.0000, 6.5000, 3.2000, 4.7000, 6.4000, 5.0000, 5.7000, 4.8000, 265, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (283, 17, 'Petén', 1708, 'Dolores', 4.5000, 8.8000, 3.6000, 7.2000, 5.7000, 8.3312, 4.3544, 5.2000, 4.7457, 4.2000, 6.3000, 4.5000, 5.5000, 7.5000, 4.6000, 8.7000, 4.9000, 3.3000, 6.3000, 6.2000, 6.3000, 5.8000, 63, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (284, 17, 'Petén', 1709, 'San Luis', 4.1000, 8.8000, 3.1000, 7.1000, 5.4000, 9.6389, 3.8282, 6.2000, 4.9260, 6.3000, 7.4000, 5.7000, 6.6000, 8.2000, 3.2000, 9.3000, 6.8000, 4.5000, 6.3000, 7.4000, 6.9000, 6.3000, 10, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (285, 17, 'Petén', 1710, 'Sayaxché', 7.6000, 8.1000, 2.9000, 7.9000, 6.0000, 8.9399, 3.8500, 4.8000, 4.6451, 5.8000, 6.5000, 5.3000, 5.9000, 6.8000, 5.9000, 8.2000, 3.2000, 2.1000, 6.4000, 5.2000, 5.8000, 5.9000, 43, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (286, 17, 'Petén', 1711, 'Melchor De Mencos', 3.3000, 6.8000, 4.5000, 5.3000, 4.9000, 5.0228, 4.4729, 3.8000, 1.8341, 2.8000, 4.5000, 2.3000, 3.5000, 6.8000, 4.1000, 7.3000, 4.0000, 1.4000, 5.6000, 4.7000, 5.2000, 4.5000, 302, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (287, 17, 'Petén', 1712, 'Poptún', 7.6000, 9.4000, 4.0000, 8.7000, 7.0000, 6.3324, 3.9989, 4.3000, 3.1876, 3.8000, 5.0000, 3.5000, 4.3000, 6.8000, 6.3000, 6.7000, 3.5000, 1.6000, 6.6000, 4.3000, 5.6000, 5.5000, 114, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (288, 17, 'Petén', 1713, 'Las Cruces', 4.2000, 7.5000, 2.9000, 6.1000, 4.7000, 9.4019, 5.1694, 5.9000, 5.5809, 6.6000, 7.4000, 6.1000, 6.8000, 7.3000, 8.1000, 9.2000, 3.5000, 4.6000, 7.7000, 6.6000, 7.2000, 6.1000, 23, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (289, 17, 'Petén', 1714, 'El Chal', 3.2000, 8.0000, 4.8000, 6.2000, 5.5000, 7.4782, 3.9448, 4.5000, 4.1813, 3.7000, 5.5000, 3.9000, 4.8000, 8.8000, 2.8000, 8.4000, 3.7000, 4.7000, 6.7000, 6.1000, 6.4000, 5.5000, 114, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (290, 18, 'Izabal', 1801, 'Puerto Barrios', 8.6000, 8.1000, 3.1000, 8.4000, 6.5000, 9.0113, 4.4473, 5.3000, 6.7002, 6.4000, 6.8000, 6.6000, 6.7000, 7.6000, 7.0000, 9.4000, 3.1000, 0.5000, 7.3000, 5.9000, 6.7000, 6.6000, 2, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (291, 18, 'Izabal', 1802, 'Livingston', 6.9000, 7.0000, 3.2000, 7.0000, 5.4000, 8.0085, 4.7428, 5.5000, 8.7792, 6.7000, 6.3000, 7.9000, 7.2000, 7.1000, 7.0000, 9.1000, 4.2000, 5.3000, 7.1000, 6.8000, 7.0000, 6.5000, 4, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (292, 18, 'Izabal', 1803, 'El Estor', 6.8000, 6.5000, 3.8000, 6.7000, 5.4000, 6.9486, 6.2791, 3.6000, 1.2018, 4.5000, 5.8000, 3.0000, 4.5000, 2.6000, 4.9000, 3.9000, 2.7000, 5.3000, 3.8000, 4.0000, 3.9000, 4.6000, 292, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (293, 18, 'Izabal', 1804, 'Morales', 8.4000, 6.9000, 3.4000, 7.7000, 6.0000, 7.5169, 3.6744, 4.9000, 3.5818, 4.1000, 5.6000, 3.8000, 4.8000, 6.5000, 6.5000, 7.3000, 3.1000, 5.1000, 6.5000, 5.4000, 6.0000, 5.6000, 94, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (294, 18, 'Izabal', 1805, 'Los Amates', 8.6000, 4.9000, 4.3000, 7.2000, 5.9000, 8.7193, 2.8335, 6.1000, 3.4364, 5.0000, 6.5000, 4.3000, 5.5000, 7.4000, 6.4000, 7.0000, 2.6000, 5.2000, 6.9000, 5.2000, 6.1000, 5.8000, 63, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (295, 19, 'Zacapa', 1901, 'Zacapa', 4.1000, 7.1000, 3.9000, 5.8000, 4.9000, 8.2894, 3.4449, 4.3000, 2.8117, 3.6000, 5.8000, 3.2000, 4.6000, 6.8000, 4.1000, 7.2000, 2.5000, 0.1000, 5.6000, 3.9000, 4.8000, 4.8000, 265, 0, 0.0000, NULL);
INSERT INTO public.home_conred VALUES (296, 19, 'Zacapa', 1902, 'Estanzuela', 1.4000, 2.5000, 4.5000, 2.0000, 3.4000, 7.5305, 5.0976, 4.0000, 2.9728, 2.4000, 5.8000, 2.7000, 4.4000, 7.5000, 4.4000, 6.9000, 2.8000, 4.6000, 6.2000, 5.0000, 5.6000, 4.4000, 307, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (297, 19, 'Zacapa', 1903, 'Río Hondo', 2.6000, 9.6000, 3.0000, 7.5000, 5.7000, 9.3528, 5.5366, 5.5000, 5.5458, 5.1000, 7.3000, 5.3000, 6.4000, 7.4000, 7.7000, 9.5000, 2.2000, 5.2000, 7.6000, 6.7000, 7.2000, 6.4000, 5, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (298, 19, 'Zacapa', 1904, 'Gualán', 5.5000, 8.4000, 3.1000, 7.2000, 5.5000, 9.5013, 4.2168, 5.2000, 5.0163, 5.4000, 7.1000, 5.2000, 6.2000, 7.5000, 5.9000, 8.0000, 2.7000, 4.6000, 6.8000, 5.6000, 6.2000, 6.0000, 28, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (299, 19, 'Zacapa', 1905, 'Teculután', 2.5000, 7.2000, 5.7000, 5.3000, 5.5000, 6.6559, 3.8575, 3.6000, 1.5791, 2.8000, 4.9000, 2.2000, 3.7000, 7.1000, 7.2000, 6.1000, 2.7000, 5.3000, 7.2000, 4.9000, 6.2000, 5.0000, 224, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (300, 19, 'Zacapa', 1906, 'Usumatlán', 2.1000, 7.6000, 3.4000, 5.5000, 4.5000, 9.6027, 2.2703, 5.4000, 3.3952, 4.5000, 6.9000, 4.0000, 5.6000, 7.5000, 4.2000, 7.1000, 3.0000, 4.6000, 6.1000, 5.1000, 5.6000, 5.2000, 181, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (301, 19, 'Zacapa', 1907, 'Cabañas', 1.3000, 8.3000, 2.9000, 5.9000, 4.6000, 9.3430, 6.1887, 6.0000, 6.5326, 4.5000, 7.6000, 5.6000, 6.7000, 7.4000, 4.2000, 9.5000, 4.7000, 3.9000, 6.0000, 6.9000, 6.5000, 5.9000, 43, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (302, 19, 'Zacapa', 1908, 'San Diego', 0.6000, 6.6000, 3.3000, 4.2000, 3.8000, 9.2825, 5.7307, 5.3000, 2.8800, 3.0000, 7.3000, 2.9000, 5.5000, 7.8000, 4.9000, 7.6000, 4.7000, 3.6000, 6.6000, 5.6000, 6.1000, 5.0000, 224, 4, 0.1053, NULL);
INSERT INTO public.home_conred VALUES (303, 19, 'Zacapa', 1909, 'La Unión', 7.6000, 7.6000, 3.3000, 7.6000, 5.9000, 8.5094, 4.0824, 5.7000, 3.5972, 4.7000, 6.5000, 4.2000, 5.5000, 7.7000, 3.6000, 7.2000, 3.1000, 4.8000, 6.0000, 5.3000, 5.7000, 5.7000, 80, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (304, 19, 'Zacapa', 1910, 'Huité', 0.8000, 1.9000, 3.2000, 1.4000, 2.3000, 5.8670, 1.8422, 4.6000, 2.0460, 2.9000, 4.3000, 2.5000, 3.5000, 7.4000, 5.0000, 5.0000, 2.5000, 5.0000, 6.3000, 4.3000, 5.4000, 3.5000, 336, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (305, 19, 'Zacapa', 1911, 'San Jorge', 0.1000, 2.8000, 3.8000, 1.5000, 2.7000, 8.1737, 3.9452, 6.5000, 2.2139, 1.5000, 6.5000, 1.9000, 4.6000, 8.8000, 4.5000, 8.5000, 2.3000, 6.6000, 7.2000, 6.4000, 6.8000, 4.4000, 307, 6, 0.1579, NULL);
INSERT INTO public.home_conred VALUES (306, 20, 'Chiquimula', 2001, 'Chiquimula', 5.2000, 7.0000, 4.7000, 6.2000, 5.5000, 9.1515, 4.8919, 5.2000, 4.7114, 4.8000, 7.0000, 4.8000, 6.0000, 6.7000, 4.9000, 7.4000, 2.5000, 1.4000, 5.9000, 4.3000, 5.2000, 5.6000, 94, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (307, 20, 'Chiquimula', 2002, 'San José La Arada', 0.8000, 9.3000, 3.0000, 6.8000, 5.2000, 9.4448, 2.5693, 5.2000, 5.8769, 4.4000, 6.7000, 5.2000, 6.0000, 8.2000, 3.6000, 9.6000, 7.0000, 3.4000, 6.4000, 7.5000, 7.0000, 6.0000, 28, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (308, 20, 'Chiquimula', 2003, 'San Juan Ermita', 1.8000, 6.0000, 4.2000, 4.2000, 4.2000, 8.3595, 4.7166, 5.3000, 3.3128, 3.5000, 6.4000, 3.4000, 5.1000, 6.4000, 5.6000, 7.7000, 3.1000, 4.2000, 6.0000, 5.4000, 5.7000, 5.0000, 224, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (309, 20, 'Chiquimula', 2004, 'Jocotán', 2.3000, 5.9000, 3.0000, 4.3000, 3.7000, 9.4936, 4.5664, 6.0000, 4.9411, 5.6000, 7.3000, 5.3000, 6.4000, 6.9000, 5.9000, 8.8000, 3.3000, 4.7000, 6.4000, 6.2000, 6.3000, 5.3000, 157, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (310, 20, 'Chiquimula', 2005, 'Camotán', 3.3000, 5.9000, 4.3000, 4.7000, 4.5000, 8.2290, 4.1957, 5.1000, 3.0408, 2.4000, 6.2000, 2.7000, 4.7000, 6.7000, 5.5000, 6.7000, 2.9000, 4.7000, 6.1000, 5.0000, 5.6000, 4.9000, 246, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (311, 20, 'Chiquimula', 2006, 'Olopa', 1.0000, 6.8000, 4.8000, 4.5000, 4.7000, 6.8185, 4.3813, 4.1000, 1.6577, 2.5000, 5.2000, 2.1000, 3.8000, 6.8000, 3.5000, 4.9000, 3.5000, 4.2000, 5.4000, 4.2000, 4.8000, 4.4000, 307, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (312, 20, 'Chiquimula', 2007, 'Esquipulas', 2.3000, 7.1000, 3.9000, 5.2000, 4.6000, 8.4900, 4.7967, 4.6000, 2.7150, 3.6000, 6.4000, 3.2000, 5.0000, 6.9000, 5.5000, 8.0000, 1.8000, 4.7000, 6.3000, 5.4000, 5.9000, 5.1000, 199, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (313, 20, 'Chiquimula', 2008, 'Concepción Las Minas', 0.9000, 6.3000, 2.9000, 4.1000, 3.5000, 8.3876, 3.8608, 5.5000, 8.9371, 5.3000, 6.3000, 7.6000, 7.0000, 7.9000, 6.8000, 9.5000, 2.0000, 3.9000, 7.4000, 6.4000, 6.9000, 5.5000, 114, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (314, 20, 'Chiquimula', 2009, 'Quezaltepeque', 1.8000, 9.1000, 3.0000, 6.8000, 5.2000, 9.6214, 3.2775, 4.0000, 5.7290, 4.4000, 6.7000, 5.1000, 6.0000, 7.1000, 6.4000, 8.4000, 4.9000, 5.1000, 6.8000, 6.5000, 6.7000, 5.9000, 43, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (315, 20, 'Chiquimula', 2010, 'San Jacinto', 0.5000, 7.1000, 3.1000, 4.6000, 3.9000, 8.9442, 2.3455, 5.8000, 3.9599, 4.6000, 6.5000, 4.3000, 5.5000, 7.3000, 5.8000, 8.8000, 2.8000, 4.4000, 6.6000, 6.1000, 6.4000, 5.2000, 181, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (316, 20, 'Chiquimula', 2011, 'Ipala', 0.1000, 6.6000, 4.4000, 4.1000, 4.3000, 8.3957, 4.4661, 4.5000, 2.7468, 2.6000, 6.2000, 2.7000, 4.7000, 6.7000, 5.4000, 7.8000, 2.3000, 3.1000, 6.1000, 5.0000, 5.6000, 4.8000, 265, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (317, 21, 'Jalapa', 2101, 'Jalapa', 5.0000, 8.6000, 3.3000, 7.2000, 5.6000, 8.5631, 4.4927, 5.5000, 4.4493, 3.4000, 6.6000, 3.9000, 5.4000, 6.3000, 6.0000, 7.9000, 3.8000, 2.7000, 6.2000, 5.3000, 5.8000, 5.6000, 94, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (318, 21, 'Jalapa', 2102, 'San Pedro Pinula', 2.0000, 9.6000, 4.5000, 7.4000, 6.2000, 7.7869, 3.2928, 4.5000, 2.4867, 3.7000, 5.6000, 3.1000, 4.5000, 6.9000, 4.6000, 8.6000, 2.4000, 5.3000, 5.9000, 6.1000, 6.0000, 5.5000, 114, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (319, 21, 'Jalapa', 2103, 'San Luis Jilotepeque', 1.3000, 4.5000, 4.8000, 3.1000, 4.0000, 8.5179, 5.2777, 4.8000, 2.0758, 3.3000, 6.5000, 2.7000, 4.9000, 7.0000, 5.2000, 7.2000, 3.0000, 4.6000, 6.2000, 5.2000, 5.7000, 4.8000, 265, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (320, 21, 'Jalapa', 2104, 'San Manuel Chaparrón', 0.4000, 8.1000, 3.7000, 5.4000, 4.6000, 8.8502, 3.7428, 5.3000, 3.9216, 2.6000, 6.5000, 3.3000, 5.1000, 8.8000, 7.1000, 8.3000, 3.0000, 3.6000, 8.1000, 5.6000, 7.0000, 5.5000, 114, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (321, 21, 'Jalapa', 2105, 'San Carlos Alzatate', 1.8000, 7.5000, 3.3000, 5.3000, 4.4000, 8.4997, 1.3335, 4.9000, 1.6986, 4.7000, 5.7000, 3.3000, 4.6000, 7.4000, 4.5000, 6.3000, 3.4000, 4.2000, 6.2000, 4.8000, 5.5000, 4.8000, 265, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (322, 21, 'Jalapa', 2106, 'Monjas', 1.7000, 6.0000, 3.5000, 4.2000, 3.9000, 8.3897, 4.4927, 4.9000, 3.7045, 4.0000, 6.3000, 3.9000, 5.2000, 7.3000, 7.8000, 7.6000, 3.1000, 4.7000, 7.6000, 5.5000, 6.7000, 5.1000, 199, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (323, 21, 'Jalapa', 2107, 'Mataquescuintla', 2.5000, 6.8000, 3.2000, 5.0000, 4.2000, 6.6436, 2.9588, 4.8000, 2.0449, 3.0000, 5.0000, 2.5000, 3.9000, 6.7000, 6.1000, 6.0000, 2.8000, 4.8000, 6.4000, 4.7000, 5.6000, 4.5000, 302, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (324, 22, 'Jutiapa', 2201, 'Jutiapa', 4.6000, 8.1000, 3.5000, 6.7000, 5.3000, 7.7272, 4.3023, 4.2000, 3.4528, 4.0000, 5.7000, 3.7000, 4.8000, 6.6000, 4.5000, 8.1000, 2.5000, 1.2000, 5.7000, 4.8000, 5.3000, 5.1000, 199, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (325, 22, 'Jutiapa', 2202, 'El Progreso', 0.1000, 6.0000, 4.1000, 3.6000, 3.9000, 5.4663, 3.7035, 4.3000, 3.0748, 2.7000, 4.5000, 2.9000, 3.7000, 7.5000, 4.4000, 8.7000, 3.7000, 4.7000, 6.2000, 6.3000, 6.3000, 4.5000, 302, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (326, 22, 'Jutiapa', 2203, 'Santa Catarina Mita', 0.1000, 7.8000, 3.6000, 5.1000, 4.4000, 8.5227, 3.6203, 4.9000, 4.8278, 2.3000, 6.2000, 3.7000, 5.1000, 7.0000, 6.4000, 9.1000, 4.0000, 4.6000, 6.7000, 6.6000, 6.7000, 5.3000, 157, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (327, 22, 'Jutiapa', 2204, 'Agua Blanca', 0.1000, 7.9000, 3.9000, 5.2000, 4.6000, 5.8367, 6.0772, 4.0000, 3.8440, 1.9000, 5.4000, 2.9000, 4.3000, 6.6000, 5.7000, 7.6000, 3.8000, 3.9000, 6.2000, 5.4000, 5.8000, 4.9000, 246, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (328, 22, 'Jutiapa', 2205, 'Asunción Mita', 1.5000, 5.0000, 3.6000, 3.4000, 3.5000, 8.8787, 6.0979, 2.3000, 3.3665, 3.4000, 6.5000, 3.4000, 5.1000, 6.9000, 3.9000, 7.3000, 2.8000, 3.8000, 5.6000, 5.0000, 5.3000, 4.6000, 292, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (329, 22, 'Jutiapa', 2206, 'Yupiltepeque', 0.8000, 1.5000, 3.8000, 1.2000, 2.6000, 6.6631, 5.8265, 3.9000, 1.7007, 2.3000, 5.6000, 2.0000, 4.0000, 8.0000, 4.8000, 6.4000, 1.8000, 3.1000, 6.7000, 4.1000, 5.5000, 3.9000, 330, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (330, 22, 'Jutiapa', 2207, 'Atescatempa', 0.1000, 5.4000, 3.0000, 3.2000, 3.1000, 9.4043, 5.5091, 6.1000, 7.5633, 4.7000, 7.5000, 6.3000, 6.9000, 7.6000, 6.5000, 9.8000, 3.4000, 3.6000, 7.1000, 6.9000, 7.0000, 5.3000, 157, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (331, 22, 'Jutiapa', 2208, 'Jerez', 0.1000, 5.1000, 4.1000, 3.0000, 3.6000, 8.5266, 4.2813, 5.0000, 2.2149, 2.8000, 6.4000, 2.5000, 4.7000, 8.1000, 4.9000, 7.6000, 2.4000, 3.6000, 6.8000, 5.0000, 6.0000, 4.7000, 282, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (332, 22, 'Jutiapa', 2209, 'El Adelanto', 0.1000, 5.9000, 7.1000, 3.5000, 5.6000, 0.4851, 4.5050, 2.7000, 0.6448, 1.4000, 2.7000, 1.0000, 1.9000, 7.2000, 0.6000, 0.7000, 2.6000, 2.8000, 4.7000, 2.1000, 3.5000, 3.3000, 339, 6, 0.1579, NULL);
INSERT INTO public.home_conred VALUES (333, 22, 'Jutiapa', 2210, 'Zapotitlán', 0.1000, 7.8000, 3.1000, 5.1000, 4.2000, 7.4401, 5.2326, 4.5000, 4.0904, 2.1000, 5.9000, 3.2000, 4.7000, 7.6000, 6.8000, 8.1000, 3.5000, 3.0000, 7.2000, 5.4000, 6.4000, 5.0000, 224, 5, 0.1316, NULL);
INSERT INTO public.home_conred VALUES (334, 22, 'Jutiapa', 2211, 'Comapa', 0.7000, 4.6000, 2.9000, 2.9000, 2.9000, 9.3754, 5.3758, 5.7000, 7.4308, 5.8000, 7.3000, 6.7000, 7.0000, 8.0000, 7.3000, 8.7000, 3.8000, 5.0000, 7.7000, 6.4000, 7.1000, 5.2000, 181, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (335, 22, 'Jutiapa', 2212, 'Jalpatagua', 2.0000, 2.3000, 3.4000, 2.2000, 2.8000, 8.1813, 5.3488, 5.5000, 4.1035, 4.8000, 6.6000, 4.5000, 5.7000, 7.3000, 5.5000, 8.0000, 3.1000, 5.3000, 6.5000, 5.9000, 6.2000, 4.6000, 292, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (336, 22, 'Jutiapa', 2213, 'Conguaco', 0.1000, 2.8000, 3.0000, 1.5000, 2.3000, 9.4918, 3.1552, 6.4000, 7.7002, 6.0000, 7.2000, 6.9000, 7.1000, 8.0000, 7.4000, 9.8000, 3.5000, 5.6000, 7.7000, 7.3000, 7.5000, 5.0000, 224, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (337, 22, 'Jutiapa', 2214, 'Moyuta', 5.4000, 5.6000, 3.3000, 5.5000, 4.5000, 7.7329, 7.5125, 4.6000, 3.3591, 4.2000, 6.8000, 3.8000, 5.5000, 7.5000, 6.0000, 7.7000, 4.5000, 5.1000, 6.8000, 6.0000, 6.4000, 5.4000, 143, 2, 0.0526, NULL);
INSERT INTO public.home_conred VALUES (338, 22, 'Jutiapa', 2215, 'Pasaco', 2.1000, 7.0000, 3.8000, 5.0000, 4.4000, 8.7004, 10.0000, 5.9000, 4.1671, 3.5000, 8.7000, 3.8000, 6.9000, 7.3000, 6.9000, 7.3000, 2.7000, 5.1000, 7.1000, 5.3000, 6.3000, 5.8000, 63, 1, 0.0263, NULL);
INSERT INTO public.home_conred VALUES (339, 22, 'Jutiapa', 2216, 'San José Acatempa', 0.1000, 5.3000, 2.9000, 3.1000, 3.0000, 8.5938, 1.8605, 6.3000, 7.6454, 4.4000, 6.3000, 6.3000, 6.3000, 7.9000, 7.2000, 8.9000, 3.9000, 4.5000, 7.6000, 6.4000, 7.0000, 5.1000, 199, 3, 0.0789, NULL);
INSERT INTO public.home_conred VALUES (340, 22, 'Jutiapa', 2217, 'Quesada', 0.1000, 4.3000, 3.7000, 2.5000, 3.1000, 7.7863, 3.5709, 5.1000, 2.2690, 1.9000, 5.8000, 2.1000, 4.2000, 6.8000, 5.1000, 7.6000, 2.9000, 4.5000, 6.0000, 5.4000, 5.7000, 4.2000, 323, 2, 0.0526, NULL);


--
-- TOC entry 3025 (class 0 OID 16572)
-- Dependencies: 192
-- Data for Name: home_indicador; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--

INSERT INTO public.home_indicador VALUES (1, 'Eventos Naturales', 'eventos_naturales', 1);
INSERT INTO public.home_indicador VALUES (2, 'Degradacion Ambiental', 'degradacion_ambiental', 1);
INSERT INTO public.home_indicador VALUES (3, 'INFORM HUMANO', 'inform_humano', 1);
INSERT INTO public.home_indicador VALUES (4, 'INFORM NATURAL', 'inform_natural', 1);
INSERT INTO public.home_indicador VALUES (5, 'Peligro y exposición', 'peligro_y_exposicion', 1);
INSERT INTO public.home_indicador VALUES (6, 'Desarrollo económico', 'desarrollo_economico', 1);
INSERT INTO public.home_indicador VALUES (7, 'Desigualdad', 'desigualdad', 1);
INSERT INTO public.home_indicador VALUES (8, 'Desarrollo y pobreza', 'desarrollo_y_pobreza', 1);
INSERT INTO public.home_indicador VALUES (9, 'Población en dependencia', 'poblacion_en_dependencia', 1);
INSERT INTO public.home_indicador VALUES (10, 'Población desprotegida', 'poblacion_desprotegida', 1);
INSERT INTO public.home_indicador VALUES (11, 'Socioeconómica', 'socioeconomica', 1);
INSERT INTO public.home_indicador VALUES (12, 'Grupos Vulnerables', 'grupos_vulnerables', 1);
INSERT INTO public.home_indicador VALUES (13, 'Vulnerabilidades', 'vulnerabilidades', 1);
INSERT INTO public.home_indicador VALUES (14, 'RRD', 'rrd', 1);
INSERT INTO public.home_indicador VALUES (15, 'Gestión Municipal', 'gestion_municipal', 1);
INSERT INTO public.home_indicador VALUES (16, 'Comunicación', 'comunicacion', 1);
INSERT INTO public.home_indicador VALUES (17, 'Infraestructura', 'infraestructura', 1);
INSERT INTO public.home_indicador VALUES (18, 'Salud', 'salud', 1);
INSERT INTO public.home_indicador VALUES (19, 'INFORM Institucional', 'inform_institucional', 1);
INSERT INTO public.home_indicador VALUES (20, 'INFORM Infraestrucutra', 'inform_infraestrucutra', 1);
INSERT INTO public.home_indicador VALUES (21, 'FALTA DE CAPACIDAD DE RESPUESTA', 'falta_capacidad_respuesta', 1);
INSERT INTO public.home_indicador VALUES (22, 'INFORM RISK', 'inform_risk', 1);
INSERT INTO public.home_indicador VALUES (23, 'Ranking', 'ranking', 1);
INSERT INTO public.home_indicador VALUES (24, 'Missing Indicators', 'missing_indicators', 1);


--
-- TOC entry 3027 (class 0 OID 16583)
-- Dependencies: 194
-- Data for Name: home_nivel; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--

INSERT INTO public.home_nivel VALUES (1, 'Primario');
INSERT INTO public.home_nivel VALUES (2, 'Secundario');
INSERT INTO public.home_nivel VALUES (3, 'Terceario');


--
-- TOC entry 3023 (class 0 OID 16561)
-- Dependencies: 190
-- Data for Name: home_riesgo; Type: TABLE DATA; Schema: public; Owner: tableroi_informgt
--

INSERT INTO public.home_riesgo VALUES (0, 'Todos', 0.0000, 11.0000, '', 0.0000, 11.0000, '', 0.0000, 11.0000, '', 0.0000, 11.0000, '');
INSERT INTO public.home_riesgo VALUES (1, 'Muy Bajo', 0.0000, 3.5000, 'ffbebe', 0.0000, 2.6000, 'ffebaf', 0.0000, 3.0000, 'bee8ff', 0.0000, 3.0000, 'e9ffbe');
INSERT INTO public.home_riesgo VALUES (3, 'Medio', 4.6000, 5.1000, 'ff0000', 3.7000, 4.5000, 'a87000', 4.2000, 5.0000, '00a9e6', 4.2000, 5.6000, '98e600');
INSERT INTO public.home_riesgo VALUES (4, 'Alto', 5.2000, 6.0000, 'a80000', 4.6000, 6.0000, '734c00', 5.1000, 6.6000, '0084a8', 5.7000, 7.0000, '70a800');
INSERT INTO public.home_riesgo VALUES (5, 'Muy Alto', 6.1000, 10.0000, '730000', 6.1000, 10.0000, '732600', 6.7000, 10.0000, '004c73', 7.1000, 10.0000, '4c7300');
INSERT INTO public.home_riesgo VALUES (2, 'Bajo', 3.6000, 4.5000, 'ff7f7f ', 2.7000, 3.6000, 'ffaa00', 3.1000, 4.1000, '00c5ff', 3.1000, 4.1000, 'd1ff73');


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 175
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 177
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 173
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 181
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 179
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 183
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 171
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 169
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 187
-- Name: home_conred_index_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.home_conred_index_seq', 340, true);


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 191
-- Name: home_indicador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.home_indicador_id_seq', 1, false);


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 193
-- Name: home_nivel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.home_nivel_id_seq', 1, false);


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 189
-- Name: home_riesgo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tableroi_informgt
--

SELECT pg_catalog.setval('public.home_riesgo_id_seq', 1, false);


--
-- TOC entry 2843 (class 2606 OID 16546)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2848 (class 2606 OID 16473)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2851 (class 2606 OID 16436)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 16426)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 16464)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2840 (class 2606 OID 16418)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2859 (class 2606 OID 16454)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 16488)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2853 (class 2606 OID 16444)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 16462)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 16502)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2856 (class 2606 OID 16540)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2871 (class 2606 OID 16526)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 16410)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2835 (class 2606 OID 16408)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 16400)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2884 (class 2606 OID 16613)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2874 (class 2606 OID 16558)
-- Name: home_conred home_conred_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.home_conred
    ADD CONSTRAINT home_conred_pkey PRIMARY KEY (index);


--
-- TOC entry 2879 (class 2606 OID 16580)
-- Name: home_indicador home_indicador_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.home_indicador
    ADD CONSTRAINT home_indicador_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 16591)
-- Name: home_nivel home_nivel_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.home_nivel
    ADD CONSTRAINT home_nivel_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 16569)
-- Name: home_riesgo home_riesgo_pkey; Type: CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.home_riesgo
    ADD CONSTRAINT home_riesgo_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 1259 OID 16547)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2846 (class 1259 OID 16484)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2849 (class 1259 OID 16485)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2836 (class 1259 OID 16470)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2857 (class 1259 OID 16500)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2860 (class 1259 OID 16499)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2863 (class 1259 OID 16514)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2866 (class 1259 OID 16513)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2854 (class 1259 OID 16541)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2869 (class 1259 OID 16537)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2872 (class 1259 OID 16538)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2882 (class 1259 OID 16615)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2885 (class 1259 OID 16614)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2877 (class 1259 OID 16605)
-- Name: home_indicador_nivel_id_ba7e0f6f; Type: INDEX; Schema: public; Owner: tableroi_informgt
--

CREATE INDEX home_indicador_nivel_id_ba7e0f6f ON public.home_indicador USING btree (nivel_id);


--
-- TOC entry 2887 (class 2606 OID 16479)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2888 (class 2606 OID 16474)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2886 (class 2606 OID 16465)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2889 (class 2606 OID 16494)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2890 (class 2606 OID 16489)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2891 (class 2606 OID 16508)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2892 (class 2606 OID 16503)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2893 (class 2606 OID 16527)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2894 (class 2606 OID 16532)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2895 (class 2606 OID 16593)
-- Name: home_indicador home_indicador_nivel_id_ba7e0f6f_fk_home_nivel_id; Type: FK CONSTRAINT; Schema: public; Owner: tableroi_informgt
--

ALTER TABLE ONLY public.home_indicador
    ADD CONSTRAINT home_indicador_nivel_id_ba7e0f6f_fk_home_nivel_id FOREIGN KEY (nivel_id) REFERENCES public.home_nivel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2026-07-13 11:32:54

--
-- PostgreSQL database dump complete
--

