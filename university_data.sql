--
-- PostgreSQL database dump
--

\restrict aWSPzKpwM9bbrxnSFKwSpRITm6da91mXypO7NqawHtYF6cnxu4wNR3hHRII0qVv

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

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
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.courses VALUES (1, 'Bases de Datos', 5);
INSERT INTO public.courses VALUES (2, 'Programación Web', 4);
INSERT INTO public.courses VALUES (3, 'Bases de Datos', 5);
INSERT INTO public.courses VALUES (4, 'Programación Web', 4);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.students VALUES (2, 'Luis Soto', 'luis@uni.cl', NULL);
INSERT INTO public.students VALUES (1, 'Ana Pérez', 'ana@uni.cl', 1);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 6, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

\unrestrict aWSPzKpwM9bbrxnSFKwSpRITm6da91mXypO7NqawHtYF6cnxu4wNR3hHRII0qVv

