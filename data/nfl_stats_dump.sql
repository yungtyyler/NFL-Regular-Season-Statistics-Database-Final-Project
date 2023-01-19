--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2023-01-19 04:36:49 UTC

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
-- TOC entry 209 (class 1259 OID 41301)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 41307)
-- Name: conferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conferences (
    id integer NOT NULL,
    name character varying NOT NULL,
    abbreviation character varying(3) NOT NULL
);


ALTER TABLE public.conferences OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 41306)
-- Name: conferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conferences_id_seq OWNER TO postgres;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 210
-- Name: conferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conferences_id_seq OWNED BY public.conferences.id;


--
-- TOC entry 213 (class 1259 OID 41318)
-- Name: divisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.divisions (
    id integer NOT NULL,
    name character varying NOT NULL,
    region character varying NOT NULL,
    conference_id integer NOT NULL
);


ALTER TABLE public.divisions OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 41317)
-- Name: divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.divisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.divisions_id_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 212
-- Name: divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.divisions_id_seq OWNED BY public.divisions.id;


--
-- TOC entry 215 (class 1259 OID 41343)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    city character varying,
    name character varying NOT NULL,
    state character varying,
    home_color character varying NOT NULL,
    wins integer,
    losses integer,
    ties integer,
    division_id integer NOT NULL,
    conference_id integer NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 41342)
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 214
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- TOC entry 3180 (class 2604 OID 41310)
-- Name: conferences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conferences ALTER COLUMN id SET DEFAULT nextval('public.conferences_id_seq'::regclass);


--
-- TOC entry 3181 (class 2604 OID 41321)
-- Name: divisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisions ALTER COLUMN id SET DEFAULT nextval('public.divisions_id_seq'::regclass);


--
-- TOC entry 3182 (class 2604 OID 41346)
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- TOC entry 3345 (class 0 OID 41301)
-- Dependencies: 209
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
02214be2a2e8
\.


--
-- TOC entry 3347 (class 0 OID 41307)
-- Dependencies: 211
-- Data for Name: conferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conferences (id, name, abbreviation) FROM stdin;
1	American Football Conference	AFC
2	National Football Conference	NFC
\.


--
-- TOC entry 3349 (class 0 OID 41318)
-- Dependencies: 213
-- Data for Name: divisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.divisions (id, name, region, conference_id) FROM stdin;
1	AFC South	South	1
2	AFC North	North	1
3	AFC East	East	1
4	AFC West	West	1
5	NFC South	South	2
6	NFC North	North	2
7	NFC East	East	2
8	NFC West	West	2
\.


--
-- TOC entry 3351 (class 0 OID 41343)
-- Dependencies: 215
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, city, name, state, home_color, wins, losses, ties, division_id, conference_id) FROM stdin;
2	Atlanta	Falcons	Georgia	Red	7	10	0	5	2
3	Baltimore	Ravens	Maryland	Purple	10	7	0	2	1
4	Buffalo	Bills	New York	Blue	13	3	0	3	1
5		Panthers	Carolina	Blue	7	10	0	5	2
6	Chicago	Bears	Illinois	Blue	3	14	0	6	2
7	Cincinnati	Bengals	Ohio	Orange	12	4	0	2	1
8	Cleveland	Browns	Ohio	Brown	7	10	0	2	1
9	Dallas	Cowboys	Texas	Blue	12	5	0	7	2
10	Denver	Broncos	Colorado	Orange	5	12	0	4	1
11	Detroit	Lions	Michigan	Blue	9	8	0	6	2
12	Green Bay	Packers	Wisconsin	Green	8	9	0	6	2
13	Houston	Texans	Texas	Blue	3	13	1	1	1
14	Indianapolis	Colts	Indiana	Blue	4	12	1	1	1
15	Jacksonville	Jaguars	Florida	Black	9	8	0	1	1
16	Kansas City	Chiefs	Missouri	Red	14	3	0	4	1
17	Las Vegas	Raiders	Nevada	Black	6	11	0	4	1
18	Los Angeles	Chargers	California	Blue	10	7	0	4	1
19	Los Angeles	Rams	California	Blue	5	12	0	8	2
20	Miami	Dolphins	Florida	Blue	9	8	0	3	1
21		Vikings	Minnesota	Purple	13	4	0	6	2
22		Patriots	New England	Blue	8	9	0	3	1
23	New Orleans	Saints	Louisiana	Gold	7	10	0	5	2
24		Giants	New York	Blue	9	7	1	7	2
25		Jets	New York	Green	7	10	0	3	1
26	Philadelphia	Eagles	Pennsylvania	Green	14	3	0	7	2
28	San Francisco	49ers	California	Red	13	4	0	8	2
29	Seattle	Seahawks	Washington	Blue	9	8	0	8	2
30	Tampa Bay	Buccaneers	Florida	Red	8	9	0	5	2
31		Titans	Tennessee	Blue	7	10	0	1	1
32		Commanders	Washington DC	Burgundy	8	8	1	7	2
1		Cardinals	Arizona	Red	4	13	0	8	2
27	Pittsburgh	Steelers	Pennsylvania	Gold	9	8	0	2	1
\.


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 210
-- Name: conferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conferences_id_seq', 5, true);


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 212
-- Name: divisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.divisions_id_seq', 1, false);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 214
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 1, false);


--
-- TOC entry 3184 (class 2606 OID 41305)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3186 (class 2606 OID 41364)
-- Name: conferences conferences_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conferences
    ADD CONSTRAINT conferences_abbreviation_key UNIQUE (abbreviation);


--
-- TOC entry 3188 (class 2606 OID 41316)
-- Name: conferences conferences_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conferences
    ADD CONSTRAINT conferences_name_key UNIQUE (name);


--
-- TOC entry 3190 (class 2606 OID 41314)
-- Name: conferences conferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conferences
    ADD CONSTRAINT conferences_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 41325)
-- Name: divisions divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 41352)
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- TOC entry 3202 (class 2606 OID 41350)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 1259 OID 41442)
-- Name: team_city_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX team_city_index ON public.teams USING hash (city);


--
-- TOC entry 3194 (class 1259 OID 41444)
-- Name: team_color_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX team_color_index ON public.teams USING hash (home_color);


--
-- TOC entry 3195 (class 1259 OID 41440)
-- Name: team_losses_b_tree_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX team_losses_b_tree_index ON public.teams USING btree (losses);


--
-- TOC entry 3196 (class 1259 OID 41443)
-- Name: team_state_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX team_state_index ON public.teams USING hash (state);


--
-- TOC entry 3197 (class 1259 OID 41441)
-- Name: team_ties_b_tree_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX team_ties_b_tree_index ON public.teams USING btree (ties);


--
-- TOC entry 3198 (class 1259 OID 41439)
-- Name: team_wins_b_tree_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX team_wins_b_tree_index ON public.teams USING btree (wins);


--
-- TOC entry 3203 (class 2606 OID 41326)
-- Name: divisions divisions_conference_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT divisions_conference_id_fkey FOREIGN KEY (conference_id) REFERENCES public.conferences(id);


--
-- TOC entry 3205 (class 2606 OID 41358)
-- Name: teams teams_conference_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_conference_id_fkey FOREIGN KEY (conference_id) REFERENCES public.conferences(id);


--
-- TOC entry 3204 (class 2606 OID 41353)
-- Name: teams teams_division_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_division_id_fkey FOREIGN KEY (division_id) REFERENCES public.divisions(id);


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE divisions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.divisions TO PUBLIC;


-- Completed on 2023-01-19 04:36:49 UTC

--
-- PostgreSQL database dump complete
--

