--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: common; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.common (
    galaxy_id integer,
    star_id integer,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    common_id integer NOT NULL,
    moon_id integer
);


ALTER TABLE public.common OWNER TO freecodecamp;

--
-- Name: common_common_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.common_common_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.common_common_id_seq OWNER TO freecodecamp;

--
-- Name: common_common_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.common_common_id_seq OWNED BY public.common.common_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text,
    galaxy_types character varying(30)
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(7,3),
    planet_id integer,
    has_life boolean DEFAULT false
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    has_life boolean,
    planet_types character varying(30),
    star_id integer
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text,
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
-- Name: common common_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.common ALTER COLUMN common_id SET DEFAULT nextval('public.common_common_id_seq'::regclass);


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
-- Data for Name: common; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.common VALUES (7, 13, 13, 'Andromeda1', 7, 21);
INSERT INTO public.common VALUES (8, 14, 14, 'Triangulum1', 8, 22);
INSERT INTO public.common VALUES (9, 15, 15, 'Whirlpool1', 9, 23);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, 'Andromeda', 10000, 'A massive galaxy in the Local Group', 'Spiral');
INSERT INTO public.galaxy VALUES (8, 'Triangulum', 6000, 'The third-largest galaxy in the Local Group', 'Spiral');
INSERT INTO public.galaxy VALUES (9, 'Whirlpool', 4500, 'Famous for its pronounced spiral arms', 'Spiral');
INSERT INTO public.galaxy VALUES (10, 'Cartwheel', 800, 'A ring galaxy with a distinctive appearance', 'Ring');
INSERT INTO public.galaxy VALUES (11, 'Sombrero', 9800, 'Known for its bright nucleus and large central bulge', 'Spiral');
INSERT INTO public.galaxy VALUES (12, 'Messier 87', 14500, 'A giant elliptical galaxy with a supermassive black hole', 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 4.527, 13, false);
INSERT INTO public.moon VALUES (22, 'Phobos', 4.503, 14, false);
INSERT INTO public.moon VALUES (23, 'Deimos', 4.502, 14, false);
INSERT INTO public.moon VALUES (24, 'Io', 4.500, 15, false);
INSERT INTO public.moon VALUES (25, 'Europa', 4.498, 15, false);
INSERT INTO public.moon VALUES (26, 'Ganymede', 4.504, 15, false);
INSERT INTO public.moon VALUES (27, 'Callisto', 4.507, 15, false);
INSERT INTO public.moon VALUES (28, 'Titan', 4.509, 16, false);
INSERT INTO public.moon VALUES (29, 'Rhea', 4.507, 16, false);
INSERT INTO public.moon VALUES (30, 'Iapetus', 4.506, 16, false);
INSERT INTO public.moon VALUES (31, 'Dione', 4.504, 16, false);
INSERT INTO public.moon VALUES (32, 'Tethys', 4.503, 16, false);
INSERT INTO public.moon VALUES (33, 'Enceladus', 4.502, 16, false);
INSERT INTO public.moon VALUES (34, 'Mimas', 4.501, 16, false);
INSERT INTO public.moon VALUES (35, 'Miranda', 4.450, 17, false);
INSERT INTO public.moon VALUES (36, 'Ariel', 4.451, 17, false);
INSERT INTO public.moon VALUES (37, 'Umbriel', 4.452, 17, false);
INSERT INTO public.moon VALUES (38, 'Titania', 4.453, 17, false);
INSERT INTO public.moon VALUES (39, 'Oberon', 4.454, 17, false);
INSERT INTO public.moon VALUES (40, 'Triton', 4.493, 18, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 'Smallest planet in the Solar System', true, false, 'Terrestrial', 13);
INSERT INTO public.planet VALUES (14, 'Venus', 'Second planet from the Sun, with a thick atmosphere', true, false, 'Terrestrial', 13);
INSERT INTO public.planet VALUES (15, 'Earth', 'Our home planet, with abundant life and liquid water', true, true, 'Terrestrial', 14);
INSERT INTO public.planet VALUES (16, 'Mars', 'Known as the Red Planet, with a thin atmosphere', true, false, 'Terrestrial', 14);
INSERT INTO public.planet VALUES (17, 'Jupiter', 'Largest planet in the Solar System, with a Great Red Spot', true, false, 'Gas Giant', 15);
INSERT INTO public.planet VALUES (18, 'Saturn', 'Famous for its stunning ring system', true, false, 'Gas Giant', 15);
INSERT INTO public.planet VALUES (19, 'Uranus', 'An ice giant with a unique tilt', true, false, 'Ice Giant', 16);
INSERT INTO public.planet VALUES (20, 'Neptune', 'Known for its deep blue color and strong winds', true, false, 'Ice Giant', 16);
INSERT INTO public.planet VALUES (21, 'Kepler-22b', 'An exoplanet in the habitable zone of its star', true, false, 'Exoplanet', 17);
INSERT INTO public.planet VALUES (22, 'Gliese 581g', 'A potentially habitable exoplanet', true, false, 'Exoplanet', 17);
INSERT INTO public.planet VALUES (23, 'HD 209458 b', 'A hot Jupiter exoplanet', true, false, 'Gas Giant', 18);
INSERT INTO public.planet VALUES (24, 'TRAPPIST-1e', 'One of the seven Earth-sized planets in the TRAPPIST-1 system', true, false, 'Terrestrial', 18);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (13, 'Sirius', 242, 'The brightest star in the night sky', 7);
INSERT INTO public.star VALUES (14, 'Betelgeuse', 8200, 'A red supergiant star nearing the end of its life', 8);
INSERT INTO public.star VALUES (15, 'Proxima Centauri', 4500, 'The closest known star to the Sun', 9);
INSERT INTO public.star VALUES (16, 'Vega', 455, 'One of the most luminous stars in the nearby vicinity', 10);
INSERT INTO public.star VALUES (17, 'Aldebaran', 6500, 'A red giant star in the constellation of Taurus', 11);
INSERT INTO public.star VALUES (18, 'Rigel', 8000, 'A blue supergiant star in the constellation of Orion', 12);


--
-- Name: common_common_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.common_common_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: common common_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.common
    ADD CONSTRAINT common_name_key UNIQUE (name);


--
-- Name: common common_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.common
    ADD CONSTRAINT common_pkey PRIMARY KEY (common_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


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
-- Name: moon name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: common common_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.common
    ADD CONSTRAINT common_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: common common_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.common
    ADD CONSTRAINT common_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: common common_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.common
    ADD CONSTRAINT common_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: common common_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.common
    ADD CONSTRAINT common_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

