--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1 (Debian 17.1-1.pgdg120+1)
-- Dumped by pg_dump version 17.1 (Debian 17.1-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: academic_score; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.academic_score (
    academicscore_id bigint NOT NULL,
    intermediate_score real NOT NULL,
    matric_score real NOT NULL
);


ALTER TABLE public.academic_score OWNER TO username;

--
-- Name: academic_score_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.academic_score_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.academic_score_seq OWNER TO username;

--
-- Name: app_user; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.app_user (
    user_id bigint NOT NULL,
    username character varying(255),
    account_locked boolean NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    email character varying(255),
    enabled boolean NOT NULL,
    first_name character varying(255),
    last_modified_data timestamp(6) without time zone,
    last_name character varying(255),
    password character varying(255),
    academicscore_id bigint,
    universityreview_id bigint
);


ALTER TABLE public.app_user OWNER TO username;

--
-- Name: app_user_roles; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.app_user_roles (
    user_user_id bigint NOT NULL,
    roles_id integer NOT NULL
);


ALTER TABLE public.app_user_roles OWNER TO username;

--
-- Name: app_user_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.app_user_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.app_user_seq OWNER TO username;

--
-- Name: city; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.city (
    city_id bigint NOT NULL,
    name character varying(255),
    province character varying(255)
);


ALTER TABLE public.city OWNER TO username;

--
-- Name: city_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.city_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.city_seq OWNER TO username;

--
-- Name: facility; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.facility (
    facility_id bigint NOT NULL,
    facility_name character varying(255),
    university_id bigint
);


ALTER TABLE public.facility OWNER TO username;

--
-- Name: facility_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.facility_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facility_seq OWNER TO username;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.notification (
    notification_id bigint NOT NULL,
    alert_at timestamp(6) without time zone,
    generated_at timestamp(6) without time zone,
    message character varying(255),
    read boolean NOT NULL,
    user_id bigint
);


ALTER TABLE public.notification OWNER TO username;

--
-- Name: notification_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.notification_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_seq OWNER TO username;

--
-- Name: program; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.program (
    program_id bigint NOT NULL,
    degree_type character varying(255),
    name character varying(255),
    university_id bigint
);


ALTER TABLE public.program OWNER TO username;

--
-- Name: program_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.program_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.program_seq OWNER TO username;

--
-- Name: quiz; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.quiz (
    quiz_id bigint NOT NULL,
    subject character varying(255),
    university character varying(255)
);


ALTER TABLE public.quiz OWNER TO username;

--
-- Name: quiz_question; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.quiz_question (
    quizquestion_id bigint NOT NULL,
    correct_answer character varying(255),
    difficulty_level integer NOT NULL,
    option1 character varying(255),
    option2 character varying(255),
    option3 character varying(255),
    option4 character varying(255),
    question character varying(255),
    quiz_id bigint
);


ALTER TABLE public.quiz_question OWNER TO username;

--
-- Name: quiz_question_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.quiz_question_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_question_seq OWNER TO username;

--
-- Name: quiz_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.quiz_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_seq OWNER TO username;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.resource (
    resource_id bigint NOT NULL,
    url character varying(255),
    resource_name character varying(255),
    test_name character varying(255),
    university_name character varying(255),
    updloaded_at timestamp(6) without time zone
);


ALTER TABLE public.resource OWNER TO username;

--
-- Name: resource_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.resource_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resource_seq OWNER TO username;

--
-- Name: role; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.role (
    id integer NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    last_modified_date timestamp(6) without time zone,
    name character varying(255)
);


ALTER TABLE public.role OWNER TO username;

--
-- Name: role_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.role_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_seq OWNER TO username;

--
-- Name: token; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.token (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    token character varying(255),
    validated_at timestamp(6) without time zone,
    user_id bigint NOT NULL
);


ALTER TABLE public.token OWNER TO username;

--
-- Name: token_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.token_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.token_seq OWNER TO username;

--
-- Name: university; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.university (
    id bigint NOT NULL,
    created_by character varying(255) NOT NULL,
    created_date timestamp(6) without time zone NOT NULL,
    last_modified_by character varying(255),
    last_modified_date timestamp(6) without time zone,
    about character varying(255),
    accrediatetion_body character varying(255),
    apply_date timestamp(6) without time zone,
    average_fees double precision NOT NULL,
    name character varying(255),
    rank integer NOT NULL,
    start_date timestamp(6) without time zone,
    website_link character varying(255)
);


ALTER TABLE public.university OWNER TO username;

--
-- Name: university_contact; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.university_contact (
    universitycontact_id bigint NOT NULL,
    email character varying(255),
    phone_number character varying(255),
    "university-id" bigint
);


ALTER TABLE public.university_contact OWNER TO username;

--
-- Name: university_contact_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.university_contact_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_contact_seq OWNER TO username;

--
-- Name: university_location; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.university_location (
    universitylocation_id bigint NOT NULL,
    latitude real NOT NULL,
    longitude real NOT NULL,
    city_id bigint,
    university_id bigint
);


ALTER TABLE public.university_location OWNER TO username;

--
-- Name: university_location_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.university_location_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_location_seq OWNER TO username;

--
-- Name: university_review; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.university_review (
    universityreview_id bigint NOT NULL,
    rating integer NOT NULL,
    review character varying(255),
    "university-id" bigint
);


ALTER TABLE public.university_review OWNER TO username;

--
-- Name: university_review_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.university_review_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_review_seq OWNER TO username;

--
-- Name: university_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.university_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_seq OWNER TO username;

--
-- Name: university_university_contacts; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.university_university_contacts (
    university_id bigint NOT NULL,
    university_contacts_universitycontact_id bigint NOT NULL
);


ALTER TABLE public.university_university_contacts OWNER TO username;

--
-- Name: user_favorites; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.user_favorites (
    user_id bigint NOT NULL,
    university_id bigint NOT NULL
);


ALTER TABLE public.user_favorites OWNER TO username;

--
-- Name: user_favourite; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.user_favourite (
    userfavourite_id bigint NOT NULL
);


ALTER TABLE public.user_favourite OWNER TO username;

--
-- Name: user_favourite_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.user_favourite_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_favourite_seq OWNER TO username;

--
-- Name: user_location; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.user_location (
    userlocation_id bigint NOT NULL,
    latitude character varying(255),
    longitude character varying(255),
    city_id bigint,
    user_id bigint
);


ALTER TABLE public.user_location OWNER TO username;

--
-- Name: user_location_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.user_location_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_location_seq OWNER TO username;

--
-- Name: user_quiz; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.user_quiz (
    userquiz_id bigint NOT NULL,
    date timestamp(6) without time zone,
    score character varying(255),
    user_id bigint
);


ALTER TABLE public.user_quiz OWNER TO username;

--
-- Name: user_quiz_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.user_quiz_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_quiz_seq OWNER TO username;

--
-- Data for Name: academic_score; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.academic_score (academicscore_id, intermediate_score, matric_score) FROM stdin;
\.


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.app_user (user_id, username, account_locked, created_date, email, enabled, first_name, last_modified_data, last_name, password, academicscore_id, universityreview_id) FROM stdin;
\.


--
-- Data for Name: app_user_roles; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.app_user_roles (user_user_id, roles_id) FROM stdin;
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.city (city_id, name, province) FROM stdin;
\.


--
-- Data for Name: facility; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.facility (facility_id, facility_name, university_id) FROM stdin;
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.notification (notification_id, alert_at, generated_at, message, read, user_id) FROM stdin;
\.


--
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.program (program_id, degree_type, name, university_id) FROM stdin;
\.


--
-- Data for Name: quiz; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.quiz (quiz_id, subject, university) FROM stdin;
\.


--
-- Data for Name: quiz_question; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.quiz_question (quizquestion_id, correct_answer, difficulty_level, option1, option2, option3, option4, question, quiz_id) FROM stdin;
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.resource (resource_id, url, resource_name, test_name, university_name, updloaded_at) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.role (id, created_date, last_modified_date, name) FROM stdin;
1	2024-12-09 16:03:25.610108	\N	USER
\.


--
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.token (id, created_at, expires_at, token, validated_at, user_id) FROM stdin;
\.


--
-- Data for Name: university; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.university (id, created_by, created_date, last_modified_by, last_modified_date, about, accrediatetion_body, apply_date, average_fees, name, rank, start_date, website_link) FROM stdin;
\.


--
-- Data for Name: university_contact; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.university_contact (universitycontact_id, email, phone_number, "university-id") FROM stdin;
\.


--
-- Data for Name: university_location; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.university_location (universitylocation_id, latitude, longitude, city_id, university_id) FROM stdin;
\.


--
-- Data for Name: university_review; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.university_review (universityreview_id, rating, review, "university-id") FROM stdin;
\.


--
-- Data for Name: university_university_contacts; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.university_university_contacts (university_id, university_contacts_universitycontact_id) FROM stdin;
\.


--
-- Data for Name: user_favorites; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.user_favorites (user_id, university_id) FROM stdin;
\.


--
-- Data for Name: user_favourite; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.user_favourite (userfavourite_id) FROM stdin;
\.


--
-- Data for Name: user_location; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.user_location (userlocation_id, latitude, longitude, city_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_quiz; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.user_quiz (userquiz_id, date, score, user_id) FROM stdin;
\.


--
-- Name: academic_score_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.academic_score_seq', 1, false);


--
-- Name: app_user_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.app_user_seq', 1, false);


--
-- Name: city_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.city_seq', 1, false);


--
-- Name: facility_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.facility_seq', 1, false);


--
-- Name: notification_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.notification_seq', 1, false);


--
-- Name: program_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.program_seq', 1, false);


--
-- Name: quiz_question_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.quiz_question_seq', 1, false);


--
-- Name: quiz_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.quiz_seq', 1, false);


--
-- Name: resource_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.resource_seq', 1, false);


--
-- Name: role_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.role_seq', 1, true);


--
-- Name: token_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.token_seq', 1, false);


--
-- Name: university_contact_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_contact_seq', 1, false);


--
-- Name: university_location_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_location_seq', 1, false);


--
-- Name: university_review_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_review_seq', 1, false);


--
-- Name: university_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_seq', 1, false);


--
-- Name: user_favourite_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.user_favourite_seq', 1, false);


--
-- Name: user_location_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.user_location_seq', 1, false);


--
-- Name: user_quiz_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.user_quiz_seq', 1, false);


--
-- Name: academic_score academic_score_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.academic_score
    ADD CONSTRAINT academic_score_pkey PRIMARY KEY (academicscore_id);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (user_id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- Name: facility facility_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.facility
    ADD CONSTRAINT facility_pkey PRIMARY KEY (facility_id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (notification_id);


--
-- Name: program program_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (program_id);


--
-- Name: quiz quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (quiz_id);


--
-- Name: quiz_question quiz_question_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT quiz_question_pkey PRIMARY KEY (quizquestion_id);


--
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (resource_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: token token_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (id);


--
-- Name: app_user uk1j9d9a06i600gd43uu3km82jw; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT uk1j9d9a06i600gd43uu3km82jw UNIQUE (email);


--
-- Name: app_user uk1qbil27csbaxikv8ud704vlih; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT uk1qbil27csbaxikv8ud704vlih UNIQUE (universityreview_id);


--
-- Name: university_university_contacts uk7ne16n0gngrtk0509k42wwwj6; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_university_contacts
    ADD CONSTRAINT uk7ne16n0gngrtk0509k42wwwj6 UNIQUE (university_contacts_universitycontact_id);


--
-- Name: role uk8sewwnpamngi6b1dwaa88askk; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk8sewwnpamngi6b1dwaa88askk UNIQUE (name);


--
-- Name: app_user ukpsnrttmcl6i469wqwofiw2huu; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT ukpsnrttmcl6i469wqwofiw2huu UNIQUE (academicscore_id);


--
-- Name: university ukru212k5vib3yvu360fuy3h1g5; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university
    ADD CONSTRAINT ukru212k5vib3yvu360fuy3h1g5 UNIQUE (name);


--
-- Name: university_contact university_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_contact
    ADD CONSTRAINT university_contact_pkey PRIMARY KEY (universitycontact_id);


--
-- Name: university_location university_location_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_location
    ADD CONSTRAINT university_location_pkey PRIMARY KEY (universitylocation_id);


--
-- Name: university university_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university
    ADD CONSTRAINT university_pkey PRIMARY KEY (id);


--
-- Name: university_review university_review_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_review
    ADD CONSTRAINT university_review_pkey PRIMARY KEY (universityreview_id);


--
-- Name: user_favorites user_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_pkey PRIMARY KEY (user_id, university_id);


--
-- Name: user_favourite user_favourite_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_favourite
    ADD CONSTRAINT user_favourite_pkey PRIMARY KEY (userfavourite_id);


--
-- Name: user_location user_location_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_location
    ADD CONSTRAINT user_location_pkey PRIMARY KEY (userlocation_id);


--
-- Name: user_quiz user_quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_quiz
    ADD CONSTRAINT user_quiz_pkey PRIMARY KEY (userquiz_id);


--
-- Name: app_user_roles fk23e7b5jyl3ql41rk3566gywdd; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.app_user_roles
    ADD CONSTRAINT fk23e7b5jyl3ql41rk3566gywdd FOREIGN KEY (roles_id) REFERENCES public.role(id);


--
-- Name: user_favorites fk2otcgjmj6lp88jpi8hm9as99y; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT fk2otcgjmj6lp88jpi8hm9as99y FOREIGN KEY (university_id) REFERENCES public.university(id);


--
-- Name: user_location fk56ug55wtd5g3q47n7hotxm8wy; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_location
    ADD CONSTRAINT fk56ug55wtd5g3q47n7hotxm8wy FOREIGN KEY (user_id) REFERENCES public.app_user(user_id);


--
-- Name: university_university_contacts fk75djr7rubf3jtlya4pevody1o; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_university_contacts
    ADD CONSTRAINT fk75djr7rubf3jtlya4pevody1o FOREIGN KEY (university_id) REFERENCES public.university(id);


--
-- Name: university_university_contacts fkascs1w6yox7ku1odo6ku0ngvd; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_university_contacts
    ADD CONSTRAINT fkascs1w6yox7ku1odo6ku0ngvd FOREIGN KEY (university_contacts_universitycontact_id) REFERENCES public.university_contact(universitycontact_id);


--
-- Name: user_quiz fkcbibnu7ahntepay11kcalw2ey; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_quiz
    ADD CONSTRAINT fkcbibnu7ahntepay11kcalw2ey FOREIGN KEY (user_id) REFERENCES public.app_user(user_id);


--
-- Name: university_location fkcpcov1w1esc0q4k8rjsa0giyw; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_location
    ADD CONSTRAINT fkcpcov1w1esc0q4k8rjsa0giyw FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: notification fkcxbqr6g1py0j4m9qeq44h1ju6; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT fkcxbqr6g1py0j4m9qeq44h1ju6 FOREIGN KEY (user_id) REFERENCES public.app_user(user_id);


--
-- Name: quiz_question fkdtynvfjgh6e7fd8l0wk37nrpc; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT fkdtynvfjgh6e7fd8l0wk37nrpc FOREIGN KEY (quiz_id) REFERENCES public.quiz(quiz_id);


--
-- Name: token fkebe1hlldfjpivnyt2tlydy4vl; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT fkebe1hlldfjpivnyt2tlydy4vl FOREIGN KEY (user_id) REFERENCES public.app_user(user_id);


--
-- Name: program fkh9w7iom0b27ijt7e1mn9foack; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT fkh9w7iom0b27ijt7e1mn9foack FOREIGN KEY (university_id) REFERENCES public.university(id);


--
-- Name: app_user fkj11qh1ywhtkga8thjgpk9sxvd; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fkj11qh1ywhtkga8thjgpk9sxvd FOREIGN KEY (academicscore_id) REFERENCES public.academic_score(academicscore_id);


--
-- Name: facility fkjk06pf0o4lc3u862r9q6j2id4; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.facility
    ADD CONSTRAINT fkjk06pf0o4lc3u862r9q6j2id4 FOREIGN KEY (university_id) REFERENCES public.university(id);


--
-- Name: university_review fkkctgib47ynwbylt0g4pcqy5j3; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_review
    ADD CONSTRAINT fkkctgib47ynwbylt0g4pcqy5j3 FOREIGN KEY ("university-id") REFERENCES public.university(id);


--
-- Name: app_user fkl18ch3l76og5y7c2onx1j10cg; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fkl18ch3l76og5y7c2onx1j10cg FOREIGN KEY (universityreview_id) REFERENCES public.university_review(universityreview_id);


--
-- Name: app_user_roles fkmbxhqftmtp6k3ms5dxoaomhoi; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.app_user_roles
    ADD CONSTRAINT fkmbxhqftmtp6k3ms5dxoaomhoi FOREIGN KEY (user_user_id) REFERENCES public.app_user(user_id);


--
-- Name: user_location fkmmfnjjtgwqfjwamkc3jb9p49p; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_location
    ADD CONSTRAINT fkmmfnjjtgwqfjwamkc3jb9p49p FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: university_location fknh24l6yc55xguqps1x66jl0fn; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_location
    ADD CONSTRAINT fknh24l6yc55xguqps1x66jl0fn FOREIGN KEY (university_id) REFERENCES public.university(id);


--
-- Name: university_contact fknp6ynlcjwjmv7m2eokmc8pa4a; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_contact
    ADD CONSTRAINT fknp6ynlcjwjmv7m2eokmc8pa4a FOREIGN KEY ("university-id") REFERENCES public.university(id);


--
-- Name: user_favorites fko3noc049cidpnky8k7638agel; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT fko3noc049cidpnky8k7638agel FOREIGN KEY (user_id) REFERENCES public.app_user(user_id);


--
-- PostgreSQL database dump complete
--

