--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1 (Ubuntu 11.1-1.pgdg16.04+1)
-- Dumped by pg_dump version 11.1 (Ubuntu 11.1-1.pgdg16.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO cherowl;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO cherowl;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO cherowl;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO cherowl;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO cherowl;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO cherowl;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO cherowl;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO cherowl;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO cherowl;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO cherowl;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO cherowl;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO cherowl;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: cherowl
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


ALTER TABLE public.django_admin_log OWNER TO cherowl;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO cherowl;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO cherowl;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO cherowl;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO cherowl;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO cherowl;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO cherowl;

--
-- Name: menu_app_menu; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.menu_app_menu (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.menu_app_menu OWNER TO cherowl;

--
-- Name: menu_app_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.menu_app_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_app_menu_id_seq OWNER TO cherowl;

--
-- Name: menu_app_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.menu_app_menu_id_seq OWNED BY public.menu_app_menu.id;


--
-- Name: menu_app_menuitem; Type: TABLE; Schema: public; Owner: cherowl
--

CREATE TABLE public.menu_app_menuitem (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    visible boolean NOT NULL,
    menu_id integer NOT NULL,
    parent_id integer
);


ALTER TABLE public.menu_app_menuitem OWNER TO cherowl;

--
-- Name: menu_app_menuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: cherowl
--

CREATE SEQUENCE public.menu_app_menuitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_app_menuitem_id_seq OWNER TO cherowl;

--
-- Name: menu_app_menuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cherowl
--

ALTER SEQUENCE public.menu_app_menuitem_id_seq OWNED BY public.menu_app_menuitem.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: menu_app_menu id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.menu_app_menu ALTER COLUMN id SET DEFAULT nextval('public.menu_app_menu_id_seq'::regclass);


--
-- Name: menu_app_menuitem id; Type: DEFAULT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.menu_app_menuitem ALTER COLUMN id SET DEFAULT nextval('public.menu_app_menuitem_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add menu	7	add_menu
26	Can change menu	7	change_menu
27	Can delete menu	7	delete_menu
28	Can view menu	7	view_menu
29	Can add menu item	8	add_menuitem
30	Can change menu item	8	change_menuitem
31	Can delete menu item	8	delete_menuitem
32	Can view menu item	8	view_menuitem
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$LZRpTiFYw7Yf$62AOTpl58Wfz93lnSW7v+GQTO2YXBZKAmTg7k3ktBk0=	2019-02-02 00:04:27.475893+00	t	elena			cherowl@yandex.ru	t	t	2019-01-22 19:35:34.331363+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-01-23 13:13:26.973138+00	198	Menu 1.2	3		8	1
2	2019-01-23 13:13:27.028343+00	197	Menu 1.1	3		8	1
3	2019-01-23 13:13:27.039465+00	196	Menu 1.2	3		8	1
4	2019-01-23 13:13:27.050779+00	195	Menu 1.1	3		8	1
5	2019-01-23 13:13:27.094487+00	194	Menu 1.2	3		8	1
6	2019-01-23 13:13:27.106267+00	193	Menu 1.1	3		8	1
7	2019-01-23 13:13:27.116339+00	192	Menu 1.2	3		8	1
8	2019-01-23 13:13:27.127483+00	191	Menu 1.1	3		8	1
9	2019-01-23 13:13:27.139058+00	190	Menu 1.2	3		8	1
10	2019-01-23 13:13:27.149771+00	189	Menu 1.1	3		8	1
11	2019-01-23 13:13:27.161124+00	188	Menu 1.2	3		8	1
12	2019-01-23 13:13:27.172012+00	187	Menu 1.1	3		8	1
13	2019-01-23 13:13:27.194336+00	186	Menu 1.2	3		8	1
14	2019-01-23 13:13:27.205348+00	185	Menu 1.1	3		8	1
15	2019-01-23 13:13:27.216451+00	184	Menu 1.2	3		8	1
16	2019-01-23 13:13:27.227704+00	183	Menu 1.1	3		8	1
17	2019-01-23 13:13:27.23909+00	182	Menu 1.2	3		8	1
18	2019-01-23 13:13:27.250082+00	181	Menu 1.1	3		8	1
19	2019-01-23 13:13:27.272127+00	180	Menu 1.2	3		8	1
20	2019-01-23 13:13:27.283113+00	179	Menu 1.1	3		8	1
21	2019-01-23 13:13:27.293738+00	178	Menu 1.2	3		8	1
22	2019-01-23 13:13:27.30504+00	177	Menu 1.1	3		8	1
23	2019-01-23 13:13:27.316433+00	176	Menu 1.2	3		8	1
24	2019-01-23 13:13:27.339152+00	175	Menu 1.1	3		8	1
25	2019-01-23 13:13:27.360691+00	174	Menu 1.2	3		8	1
26	2019-01-23 13:13:27.372387+00	173	Menu 1.1	3		8	1
27	2019-01-23 13:13:27.393954+00	172	Menu 1.2	3		8	1
28	2019-01-23 13:13:27.404979+00	171	Menu 1.1	3		8	1
29	2019-01-23 13:13:27.427136+00	170	Menu 1.2	3		8	1
30	2019-01-23 13:13:27.437988+00	169	Menu 1.1	3		8	1
31	2019-01-23 13:13:27.482141+00	168	Menu 1.2	3		8	1
32	2019-01-23 13:13:27.504304+00	167	Menu 1.1	3		8	1
33	2019-01-23 13:13:27.559894+00	166	Menu 1.2	3		8	1
34	2019-01-23 13:13:27.593422+00	165	Menu 1.1	3		8	1
35	2019-01-23 13:13:27.615633+00	164	Menu 1.2	3		8	1
36	2019-01-23 13:13:27.626517+00	163	Menu 1.1	3		8	1
37	2019-01-23 13:13:27.637499+00	162	Menu 1.2	3		8	1
38	2019-01-23 13:13:27.648469+00	161	Menu 1.1	3		8	1
39	2019-01-23 13:13:27.659602+00	160	Menu 1.2	3		8	1
40	2019-01-23 13:13:27.681807+00	159	Menu 1.1	3		8	1
41	2019-01-23 13:13:27.692788+00	158	Menu 1.2	3		8	1
42	2019-01-23 13:13:27.703714+00	157	Menu 1.1	3		8	1
43	2019-01-23 13:13:27.715058+00	156	Menu 1.2	3		8	1
44	2019-01-23 13:13:27.726135+00	155	Menu 1.1	3		8	1
45	2019-01-23 13:13:27.736581+00	154	Menu 1.2	3		8	1
46	2019-01-23 13:13:27.747905+00	153	Menu 1.1	3		8	1
47	2019-01-23 13:13:27.758708+00	152	Menu 1.2	3		8	1
48	2019-01-23 13:13:27.770019+00	151	Menu 1.1	3		8	1
49	2019-01-23 13:13:27.781104+00	150	Menu 1.2	3		8	1
50	2019-01-23 13:13:27.792198+00	149	Menu 1.1	3		8	1
51	2019-01-23 13:13:27.803454+00	148	Menu 1.2	3		8	1
52	2019-01-23 13:13:27.825779+00	147	Menu 1.1	3		8	1
53	2019-01-23 13:13:27.837129+00	146	Menu 1.2	3		8	1
54	2019-01-23 13:13:27.859051+00	145	Menu 1.1	3		8	1
55	2019-01-23 13:13:27.869657+00	144	Menu 1.2	3		8	1
56	2019-01-23 13:13:27.881334+00	143	Menu 1.1	3		8	1
57	2019-01-23 13:13:27.892135+00	142	Menu 1.2	3		8	1
58	2019-01-23 13:13:27.903002+00	141	Menu 1.1	3		8	1
59	2019-01-23 13:13:27.914125+00	140	Menu 1.2	3		8	1
60	2019-01-23 13:13:27.925216+00	139	Menu 1.1	3		8	1
61	2019-01-23 13:13:27.947574+00	138	Menu 1.2	3		8	1
62	2019-01-23 13:13:27.958703+00	137	Menu 1.1	3		8	1
63	2019-01-23 13:13:27.969417+00	136	Menu 1.2	3		8	1
64	2019-01-23 13:13:27.980744+00	135	Menu 1.1	3		8	1
65	2019-01-23 13:13:27.991821+00	134	Menu 1.2	3		8	1
66	2019-01-23 13:13:28.014126+00	133	Menu 1.1	3		8	1
67	2019-01-23 13:13:28.025083+00	132	Menu 1.2	3		8	1
68	2019-01-23 13:13:28.036604+00	131	Menu 1.1	3		8	1
69	2019-01-23 13:13:28.04725+00	130	Menu 1.2	3		8	1
70	2019-01-23 13:13:28.058553+00	129	Menu 1.1	3		8	1
71	2019-01-23 13:13:28.080124+00	128	Menu 1.2	3		8	1
72	2019-01-23 13:13:28.09175+00	127	Menu 1.1	3		8	1
73	2019-01-23 13:13:28.102541+00	126	Menu 1.2	3		8	1
74	2019-01-23 13:13:28.113681+00	125	Menu 1.1	3		8	1
75	2019-01-23 13:13:28.124798+00	124	Menu 1.2	3		8	1
76	2019-01-23 13:13:28.147408+00	123	Menu 1.1	3		8	1
77	2019-01-23 13:13:28.158107+00	122	Menu 1.2	3		8	1
78	2019-01-23 13:13:28.168935+00	121	Menu 1.1	3		8	1
79	2019-01-23 13:13:28.180196+00	120	Menu 1.2	3		8	1
80	2019-01-23 13:13:28.191316+00	119	Menu 1.1	3		8	1
81	2019-01-23 13:13:28.2021+00	118	Menu 1.2	3		8	1
82	2019-01-23 13:13:28.213302+00	117	Menu 1.1	3		8	1
83	2019-01-23 13:13:28.224312+00	116	Menu 1.2	3		8	1
84	2019-01-23 13:13:28.235233+00	115	Menu 1.1	3		8	1
85	2019-01-23 13:13:28.246655+00	114	Menu 1.2	3		8	1
86	2019-01-23 13:13:28.268686+00	113	Menu 1.1	3		8	1
87	2019-01-23 13:13:28.290933+00	112	Menu 1.2	3		8	1
88	2019-01-23 13:13:28.301696+00	111	Menu 1.1	3		8	1
89	2019-01-23 13:13:28.313181+00	110	Menu 1.2	3		8	1
90	2019-01-23 13:13:28.335278+00	109	Menu 1.1	3		8	1
91	2019-01-23 13:13:28.346604+00	108	Menu 1.2	3		8	1
92	2019-01-23 13:13:28.368338+00	107	Menu 1.1	3		8	1
93	2019-01-23 13:13:28.379377+00	106	Menu 1.2	3		8	1
94	2019-01-23 13:13:28.390883+00	105	Menu 1.1	3		8	1
95	2019-01-23 13:13:28.401527+00	104	Menu 1.2	3		8	1
96	2019-01-23 13:13:28.41269+00	103	Menu 1.1	3		8	1
97	2019-01-23 13:13:28.424056+00	102	Menu 1.2	3		8	1
98	2019-01-23 13:13:28.446371+00	101	Menu 1.1	3		8	1
99	2019-01-23 13:13:28.457278+00	100	Menu 1.2	3		8	1
100	2019-01-23 13:13:28.479341+00	99	Menu 1.1	3		8	1
101	2019-01-23 13:13:45.56615+00	98	Menu 1.2	3		8	1
102	2019-01-23 13:13:45.593784+00	97	Menu 1.1	3		8	1
103	2019-01-23 13:13:45.604654+00	96	Menu 1.2	3		8	1
104	2019-01-23 13:13:45.627022+00	95	Menu 1.1	3		8	1
105	2019-01-23 13:13:45.637807+00	94	Menu 1.2	3		8	1
106	2019-01-23 13:13:45.660028+00	93	Menu 1.1	3		8	1
107	2019-01-23 13:13:45.671683+00	92	Menu 1.2	3		8	1
108	2019-01-23 13:13:45.69343+00	91	Menu 1.1	3		8	1
109	2019-01-23 13:13:45.704171+00	90	Menu 1.2	3		8	1
110	2019-01-23 13:13:45.72669+00	89	Menu 1.1	3		8	1
111	2019-01-23 13:13:45.73767+00	88	Menu 1.2	3		8	1
112	2019-01-23 13:13:45.74813+00	87	Menu 1.1	3		8	1
113	2019-01-23 13:13:45.759519+00	86	Menu 1.2	3		8	1
114	2019-01-23 13:13:45.770623+00	85	Menu 1.1	3		8	1
115	2019-01-23 13:13:45.781865+00	84	Menu 1.2	3		8	1
116	2019-01-23 13:13:45.793069+00	83	Menu 1.1	3		8	1
117	2019-01-23 13:13:45.804136+00	82	Menu 1.2	3		8	1
118	2019-01-23 13:13:45.815838+00	81	Menu 1.1	3		8	1
119	2019-01-23 13:13:45.837263+00	80	Menu 1.2	3		8	1
120	2019-01-23 13:13:45.848336+00	79	Menu 1.1	3		8	1
121	2019-01-23 13:13:45.870502+00	78	Menu 1.2	3		8	1
122	2019-01-23 13:13:45.881765+00	77	Menu 1.1	3		8	1
123	2019-01-23 13:13:45.892553+00	76	Menu 1.2	3		8	1
124	2019-01-23 13:13:45.903559+00	75	Menu 1.1	3		8	1
125	2019-01-23 13:13:45.915037+00	74	Menu 1.2	3		8	1
126	2019-01-23 13:13:45.926352+00	73	Menu 1.1	3		8	1
127	2019-01-23 13:13:45.937009+00	72	Menu 1.2	3		8	1
128	2019-01-23 13:13:45.959666+00	71	Menu 1.1	3		8	1
129	2019-01-23 13:13:45.9703+00	70	Menu 1.2	3		8	1
130	2019-01-23 13:13:45.981262+00	69	Menu 1.1	3		8	1
131	2019-01-23 13:13:46.003507+00	68	Menu 1.2	3		8	1
132	2019-01-23 13:13:46.014206+00	67	Menu 1.1	3		8	1
133	2019-01-23 13:13:46.025788+00	66	Menu 1.2	3		8	1
134	2019-01-23 13:13:46.047038+00	65	Menu 1.1	3		8	1
135	2019-01-23 13:13:46.058881+00	64	Menu 1.2	3		8	1
136	2019-01-23 13:13:46.069726+00	63	Menu 1.1	3		8	1
137	2019-01-23 13:13:46.080234+00	62	Menu 1.2	3		8	1
138	2019-01-23 13:13:46.091685+00	61	Menu 1.1	3		8	1
139	2019-01-23 13:13:46.104198+00	60	Menu 1.2	3		8	1
140	2019-01-23 13:13:46.12574+00	59	Menu 1.1	3		8	1
141	2019-01-23 13:13:46.147337+00	58	Menu 1.2	3		8	1
142	2019-01-23 13:13:46.15868+00	57	Menu 1.1	3		8	1
143	2019-01-23 13:13:46.169301+00	56	Menu 1.2	3		8	1
144	2019-01-23 13:13:46.180368+00	55	Menu 1.1	3		8	1
145	2019-01-23 13:13:46.191563+00	54	Menu 1.2	3		8	1
146	2019-01-23 13:13:46.202511+00	53	Menu 1.1	3		8	1
147	2019-01-23 13:13:46.213422+00	52	Menu 1.2	3		8	1
148	2019-01-23 13:13:46.224938+00	51	Menu 1.1	3		8	1
149	2019-01-23 13:13:46.236125+00	50	Menu 1.2	3		8	1
150	2019-01-23 13:13:46.25828+00	49	Menu 1.1	3		8	1
151	2019-01-23 13:13:46.269283+00	48	Menu 1.2	3		8	1
152	2019-01-23 13:13:46.280143+00	47	Menu 1.1	3		8	1
153	2019-01-23 13:13:46.291431+00	46	Menu 1.2	3		8	1
154	2019-01-23 13:13:46.302473+00	45	Menu 1.1	3		8	1
155	2019-01-23 13:13:46.324612+00	44	Menu 1.2	3		8	1
156	2019-01-23 13:13:46.335779+00	43	Menu 1.1	3		8	1
157	2019-01-23 13:13:46.357801+00	42	Menu 1.2	3		8	1
158	2019-01-23 13:13:46.368997+00	41	Menu 1.1	3		8	1
159	2019-01-23 13:13:46.391165+00	40	Menu 1.2	3		8	1
160	2019-01-23 13:13:46.402215+00	39	Menu 1.1	3		8	1
161	2019-01-23 13:13:46.412998+00	38	Menu 1.2	3		8	1
162	2019-01-23 13:13:46.424301+00	37	Menu 1.1	3		8	1
163	2019-01-23 13:13:46.435822+00	36	Menu 1.2	3		8	1
164	2019-01-23 13:13:46.446616+00	35	Menu 1.1	3		8	1
165	2019-01-23 13:13:46.457482+00	34	Menu 1.2	3		8	1
166	2019-01-23 13:13:46.468557+00	33	Menu 1.1	3		8	1
167	2019-01-23 13:13:46.479802+00	32	Menu 1.2	3		8	1
168	2019-01-23 13:13:46.490903+00	31	Menu 1.1	3		8	1
169	2019-01-23 13:13:46.501161+00	30	Menu 1.2	3		8	1
170	2019-01-23 13:13:46.51252+00	29	Menu 1.1	3		8	1
171	2019-01-23 13:13:46.52397+00	28	Menu #1.2	3		8	1
172	2019-01-23 13:13:46.546191+00	27	Menu #1.1	3		8	1
173	2019-01-23 13:13:46.557127+00	26	Menu #1.2	3		8	1
174	2019-01-23 13:13:46.568377+00	25	Menu #1.1	3		8	1
175	2019-01-23 13:13:46.590513+00	24	Menu #1.2	3		8	1
176	2019-01-23 13:13:46.601565+00	23	Menu #1.1	3		8	1
177	2019-01-23 13:13:46.612268+00	22	Menu #1.2	3		8	1
178	2019-01-23 13:13:46.623919+00	21	Menu #1.1	3		8	1
179	2019-01-23 13:13:46.678968+00	20	Menu #1.2	3		8	1
180	2019-01-23 13:13:46.723595+00	19	Menu #1.1	3		8	1
181	2019-01-23 13:13:46.756496+00	18	Menu #1.2	3		8	1
182	2019-01-23 13:13:46.834183+00	17	Menu #1.1	3		8	1
183	2019-01-23 13:13:46.8674+00	16	Menu #1.2	3		8	1
184	2019-01-23 13:13:46.878399+00	15	Menu #1.1	3		8	1
185	2019-01-23 13:13:46.88935+00	14	Menu #1.2	3		8	1
186	2019-01-23 13:13:46.900405+00	13	Menu #1.1	3		8	1
187	2019-01-23 13:13:46.91167+00	12	Menu #1.2	3		8	1
188	2019-01-23 13:13:46.922756+00	11	Menu #1.1	3		8	1
189	2019-01-23 13:13:46.933867+00	10	Menu #1.2	3		8	1
190	2019-01-23 13:13:46.944768+00	9	Menu #1.1	3		8	1
191	2019-01-23 13:13:46.955828+00	8	Menu #1.2	3		8	1
192	2019-01-23 13:13:46.978169+00	7	Menu #1.1	3		8	1
193	2019-01-23 13:13:46.989117+00	6	Menu #1.2	3		8	1
194	2019-01-23 13:13:47.011198+00	5	Menu #1.1	3		8	1
195	2019-01-23 13:13:47.022064+00	4	Menu #1.2	3		8	1
196	2019-01-23 13:13:47.033295+00	3	Menu #1.1	3		8	1
197	2019-01-23 13:13:47.04451+00	2	Menu #1.2	3		8	1
198	2019-01-23 13:13:47.055557+00	1	Menu #1.1	3		8	1
199	2019-01-23 13:15:04.302157+00	199	Menu 1.1	1	[{"added": {}}]	8	1
200	2019-01-23 13:16:12.839418+00	199	Menu 1.1	3		8	1
201	2019-01-23 13:20:37.344482+00	200	i1	1	[{"added": {}}]	8	1
202	2019-01-23 14:02:16.617227+00	210	Menu 1.2	3		8	1
203	2019-01-23 14:02:16.654218+00	209	Menu 1.1	3		8	1
204	2019-01-23 14:02:16.665331+00	208	Menu 1.2	3		8	1
205	2019-01-23 14:02:16.676083+00	207	Menu 1.1	3		8	1
206	2019-01-23 14:02:16.687719+00	206	Menu 1.2	3		8	1
207	2019-01-23 14:02:16.710197+00	205	Menu 1.1	3		8	1
208	2019-01-23 14:02:16.731974+00	204	Menu 1.2	3		8	1
209	2019-01-23 14:02:16.742537+00	203	Menu 1.1	3		8	1
210	2019-01-23 14:02:16.753756+00	202	Menu 1.2	3		8	1
211	2019-01-23 14:02:16.765264+00	201	Menu 1.1	3		8	1
212	2019-01-23 14:02:16.787531+00	200	i1	3		8	1
213	2019-01-23 14:13:20.543622+00	153	main_menu_#1	1	[{"added": {}}]	7	1
214	2019-01-23 14:14:10.764834+00	211	menu_item_1.1	1	[{"added": {}}]	8	1
215	2019-01-23 14:14:28.906604+00	212	menu_item_1.2	1	[{"added": {}}]	8	1
216	2019-01-23 14:14:49.834745+00	213	menu_item_1.3	1	[{"added": {}}]	8	1
217	2019-01-23 14:15:32.899559+00	152	Menu 1	3		7	1
218	2019-01-23 14:15:32.929047+00	151	Menu 1	3		7	1
219	2019-01-23 14:15:32.95088+00	150	Menu 1	3		7	1
220	2019-01-23 14:15:32.972978+00	149	Menu 1	3		7	1
221	2019-01-23 14:15:32.995821+00	148	Menu 1	3		7	1
222	2019-01-23 14:15:33.017214+00	147	Menu 1	3		7	1
223	2019-01-23 14:15:33.02845+00	146	Menu 1	3		7	1
224	2019-01-23 14:15:33.050461+00	145	Menu 1	3		7	1
225	2019-01-23 14:15:33.061718+00	144	Menu 1	3		7	1
226	2019-01-23 14:15:33.083961+00	143	Menu 1	3		7	1
227	2019-01-23 14:15:33.094761+00	142	Menu 1	3		7	1
228	2019-01-23 14:15:33.105648+00	141	Menu 1	3		7	1
229	2019-01-23 14:15:33.119467+00	140	Menu 1	3		7	1
230	2019-01-23 14:15:33.139485+00	139	Menu 1	3		7	1
231	2019-01-23 14:15:33.150178+00	138	Menu 1	3		7	1
232	2019-01-23 14:15:33.1612+00	137	Menu 1	3		7	1
233	2019-01-23 14:15:33.172353+00	136	Menu 1	3		7	1
234	2019-01-23 14:15:33.194678+00	135	Menu 1	3		7	1
235	2019-01-23 14:15:33.216557+00	134	Menu 1	3		7	1
236	2019-01-23 14:15:33.227487+00	133	Menu 1	3		7	1
237	2019-01-23 14:15:33.238672+00	132	Menu 1	3		7	1
238	2019-01-23 14:15:33.249851+00	131	Menu 1	3		7	1
239	2019-01-23 14:15:33.272208+00	130	Menu 1	3		7	1
240	2019-01-23 14:15:33.282913+00	129	Menu 1	3		7	1
241	2019-01-23 14:15:33.293984+00	128	Menu 1	3		7	1
242	2019-01-23 14:15:33.305175+00	127	Menu 1	3		7	1
243	2019-01-23 14:15:33.31644+00	126	Menu 1	3		7	1
244	2019-01-23 14:15:33.338808+00	125	Menu 1	3		7	1
245	2019-01-23 14:15:33.349536+00	124	Menu 1	3		7	1
246	2019-01-23 14:15:33.571422+00	123	Menu 1	3		7	1
247	2019-01-23 14:15:33.581927+00	122	Menu 1	3		7	1
248	2019-01-23 14:15:33.604387+00	121	Menu 1	3		7	1
249	2019-01-23 14:15:33.615434+00	120	Menu 1	3		7	1
250	2019-01-23 14:15:33.636805+00	119	Menu 1	3		7	1
251	2019-01-23 14:15:33.648123+00	118	Menu 1	3		7	1
252	2019-01-23 14:15:33.659585+00	117	Menu 1	3		7	1
253	2019-01-23 14:15:33.671219+00	116	Menu 1	3		7	1
254	2019-01-23 14:15:33.681108+00	115	Menu 1	3		7	1
255	2019-01-23 14:15:33.692175+00	114	Menu 1	3		7	1
256	2019-01-23 14:15:33.703468+00	113	Menu 1	3		7	1
257	2019-01-23 14:15:33.715317+00	112	Menu 1	3		7	1
258	2019-01-23 14:15:33.725362+00	111	Menu 1	3		7	1
259	2019-01-23 14:15:33.736755+00	110	Menu 1	3		7	1
260	2019-01-23 14:15:33.748176+00	109	Menu 1	3		7	1
261	2019-01-23 14:15:33.758811+00	108	Menu 1	3		7	1
262	2019-01-23 14:15:33.770796+00	107	Menu 1	3		7	1
263	2019-01-23 14:15:33.781534+00	106	Menu 1	3		7	1
264	2019-01-23 14:15:33.792693+00	105	Menu 1	3		7	1
265	2019-01-23 14:15:33.804028+00	104	Menu 1	3		7	1
266	2019-01-23 14:15:33.81463+00	103	Menu 1	3		7	1
267	2019-01-23 14:15:33.825874+00	102	Menu 1	3		7	1
268	2019-01-23 14:15:33.848053+00	101	Menu 1	3		7	1
269	2019-01-23 14:15:33.859291+00	100	Menu 1	3		7	1
270	2019-01-23 14:15:33.881644+00	99	Menu 1	3		7	1
271	2019-01-23 14:15:33.903421+00	98	Menu 1	3		7	1
272	2019-01-23 14:15:33.913681+00	97	Menu 1	3		7	1
273	2019-01-23 14:15:33.925236+00	96	Menu 1	3		7	1
274	2019-01-23 14:15:33.936408+00	95	Menu 1	3		7	1
275	2019-01-23 14:15:33.947498+00	94	Menu 1	3		7	1
276	2019-01-23 14:15:33.969647+00	93	Menu 1	3		7	1
277	2019-01-23 14:15:33.980398+00	92	Menu 1	3		7	1
278	2019-01-23 14:15:33.991847+00	91	Menu 1	3		7	1
279	2019-01-23 14:15:34.002814+00	90	Menu 1	3		7	1
280	2019-01-23 14:15:34.014115+00	89	Menu 1	3		7	1
281	2019-01-23 14:15:34.036113+00	88	Menu 1	3		7	1
282	2019-01-23 14:15:34.047229+00	87	Menu 1	3		7	1
283	2019-01-23 14:15:34.058594+00	86	Menu 1	3		7	1
284	2019-01-23 14:15:34.068976+00	85	Menu 1	3		7	1
285	2019-01-23 14:15:34.080372+00	84	Menu 1	3		7	1
286	2019-01-23 14:15:34.091338+00	83	Menu 1	3		7	1
287	2019-01-23 14:15:34.102496+00	82	Menu 1	3		7	1
288	2019-01-23 14:15:34.114072+00	81	Menu 1	3		7	1
289	2019-01-23 14:15:34.13588+00	80	Menu 1	3		7	1
290	2019-01-23 14:15:34.146739+00	79	Menu 1	3		7	1
291	2019-01-23 14:15:34.16897+00	78	Menu 1	3		7	1
292	2019-01-23 14:15:34.179997+00	77	Menu 1	3		7	1
293	2019-01-23 14:15:34.202709+00	76	Menu 1	3		7	1
294	2019-01-23 14:15:34.213181+00	75	Menu 1	3		7	1
295	2019-01-23 14:15:34.224511+00	74	Menu 1	3		7	1
296	2019-01-23 14:15:34.246476+00	73	Menu 1	3		7	1
297	2019-01-23 14:15:34.257452+00	72	Menu 1	3		7	1
298	2019-01-23 14:15:34.268527+00	71	Menu 1	3		7	1
299	2019-01-23 14:15:34.280044+00	70	Menu 1	3		7	1
300	2019-01-23 14:15:34.290912+00	69	Menu 1	3		7	1
301	2019-01-23 14:15:34.340419+00	68	Menu 1	3		7	1
302	2019-01-23 14:15:34.368431+00	67	Menu 1	3		7	1
303	2019-01-23 14:15:34.401545+00	66	Menu 1	3		7	1
304	2019-01-23 14:15:34.446228+00	65	Menu 1	3		7	1
305	2019-01-23 14:15:34.501102+00	64	Menu 1	3		7	1
306	2019-01-23 14:15:34.534326+00	63	Menu 1	3		7	1
307	2019-01-23 14:15:34.64512+00	62	Menu 1	3		7	1
308	2019-01-23 14:15:34.689453+00	61	Menu #1	3		7	1
309	2019-01-23 14:15:34.71165+00	60	Menu #1	3		7	1
310	2019-01-23 14:15:34.722264+00	59	Menu #1	3		7	1
311	2019-01-23 14:15:34.733601+00	58	Menu #1	3		7	1
312	2019-01-23 14:15:34.755365+00	57	Menu #1	3		7	1
313	2019-01-23 14:15:34.766499+00	56	Menu #1	3		7	1
314	2019-01-23 14:15:34.778096+00	55	Menu #1	3		7	1
315	2019-01-23 14:15:34.799663+00	54	Menu #1	3		7	1
316	2019-01-23 14:15:50.696578+00	153	main_menu_#1	3		7	1
317	2019-01-23 14:15:50.718769+00	53	Menu #1	3		7	1
318	2019-01-23 14:15:50.729774+00	52	Menu #1	3		7	1
319	2019-01-23 14:15:50.75203+00	51	Menu #1	3		7	1
320	2019-01-23 14:15:50.774301+00	50	Menu #1	3		7	1
321	2019-01-23 14:15:50.785007+00	49	Menu #1	3		7	1
322	2019-01-23 14:15:50.79617+00	48	Menu #1	3		7	1
323	2019-01-23 14:15:50.80742+00	47	Menu #1	3		7	1
324	2019-01-23 14:15:50.818361+00	46	Menu #1	3		7	1
325	2019-01-23 14:15:50.82965+00	45	Menu #1	3		7	1
326	2019-01-23 14:15:50.851748+00	44	Menu #1	3		7	1
327	2019-01-23 14:15:50.86297+00	43	Menu #1	3		7	1
328	2019-01-23 14:15:50.885123+00	42	Menu #1	3		7	1
329	2019-01-23 14:15:50.907547+00	41	Menu #1	3		7	1
330	2019-01-23 14:15:50.918017+00	40	Menu #1	3		7	1
331	2019-01-23 14:15:50.929308+00	39	Menu #1	3		7	1
332	2019-01-23 14:15:50.940553+00	38	Menu #1	3		7	1
333	2019-01-23 14:15:50.962426+00	37	Menu #1	3		7	1
334	2019-01-23 14:15:50.973837+00	36	Menu #1	3		7	1
335	2019-01-23 14:15:50.995814+00	35	Menu #1	3		7	1
336	2019-01-23 14:15:51.007162+00	34	Menu #1	3		7	1
337	2019-01-23 14:15:51.028806+00	33	Menu #1	3		7	1
338	2019-01-23 14:15:51.040066+00	32	Menu #1	3		7	1
339	2019-01-23 14:15:51.062068+00	31	Menu #1	3		7	1
340	2019-01-23 14:15:51.073837+00	30	Menu #1	3		7	1
341	2019-01-23 14:15:51.095351+00	29	Menu #1	3		7	1
342	2019-01-23 14:15:51.106645+00	28	Menu #1	3		7	1
343	2019-01-23 14:15:51.128733+00	27	Menu #1	3		7	1
344	2019-01-23 14:15:51.151297+00	26	Menu #1	3		7	1
345	2019-01-23 14:15:51.161669+00	25	Menu #1	3		7	1
346	2019-01-23 14:15:51.172872+00	24	Menu #1	3		7	1
347	2019-01-23 14:15:51.184095+00	23	Menu #1	3		7	1
348	2019-01-23 14:15:51.206025+00	22	Menu #1	3		7	1
349	2019-01-23 14:15:51.217098+00	21	Menu #1	3		7	1
350	2019-01-23 14:15:51.228227+00	20	Menu #1	3		7	1
351	2019-01-23 14:15:51.250002+00	19	Menu #1	3		7	1
352	2019-01-23 14:15:51.261187+00	18	Menu #1	3		7	1
353	2019-01-23 14:15:51.272218+00	17	Menu #1	3		7	1
354	2019-01-23 14:15:51.282848+00	16	Menu #1	3		7	1
355	2019-01-23 14:15:51.295112+00	15	Menu #1	3		7	1
356	2019-01-23 14:15:51.306105+00	14	Menu #1	3		7	1
357	2019-01-23 14:15:51.31622+00	13	Menu #1	3		7	1
358	2019-01-23 14:15:51.327468+00	12	Menu #1	3		7	1
359	2019-01-23 14:15:51.338446+00	11	Menu #1	3		7	1
360	2019-01-23 14:15:51.349576+00	10	Menu #1	3		7	1
361	2019-01-23 14:15:51.361218+00	9	Menu #1	3		7	1
362	2019-01-23 14:15:51.372364+00	8	Menu #1	3		7	1
363	2019-01-23 14:15:51.383375+00	7	Menu #1	3		7	1
364	2019-01-23 14:15:51.394446+00	6	Menu #1	3		7	1
365	2019-01-23 14:15:51.404878+00	5	Menu #1	3		7	1
366	2019-01-23 14:15:51.416581+00	4	Menu #1	3		7	1
367	2019-01-23 14:15:51.427658+00	3	Menu #1	3		7	1
368	2019-01-23 14:15:51.438354+00	2	Menu #1	3		7	1
369	2019-01-23 14:15:51.450337+00	1	Menu #1	3		7	1
370	2019-01-23 14:16:42.513908+00	154	main_menu_1	1	[{"added": {}}]	7	1
371	2019-01-23 14:17:04.74923+00	155	main_menu_2	1	[{"added": {}}]	7	1
372	2019-01-23 14:17:25.412988+00	214	menu_item_1.1	1	[{"added": {}}]	8	1
373	2019-01-23 14:17:48.027189+00	215	menu_item_2.1	1	[{"added": {}}]	8	1
374	2019-01-23 14:18:07.507884+00	216	menu_item_2.2	1	[{"added": {}}]	8	1
375	2019-01-23 14:28:18.027158+00	156	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.1"}}]	7	1
376	2019-01-23 14:29:12.107659+00	156	main_menu_3	2	[{"added": {"name": "menu item", "object": "menu_item_3.2"}}]	7	1
377	2019-01-24 08:53:14.078854+00	156	main_menu_3	2	[{"added": {"name": "menu item", "object": "menu_item_3.3"}}]	7	1
378	2019-01-26 23:47:23.830439+00	257	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
379	2019-01-26 23:47:24.477152+00	258	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
380	2019-01-26 23:47:27.099861+00	259	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
381	2019-01-26 23:47:27.865375+00	260	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
382	2019-01-26 23:47:28.422913+00	261	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
383	2019-01-26 23:47:30.43801+00	262	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
384	2019-01-26 23:47:32.203596+00	263	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
385	2019-01-26 23:47:32.804725+00	264	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
386	2019-01-26 23:47:33.629664+00	265	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
387	2019-01-26 23:47:34.099896+00	266	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
388	2019-01-26 23:47:34.693992+00	267	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
389	2019-01-26 23:47:35.982156+00	268	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
390	2019-01-26 23:47:36.604348+00	269	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
391	2019-01-26 23:47:37.396809+00	270	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
392	2019-01-26 23:47:38.158086+00	271	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
393	2019-01-26 23:47:38.504975+00	272	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
394	2019-01-26 23:47:38.712675+00	273	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
395	2019-01-26 23:47:40.150253+00	274	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
396	2019-01-26 23:47:41.825383+00	275	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
397	2019-01-26 23:47:42.368949+00	276	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
398	2019-01-26 23:47:44.858126+00	277	main_menu_3	1	[{"added": {}}, {"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
399	2019-01-26 23:48:45.732063+00	277	main_menu_3	3		7	1
400	2019-01-26 23:48:45.753158+00	276	main_menu_3	3		7	1
401	2019-01-26 23:48:45.764494+00	275	main_menu_3	3		7	1
402	2019-01-26 23:48:45.775859+00	274	main_menu_3	3		7	1
403	2019-01-26 23:48:45.78661+00	273	main_menu_3	3		7	1
404	2019-01-26 23:48:45.797623+00	272	main_menu_3	3		7	1
405	2019-01-26 23:48:45.808767+00	271	main_menu_3	3		7	1
406	2019-01-26 23:48:45.820031+00	270	main_menu_3	3		7	1
407	2019-01-26 23:48:45.83153+00	269	main_menu_3	3		7	1
408	2019-01-26 23:48:45.842339+00	268	main_menu_3	3		7	1
409	2019-01-26 23:48:45.864466+00	267	main_menu_3	3		7	1
410	2019-01-26 23:48:45.875221+00	266	main_menu_3	3		7	1
411	2019-01-26 23:48:45.88643+00	265	main_menu_3	3		7	1
412	2019-01-26 23:48:45.897316+00	264	main_menu_3	3		7	1
413	2019-01-26 23:48:45.908558+00	263	main_menu_3	3		7	1
414	2019-01-26 23:48:45.920007+00	262	main_menu_3	3		7	1
415	2019-01-26 23:48:45.931237+00	261	main_menu_3	3		7	1
416	2019-01-26 23:48:45.942139+00	260	main_menu_3	3		7	1
417	2019-01-26 23:48:45.953081+00	259	main_menu_3	3		7	1
418	2019-01-26 23:48:45.964156+00	258	main_menu_3	3		7	1
419	2019-01-26 23:48:45.975593+00	257	main_menu_3	3		7	1
420	2019-01-26 23:48:45.985922+00	256	Menu 1	3		7	1
421	2019-01-26 23:48:45.997475+00	255	Menu 1	3		7	1
422	2019-01-26 23:48:46.008426+00	254	Menu 1	3		7	1
423	2019-01-26 23:48:46.019817+00	253	Menu 1	3		7	1
424	2019-01-26 23:48:46.030557+00	252	Menu 1	3		7	1
425	2019-01-26 23:48:46.041542+00	251	Menu 1	3		7	1
426	2019-01-26 23:48:46.052425+00	250	Menu 1	3		7	1
427	2019-01-26 23:48:46.064001+00	249	Menu 1	3		7	1
428	2019-01-26 23:48:46.074868+00	248	Menu 1	3		7	1
429	2019-01-26 23:48:46.086076+00	247	Menu 1	3		7	1
430	2019-01-26 23:48:46.096676+00	246	Menu 1	3		7	1
431	2019-01-26 23:48:46.10803+00	245	Menu 1	3		7	1
432	2019-01-26 23:48:46.14137+00	244	Menu 1	3		7	1
433	2019-01-26 23:48:46.152465+00	243	Menu 1	3		7	1
434	2019-01-26 23:48:46.163162+00	242	Menu 1	3		7	1
435	2019-01-26 23:48:46.174519+00	241	Menu 1	3		7	1
436	2019-01-26 23:48:46.185495+00	240	Menu 1	3		7	1
437	2019-01-26 23:48:46.196375+00	239	Menu 1	3		7	1
438	2019-01-26 23:48:46.208131+00	238	Menu 1	3		7	1
439	2019-01-26 23:48:46.219138+00	237	Menu 1	3		7	1
440	2019-01-26 23:48:46.230062+00	236	Menu 1	3		7	1
441	2019-01-26 23:48:46.241032+00	235	Menu 1	3		7	1
442	2019-01-26 23:48:46.252456+00	234	Menu 1	3		7	1
443	2019-01-26 23:48:46.263222+00	233	Menu 1	3		7	1
444	2019-01-26 23:48:46.274151+00	232	Menu 1	3		7	1
445	2019-01-26 23:48:46.285211+00	231	Menu 1	3		7	1
446	2019-01-26 23:48:46.296215+00	230	Menu 1	3		7	1
447	2019-01-26 23:48:46.307459+00	229	Menu 1	3		7	1
448	2019-01-26 23:48:46.31838+00	228	Menu 1	3		7	1
449	2019-01-26 23:48:46.329206+00	227	Menu 1	3		7	1
450	2019-01-26 23:48:46.340776+00	226	Menu 1	3		7	1
451	2019-01-26 23:48:46.351988+00	225	Menu 1	3		7	1
452	2019-01-26 23:48:46.362492+00	224	Menu 1	3		7	1
453	2019-01-26 23:48:46.373855+00	223	Menu 1	3		7	1
454	2019-01-26 23:48:46.385119+00	222	Menu 1	3		7	1
455	2019-01-26 23:48:46.396447+00	221	Menu 1	3		7	1
456	2019-01-26 23:48:46.407135+00	220	Menu 1	3		7	1
457	2019-01-26 23:48:46.41783+00	219	Menu 1	3		7	1
458	2019-01-26 23:48:46.429505+00	218	Menu 1	3		7	1
459	2019-01-26 23:48:46.440328+00	217	Menu 1	3		7	1
460	2019-01-26 23:48:46.451127+00	216	Menu 1	3		7	1
461	2019-01-26 23:48:46.462639+00	215	Menu 1	3		7	1
462	2019-01-26 23:48:46.473534+00	214	Menu 1	3		7	1
463	2019-01-26 23:48:46.485128+00	213	Menu 1	3		7	1
464	2019-01-26 23:48:46.496116+00	212	Menu 1	3		7	1
465	2019-01-26 23:48:46.506846+00	211	Menu 1	3		7	1
466	2019-01-26 23:48:46.517744+00	210	Menu 1	3		7	1
467	2019-01-26 23:48:46.529233+00	209	Menu 1	3		7	1
468	2019-01-26 23:48:46.540307+00	208	Menu 1	3		7	1
469	2019-01-26 23:48:46.550747+00	207	Menu 1	3		7	1
470	2019-01-26 23:48:46.561909+00	206	Menu 1	3		7	1
471	2019-01-26 23:48:46.5734+00	205	Menu 1	3		7	1
472	2019-01-26 23:48:46.584076+00	204	Menu 1	3		7	1
473	2019-01-26 23:48:46.595672+00	203	Menu 1	3		7	1
474	2019-01-26 23:48:46.606536+00	202	Menu 1	3		7	1
475	2019-01-26 23:48:46.617787+00	201	Menu 1	3		7	1
476	2019-01-26 23:48:46.62853+00	200	Menu 1	3		7	1
477	2019-01-26 23:48:46.639772+00	199	Menu 1	3		7	1
478	2019-01-26 23:48:46.650916+00	198	Menu 1	3		7	1
479	2019-01-26 23:48:46.661547+00	197	Menu 1	3		7	1
480	2019-01-26 23:48:46.673083+00	196	Menu 1	3		7	1
481	2019-01-26 23:48:46.683814+00	195	Menu 1	3		7	1
482	2019-01-26 23:48:46.695419+00	194	Menu 1	3		7	1
483	2019-01-26 23:48:46.706261+00	193	Menu 1	3		7	1
484	2019-01-26 23:48:46.717169+00	192	Menu 1	3		7	1
485	2019-01-26 23:48:46.728589+00	191	Menu 1	3		7	1
486	2019-01-26 23:48:46.739569+00	190	Menu 1	3		7	1
487	2019-01-26 23:48:46.750797+00	189	Menu 1	3		7	1
488	2019-01-26 23:48:46.761861+00	188	Menu 1	3		7	1
489	2019-01-26 23:48:46.773752+00	187	Menu 1	3		7	1
490	2019-01-26 23:48:46.784062+00	186	Menu 1	3		7	1
491	2019-01-26 23:48:46.795045+00	185	Menu 1	3		7	1
492	2019-01-26 23:48:46.806063+00	184	Menu 1	3		7	1
493	2019-01-26 23:48:46.817194+00	183	Menu 1	3		7	1
494	2019-01-26 23:48:46.82828+00	182	Menu 1	3		7	1
495	2019-01-26 23:48:46.839032+00	181	Menu 1	3		7	1
496	2019-01-26 23:48:46.84972+00	180	Menu 1	3		7	1
497	2019-01-26 23:48:46.860778+00	179	Menu 1	3		7	1
498	2019-01-26 23:48:46.872037+00	178	Menu 1	3		7	1
499	2019-01-26 23:49:03.685298+00	177	Menu 1	3		7	1
500	2019-01-26 23:49:03.709702+00	176	Menu 1	3		7	1
501	2019-01-26 23:49:03.721094+00	175	Menu 1	3		7	1
502	2019-01-26 23:49:03.732455+00	174	Menu 1	3		7	1
503	2019-01-26 23:49:03.74304+00	173	Menu 1	3		7	1
504	2019-01-26 23:49:03.754155+00	172	Menu 1	3		7	1
505	2019-01-26 23:49:03.765514+00	171	Menu 1	3		7	1
506	2019-01-26 23:49:03.776133+00	170	Menu 1	3		7	1
507	2019-01-26 23:49:03.787727+00	169	Menu 1	3		7	1
508	2019-01-26 23:49:03.798421+00	168	Menu 1	3		7	1
509	2019-01-26 23:49:03.809195+00	167	Menu 1	3		7	1
510	2019-01-26 23:49:03.820416+00	166	Menu 1	3		7	1
511	2019-01-26 23:49:03.83138+00	165	Menu 1	3		7	1
512	2019-01-26 23:49:03.842599+00	164	Menu 1	3		7	1
513	2019-01-26 23:49:03.853603+00	163	Menu 1	3		7	1
514	2019-01-26 23:49:03.864587+00	162	Menu 1	3		7	1
515	2019-01-26 23:49:03.875643+00	161	Menu 1	3		7	1
516	2019-01-26 23:49:03.886885+00	160	Menu 1	3		7	1
517	2019-01-26 23:49:03.897724+00	159	Menu 1	3		7	1
518	2019-01-26 23:49:03.909525+00	158	Menu 1	3		7	1
519	2019-01-26 23:49:03.92056+00	157	Menu 1	3		7	1
520	2019-01-26 23:49:24.874818+00	156	main_menu_3	2	[{"added": {"name": "menu item", "object": "menu_item_3.4"}}]	7	1
521	2019-01-31 22:03:37.778074+00	156	main_menu_3	2	[{"changed": {"name": "menu item", "object": "menu_item_3.1.1", "fields": ["name"]}}, {"changed": {"name": "menu item", "object": "menu_item_3.1.1.1", "fields": ["name"]}}, {"changed": {"name": "menu item", "object": "menu_item_3.1.1.2", "fields": ["name"]}}]	7	1
522	2019-01-31 22:04:11.539039+00	156	main_menu_3	2	[{"added": {"name": "menu item", "object": "menu_item_3.2"}}]	7	1
523	2019-01-31 22:04:46.537964+00	156	main_menu_3	2	[{"added": {"name": "menu item", "object": "menu_item_3.2.1"}}]	7	1
524	2019-02-01 08:43:05.422783+00	156	main_menu_3	2	[{"added": {"name": "menu item", "object": "menu_item_3.2.2"}}]	7	1
525	2019-02-01 22:05:06.449746+00	155	main_menu_2	2	[{"added": {"name": "menu item", "object": "menu_item_2.2.1"}}, {"added": {"name": "menu item", "object": "menu_item_2.2.2"}}, {"added": {"name": "menu item", "object": "menu_item_2.1.1"}}, {"added": {"name": "menu item", "object": "menu_item_2.1.2"}}]	7	1
526	2019-02-01 22:05:20.651797+00	155	main_menu_2	2	[{"added": {"name": "menu item", "object": "menu_item_2.1.2.1"}}]	7	1
527	2019-02-01 22:05:44.378361+00	154	main_menu_1	2	[{"added": {"name": "menu item", "object": "menu_item_1.2"}}, {"added": {"name": "menu item", "object": "menu_item_1.3"}}]	7	1
528	2019-02-01 22:06:57.713184+00	154	main_menu_1	2	[{"added": {"name": "menu item", "object": "menu_item_1.3.1"}}, {"added": {"name": "menu item", "object": "menu_item_1.3.2"}}, {"added": {"name": "menu item", "object": "menu_item_1.2.1"}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	menu_app	menu
8	menu_app	menuitem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-01-22 16:17:47.520651+00
2	auth	0001_initial	2019-01-22 16:17:48.499977+00
3	admin	0001_initial	2019-01-22 16:17:48.864329+00
4	admin	0002_logentry_remove_auto_add	2019-01-22 16:17:48.938792+00
5	admin	0003_logentry_add_action_flag_choices	2019-01-22 16:17:49.006319+00
6	contenttypes	0002_remove_content_type_name	2019-01-22 16:17:49.150367+00
7	auth	0002_alter_permission_name_max_length	2019-01-22 16:17:49.194565+00
8	auth	0003_alter_user_email_max_length	2019-01-22 16:17:49.271698+00
9	auth	0004_alter_user_username_opts	2019-01-22 16:17:49.347906+00
10	auth	0005_alter_user_last_login_null	2019-01-22 16:17:49.440065+00
11	auth	0006_require_contenttypes_0002	2019-01-22 16:17:49.461877+00
12	auth	0007_alter_validators_add_error_messages	2019-01-22 16:17:49.529565+00
13	auth	0008_alter_user_username_max_length	2019-01-22 16:17:49.672293+00
14	auth	0009_alter_user_last_name_max_length	2019-01-22 16:17:49.760632+00
15	menu_app	0001_initial	2019-01-22 16:17:50.072277+00
16	sessions	0001_initial	2019-01-22 16:17:50.260427+00
17	menu_app	0002_auto_20190122_1719	2019-01-22 17:19:27.691917+00
18	menu_app	0003_auto_20190122_1730	2019-01-22 17:30:15.316935+00
19	menu_app	0004_remove_menuitem_url	2019-01-24 09:41:40.215821+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
wtq14sxdsgh9uu77g61wlzv31jb45e9v	Y2I2MzcwY2ZkOGNlYzk5MDJlMmM4MTk1NWYzZmUxNzcxYzZlZTY1Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNzFkOTNkMzUzMmM2OGQ2YTYxNGZiNDJmY2YxZTM2Y2M2YTAxYzZmIn0=	2019-02-16 00:04:35.753335+00
jvj85zgdb49s8cw4pw7svkz9lexiz435	YmFhNGZkMWQ3YWFmZGIzMGRhNjI3ZjQ3YzgzNjNjZjg3Y2Q5NTU0Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjcxZDkzZDM1MzJjNjhkNmE2MTRmYjQyZmNmMWUzNmNjNmEwMWM2ZiIsInRlc3QiOiJtYWluX21lbnVfMSIsInRlc3QxIjoibWFpbl9tZW51XzMiLCJtYWluX21lbnVfMSI6eyJjdXJyZW50X21lbnUiOiJtYWluX21lbnVfMSIsInBhdGhfbGlzdCI6WyJtZW51X2FwcCIsIm1haW5fbWVudV8xIl19LCJtYWluX21lbnVfMyI6eyJjdXJyZW50X21lbnUiOiJtYWluX21lbnVfMyIsInBhdGhfbGlzdCI6WyJtZW51X2FwcCIsIm1haW5fbWVudV8zIl19LCJtZW51Ijp7Im5hbWUiOiJtYWluX21lbnVfMyIsInBhdGhfbGlzdCI6WyJtZW51X2FwcCIsIm1haW5fbWVudV8zIl19LCJjdXJyZW50X21lbnUiOiJtYWluX21lbnVfMyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2019-02-15 23:55:49.317232+00
\.


--
-- Data for Name: menu_app_menu; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.menu_app_menu (id, name) FROM stdin;
156	main_menu_3
155	main_menu_2
154	main_menu_1
\.


--
-- Data for Name: menu_app_menuitem; Type: TABLE DATA; Schema: public; Owner: cherowl
--

COPY public.menu_app_menuitem (id, name, visible, menu_id, parent_id) FROM stdin;
218	menu_item_3.1.1	f	156	217
219	menu_item_3.1.1.1	f	156	218
418	menu_item_3.2	f	156	\N
420	menu_item_3.2.2	f	156	418
425	menu_item_2.1.2.1	f	155	424
428	menu_item_1.3.1	f	154	427
429	menu_item_1.3.2	f	154	427
430	menu_item_1.2.1	f	154	426
214	menu_item_1.1	f	154	\N
215	menu_item_2.1	f	155	\N
216	menu_item_2.2	f	155	215
217	menu_item_3.1	f	156	\N
417	menu_item_3.1.1.2	f	156	218
419	menu_item_3.2.1	f	156	418
421	menu_item_2.2.1	f	155	216
422	menu_item_2.2.2	f	155	216
423	menu_item_2.1.1	f	155	215
424	menu_item_2.1.2	f	155	215
426	menu_item_1.2	f	154	\N
427	menu_item_1.3	f	154	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 528, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: menu_app_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.menu_app_menu_id_seq', 277, true);


--
-- Name: menu_app_menuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cherowl
--

SELECT pg_catalog.setval('public.menu_app_menuitem_id_seq', 430, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: menu_app_menu menu_app_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.menu_app_menu
    ADD CONSTRAINT menu_app_menu_pkey PRIMARY KEY (id);


--
-- Name: menu_app_menuitem menu_app_menuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.menu_app_menuitem
    ADD CONSTRAINT menu_app_menuitem_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: menu_app_menuitem_menu_id_d221970b; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX menu_app_menuitem_menu_id_d221970b ON public.menu_app_menuitem USING btree (menu_id);


--
-- Name: menu_app_menuitem_parent_id_c811aa7f; Type: INDEX; Schema: public; Owner: cherowl
--

CREATE INDEX menu_app_menuitem_parent_id_c811aa7f ON public.menu_app_menuitem USING btree (parent_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_app_menuitem menu_app_menuitem_menu_id_d221970b_fk_menu_app_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.menu_app_menuitem
    ADD CONSTRAINT menu_app_menuitem_menu_id_d221970b_fk_menu_app_menu_id FOREIGN KEY (menu_id) REFERENCES public.menu_app_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_app_menuitem menu_app_menuitem_parent_id_c811aa7f_fk_menu_app_menuitem_id; Type: FK CONSTRAINT; Schema: public; Owner: cherowl
--

ALTER TABLE ONLY public.menu_app_menuitem
    ADD CONSTRAINT menu_app_menuitem_parent_id_c811aa7f_fk_menu_app_menuitem_id FOREIGN KEY (parent_id) REFERENCES public.menu_app_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

