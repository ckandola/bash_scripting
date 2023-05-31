--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

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
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100)
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50)
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    gpa numeric(2,1),
    major_id integer
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (17, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (18, 'Web Programming');
INSERT INTO public.courses VALUES (19, 'Database Systems');
INSERT INTO public.courses VALUES (20, 'Computer Networks');
INSERT INTO public.courses VALUES (21, 'SQL');
INSERT INTO public.courses VALUES (22, 'Machine Learning');
INSERT INTO public.courses VALUES (23, 'Computer Systems');
INSERT INTO public.courses VALUES (24, 'Web Applications');
INSERT INTO public.courses VALUES (25, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (26, 'Python');
INSERT INTO public.courses VALUES (27, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (28, 'Calculus');
INSERT INTO public.courses VALUES (29, 'Game Architecture');
INSERT INTO public.courses VALUES (30, 'Algorithms');
INSERT INTO public.courses VALUES (31, 'UNIX');
INSERT INTO public.courses VALUES (32, 'Server Administration');
INSERT INTO public.courses VALUES (33, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (17, 'Database Administration');
INSERT INTO public.majors VALUES (18, 'Web Development');
INSERT INTO public.majors VALUES (19, 'Data Science');
INSERT INTO public.majors VALUES (20, 'Network Engineering');
INSERT INTO public.majors VALUES (21, 'Computer Programming');
INSERT INTO public.majors VALUES (22, 'Game Design');
INSERT INTO public.majors VALUES (23, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (17, 17);
INSERT INTO public.majors_courses VALUES (18, 18);
INSERT INTO public.majors_courses VALUES (17, 19);
INSERT INTO public.majors_courses VALUES (19, 17);
INSERT INTO public.majors_courses VALUES (20, 20);
INSERT INTO public.majors_courses VALUES (17, 21);
INSERT INTO public.majors_courses VALUES (19, 22);
INSERT INTO public.majors_courses VALUES (20, 23);
INSERT INTO public.majors_courses VALUES (21, 20);
INSERT INTO public.majors_courses VALUES (17, 24);
INSERT INTO public.majors_courses VALUES (22, 25);
INSERT INTO public.majors_courses VALUES (19, 26);
INSERT INTO public.majors_courses VALUES (21, 27);
INSERT INTO public.majors_courses VALUES (23, 23);
INSERT INTO public.majors_courses VALUES (22, 28);
INSERT INTO public.majors_courses VALUES (18, 17);
INSERT INTO public.majors_courses VALUES (19, 28);
INSERT INTO public.majors_courses VALUES (18, 27);
INSERT INTO public.majors_courses VALUES (22, 29);
INSERT INTO public.majors_courses VALUES (23, 20);
INSERT INTO public.majors_courses VALUES (22, 30);
INSERT INTO public.majors_courses VALUES (23, 31);
INSERT INTO public.majors_courses VALUES (23, 32);
INSERT INTO public.majors_courses VALUES (21, 23);
INSERT INTO public.majors_courses VALUES (21, 26);
INSERT INTO public.majors_courses VALUES (20, 33);
INSERT INTO public.majors_courses VALUES (18, 24);
INSERT INTO public.majors_courses VALUES (20, 30);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (5, 'Rhea', 'Kellems', 2.5, 17);
INSERT INTO public.students VALUES (6, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (7, 'Kimberly', 'Whitley', 3.8, 18);
INSERT INTO public.students VALUES (8, 'Jimmy', 'Felipe', 3.7, 17);
INSERT INTO public.students VALUES (9, 'Kyle', 'Stimson', 2.8, NULL);
INSERT INTO public.students VALUES (10, 'Casares', 'Hijo', 4.0, 22);
INSERT INTO public.students VALUES (11, 'Noe', 'Savage', 3.6, NULL);
INSERT INTO public.students VALUES (12, 'Sterling', 'Boss', 3.9, 22);
INSERT INTO public.students VALUES (13, 'Brian', 'Davis', 2.3, NULL);
INSERT INTO public.students VALUES (14, 'Kaija', 'Uronen', 3.7, 22);
INSERT INTO public.students VALUES (15, 'Faye', 'Conn', 2.1, 22);
INSERT INTO public.students VALUES (16, 'Efren', 'Reilly', 3.9, 18);
INSERT INTO public.students VALUES (17, 'Danh', 'Nhung', 2.4, NULL);
INSERT INTO public.students VALUES (18, 'Maxine', 'Hagenes', 2.9, 17);
INSERT INTO public.students VALUES (19, 'Larry', 'Saunders', 2.2, 19);
INSERT INTO public.students VALUES (20, 'Karl', 'Kuhar', NULL, 18);
INSERT INTO public.students VALUES (21, 'Lieke', 'Hazenveld', 3.5, 22);
INSERT INTO public.students VALUES (22, 'Obie', 'Hilpert', NULL, 18);
INSERT INTO public.students VALUES (23, 'Peter', 'Booysen', 2.9, NULL);
INSERT INTO public.students VALUES (24, 'Nathan', 'Turner', 3.3, 17);
INSERT INTO public.students VALUES (25, 'Gerald', 'Osiki', 2.2, 19);
INSERT INTO public.students VALUES (26, 'Vanya', 'Hassanah', 4.0, 22);
INSERT INTO public.students VALUES (27, 'Roxelana', 'Florescu', 3.2, 17);
INSERT INTO public.students VALUES (28, 'Helene', 'Parker', 3.4, 19);
INSERT INTO public.students VALUES (29, 'Mariana', 'Russel', 1.8, 18);
INSERT INTO public.students VALUES (30, 'Ajit', 'Dhungel', 3.0, NULL);
INSERT INTO public.students VALUES (31, 'Mehdi', 'Vandenberghe', 1.9, 17);
INSERT INTO public.students VALUES (32, 'Dejon', 'Howell', 4.0, 18);
INSERT INTO public.students VALUES (33, 'Aliya', 'Gulgowski', 2.6, 23);
INSERT INTO public.students VALUES (34, 'Ana', 'Tupajic', 3.1, 19);
INSERT INTO public.students VALUES (35, 'Hugo', 'Duran', 3.8, NULL);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 33, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 23, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 35, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

