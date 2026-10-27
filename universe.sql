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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km numeric NOT NULL,
    is_hazardous boolean DEFAULT false,
    estimated_mass_kg integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    has_life boolean DEFAULT false,
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
    name character varying(100) NOT NULL,
    radius_km integer NOT NULL,
    is_tidally_locked boolean DEFAULT true,
    surface_gravity numeric,
    discovery_year integer
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
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbital_period_days integer NOT NULL,
    has_rings boolean DEFAULT false,
    radius_km numeric,
    atmospheric_composition text
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
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    temperature_kelvin integer NOT NULL,
    is_main_sequence boolean DEFAULT true,
    mass_solar_masses numeric
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.4, false, 939);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.4, false, 259);
INSERT INTO public.asteroid VALUES (3, 'Apophis', 0.37, true, 61);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, true, 'Our home galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2.537, false, 'The closest large galaxy to us.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 2.73, false, 'A spiral galaxy in the constellation Triangulum.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 13200, 28.0, false, 'Characterized by its bright nucleus.');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 11000, 11.0, false, 'Known for its prominent dust lane.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 400, 23.0, false, 'A classic spiral galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 1737, true, 1.62, NULL);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 11, true, 0.0057, 1877);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 6, true, 0.003, 1877);
INSERT INTO public.moon VALUES (4, 5, 'Io', 1821, true, 1.796, 1610);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 1560, true, 1.315, 1610);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 2634, true, 1.428, 1610);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 2410, true, 1.236, 1610);
INSERT INTO public.moon VALUES (8, 6, 'Mimas', 198, true, 0.064, 1789);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 252, true, 0.113, 1789);
INSERT INTO public.moon VALUES (10, 6, 'Tethys', 531, true, 0.145, 1684);
INSERT INTO public.moon VALUES (11, 6, 'Dione', 561, true, 0.232, 1684);
INSERT INTO public.moon VALUES (12, 6, 'Rhea', 763, true, 0.264, 1672);
INSERT INTO public.moon VALUES (13, 6, 'Titan', 2574, true, 1.352, 1655);
INSERT INTO public.moon VALUES (14, 6, 'Iapetus', 734, true, 0.223, 1671);
INSERT INTO public.moon VALUES (15, 7, 'Miranda', 235, true, 0.079, 1948);
INSERT INTO public.moon VALUES (16, 7, 'Ariel', 578, true, 0.269, 1851);
INSERT INTO public.moon VALUES (17, 7, 'Umbriel', 584, true, 0.200, 1851);
INSERT INTO public.moon VALUES (18, 7, 'Titania', 788, true, 0.379, 1787);
INSERT INTO public.moon VALUES (19, 7, 'Oberon', 761, true, 0.346, 1787);
INSERT INTO public.moon VALUES (20, 8, 'Triton', 1353, true, 0.779, 1846);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 88, false, 2439.7, 'Thin exosphere');
INSERT INTO public.planet VALUES (2, 1, 'Venus', 225, false, 6051.8, 'Carbon Dioxide, Nitrogen');
INSERT INTO public.planet VALUES (3, 1, 'Earth', 365, false, 6371.0, 'Nitrogen, Oxygen');
INSERT INTO public.planet VALUES (4, 1, 'Mars', 687, false, 3389.5, 'Carbon Dioxide');
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 4333, true, 69911.0, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 10759, true, 58232.0, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 30687, true, 25362.0, 'Hydrogen, Helium, Methane');
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 60190, true, 24622.0, 'Hydrogen, Helium, Methane');
INSERT INTO public.planet VALUES (9, 2, 'Sirius Prime', 500, false, 8200.0, 'Nitrogen');
INSERT INTO public.planet VALUES (10, 2, 'Sirius Secundus', 1200, true, 45000.0, 'Gas giant');
INSERT INTO public.planet VALUES (11, 3, 'Centauri Rock', 20, false, 4100.0, 'None');
INSERT INTO public.planet VALUES (12, 3, 'Centauri Gas', 450, true, 72000.0, 'Helium');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 5778, true, 1.0);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 9940, true, 2.06);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri A', 5790, true, 1.1);
INSERT INTO public.star VALUES (4, 2, 'Andromeda Alpha', 12000, true, 4.5);
INSERT INTO public.star VALUES (5, 2, 'Mirach', 3800, false, 3.2);
INSERT INTO public.star VALUES (6, 3, 'Triangulum Alpha', 6200, true, 1.4);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


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

