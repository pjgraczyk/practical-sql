--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE analysis;




--
-- Drop roles
--

DROP ROLE postgres;
DROP ROLE vscode;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE vscode;
ALTER ROLE vscode WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.21 (Debian 13.21-0+deb11u1)
-- Dumped by pg_dump version 13.21 (Debian 13.21-0+deb11u1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "analysis" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.21 (Debian 13.21-0+deb11u1)
-- Dumped by pg_dump version 13.21 (Debian 13.21-0+deb11u1)

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
-- Name: analysis; Type: DATABASE; Schema: -; Owner: vscode
--

CREATE DATABASE analysis WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE analysis OWNER TO vscode;

\connect analysis

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
-- Name: animals; Type: TABLE; Schema: public; Owner: vscode
--

CREATE TABLE public.animals (
    id bigint NOT NULL,
    common_name text NOT NULL,
    scientific_name text NOT NULL,
    conservation_status text NOT NULL
);


ALTER TABLE public.animals OWNER TO vscode;

--
-- Name: animals_details; Type: TABLE; Schema: public; Owner: vscode
--

CREATE TABLE public.animals_details (
    id bigint NOT NULL,
    animal_id bigint NOT NULL,
    animal_kingdom text NOT NULL,
    species text,
    animal_weight numeric(10,2) NOT NULL,
    is_vaccinated boolean NOT NULL,
    recorded_date date DEFAULT CURRENT_DATE NOT NULL,
    diet_type text NOT NULL,
    health_status character varying(70),
    CONSTRAINT animals_details_animal_kingdom_check CHECK ((animal_kingdom = ANY (ARRAY['Vertebrates'::text, 'Invertebrates'::text, 'Mammals'::text, 'Birds'::text, 'Fish'::text, 'Reptiles'::text, 'Amphibians'::text, 'Insects'::text, 'Arachnids'::text])))
);


ALTER TABLE public.animals_details OWNER TO vscode;

--
-- Name: animals_details_id_seq; Type: SEQUENCE; Schema: public; Owner: vscode
--

CREATE SEQUENCE public.animals_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animals_details_id_seq OWNER TO vscode;

--
-- Name: animals_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vscode
--

ALTER SEQUENCE public.animals_details_id_seq OWNED BY public.animals_details.id;


--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: vscode
--

CREATE SEQUENCE public.animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animals_id_seq OWNER TO vscode;

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vscode
--

ALTER SEQUENCE public.animals_id_seq OWNED BY public.animals.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: vscode
--

CREATE TABLE public.teachers (
    id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(150) NOT NULL,
    school character varying(50),
    hire_date date NOT NULL,
    salary numeric(10,2) NOT NULL,
    CONSTRAINT teachers_hire_date_check CHECK ((hire_date <= CURRENT_DATE)),
    CONSTRAINT teachers_salary_check CHECK ((salary >= (0)::numeric))
);


ALTER TABLE public.teachers OWNER TO vscode;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: vscode
--

CREATE SEQUENCE public.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO vscode;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vscode
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: vscode
--

ALTER TABLE ONLY public.animals ALTER COLUMN id SET DEFAULT nextval('public.animals_id_seq'::regclass);


--
-- Name: animals_details id; Type: DEFAULT; Schema: public; Owner: vscode
--

ALTER TABLE ONLY public.animals_details ALTER COLUMN id SET DEFAULT nextval('public.animals_details_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: vscode
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: vscode
--

COPY public.animals (id, common_name, scientific_name, conservation_status) FROM stdin;
1	Lion	Panthera leo	Vulnerable
2	African Elephant	Loxodonta africana	Endangered
3	Giant Panda	Ailuropoda melanoleuca	Vulnerable
4	Blue Whale	Balaenoptera musculus	Endangered
5	Bald Eagle	Haliaeetus leucocephalus	Least Concern
6	Komodo Dragon	Varanus komodoensis	Endangered
7	Green Sea Turtle	Chelonia mydas	Endangered
8	Emperor Penguin	Aptenodytes forsteri	Near Threatened
9	Chimpanzee	Pan troglodytes	Endangered
10	Polar Bear	Ursus maritimus	Vulnerable
11	Red Fox	Vulpes vulpes	Least Concern
12	Snow Leopard	Panthera uncia	Vulnerable
13	Orangutan	Pongo pygmaeus	Critically Endangered
14	Gray Wolf	Canis lupus	Least Concern
15	White Rhinoceros	Ceratotherium simum	Near Threatened
\.


--
-- Data for Name: animals_details; Type: TABLE DATA; Schema: public; Owner: vscode
--

COPY public.animals_details (id, animal_id, animal_kingdom, species, animal_weight, is_vaccinated, recorded_date, diet_type, health_status) FROM stdin;
1	1	Mammals	Lion	190.50	t	2025-06-01	Carnivore	Healthy
2	2	Birds	Eagle	6.20	t	2025-06-05	Carnivore	Healthy
3	3	Fish	Great White Shark	2000.00	f	2025-06-10	Piscivore	Healthy
4	4	Reptiles	Python	45.75	t	2025-06-12	Carnivore	Healthy
5	5	Amphibians	Poison Dart Frog	0.05	f	2025-06-15	Insectivore	Healthy
6	6	Invertebrates	Octopus	15.00	f	2025-06-18	Carnivore	Healthy
7	7	Mammals	Elephant	5000.00	t	2025-06-20	Herbivore	Healthy
8	8	Birds	Penguin	35.00	t	2025-06-22	Piscivore	Healthy
9	9	Fish	Clownfish	0.10	f	2025-06-25	Omnivore	Healthy
10	10	Reptiles	Komodo Dragon	80.00	t	2025-06-28	Carnivore	Healthy
11	11	Mammals	Kangaroo	60.00	t	2025-07-01	Herbivore	Healthy
12	12	Birds	Owl	3.50	t	2025-07-02	Carnivore	Healthy
13	13	Insects	Ant	0.00	f	2025-07-03	Omnivore	Healthy
14	14	Arachnids	Tarantula	0.02	f	2025-07-04	Insectivore	Healthy
15	15	Mammals	Giraffe	1200.00	t	2025-07-05	Herbivore	Healthy
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: vscode
--

COPY public.teachers (id, first_name, last_name, school, hire_date, salary) FROM stdin;
1	Jan	Kowalski	Liceum Ogolnoksztalcace nr. V	2020-09-01	2000.00
3	Janet	Smith	F.D. Roosevelt HS	2011-10-30	36200.00
4	Lee	Reynolds	F.D. Roosevelt HS	1993-05-22	65000.00
5	Samuel	Cole	Myers Middle School	2005-08-01	43500.00
6	Samantha	Bush	Myers Middle School	2011-10-30	36200.00
7	Betty	Diaz	Myers Middle School	2005-08-30	43500.00
8	Kathleen	Roush	F.D. Roosevelt HS	2010-10-22	38500.00
\.


--
-- Name: animals_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vscode
--

SELECT pg_catalog.setval('public.animals_details_id_seq', 15, true);


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vscode
--

SELECT pg_catalog.setval('public.animals_id_seq', 15, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vscode
--

SELECT pg_catalog.setval('public.teachers_id_seq', 8, true);


--
-- Name: animals_details animals_details_pkey; Type: CONSTRAINT; Schema: public; Owner: vscode
--

ALTER TABLE ONLY public.animals_details
    ADD CONSTRAINT animals_details_pkey PRIMARY KEY (id);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: vscode
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- Name: animals_details unique_animal_id; Type: CONSTRAINT; Schema: public; Owner: vscode
--

ALTER TABLE ONLY public.animals_details
    ADD CONSTRAINT unique_animal_id UNIQUE (animal_id);


--
-- Name: animals unique_common_name; Type: CONSTRAINT; Schema: public; Owner: vscode
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT unique_common_name UNIQUE (common_name);


--
-- Name: animals_details animals_details_animal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vscode
--

ALTER TABLE ONLY public.animals_details
    ADD CONSTRAINT animals_details_animal_id_fkey FOREIGN KEY (animal_id) REFERENCES public.animals(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.21 (Debian 13.21-0+deb11u1)
-- Dumped by pg_dump version 13.21 (Debian 13.21-0+deb11u1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

