--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxies_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxies_planets (
    galaxies_planets_id integer NOT NULL,
    galaxy_id integer,
    planet_id integer,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxies_planets OWNER TO freecodecamp;

--
-- Name: galaxies_planets_galaxies_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_planets_galaxies_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_planets_galaxies_planets_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_planets_galaxies_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_planets_galaxies_planets_id_seq OWNED BY public.galaxies_planets.galaxies_planets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    age_in_millions_of_years integer NOT NULL,
    type character varying(40),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_spherical boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(50) NOT NULL,
    distance_from_earth numeric(5,5) NOT NULL,
    age_in_millions_of_years integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    ditance_from_earth integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxies_planets galaxies_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxies_planets ALTER COLUMN galaxies_planets_id SET DEFAULT nextval('public.galaxies_planets_galaxies_planets_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxies_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxies_planets VALUES (1, 1, 1, 'test1', NULL);
INSERT INTO public.galaxies_planets VALUES (2, 1, 2, 'test2', NULL);
INSERT INTO public.galaxies_planets VALUES (3, 2, 3, 'test3', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Alcyoneus', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda I', 2, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 5, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Ambartsumian''s knot', 10, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Antennae Galaxies', 23, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Backward Galaxy', 4, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Bear Paw Galaxy', 13, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Ganymede', NULL, NULL);
INSERT INTO public.moon VALUES (2, 1, 'Callisto', NULL, NULL);
INSERT INTO public.moon VALUES (3, 1, 'Europa', NULL, NULL);
INSERT INTO public.moon VALUES (4, 2, 'Io', NULL, NULL);
INSERT INTO public.moon VALUES (5, 2, 'Tanjiro', NULL, NULL);
INSERT INTO public.moon VALUES (6, 3, 'Kamado', NULL, NULL);
INSERT INTO public.moon VALUES (7, 3, 'Eren', NULL, NULL);
INSERT INTO public.moon VALUES (8, 4, 'Okarun', NULL, NULL);
INSERT INTO public.moon VALUES (9, 4, 'Mmomo', NULL, NULL);
INSERT INTO public.moon VALUES (10, 4, 'Aria', NULL, NULL);
INSERT INTO public.moon VALUES (11, 5, 'Arturo', NULL, NULL);
INSERT INTO public.moon VALUES (12, 6, 'Josesito', NULL, NULL);
INSERT INTO public.moon VALUES (13, 6, 'Valentin', NULL, NULL);
INSERT INTO public.moon VALUES (14, 7, 'Teresa', NULL, NULL);
INSERT INTO public.moon VALUES (15, 7, 'Eri', NULL, NULL);
INSERT INTO public.moon VALUES (16, 7, 'Nanakusa', NULL, NULL);
INSERT INTO public.moon VALUES (17, 7, 'Aimyon', NULL, NULL);
INSERT INTO public.moon VALUES (18, 1, 'Goku', NULL, NULL);
INSERT INTO public.moon VALUES (19, 1, 'Bulma', NULL, NULL);
INSERT INTO public.moon VALUES (20, 3, 'krilin', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Gamma Cephei Ab', 0.12200, NULL);
INSERT INTO public.planet VALUES (2, 1, '51 Pegasi b', 0.12200, NULL);
INSERT INTO public.planet VALUES (3, 1, 'PSR B1257', 0.23300, NULL);
INSERT INTO public.planet VALUES (4, 1, 'Dh tauri b', 0.34000, NULL);
INSERT INTO public.planet VALUES (5, 2, 'V391 Pegasi b', 0.56600, NULL);
INSERT INTO public.planet VALUES (6, 2, 'Fomalhaut b', 0.56000, NULL);
INSERT INTO public.planet VALUES (7, 3, 'kepler-19c', 0.43300, NULL);
INSERT INTO public.planet VALUES (8, 3, 'Kepler-88c', 0.12300, NULL);
INSERT INTO public.planet VALUES (9, 3, 'Beta Pictoris d', 0.23400, NULL);
INSERT INTO public.planet VALUES (10, 4, 'DH tauri', 0.23450, NULL);
INSERT INTO public.planet VALUES (11, 1, 'Gamma Cephei A', 0.12200, NULL);
INSERT INTO public.planet VALUES (12, 3, 'Okarun', 0.45000, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a lyn', 222, false, true, 1);
INSERT INTO public.star VALUES (2, '38 lyn', 122, false, true, 1);
INSERT INTO public.star VALUES (3, '10 Uma', 54, false, true, 1);
INSERT INTO public.star VALUES (4, 'Alpheratz', 97, false, true, 2);
INSERT INTO public.star VALUES (5, 'Mirach', 199, false, true, 2);
INSERT INTO public.star VALUES (6, '51 And', 174, false, true, 2);


--
-- Name: galaxies_planets_galaxies_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_planets_galaxies_planets_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxies_planets galaxies_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxies_planets
    ADD CONSTRAINT galaxies_planets_name_key UNIQUE (name);


--
-- Name: galaxies_planets galaxies_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxies_planets
    ADD CONSTRAINT galaxies_planets_pkey PRIMARY KEY (galaxies_planets_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: galaxies_planets galaxies_planets_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxies_planets
    ADD CONSTRAINT galaxies_planets_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxies_planets galaxies_planets_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxies_planets
    ADD CONSTRAINT galaxies_planets_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

