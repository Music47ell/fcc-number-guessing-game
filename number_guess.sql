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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL,
    played_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2, 511, '2024-10-09 18:33:27.382172');
INSERT INTO public.games VALUES (2, 2, 823, '2024-10-09 18:33:27.565388');
INSERT INTO public.games VALUES (3, 3, 628, '2024-10-09 18:33:27.716118');
INSERT INTO public.games VALUES (4, 3, 958, '2024-10-09 18:33:27.910325');
INSERT INTO public.games VALUES (5, 2, 147, '2024-10-09 18:33:28.031648');
INSERT INTO public.games VALUES (6, 2, 87, '2024-10-09 18:33:28.151598');
INSERT INTO public.games VALUES (7, 2, 550, '2024-10-09 18:33:28.301138');
INSERT INTO public.games VALUES (8, 4, 157, '2024-10-09 18:33:41.04312');
INSERT INTO public.games VALUES (9, 4, 606, '2024-10-09 18:33:41.225834');
INSERT INTO public.games VALUES (10, 5, 704, '2024-10-09 18:33:41.384951');
INSERT INTO public.games VALUES (11, 5, 941, '2024-10-09 18:33:41.590748');
INSERT INTO public.games VALUES (12, 4, 847, '2024-10-09 18:33:41.768344');
INSERT INTO public.games VALUES (13, 4, 439, '2024-10-09 18:33:41.916721');
INSERT INTO public.games VALUES (14, 4, 488, '2024-10-09 18:33:42.070477');
INSERT INTO public.games VALUES (15, 6, 764, '2024-10-09 18:34:14.047506');
INSERT INTO public.games VALUES (16, 6, 728, '2024-10-09 18:34:14.2166');
INSERT INTO public.games VALUES (17, 7, 925, '2024-10-09 18:34:14.378879');
INSERT INTO public.games VALUES (18, 7, 504, '2024-10-09 18:34:14.543856');
INSERT INTO public.games VALUES (19, 6, 846, '2024-10-09 18:34:14.72064');
INSERT INTO public.games VALUES (20, 6, 377, '2024-10-09 18:34:14.862849');
INSERT INTO public.games VALUES (21, 6, 307, '2024-10-09 18:34:14.988472');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'a');
INSERT INTO public.users VALUES (2, 'user_1728498807206');
INSERT INTO public.users VALUES (3, 'user_1728498807205');
INSERT INTO public.users VALUES (4, 'user_1728498820924');
INSERT INTO public.users VALUES (5, 'user_1728498820923');
INSERT INTO public.users VALUES (6, 'user_1728498853870');
INSERT INTO public.users VALUES (7, 'user_1728498853869');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 21, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 7, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

