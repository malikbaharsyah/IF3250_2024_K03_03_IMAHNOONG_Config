--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO admin;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Admin; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Admin" (
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    "imageProfilePath" text,
    "isSuperAdmin" boolean DEFAULT false NOT NULL,
    id integer NOT NULL,
    "planetariumId" integer NOT NULL
);


ALTER TABLE public."Admin" OWNER TO admin;

--
-- Name: Admin_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Admin_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Admin_id_seq" OWNER TO admin;

--
-- Name: Admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Admin_id_seq" OWNED BY public."Admin".id;


--
-- Name: Jadwal; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Jadwal" (
    "namaJadwal" text NOT NULL,
    "waktuKunjungan" timestamp(3) without time zone NOT NULL,
    kapasitas integer NOT NULL,
    "hargaTiket" integer NOT NULL,
    "deskripsiJadwal" text NOT NULL,
    id integer NOT NULL,
    "planetariumId" integer NOT NULL,
    durasi integer DEFAULT 60 NOT NULL,
    "imagePath" text[],
    "isDefault" boolean DEFAULT false NOT NULL,
    "jadwalDefaultId" integer
);


ALTER TABLE public."Jadwal" OWNER TO admin;

--
-- Name: Jadwal_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Jadwal_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Jadwal_id_seq" OWNER TO admin;

--
-- Name: Jadwal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Jadwal_id_seq" OWNED BY public."Jadwal".id;


--
-- Name: Log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Log" (
    "logId" integer NOT NULL,
    "waktuPencatatan" timestamp(3) without time zone NOT NULL,
    deskripsi text NOT NULL,
    "ipAddress" text NOT NULL,
    endpoint text NOT NULL
);


ALTER TABLE public."Log" OWNER TO admin;

--
-- Name: Log_logId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Log_logId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Log_logId_seq" OWNER TO admin;

--
-- Name: Log_logId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Log_logId_seq" OWNED BY public."Log"."logId";


--
-- Name: Planetarium; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Planetarium" (
    "namaPlanetarium" text NOT NULL,
    deskripsi text NOT NULL,
    "imagePath" text[],
    lokasi text NOT NULL,
    rating text,
    id integer NOT NULL,
    "noTelepon" text DEFAULT '+62 812-3456-7890'::text NOT NULL,
    "prosedurPendaftaran" text DEFAULT ''::text NOT NULL,
    "tataTertib" text DEFAULT ''::text NOT NULL
);


ALTER TABLE public."Planetarium" OWNER TO admin;

--
-- Name: Planetarium_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Planetarium_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Planetarium_id_seq" OWNER TO admin;

--
-- Name: Planetarium_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Planetarium_id_seq" OWNED BY public."Planetarium".id;


--
-- Name: Request; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Request" (
    id integer NOT NULL,
    "planetariumId" integer NOT NULL,
    "namaPemesan" text NOT NULL,
    "jumlahTiket" integer NOT NULL,
    email text NOT NULL,
    note text NOT NULL,
    konfirmasi boolean DEFAULT false NOT NULL,
    "noTelepon" text NOT NULL,
    "waktuDibuat" timestamp(3) without time zone NOT NULL,
    "waktuKunjungan" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Request" OWNER TO admin;

--
-- Name: Request_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Request_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Request_id_seq" OWNER TO admin;

--
-- Name: Request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Request_id_seq" OWNED BY public."Request".id;


--
-- Name: Review; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Review" (
    "reviewId" integer NOT NULL,
    komentar text NOT NULL,
    rating integer NOT NULL,
    nama text,
    "planetariumId" integer NOT NULL
);


ALTER TABLE public."Review" OWNER TO admin;

--
-- Name: Review_reviewId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."Review_reviewId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Review_reviewId_seq" OWNER TO admin;

--
-- Name: Review_reviewId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."Review_reviewId_seq" OWNED BY public."Review"."reviewId";


--
-- Name: Tiket; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Tiket" (
    id text NOT NULL,
    "jumlahTiket" integer NOT NULL,
    "noTelepon" text NOT NULL,
    email text NOT NULL,
    "idJadwal" integer,
    "namaPemesan" text NOT NULL,
    "idRequest" integer,
    "statusTiket" text NOT NULL,
    "waktuDibayar" timestamp(3) without time zone,
    "waktuDibuat" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Tiket" OWNER TO admin;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO admin;

--
-- Name: jadwalDefault; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."jadwalDefault" (
    id integer NOT NULL,
    "namaJadwal" text NOT NULL,
    hari text NOT NULL,
    jam text NOT NULL,
    kapasitas integer NOT NULL,
    "hargaTiket" integer NOT NULL,
    "planetariumId" integer NOT NULL,
    "deskripsiJadwal" text NOT NULL,
    durasi integer DEFAULT 60 NOT NULL
);


ALTER TABLE public."jadwalDefault" OWNER TO admin;

--
-- Name: jadwalDefault_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."jadwalDefault_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."jadwalDefault_id_seq" OWNER TO admin;

--
-- Name: jadwalDefault_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."jadwalDefault_id_seq" OWNED BY public."jadwalDefault".id;


--
-- Name: Admin id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Admin" ALTER COLUMN id SET DEFAULT nextval('public."Admin_id_seq"'::regclass);


--
-- Name: Jadwal id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Jadwal" ALTER COLUMN id SET DEFAULT nextval('public."Jadwal_id_seq"'::regclass);


--
-- Name: Log logId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Log" ALTER COLUMN "logId" SET DEFAULT nextval('public."Log_logId_seq"'::regclass);


--
-- Name: Planetarium id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Planetarium" ALTER COLUMN id SET DEFAULT nextval('public."Planetarium_id_seq"'::regclass);


--
-- Name: Request id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Request" ALTER COLUMN id SET DEFAULT nextval('public."Request_id_seq"'::regclass);


--
-- Name: Review reviewId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Review" ALTER COLUMN "reviewId" SET DEFAULT nextval('public."Review_reviewId_seq"'::regclass);


--
-- Name: jadwalDefault id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."jadwalDefault" ALTER COLUMN id SET DEFAULT nextval('public."jadwalDefault_id_seq"'::regclass);


ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "Review_planetariumId_fkey" FOREIGN KEY ("planetariumId") REFERENCES public."Planetarium"(id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Data for Name: Admin; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Admin" (username, password, email, "imageProfilePath", "isSuperAdmin", id, "planetariumId") FROM stdin;
admin	$2b$10$MTbAwclsOG5w/XhOjrqA5.VpzBDlrCn6/LyWHC9f4y8lT8QJ5XFZC	anjaymabars249@gmail.com	dummy1.jpg	t	1	1
admin1	$2b$10$YLHGopTeBroQ0G5.Z/bnvOd5EcJ3bzmoRTGdkhdDl9G0woZqOpSd2	anjaymabars249@gmail.com	../../../dummy1.jpg	f	4	2
\.


--
-- Data for Name: Jadwal; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Jadwal" ("namaJadwal", "waktuKunjungan", kapasitas, "hargaTiket", "deskripsiJadwal", id, "planetariumId", durasi, "imagePath", "isDefault", "jadwalDefaultId") FROM stdin;
Example Jadwal	2024-03-06 08:36:48.591	100	20	Description of the Jadwal	8	1	60	\N	f	\N
Example Jadwal	2024-03-06 08:37:14.996	100	20	Description of the Jadwal	11	1	60	\N	f	\N
Example Jadwal 2	2024-03-08 15:45:29.755	100	20	Description of the Jadwal	2	1	60	\N	f	\N
Example Jadwal 3	2024-03-08 15:47:07.609	100	20	Description of the Jadwal	3	2	60	\N	f	\N
Example Jadwal	2024-03-06 08:36:23.724	100	20	Description of the Jadwal	5	3	60	\N	f	\N
Example Jadwal	2024-03-06 08:36:57.281	100	20	Description of the Jadwal	9	2	60	\N	f	\N
Example Jadwal	2024-03-21 02:03:50.57	100	20	Description of the Jadwal	16	3	60	\N	f	\N
Example Jadwal	2024-03-21 02:01:22.272	100	20	Description of the Jadwal	14	2	60	\N	f	\N
Example Jadwal	2024-03-06 08:37:05.824	100	20	Description of the Jadwal	10	3	60	\N	f	\N
Example Jadwal	2024-03-21 02:03:50.681	100	20	Description of the Jadwal	18	3	60	\N	f	\N
Example Jadwal	2024-03-06 08:36:40.189	100	20	Description of the Jadwal	7	2	60	\N	f	\N
Example Jadwal 1	2024-03-08 16:44:53.396	100	20	Description of the Jadwal	1	3	60	\N	f	\N
Example Jadwal	2024-05-07 11:34:58.976	100	20	Description of the Jadwal	29	3	60	\N	f	\N
Example Jadwal	2024-03-21 02:03:50.491	100	20	Description of the Jadwal	15	1	60	\N	f	\N
Example Jadwal	2024-03-21 02:03:50.632	100	20	Description of the Jadwal	17	1	60	\N	f	\N
Example Jadwal	2024-05-07 11:55:59.429	100	20	Description of the Jadwal	31	1	60	\N	f	\N
Example Jadwal	2024-05-07 09:33:59.541	100	20	Description of the Jadwal	32	3	60	\N	f	\N
Example Jadwal	2024-05-07 11:47:59.689	100	20	Description of the Jadwal	33	1	60	\N	f	\N
Example Jadwal	2024-05-07 12:11:59.995	100	20	Description of the Jadwal	34	1	60	\N	f	\N
Example Jadwal	2024-05-07 10:26:00.13	100	20	Description of the Jadwal	35	3	60	\N	f	\N
Example Jadwal	2024-05-07 15:04:00.227	100	20	Description of the Jadwal	36	3	60	\N	f	\N
Example Jadwal	2024-05-07 09:39:00.322	100	20	Description of the Jadwal	37	2	60	\N	f	\N
Example Jadwal	2024-05-07 14:18:00.42	100	20	Description of the Jadwal	38	3	60	\N	f	\N
Example Jadwal	2024-05-07 09:09:59.227	100	20	Description of the Jadwal	30	2	60	{../../../dummy2.jpg}	f	\N
oawoakwkoawkwoa annnn	2024-08-03 16:59:00	100	20	Description of the Jadwal	4	1	60	{../../../Ino.png}	f	\N
ACARA	2024-06-03 08:36:00	100	20	Description of the Jadwal	6	1	60	{../../../dummyImage.png}	f	\N
\.


--
-- Data for Name: Log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Log" ("logId", "waktuPencatatan", deskripsi, "ipAddress", endpoint) FROM stdin;
\.


--
-- Data for Name: Planetarium; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Planetarium" ("namaPlanetarium", deskripsi, "imagePath", lokasi, rating, id, "noTelepon", "prosedurPendaftaran", "tataTertib") FROM stdin;
planetarium2	test2	{../../../dummy2.jpg}	bandung	\N	2	+62 812-3456-7891	prosedur B	prosedur B
planetarium3	test3	{../../../Ino.png}	bali	\N	3	+62 812-3456-7892	prosedur C	prosedur C
planetarium1	test1	{../../../dummy1.jpg}		\N	1	+62 812-3456-0978	prosedur A	prosedur A
\.


--
-- Data for Name: Request; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Request" (id, "planetariumId", "namaPemesan", "jumlahTiket", email, note, konfirmasi, "noTelepon", "waktuDibuat", "waktuKunjungan") FROM stdin;
2	1	pesanan3	12	malikbaharsyah@gmail.com	note 1	f	081208120812	1970-01-01 00:00:00	1970-01-01 00:00:00
1	1	pesanan1	10	13521029@std.stei.itb.ac.id	note	t	098709870987	2024-05-07 23:00:00	1970-01-01 00:00:00
\.


--
-- Data for Name: Review; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Review" ("reviewId", komentar, rating, nama, "planetariumId") FROM stdin;
\.


--
-- Data for Name: Tiket; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."Tiket" (id, "jumlahTiket", "noTelepon", email, "idJadwal", "namaPemesan", "idRequest", "statusTiket", "waktuDibayar", "waktuDibuat") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
18828108-dee4-497e-8a47-cdd57a01af50	bde126b21e3b1ae12d0c9093ea07662029f4656c4b0206e1a19756727b8884e7	2024-03-05 13:13:53.731126+00	20240228033446_init	\N	\N	2024-03-05 13:13:53.580102+00	1
21138cf6-f74c-4cf3-8ac2-9c718e8dca6e	56117984eda08da699337c9fabbcef8525a302c4467bbc254b4c7d2dedfee0ea	2024-03-05 13:13:53.836222+00	20240301041312_init	\N	\N	2024-03-05 13:13:53.73863+00	1
f66e50a0-5618-4b44-aca7-289a39198495	862661650a7cbc3a41f3b839b55814eefb7272904f4637606a78df827e2ac182	2024-03-05 13:13:54.11158+00	20240304123556_init	\N	\N	2024-03-05 13:13:53.846055+00	1
234a3467-4406-4bec-827a-7e63f355c113	8b12dd0d244e43772da2ca81bd2c55b158a8346a603f30428d5f0caab44545d4	2024-03-05 13:13:54.159904+00	20240305123106_init	\N	\N	2024-03-05 13:13:54.118527+00	1
4fe007d3-5ae5-4a59-bb6c-bf3d44bc3231	ac59aae43402aac4bf44f8a85039cdce172846e2dd0e80d39ebcf1b3ca5e3577	2024-03-05 13:13:55.606773+00	20240305131355_init	\N	\N	2024-03-05 13:13:55.541299+00	1
5d18ed27-e209-41a9-88e1-63333a48dee7	646effc0768100215a949398255f7723141502acc21c16adfa26f7c4cc790043	2024-03-05 13:20:44.950816+00	20240305132044_init	\N	\N	2024-03-05 13:20:44.847688+00	1
b0996d70-9cc9-41b4-8bb7-5524b5d0fb18	3a32fd84aa6a22129fcb35ae0bd7208c096db0f0f248cb6ff707e3e81e95d5cc	2024-03-06 00:11:16.747993+00	20240306001116_init	\N	\N	2024-03-06 00:11:16.671063+00	1
cc1d7b0a-3bed-43bd-8001-a509cfaebaaf	390196e13dad0d5a4aab8f3252d019d8f054b240d77402c78dea18d1deec76d0	2024-03-14 09:45:35.975423+00	20240314094535_add_request_table	\N	\N	2024-03-14 09:45:35.900808+00	1
29931303-4900-44fd-82c6-a9bed73df7b7	30d3ff911565cd985c6eff4a0e6d5763ddd048f93506c12f77570399f4407b5d	2024-04-25 16:07:49.179443+00	20240425160749_init	\N	\N	2024-04-25 16:07:49.087326+00	1
6cfc7529-4f87-4037-8adf-b76d02a1c088	50622d74661dd1e4364d45f8ca34f436a631d2da410492266ef85de6c0e5f3ca	2024-05-05 01:57:23.613436+00	20240505015723_init	\N	\N	2024-05-05 01:57:23.25417+00	1
\.


--
-- Data for Name: jadwalDefault; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."jadwalDefault" (id, "namaJadwal", hari, jam, kapasitas, "hargaTiket", "planetariumId", "deskripsiJadwal", durasi) FROM stdin;
1	Example Jadwal	Senin	10:00	100	20	1	Description of the Jadwal	60
4	Example Jadwal	Kamis	10:00	100	20	1	Description of the Jadwal	60
6	Example Jadwal	Sabtu	10:00	100	20	1	Description of the Jadwal	60
7	Example Jadwal	Minggu	10:00	100	20	1	Description of the Jadwal	60
9	Example Jadwal	Kamis	10:00	100	20	1	Description of the Jadwal	60
11	ini jadawal minggu	Minggu	19:00	0	0	2		60
2	Example Jadwal	Selasa	10:00	100	20	2	Description of the Jadwal	60
5	Example Jadwal	Jumat	10:00	100	20	3	Description of the Jadwal	60
8	Example Jadwal	Selasa	10:00	100	20	2	Description of the Jadwal	60
10	Example Jadwal	Rabu	10:00	100	20	3	Description of the Jadwal	60
3	Example Jadwal	Rabu	10:00	100	20	3	Description of the Jadwal	60
\.


--
-- Name: Admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Admin_id_seq"', 4, true);


--
-- Name: Jadwal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Jadwal_id_seq"', 38, true);


--
-- Name: Log_logId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Log_logId_seq"', 1, false);


--
-- Name: Planetarium_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Planetarium_id_seq"', 1, true);


--
-- Name: Request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Request_id_seq"', 2, true);


--
-- Name: Review_reviewId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."Review_reviewId_seq"', 1, false);


--
-- Name: jadwalDefault_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."jadwalDefault_id_seq"', 11, true);


--
-- Name: Admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--



--
-- Name: Admin Admin_planetariumId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--


REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

