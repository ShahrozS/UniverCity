--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

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
    universityreview_id bigint,
    phone_number character varying(255)
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
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: username
--

ALTER TABLE public.city ALTER COLUMN city_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
-- Name: program_program_id_seq; Type: SEQUENCE; Schema: public; Owner: username
--

ALTER TABLE public.program ALTER COLUMN program_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.program_program_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
-- Name: question_sub_main; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.question_sub_main (
    question_sub_main_id bigint NOT NULL,
    quizquestion_id bigint,
    quizsubcategorymaincategory_id bigint
);


ALTER TABLE public.question_sub_main OWNER TO username;

--
-- Name: question_sub_main_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.question_sub_main_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_sub_main_seq OWNER TO username;

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
-- Name: quiz_category; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.quiz_category (
    quizcategory_id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.quiz_category OWNER TO username;

--
-- Name: quiz_category_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.quiz_category_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_category_seq OWNER TO username;

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
-- Name: quiz_sub_category; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.quiz_sub_category (
    quizsubcategory_id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.quiz_sub_category OWNER TO username;

--
-- Name: quiz_sub_category_main_category; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.quiz_sub_category_main_category (
    quiz_sub_category_main_category_id bigint NOT NULL,
    quizcategory_id bigint,
    quizsubcategory_id bigint
);


ALTER TABLE public.quiz_sub_category_main_category OWNER TO username;

--
-- Name: quiz_sub_category_main_category_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.quiz_sub_category_main_category_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_sub_category_main_category_seq OWNER TO username;

--
-- Name: quiz_sub_category_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.quiz_sub_category_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_sub_category_seq OWNER TO username;

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
    about character varying(5000),
    accrediatetion_body character varying(255),
    apply_date timestamp(6) without time zone,
    average_fees double precision NOT NULL,
    name character varying(255),
    rank integer NOT NULL,
    start_date timestamp(6) without time zone,
    website_link character varying(255),
    entry_test_date timestamp(6) without time zone
);


ALTER TABLE public.university OWNER TO username;

--
-- Name: university_contact; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.university_contact (
    universitycontact_id bigint NOT NULL,
    email character varying(255),
    phone_number character varying(255),
    university_id bigint,
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
-- Name: university_contact_universitycontact_id_seq; Type: SEQUENCE; Schema: public; Owner: username
--

ALTER TABLE public.university_contact ALTER COLUMN universitycontact_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.university_contact_universitycontact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: university_id_seq; Type: SEQUENCE; Schema: public; Owner: username
--

ALTER TABLE public.university ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.university_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
-- Name: university_location_universitylocation_id_seq; Type: SEQUENCE; Schema: public; Owner: username
--

ALTER TABLE public.university_location ALTER COLUMN universitylocation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.university_location_universitylocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


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
    date date,
    score character varying(255),
    user_id bigint,
    completed real NOT NULL,
    quizcategory_id bigint
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

COPY public.app_user (user_id, username, account_locked, created_date, email, enabled, first_name, last_modified_data, last_name, password, academicscore_id, universityreview_id, phone_number) FROM stdin;
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
4	Islamabad	Islamabad Capital Territory
5	lahore	Punjab
6	karachi	Sindh
7	peshawar	KPK
8	quetta	balochistan
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
1	Bachelors	BS - Artificial Intelligence	37
2	Bachelors	BS - Aviation Management	37
3	Bachelors	BS - Computer Engineering	37
4	Bachelors	BS - Computer Games Development	37
5	Bachelors	BS - Computer Science	37
6	Bachelors	BS - Cyber Security	37
7	Bachelors	BS - Data Science	37
8	Bachelors	BS - Education	37
9	Bachelors	BS - Electrical	37
10	Bachelors	BS - English	37
11	Bachelors	BS - Finance & Accounting	37
12	Bachelors	BS - Healthcare Systems Management	37
13	Bachelors	BS - Information Technology	37
14	Bachelors	BS - International Relations	37
15	Bachelors	BS - Mathematics	37
16	Bachelors	BS - Multimedia	37
17	Bachelors	BS - Physics	37
18	Bachelors	BS - Psychology	37
19	Bachelors	BS - Software Engineering	37
20	Bachelors	BS - Strategic Studies	37
21	Bachelors	BS - Tourism & Hospitality	37
22	Bachelors	BS - Computer Science	35
23	Bachelors	BS - Information Technology	35
24	Bachelors	BS - Arabic	38
25	Bachelors	BS - Biochemistry	38
26	Bachelors	BS - Botany	38
27	Bachelors	BS - Chemistry	38
28	Bachelors	BS - Computer Science	38
29	Bachelors	BS - Economics	38
30	Bachelors	BS - Environmental Sciences	38
31	Bachelors	BS - Gender & Women Studies	38
32	Bachelors	BS - Hadith & Seerah	38
33	Bachelors	BS - History	38
34	Bachelors	BS - Information Technology	38
35	Bachelors	BS - Instructional Technology	38
36	Bachelors	BS - Interfaith Studies	38
37	Bachelors	BS - Islamic Studies	38
38	Bachelors	BS - Mathematics	38
39	Bachelors	BS - Microbiology	38
40	Bachelors	BS - Pakistan Studies	38
41	Bachelors	BS - Physics	38
42	Bachelors	BS - Quran & Tafseer	38
43	Bachelors	BS - Rural Development	38
44	Bachelors	BS - Seerat Studies	38
45	Bachelors	BS - Shariah	38
46	Bachelors	BS - Sociology	38
47	Bachelors	BS - Statistics	38
48	Bachelors	BS - Urdu	38
49	Bachelors	BS - Area Studies	27
50	Bachelors	BS - Artificial Intelligence	27
51	Bachelors	BS - Balochi	27
52	Bachelors	BS - Bengali	27
53	Bachelors	BS - Chinese	27
54	Bachelors	BS - Computer Engineering	27
55	Bachelors	BS - Computer Science	27
56	Bachelors	BS - Conflict & Peace Studies	27
57	Bachelors	BS - Early Childhood Care And Education	27
58	Bachelors	BS - Economics	27
59	Bachelors	BS - Economics & Finance	27
60	Bachelors	BS - Education [health & Physical]	27
61	Bachelors	BS - Educational Leadership & Management	27
62	Bachelors	BS - Electronics	27
63	Bachelors	BS - English	27
64	Bachelors	BS - Finance & Accounting	27
65	Bachelors	BS - French	27
66	Bachelors	BS - German	27
67	Bachelors	BS - Hindi	27
68	Bachelors	BS - History	27
69	Bachelors	BS - Information Technology	27
70	Bachelors	BS - International Relations	27
71	Bachelors	BS - Islamic Studies	27
72	Bachelors	BS - Korean	27
73	Bachelors	BS - Mathematics	27
74	Bachelors	BS - Media & Communication	27
75	Bachelors	BS - Pakistan Studies	27
76	Bachelors	BS - Persian	27
77	Bachelors	BS - Psychology	27
78	Bachelors	BS - Public Administration	27
79	Bachelors	BS - Punjabi	27
80	Bachelors	BS - Pushto	27
81	Bachelors	BS - Software Engineering	27
82	Bachelors	BS - Spanish	27
83	Bachelors	BS - Translation & Interpretation (english)	27
84	Bachelors	BS - Turkish	27
85	Bachelors	BS - Urdu	27
86	Bachelors	BS - Biotechnology	28
87	Bachelors	BS - Chemistry	28
88	Bachelors	BS - Computer Science	28
89	Bachelors	BS - Economics	28
90	Bachelors	BS - Finance & Accounting	28
91	Bachelors	BS - Geoinformatics	28
92	Bachelors	BSC (AGRI.) HON - Human Diet & Nutrition	28
93	Bachelors	BS - Industrial Design	28
94	Bachelors	BS - Mass Communication	28
95	Bachelors	BS - Mathematics	28
96	Bachelors	BS - Physics	28
97	Bachelors	BS - Psychology	28
98	Bachelors	BS - Public Administration	28
99	Bachelors	BS - Tourism & Hospitality	28
100	Bachelors	BS - Artificial Intelligence	29
101	Bachelors	BS - Civil	29
102	Bachelors	BS - Computer Engineering	29
103	Bachelors	BS - Computer Science	29
104	Bachelors	BS - Cyber Security	29
105	Bachelors	BS - Electrical	29
106	Bachelors	BS - Mechanical	29
107	Bachelors	BS - Software Engineering	29
108	Bachelors	BS - Chemical	30
109	Bachelors	BS - Computer & Information Sciences	30
110	Bachelors	BS - Metallurgy & Materials	30
111	Bachelors	BS - Physics	30
112	Bachelors	BS - Applied Psychology	31
113	Bachelors	BS - Bio-medical	31
114	Bachelors	BS - Biomedical Sciences	31
115	Bachelors	BS - Business Analytics	31
116	Bachelors	BS - Commerce	31
117	Bachelors	BS - Computer Arts	31
118	Bachelors	BS - Computer Science	31
119	Bachelors	BS - Computer System	31
120	Bachelors	BS - Cyber Security	31
121	Bachelors	BS - Data Science	31
122	Bachelors	BS - Design	31
123	Bachelors	BS - English	31
124	Bachelors	BS - Film	31
125	Bachelors	BS - Finance & Accounting	31
126	Bachelors	BS - Game Design	31
127	Bachelors	BS - Health Care & Business Management	31
128	Bachelors	BS - Hospitality Management	31
129	Bachelors	BS - Human Diet & Nutrition	31
130	Bachelors	BS - International Relations	31
131	Bachelors	BS - Islamic Studies	31
132	Bachelors	BS - Mass Communication	31
133	Bachelors	BS - Mathematics	31
134	Bachelors	BS - Media Studies	31
135	Bachelors	BS - Medical Image Technology	31
136	Bachelors	BS - Medical Laboratory Technology	31
137	Bachelors	BS - Mental Health Diagnostic Skills	31
138	Bachelors	BS - Nursing	31
139	Bachelors	BS - Optometry & Orthoptics	31
140	Bachelors	BS - Physics	31
141	Bachelors	BS - Political Science	31
142	Bachelors	BS - Project Management	31
143	Bachelors	BS - Public Administration	31
144	Bachelors	BS - Public Policy & Governance	31
145	Bachelors	BS - Software Engineering	31
146	Bachelors	BS - Speech & Language Pathology	31
147	Bachelors	BS - Statistics	31
148	Bachelors	BS - Supply Chain Management	31
149	Bachelors	BS - Audiology	32
150	Bachelors	BS - Cardiac Catheterization	32
151	Bachelors	BS - Clinical Psychology	32
152	Bachelors	BS - Computer Science	32
153	Bachelors	BS - Economics	32
154	Bachelors	BS - Educational Planning & Management	32
155	Bachelors	BS - English Linguistics & Literature	32
156	Bachelors	BS - Finance & Accounting	32
157	Bachelors	BS - Health Services Management	32
158	Bachelors	BS - Human Resources Management	32
159	Bachelors	BS - Islamic Banking & Finance	32
160	Bachelors	BS - Marketing	32
161	Bachelors	BS - Mathematics	32
162	Bachelors	BS - Medical Laboratory Technology	32
163	Bachelors	BS - Nursing	32
164	Bachelors	BS - Speech & Language Pathology	32
165	Bachelors	BS - Statistics	32
166	Bachelors	BS - Supply Chain Management	32
167	Bachelors	BS - Artificial Intelligence	33
168	Bachelors	BS - Business Analytics	33
169	Bachelors	BS - Computer Engineering	33
170	Bachelors	BS - Computer Science	33
171	Bachelors	BS - Cyber Security	33
172	Bachelors	BS - Data Science	33
173	Bachelors	BS - English	33
174	Bachelors	BS - Finance & Accounting	33
175	Bachelors	BS - Finance & Technoloy	33
176	Bachelors	BS - Mathematics	33
177	Bachelors	BS - Medical Image Technology	33
178	Bachelors	BS - Medical Laboratory Technology	33
179	Bachelors	BS - Operation Theater Technology	33
180	Bachelors	BS - Software Engineering	33
181	Bachelors	BS - Vision Sciences	33
182	Bachelors	BS - Artificial Intelligence	34
183	Bachelors	BS - Biochemistry	34
184	Bachelors	BS - Biotechnology	34
185	Bachelors	BS - Computer Engineering	34
186	Bachelors	BS - Computer Science	34
187	Bachelors	BS - Digital Marketing	34
188	Bachelors	BS - Electronics	34
189	Bachelors	BS - English	34
190	Bachelors	BS - Environmental Sciences	34
191	Bachelors	BS - Fashion Design	34
192	Bachelors	BS - Finance & Accounting	34
193	Bachelors	BS - Human Diet & Nutrition	34
194	Bachelors	BS - Mathematics	34
195	Bachelors	BS - Media & Communication	34
196	Bachelors	BS - Medical Laboratory Technology	34
197	Bachelors	BS - Operation Theater Technology	34
198	Bachelors	BS - Optometry	34
199	Bachelors	BS - Psychology	34
200	Bachelors	BS - Radiologic Technology	34
201	Bachelors	BS - Software Engineering	34
202	Bachelors	BS - Vision Sciences	34
203	Bachelors	BS - Anesthesia Technology	7
204	Bachelors	BS - Computer Science	7
205	Bachelors	BS - Dental Hygienist	7
206	Bachelors	BS - Education	7
207	Bachelors	BS - English	7
208	Bachelors	BS - Finance & Accounting	7
209	Bachelors	BS - Information Technology	7
210	Bachelors	BS - Media Studies	7
211	Bachelors	BS - Medical Laboratory Technology	7
212	Bachelors	BS - Radiology & Imaging Technology	7
213	Bachelors	BS - Software Engineering	7
214	Bachelors	BS - Urdu	7
215	Bachelors	BS (HONS) - Actuarial Sciences	8
216	Bachelors	BS - Business Analytics	8
217	Bachelors	BS - Clinical Psychology	8
218	Bachelors	BS - Data Science	8
219	Bachelors	BS (HONS) - Education	8
220	Bachelors	BS - English	8
221	Bachelors	BS (HONS) - Environmental Management	8
222	Bachelors	BS - Finance & Accounting	8
223	Bachelors	BS - Fine Arts	8
224	Bachelors	BS - Food & Nutrition	8
225	Bachelors	BS - Information Technology	8
226	Bachelors	BS - International Relations	8
227	Bachelors	BS - Islamic Studies	8
228	Bachelors	BS (HONS) - Marketing	8
229	Bachelors	BS - Mass Communication	8
230	Bachelors	BS (HONS) - Mathematics	8
231	Bachelors	BS - Media Sciences	8
232	Bachelors	BS - Political Science	8
233	Bachelors	BS - Psychology	8
234	Bachelors	BS (HONS) - Software Engineering	8
235	Bachelors	BS - Applied Psychology	9
236	Bachelors	BS (HONS) - Biotechnology	9
237	Bachelors	BS - Clinical Psychology	9
238	Bachelors	BS - Economics	9
239	Bachelors	BS - Emergency & Intensive Care Sciences	9
240	Bachelors	BS - Food & Nutrition	9
241	Bachelors	BS - Food Science & Technology	9
242	Bachelors	BS - Medical Image Technology	9
243	Bachelors	BS - Medical Laboratory Technology	9
244	Bachelors	BS - Nutritional Sciences	9
245	Bachelors	BS - Operation Theater Technology	9
246	Bachelors	BS - Optometry	9
247	Bachelors	BS - Respiratory Therapy	9
248	Bachelors	BS - Speech & Language Pathology	9
249	Bachelors	BS - Ceramic Design	10
250	Bachelors	BS - Fashion Marketing & Merchandizing	10
251	Bachelors	BS - Furniture Design	10
252	Bachelors	BS - Jewellery	10
253	Bachelors	BS - Leather Technology	10
254	Bachelors	BS - Textile Design	10
255	Bachelors	BS(TECHNOLOGY) - Chemical Technology	40
256	Bachelors	BS(TECHNOLOGY) - Civil Technology	40
257	Bachelors	BS(TECHNOLOGY) - Electrical Technology	40
258	Bachelors	BS(TECHNOLOGY) - Electronics Technology	40
259	Bachelors	BS(TECHNOLOGY) - Mechanical Technology	40
260	Bachelors	BS - Telecommunication	40
261	Bachelors	BS - Architecture Technology	11
262	Bachelors	BS - Automotive Engineering	11
263	Bachelors	BS - Civil Technology	11
264	Bachelors	BS - Electrical Technology	11
265	Bachelors	BS - Fashion Design	11
266	Bachelors	BS(TECHNOLOGY) - Garment Technology	11
267	Bachelors	BS - Mechanical Technology	11
268	Bachelors	BS - Software Engineering	11
269	Bachelors	BS - Biochemistry	12
270	Bachelors	BS - Biomedical Sciences	12
271	Bachelors	BS - Biotechnology	12
272	Bachelors	BS - Business & Information Technology	12
273	Bachelors	BS - Clinical Psychology	12
274	Bachelors	BS - Computer Science	12
275	Bachelors	BS - Data Science	12
276	Bachelors	BS - Economics & Politics	12
277	Bachelors	BS - Food Science & Technology	12
278	Bachelors	BS - Health Informatics	12
279	Bachelors	BS - Human Diet & Nutrition	12
280	Bachelors	BS - Medical Laboratory Technology	12
281	Bachelors	BS - Microbiology	12
282	Bachelors	BS - Software Engineering	12
283	Bachelors	BS - Biochemistry	13
284	Bachelors	BS - Biotechnology	13
285	Bachelors	BS - Business Administration	13
286	Bachelors	BS - Clinical Psychology	13
287	Bachelors	BS - Computer Science	13
288	Bachelors	BS - English	13
289	Bachelors	BS - Finance & Accounting	13
290	Bachelors	BS - Human Diet & Nutrition	13
291	Bachelors	BS - Law	13
292	Bachelors	BS - Media & Communication	13
293	Bachelors	BS - Media Studies	13
294	Bachelors	BS - Medical Image Technology	13
295	Bachelors	BS - Nursing	13
296	Bachelors	BS - Nutrition	13
297	Bachelors	BS (HONS) - Operation Theater Technology	13
298	Bachelors	BS - Speech & Language Pathology	13
299	Bachelors	BS - Aesthetics And Cosmetology	14
300	Bachelors	BS - Anesthesia Technology	14
301	Bachelors	BS - Artificial Intelligence	14
302	Bachelors	BS - Audiology	14
303	Bachelors	BS - Aviation Management	14
304	Bachelors	BS - Aviation Technology	14
305	Bachelors	BS - Avionics	14
306	Bachelors	BS - Bio-medical	14
307	Bachelors	BS - Biochemistry	14
308	Bachelors	BS - Bioinformatics	14
309	Bachelors	BS - Biotechnology	14
310	Bachelors	BS - Blood Transfusion Technology	14
311	Bachelors	BS - Botany	14
312	Bachelors	BS - Cardiac Perfusion	14
313	Bachelors	BS(TECHNOLOGY) - Civil	14
314	Bachelors	BS - Criminology	14
315	Bachelors	BS - Cyber Security	14
316	Bachelors	BS - Data Science	14
317	Bachelors	BS - Dental Hygienist	14
318	Bachelors	BS - Dental Technology	14
319	Bachelors	BS - Digital Media	14
320	Bachelors	BS - Economics	14
321	Bachelors	BS - Education	14
322	Bachelors	BS - Electrical Energy System Engineering	14
323	Bachelors	BS(TECHNOLOGY) - Electrical Technology	14
324	Bachelors	BS(TECHNOLOGY) - Electronics Technology	14
325	Bachelors	BS - Emergency & Intensive Care Sciences	14
326	Bachelors	BS - English	14
327	Bachelors	BS - Fashion Design	14
328	Bachelors	BS - Finance & Accounting	14
329	Bachelors	BS - Food Science & Technology	14
330	Bachelors	BS - Food Sfety & Quality Management	14
331	Bachelors	BS - Forensic Studies	14
332	Bachelors	BS(TECHNOLOGY) - Heating Ventilation Air Conditioning	14
333	Bachelors	BS - Human Diet & Nutrition	14
334	Bachelors	BS - Information Technology	14
335	Bachelors	BS - Insurance & Risk Management	14
336	Bachelors	BS - Interior Design	14
337	Bachelors	BS - Internet Of Things	14
338	Bachelors	BS - Library Sciences	14
339	Bachelors	BS - Mass Communication Management	14
340	Bachelors	BS - Mathematics	14
341	Bachelors	BS(TECHNOLOGY) - Mechanical	14
342	Bachelors	BS - Medical Image Technology	14
343	Bachelors	BS - Medical Laboratory Sciences	14
344	Bachelors	BS - Microbiology	14
345	Bachelors	BS - Multimedia	14
346	Bachelors	BS - Occupational Therapy	14
347	Bachelors	BS - Operation Theater Technology	14
348	Bachelors	BS - Physics	14
349	Bachelors	BS - Public Health	14
350	Bachelors	BS - Public Policy & Governance	14
351	Bachelors	BS - Radiation Therapy Technology	14
352	Bachelors	BS - Renal Dialysis Technology	14
353	Bachelors	BS - Respiratory Therapy	14
354	Bachelors	BS - Robotics	14
355	Bachelors	BS - Software Engineering	14
356	Bachelors	BS - Speech & Language Pathology	14
357	Bachelors	BS - Statistics	14
358	Bachelors	BS - Textile Design	14
359	Bachelors	BS - Tourism & Hospitality	14
360	Bachelors	BS - Zoology	14
361	Bachelors	BS - Agricultural Technology	15
362	Bachelors	BS - Aircraft Maintenance Engineers Technology	15
363	Bachelors	BS - Analytical Chemistry	15
364	Bachelors	BS - Anesthesia Technology	15
365	Bachelors	BS - Animation	15
366	Bachelors	BS - Applied Chemistry	15
367	Bachelors	BS - Applied Mathematics	15
368	Bachelors	BS - Architecture	15
369	Bachelors	BS - Architecture Technology	15
370	Bachelors	BS - Audiology	15
371	Bachelors	BS - Aviation Management	15
372	Bachelors	BS - Biochemistry & Biotechnology	15
373	Bachelors	BS - Bioinformatics	15
374	Bachelors	BS - Biomedical Technician	15
375	Bachelors	BS - Biotechnology	15
376	Bachelors	BS - Botany	15
377	Bachelors	BS - Cardiac Perfusion	15
378	Bachelors	BS - Cardiac Technology	15
379	Bachelors	BS - Chemistry	15
380	Bachelors	BS - Civil	15
381	Bachelors	BS - Community Work	15
382	Bachelors	BS - Computer Engineering	15
383	Bachelors	BS - Computer Science	15
384	Bachelors	BS - Criminology	15
385	Bachelors	BS - Critical Care Sciences	15
386	Bachelors	BS - Data Science	15
387	Bachelors	BS - Dermatology	15
388	Bachelors	BS - Dialysis Technology	15
389	Bachelors	BS - Economics	15
390	Bachelors	BS - Education Management	15
391	Bachelors	BS - Education [elementary]	15
392	Bachelors	BS - Electrical	15
393	Bachelors	BS - Electronics & Communication	15
394	Bachelors	BS - Electronics & Electrical System	15
395	Bachelors	BS - Emergency & Intensive Care Sciences	15
396	Bachelors	BS - English Language & Literature	15
397	Bachelors	BS - English Language & Literature	15
398	Bachelors	BS - Environmental Sciences	15
399	Bachelors	BS (HONS) - Finance & Accounting	15
400	Bachelors	BS - Finance & Technoloy	15
601	Bachelors	BS - Urdu	38
401	Bachelors	BS - Food Science & Technology	15
402	Bachelors	BS - Health & Safety Environment	15
403	Bachelors	BS - Industrial Technology	15
404	Bachelors	BS - Information Technology	15
405	Bachelors	BS - Inorganic Chemistry	15
406	Bachelors	BS - Interior Design	15
407	Bachelors	BS - Islamic Banking & Finance	15
408	Bachelors	BS (HONS) - Islamic Studies	15
409	Bachelors	BS (HONS) - Mathematics	15
410	Bachelors	BS - Mechanical	15
411	Bachelors	BS - Mechanical Technology	15
412	Bachelors	BS - Media & Mass Communication	15
413	Bachelors	BS - Medical Image Technology	15
414	Bachelors	BS - Medical Laboratory Sciences	15
415	Bachelors	BS - Medical Physics	15
416	Bachelors	BS - Medical Ultrasound	15
417	Bachelors	BS - Microbiology & Biotechnology	15
418	Bachelors	BS - Molecular Biology & Biotechnology	15
419	Bachelors	BS - Neuro Physiology Technology	15
420	Bachelors	BS - Occupational Therapy	15
421	Bachelors	BS - Operation Theatre Sciences	15
422	Bachelors	BS - Organic Chemistry	15
423	Bachelors	BS - Physical Chemistry	15
424	Bachelors	BS - Physics	15
425	Bachelors	BS - Prosthetics & Orthotics	15
426	Bachelors	BS - Public Health	15
427	Bachelors	BS - Rehabilitation Sciences	15
428	Bachelors	BS - Respiratory Therapy	15
429	Bachelors	BS - Social Sciences	15
430	Bachelors	BS - Software Engineering	15
431	Bachelors	BS - Speech & Language Pathology	15
432	Bachelors	BS - Sports Sciences & Physical Education	15
433	Bachelors	BS - Statistics	15
434	Bachelors	BS - Surgery Technology	15
435	Bachelors	BS - Taxation Management	15
436	Bachelors	BS - Urdu	15
437	Bachelors	BS - Vision Sciences	15
438	Bachelors	BS - Visual Arts	15
439	Bachelors	BS - Visual Communication & Design	15
440	Bachelors	BS - Zoology	15
441	Bachelors	MBBS - Medicine - Mbbs	16
442	Bachelors	BS - Artificial Intelligence	17
443	Bachelors	BS - Audit & Taxation	17
444	Bachelors	BS - Biochemistry	17
445	Bachelors	BS - Biotechnology	17
446	Bachelors	BS - Business Analytics	17
447	Bachelors	BS - Chemistry	17
448	Bachelors	BS - Computer Science	17
449	Bachelors	BS - Data Science	17
450	Bachelors	BS - Economics	17
451	Bachelors	BS - English Language & Literature	17
452	Bachelors	BS - Film/tv	17
453	Bachelors	BS - Finance & Accounting	17
454	Bachelors	BS - Food Science & Technology	17
455	Bachelors	BS - Human Diet & Nutrition	17
456	Bachelors	BS - International Relations	17
457	Bachelors	BS - Mathematics	17
458	Bachelors	BS - Media & Communication	17
459	Bachelors	BS - Medical Laboratory Technology	17
460	Bachelors	BS - Microbiology	17
461	Bachelors	BS - Physics	17
462	Bachelors	BS - Political Science	17
463	Bachelors	BS - Psychology	17
464	Bachelors	BS - Real State Management	17
465	Bachelors	BS - Robotics	17
466	Bachelors	BS - Software Engineering	17
467	Bachelors	BS - Zoology	17
468	Bachelors	BS - Asian Studies	18
469	Bachelors	BS - Environmental Studies	18
470	Bachelors	BS - Philosophy	18
471	Bachelors	BS - Social Development & Policy	18
472	Bachelors	BS - Bioinformatics	19
473	Bachelors	BS - Computer Science	19
474	Bachelors	BS - Medical Laboratory Sciences	19
475	Bachelors	MBBS - Medicine - Mbbs	19
476	Bachelors	BS - Software Engineering	19
477	Bachelors	BS - Artificial Intelligence	20
478	Bachelors	BS - Computer Science	20
479	Bachelors	BS - Education	20
480	Bachelors	BS - English	20
481	Bachelors	BS - Entrepreneurship	20
482	Bachelors	BS - Finance & Accounting	20
483	Bachelors	BS - Information Technology	20
484	Bachelors	BS - International Relations	20
485	Bachelors	BS - Islamic Studies	20
486	Bachelors	BS - Mathematics	20
487	Bachelors	BS - Media Sciences	20
488	Bachelors	BS - Public Administration	20
489	Bachelors	BS - Sports Sciences & Physical Education	20
490	Bachelors	BS(TECHNOLOGY) - Chemical Technology	21
491	Bachelors	BS(TECHNOLOGY) - Civil Technology	21
492	Bachelors	BS - Clinical Micro Biology	21
493	Bachelors	BS - Computer Science	21
494	Bachelors	BS(TECHNOLOGY) - Electrical Technology	21
495	Bachelors	BS(TECHNOLOGY) - Electronics Technology	21
496	Bachelors	BS - Epidemiology & Public Health	21
497	Bachelors	BS - Food Science & Technology	21
498	Bachelors	BS(TECHNOLOGY) - Mechanical Technology	21
499	Bachelors	BS - Artificial Intelligence	22
500	Bachelors	BS - Chemistry	22
501	Bachelors	BS - Computer Science	22
502	Bachelors	BS - Cyber Security	22
503	Bachelors	BS - Data Science	22
504	Bachelors	BS - Environmental Sciences	22
505	Bachelors	BS - Arts	23
506	Bachelors	BS - Business Analytics	23
507	Bachelors	BS - Computer Science	23
508	Bachelors	BS - Data Science	23
509	Bachelors	BS - English	23
510	Bachelors	BS - Finance & Accounting	23
511	Bachelors	BS - International Relations	23
512	Bachelors	BS - Psychology	23
513	Bachelors	BS - Software Engineering	23
514	Bachelors	BS - Biotechnology	24
515	Bachelors	BS - Clinical Laboratory Sciences	24
516	Bachelors	BS - Dental Hygienist	24
517	Bachelors	BS - Finance & Accounting	24
518	Bachelors	BS - Nursing Generic	24
519	Bachelors	BS - Nutrition	24
520	Bachelors	BS - Ophthalmic Technician	24
521	Bachelors	BS - Optometry	24
522	Bachelors	BS - Perfusion Sciences	24
523	Bachelors	BS - Psychology	24
524	Bachelors	BS - Public Health	24
525	Bachelors	BS - Radiologic Technology	24
526	Bachelors	BS - Respiratory Therapy	24
527	Bachelors	BS - Surgery Technology	24
528	Bachelors	BS - Artificial Intelligence	25
529	Bachelors	BS - Business Administration	25
530	Bachelors	BS - Business Management	25
531	Bachelors	BS - Communication Design	25
532	Bachelors	BS - Cyber Security	25
533	Bachelors	BS - Data Science	25
534	Bachelors	BS - Digital Marketing	25
535	Bachelors	BS - Economics & Finance	25
536	Bachelors	BS - English	25
537	Bachelors	BS - Fashion Design	25
538	Bachelors	BS - Fashion Marketing & Merchandizing	25
539	Bachelors	BS - Film	25
540	Bachelors	BS - Information Technology	25
541	Bachelors	BS - Islamic Banking & Finance	25
542	Bachelors	BS - Mass Communication & Media Studies	25
543	Bachelors	BS - Networking	25
544	Bachelors	BS - Psychology	25
545	Bachelors	BS - Social Sciences	25
546	Bachelors	BS - Software Engineering	25
547	Bachelors	BS - Textile Designing	25
548	Bachelors	BS - Visual Effects & Animation	25
549	Bachelors	BS - Computer Engineering	26
550	Bachelors	BS - Computer Science	26
551	Bachelors	BS - Electrical	26
552	Bachelors	BS - Computer Science	41
553	Bachelors	BS - Software Engineering	41
554	Bachelors	BS - Artificial Intelligence	37
555	Bachelors	BS - Aviation Management	37
556	Bachelors	BS - Computer Engineering	37
557	Bachelors	BS - Computer Games Development	37
558	Bachelors	BS - Computer Science	37
559	Bachelors	BS - Cyber Security	37
560	Bachelors	BS - Data Science	37
561	Bachelors	BS - Education	37
562	Bachelors	BS - Electrical	37
563	Bachelors	BS - English	37
564	Bachelors	BS - Finance & Accounting	37
565	Bachelors	BS - Healthcare Systems Management	37
566	Bachelors	BS - Information Technology	37
567	Bachelors	BS - International Relations	37
568	Bachelors	BS - Mathematics	37
569	Bachelors	BS - Multimedia	37
570	Bachelors	BS - Physics	37
571	Bachelors	BS - Psychology	37
572	Bachelors	BS - Software Engineering	37
573	Bachelors	BS - Strategic Studies	37
574	Bachelors	BS - Tourism & Hospitality	37
575	Bachelors	BS - Computer Science	35
576	Bachelors	BS - Information Technology	35
577	Bachelors	BS - Arabic	38
578	Bachelors	BS - Biochemistry	38
579	Bachelors	BS - Botany	38
580	Bachelors	BS - Chemistry	38
581	Bachelors	BS - Computer Science	38
582	Bachelors	BS - Economics	38
583	Bachelors	BS - Environmental Sciences	38
584	Bachelors	BS - Gender & Women Studies	38
585	Bachelors	BS - Hadith & Seerah	38
586	Bachelors	BS - History	38
587	Bachelors	BS - Information Technology	38
588	Bachelors	BS - Instructional Technology	38
589	Bachelors	BS - Interfaith Studies	38
590	Bachelors	BS - Islamic Studies	38
591	Bachelors	BS - Mathematics	38
592	Bachelors	BS - Microbiology	38
593	Bachelors	BS - Pakistan Studies	38
594	Bachelors	BS - Physics	38
595	Bachelors	BS - Quran & Tafseer	38
596	Bachelors	BS - Rural Development	38
597	Bachelors	BS - Seerat Studies	38
598	Bachelors	BS - Shariah	38
599	Bachelors	BS - Sociology	38
600	Bachelors	BS - Statistics	38
602	Bachelors	BS - Area Studies	27
603	Bachelors	BS - Artificial Intelligence	27
604	Bachelors	BS - Balochi	27
605	Bachelors	BS - Bengali	27
606	Bachelors	BS - Chinese	27
607	Bachelors	BS - Computer Engineering	27
608	Bachelors	BS - Computer Science	27
609	Bachelors	BS - Conflict & Peace Studies	27
610	Bachelors	BS - Early Childhood Care And Education	27
611	Bachelors	BS - Economics	27
612	Bachelors	BS - Economics & Finance	27
613	Bachelors	BS - Education [health & Physical]	27
614	Bachelors	BS - Educational Leadership & Management	27
615	Bachelors	BS - Electronics	27
616	Bachelors	BS - English	27
617	Bachelors	BS - Finance & Accounting	27
618	Bachelors	BS - French	27
619	Bachelors	BS - German	27
620	Bachelors	BS - Hindi	27
621	Bachelors	BS - History	27
622	Bachelors	BS - Information Technology	27
623	Bachelors	BS - International Relations	27
624	Bachelors	BS - Islamic Studies	27
625	Bachelors	BS - Korean	27
626	Bachelors	BS - Mathematics	27
627	Bachelors	BS - Media & Communication	27
628	Bachelors	BS - Pakistan Studies	27
629	Bachelors	BS - Persian	27
630	Bachelors	BS - Psychology	27
631	Bachelors	BS - Public Administration	27
632	Bachelors	BS - Punjabi	27
633	Bachelors	BS - Pushto	27
634	Bachelors	BS - Software Engineering	27
635	Bachelors	BS - Spanish	27
636	Bachelors	BS - Translation & Interpretation (english)	27
637	Bachelors	BS - Turkish	27
638	Bachelors	BS - Urdu	27
639	Bachelors	BS - Biotechnology	28
640	Bachelors	BS - Chemistry	28
641	Bachelors	BS - Computer Science	28
642	Bachelors	BS - Economics	28
643	Bachelors	BS - Finance & Accounting	28
644	Bachelors	BS - Geoinformatics	28
645	Bachelors	BSC (AGRI.) HON - Human Diet & Nutrition	28
646	Bachelors	BS - Industrial Design	28
647	Bachelors	BS - Mass Communication	28
648	Bachelors	BS - Mathematics	28
649	Bachelors	BS - Physics	28
650	Bachelors	BS - Psychology	28
651	Bachelors	BS - Public Administration	28
652	Bachelors	BS - Tourism & Hospitality	28
653	Bachelors	BS - Artificial Intelligence	29
654	Bachelors	BS - Civil	29
655	Bachelors	BS - Computer Engineering	29
656	Bachelors	BS - Computer Science	29
657	Bachelors	BS - Cyber Security	29
658	Bachelors	BS - Electrical	29
659	Bachelors	BS - Mechanical	29
660	Bachelors	BS - Software Engineering	29
661	Bachelors	BS - Chemical	30
662	Bachelors	BS - Computer & Information Sciences	30
663	Bachelors	BS - Metallurgy & Materials	30
664	Bachelors	BS - Physics	30
665	Bachelors	BS - Applied Psychology	31
666	Bachelors	BS - Bio-medical	31
667	Bachelors	BS - Biomedical Sciences	31
668	Bachelors	BS - Business Analytics	31
669	Bachelors	BS - Commerce	31
670	Bachelors	BS - Computer Arts	31
671	Bachelors	BS - Computer Science	31
672	Bachelors	BS - Computer System	31
673	Bachelors	BS - Cyber Security	31
674	Bachelors	BS - Data Science	31
675	Bachelors	BS - Design	31
676	Bachelors	BS - English	31
677	Bachelors	BS - Film	31
678	Bachelors	BS - Finance & Accounting	31
679	Bachelors	BS - Game Design	31
680	Bachelors	BS - Health Care & Business Management	31
681	Bachelors	BS - Hospitality Management	31
682	Bachelors	BS - Human Diet & Nutrition	31
683	Bachelors	BS - International Relations	31
684	Bachelors	BS - Islamic Studies	31
685	Bachelors	BS - Mass Communication	31
686	Bachelors	BS - Mathematics	31
687	Bachelors	BS - Media Studies	31
688	Bachelors	BS - Medical Image Technology	31
689	Bachelors	BS - Medical Laboratory Technology	31
690	Bachelors	BS - Mental Health Diagnostic Skills	31
691	Bachelors	BS - Nursing	31
692	Bachelors	BS - Optometry & Orthoptics	31
693	Bachelors	BS - Physics	31
694	Bachelors	BS - Political Science	31
695	Bachelors	BS - Project Management	31
696	Bachelors	BS - Public Administration	31
697	Bachelors	BS - Public Policy & Governance	31
698	Bachelors	BS - Software Engineering	31
699	Bachelors	BS - Speech & Language Pathology	31
700	Bachelors	BS - Statistics	31
701	Bachelors	BS - Supply Chain Management	31
702	Bachelors	BS - Audiology	32
703	Bachelors	BS - Cardiac Catheterization	32
704	Bachelors	BS - Clinical Psychology	32
705	Bachelors	BS - Computer Science	32
706	Bachelors	BS - Economics	32
707	Bachelors	BS - Educational Planning & Management	32
708	Bachelors	BS - English Linguistics & Literature	32
709	Bachelors	BS - Finance & Accounting	32
710	Bachelors	BS - Health Services Management	32
711	Bachelors	BS - Human Resources Management	32
712	Bachelors	BS - Islamic Banking & Finance	32
713	Bachelors	BS - Marketing	32
714	Bachelors	BS - Mathematics	32
715	Bachelors	BS - Medical Laboratory Technology	32
716	Bachelors	BS - Nursing	32
717	Bachelors	BS - Speech & Language Pathology	32
718	Bachelors	BS - Statistics	32
719	Bachelors	BS - Supply Chain Management	32
720	Bachelors	BS - Artificial Intelligence	33
721	Bachelors	BS - Business Analytics	33
722	Bachelors	BS - Computer Engineering	33
723	Bachelors	BS - Computer Science	33
724	Bachelors	BS - Cyber Security	33
725	Bachelors	BS - Data Science	33
726	Bachelors	BS - English	33
727	Bachelors	BS - Finance & Accounting	33
728	Bachelors	BS - Finance & Technoloy	33
729	Bachelors	BS - Mathematics	33
730	Bachelors	BS - Medical Image Technology	33
731	Bachelors	BS - Medical Laboratory Technology	33
732	Bachelors	BS - Operation Theater Technology	33
733	Bachelors	BS - Software Engineering	33
734	Bachelors	BS - Vision Sciences	33
735	Bachelors	BS - Artificial Intelligence	34
736	Bachelors	BS - Biochemistry	34
737	Bachelors	BS - Biotechnology	34
738	Bachelors	BS - Computer Engineering	34
739	Bachelors	BS - Computer Science	34
740	Bachelors	BS - Digital Marketing	34
741	Bachelors	BS - Electronics	34
742	Bachelors	BS - English	34
743	Bachelors	BS - Environmental Sciences	34
744	Bachelors	BS - Fashion Design	34
745	Bachelors	BS - Finance & Accounting	34
746	Bachelors	BS - Human Diet & Nutrition	34
747	Bachelors	BS - Mathematics	34
748	Bachelors	BS - Media & Communication	34
749	Bachelors	BS - Medical Laboratory Technology	34
750	Bachelors	BS - Operation Theater Technology	34
751	Bachelors	BS - Optometry	34
752	Bachelors	BS - Psychology	34
753	Bachelors	BS - Radiologic Technology	34
754	Bachelors	BS - Software Engineering	34
755	Bachelors	BS - Vision Sciences	34
756	Bachelors	BS - Anesthesia Technology	7
757	Bachelors	BS - Computer Science	7
758	Bachelors	BS - Dental Hygienist	7
759	Bachelors	BS - Education	7
760	Bachelors	BS - English	7
761	Bachelors	BS - Finance & Accounting	7
762	Bachelors	BS - Information Technology	7
763	Bachelors	BS - Media Studies	7
764	Bachelors	BS - Medical Laboratory Technology	7
765	Bachelors	BS - Radiology & Imaging Technology	7
766	Bachelors	BS - Software Engineering	7
767	Bachelors	BS - Urdu	7
768	Bachelors	BS - Culture	42
769	Bachelors	BS - Fashion Design	42
770	Bachelors	BS - Multimedia	42
771	Bachelors	BS (HONS) - Actuarial Sciences	8
772	Bachelors	BS - Business Analytics	8
773	Bachelors	BS - Clinical Psychology	8
774	Bachelors	BS - Data Science	8
775	Bachelors	BS (HONS) - Education	8
776	Bachelors	BS - English	8
777	Bachelors	BS (HONS) - Environmental Management	8
778	Bachelors	BS - Finance & Accounting	8
779	Bachelors	BS - Fine Arts	8
780	Bachelors	BS - Food & Nutrition	8
781	Bachelors	BS - Information Technology	8
782	Bachelors	BS - International Relations	8
783	Bachelors	BS - Islamic Studies	8
784	Bachelors	BS (HONS) - Marketing	8
785	Bachelors	BS - Mass Communication	8
786	Bachelors	BS (HONS) - Mathematics	8
787	Bachelors	BS - Media Sciences	8
788	Bachelors	BS - Political Science	8
789	Bachelors	BS - Psychology	8
790	Bachelors	BS (HONS) - Software Engineering	8
791	Bachelors	BS - Applied Psychology	9
792	Bachelors	BS (HONS) - Biotechnology	9
793	Bachelors	BS - Clinical Psychology	9
794	Bachelors	BS - Economics	9
795	Bachelors	BS - Emergency & Intensive Care Sciences	9
796	Bachelors	BS - Food & Nutrition	9
797	Bachelors	BS - Food Science & Technology	9
798	Bachelors	BS - Medical Image Technology	9
799	Bachelors	BS - Medical Laboratory Technology	9
800	Bachelors	BS - Nutritional Sciences	9
801	Bachelors	BS - Operation Theater Technology	9
802	Bachelors	BS - Optometry	9
803	Bachelors	BS - Respiratory Therapy	9
1607	Bachelors	BS - Physics	73
804	Bachelors	BS - Speech & Language Pathology	9
805	Bachelors	BS - Ceramic Design	10
806	Bachelors	BS - Fashion Marketing & Merchandizing	10
807	Bachelors	BS - Furniture Design	10
808	Bachelors	BS - Jewellery	10
809	Bachelors	BS - Leather Technology	10
810	Bachelors	BS - Textile Design	10
811	Bachelors	BS(TECHNOLOGY) - Chemical Technology	40
812	Bachelors	BS(TECHNOLOGY) - Civil Technology	40
813	Bachelors	BS(TECHNOLOGY) - Electrical Technology	40
814	Bachelors	BS(TECHNOLOGY) - Electronics Technology	40
815	Bachelors	BS(TECHNOLOGY) - Mechanical Technology	40
816	Bachelors	BS - Telecommunication	40
817	Bachelors	BS - Architecture Technology	11
818	Bachelors	BS - Automotive Engineering	11
819	Bachelors	BS - Civil Technology	11
820	Bachelors	BS - Electrical Technology	11
821	Bachelors	BS - Fashion Design	11
822	Bachelors	BS(TECHNOLOGY) - Garment Technology	11
823	Bachelors	BS - Mechanical Technology	11
824	Bachelors	BS - Software Engineering	11
825	Bachelors	BS - Biochemistry	12
826	Bachelors	BS - Biomedical Sciences	12
827	Bachelors	BS - Biotechnology	12
828	Bachelors	BS - Business & Information Technology	12
829	Bachelors	BS - Clinical Psychology	12
830	Bachelors	BS - Computer Science	12
831	Bachelors	BS - Data Science	12
832	Bachelors	BS - Economics & Politics	12
833	Bachelors	BS - Food Science & Technology	12
834	Bachelors	BS - Health Informatics	12
835	Bachelors	BS - Human Diet & Nutrition	12
836	Bachelors	BS - Medical Laboratory Technology	12
837	Bachelors	BS - Microbiology	12
838	Bachelors	BS - Software Engineering	12
839	Bachelors	BS - Biochemistry	13
840	Bachelors	BS - Biotechnology	13
841	Bachelors	BS - Business Administration	13
842	Bachelors	BS - Clinical Psychology	13
843	Bachelors	BS - Computer Science	13
844	Bachelors	BS - English	13
845	Bachelors	BS - Finance & Accounting	13
846	Bachelors	BS - Human Diet & Nutrition	13
847	Bachelors	BS - Law	13
848	Bachelors	BS - Media & Communication	13
849	Bachelors	BS - Media Studies	13
850	Bachelors	BS - Medical Image Technology	13
851	Bachelors	BS - Nursing	13
852	Bachelors	BS - Nutrition	13
853	Bachelors	BS (HONS) - Operation Theater Technology	13
854	Bachelors	BS - Speech & Language Pathology	13
855	Bachelors	BS - Aesthetics And Cosmetology	14
856	Bachelors	BS - Anesthesia Technology	14
857	Bachelors	BS - Artificial Intelligence	14
858	Bachelors	BS - Audiology	14
859	Bachelors	BS - Aviation Management	14
860	Bachelors	BS - Aviation Technology	14
861	Bachelors	BS - Avionics	14
862	Bachelors	BS - Bio-medical	14
863	Bachelors	BS - Biochemistry	14
864	Bachelors	BS - Bioinformatics	14
865	Bachelors	BS - Biotechnology	14
866	Bachelors	BS - Blood Transfusion Technology	14
867	Bachelors	BS - Botany	14
868	Bachelors	BS - Cardiac Perfusion	14
869	Bachelors	BS(TECHNOLOGY) - Civil	14
870	Bachelors	BS - Criminology	14
871	Bachelors	BS - Cyber Security	14
872	Bachelors	BS - Data Science	14
873	Bachelors	BS - Dental Hygienist	14
874	Bachelors	BS - Dental Technology	14
875	Bachelors	BS - Digital Media	14
876	Bachelors	BS - Economics	14
877	Bachelors	BS - Education	14
878	Bachelors	BS - Electrical Energy System Engineering	14
879	Bachelors	BS(TECHNOLOGY) - Electrical Technology	14
880	Bachelors	BS(TECHNOLOGY) - Electronics Technology	14
881	Bachelors	BS - Emergency & Intensive Care Sciences	14
882	Bachelors	BS - English	14
883	Bachelors	BS - Fashion Design	14
884	Bachelors	BS - Finance & Accounting	14
885	Bachelors	BS - Food Science & Technology	14
886	Bachelors	BS - Food Sfety & Quality Management	14
887	Bachelors	BS - Forensic Studies	14
888	Bachelors	BS(TECHNOLOGY) - Heating Ventilation Air Conditioning	14
889	Bachelors	BS - Human Diet & Nutrition	14
890	Bachelors	BS - Information Technology	14
891	Bachelors	BS - Insurance & Risk Management	14
892	Bachelors	BS - Interior Design	14
893	Bachelors	BS - Internet Of Things	14
894	Bachelors	BS - Library Sciences	14
895	Bachelors	BS - Mass Communication Management	14
896	Bachelors	BS - Mathematics	14
897	Bachelors	BS(TECHNOLOGY) - Mechanical	14
898	Bachelors	BS - Medical Image Technology	14
899	Bachelors	BS - Medical Laboratory Sciences	14
900	Bachelors	BS - Microbiology	14
901	Bachelors	BS - Multimedia	14
902	Bachelors	BS - Occupational Therapy	14
903	Bachelors	BS - Operation Theater Technology	14
904	Bachelors	BS - Physics	14
905	Bachelors	BS - Public Health	14
906	Bachelors	BS - Public Policy & Governance	14
907	Bachelors	BS - Radiation Therapy Technology	14
908	Bachelors	BS - Renal Dialysis Technology	14
909	Bachelors	BS - Respiratory Therapy	14
910	Bachelors	BS - Robotics	14
911	Bachelors	BS - Software Engineering	14
912	Bachelors	BS - Speech & Language Pathology	14
913	Bachelors	BS - Statistics	14
914	Bachelors	BS - Textile Design	14
915	Bachelors	BS - Tourism & Hospitality	14
916	Bachelors	BS - Zoology	14
917	Bachelors	BS - Agricultural Technology	15
918	Bachelors	BS - Aircraft Maintenance Engineers Technology	15
919	Bachelors	BS - Analytical Chemistry	15
920	Bachelors	BS - Anesthesia Technology	15
921	Bachelors	BS - Animation	15
922	Bachelors	BS - Applied Chemistry	15
923	Bachelors	BS - Applied Mathematics	15
924	Bachelors	BS - Architecture	15
925	Bachelors	BS - Architecture Technology	15
926	Bachelors	BS - Audiology	15
927	Bachelors	BS - Aviation Management	15
928	Bachelors	BS - Biochemistry & Biotechnology	15
929	Bachelors	BS - Bioinformatics	15
930	Bachelors	BS - Biomedical Technician	15
931	Bachelors	BS - Biotechnology	15
932	Bachelors	BS - Botany	15
933	Bachelors	BS - Cardiac Perfusion	15
934	Bachelors	BS - Cardiac Technology	15
935	Bachelors	BS - Chemistry	15
936	Bachelors	BS - Civil	15
937	Bachelors	BS - Community Work	15
938	Bachelors	BS - Computer Engineering	15
939	Bachelors	BS - Computer Science	15
940	Bachelors	BS - Criminology	15
941	Bachelors	BS - Critical Care Sciences	15
942	Bachelors	BS - Data Science	15
943	Bachelors	BS - Dermatology	15
944	Bachelors	BS - Dialysis Technology	15
945	Bachelors	BS - Economics	15
946	Bachelors	BS - Education Management	15
947	Bachelors	BS - Education [elementary]	15
948	Bachelors	BS - Electrical	15
949	Bachelors	BS - Electronics & Communication	15
950	Bachelors	BS - Electronics & Electrical System	15
951	Bachelors	BS - Emergency & Intensive Care Sciences	15
952	Bachelors	BS - English Language & Literature	15
953	Bachelors	BS - English Language & Literature	15
954	Bachelors	BS - Environmental Sciences	15
955	Bachelors	BS (HONS) - Finance & Accounting	15
956	Bachelors	BS - Finance & Technoloy	15
957	Bachelors	BS - Food Science & Technology	15
958	Bachelors	BS - Health & Safety Environment	15
959	Bachelors	BS - Industrial Technology	15
960	Bachelors	BS - Information Technology	15
961	Bachelors	BS - Inorganic Chemistry	15
962	Bachelors	BS - Interior Design	15
963	Bachelors	BS - Islamic Banking & Finance	15
964	Bachelors	BS (HONS) - Islamic Studies	15
965	Bachelors	BS (HONS) - Mathematics	15
966	Bachelors	BS - Mechanical	15
967	Bachelors	BS - Mechanical Technology	15
968	Bachelors	BS - Media & Mass Communication	15
969	Bachelors	BS - Medical Image Technology	15
970	Bachelors	BS - Medical Laboratory Sciences	15
971	Bachelors	BS - Medical Physics	15
972	Bachelors	BS - Medical Ultrasound	15
973	Bachelors	BS - Microbiology & Biotechnology	15
974	Bachelors	BS - Molecular Biology & Biotechnology	15
975	Bachelors	BS - Neuro Physiology Technology	15
976	Bachelors	BS - Occupational Therapy	15
977	Bachelors	BS - Operation Theatre Sciences	15
978	Bachelors	BS - Organic Chemistry	15
979	Bachelors	BS - Physical Chemistry	15
980	Bachelors	BS - Physics	15
981	Bachelors	BS - Prosthetics & Orthotics	15
982	Bachelors	BS - Public Health	15
983	Bachelors	BS - Rehabilitation Sciences	15
984	Bachelors	BS - Respiratory Therapy	15
985	Bachelors	BS - Social Sciences	15
986	Bachelors	BS - Software Engineering	15
987	Bachelors	BS - Speech & Language Pathology	15
988	Bachelors	BS - Sports Sciences & Physical Education	15
989	Bachelors	BS - Statistics	15
990	Bachelors	BS - Surgery Technology	15
991	Bachelors	BS - Taxation Management	15
992	Bachelors	BS - Urdu	15
993	Bachelors	BS - Vision Sciences	15
994	Bachelors	BS - Visual Arts	15
995	Bachelors	BS - Visual Communication & Design	15
996	Bachelors	BS - Zoology	15
997	Bachelors	MBBS - Medicine - Mbbs	16
998	Bachelors	BS - Artificial Intelligence	17
999	Bachelors	BS - Audit & Taxation	17
1000	Bachelors	BS - Biochemistry	17
1001	Bachelors	BS - Biotechnology	17
1002	Bachelors	BS - Business Analytics	17
1003	Bachelors	BS - Chemistry	17
1004	Bachelors	BS - Computer Science	17
1005	Bachelors	BS - Data Science	17
1006	Bachelors	BS - Economics	17
1007	Bachelors	BS - English Language & Literature	17
1008	Bachelors	BS - Film/tv	17
1009	Bachelors	BS - Finance & Accounting	17
1010	Bachelors	BS - Food Science & Technology	17
1011	Bachelors	BS - Human Diet & Nutrition	17
1012	Bachelors	BS - International Relations	17
1013	Bachelors	BS - Mathematics	17
1014	Bachelors	BS - Media & Communication	17
1015	Bachelors	BS - Medical Laboratory Technology	17
1016	Bachelors	BS - Microbiology	17
1017	Bachelors	BS - Physics	17
1018	Bachelors	BS - Political Science	17
1019	Bachelors	BS - Psychology	17
1020	Bachelors	BS - Real State Management	17
1021	Bachelors	BS - Robotics	17
1022	Bachelors	BS - Software Engineering	17
1023	Bachelors	BS - Zoology	17
1024	Bachelors	BS - Asian Studies	18
1025	Bachelors	BS - Environmental Studies	18
1026	Bachelors	BS - Philosophy	18
1027	Bachelors	BS - Social Development & Policy	18
1028	Bachelors	BS - Bioinformatics	19
1029	Bachelors	BS - Computer Science	19
1030	Bachelors	BS - Medical Laboratory Sciences	19
1031	Bachelors	MBBS - Medicine - Mbbs	19
1032	Bachelors	BS - Software Engineering	19
1033	Bachelors	BS - Artificial Intelligence	20
1034	Bachelors	BS - Computer Science	20
1035	Bachelors	BS - Education	20
1036	Bachelors	BS - English	20
1037	Bachelors	BS - Entrepreneurship	20
1038	Bachelors	BS - Finance & Accounting	20
1039	Bachelors	BS - Information Technology	20
1040	Bachelors	BS - International Relations	20
1041	Bachelors	BS - Islamic Studies	20
1042	Bachelors	BS - Mathematics	20
1043	Bachelors	BS - Media Sciences	20
1044	Bachelors	BS - Public Administration	20
1045	Bachelors	BS - Sports Sciences & Physical Education	20
1046	Bachelors	BS(TECHNOLOGY) - Chemical Technology	21
1047	Bachelors	BS(TECHNOLOGY) - Civil Technology	21
1048	Bachelors	BS - Clinical Micro Biology	21
1049	Bachelors	BS - Computer Science	21
1050	Bachelors	BS(TECHNOLOGY) - Electrical Technology	21
1051	Bachelors	BS(TECHNOLOGY) - Electronics Technology	21
1052	Bachelors	BS - Epidemiology & Public Health	21
1053	Bachelors	BS - Food Science & Technology	21
1054	Bachelors	BS(TECHNOLOGY) - Mechanical Technology	21
1055	Bachelors	BS - Artificial Intelligence	22
1056	Bachelors	BS - Chemistry	22
1057	Bachelors	BS - Computer Science	22
1058	Bachelors	BS - Cyber Security	22
1059	Bachelors	BS - Data Science	22
1060	Bachelors	BS - Environmental Sciences	22
1061	Bachelors	BS - Arts	23
1062	Bachelors	BS - Business Analytics	23
1063	Bachelors	BS - Computer Science	23
1064	Bachelors	BS - Data Science	23
1065	Bachelors	BS - English	23
1066	Bachelors	BS - Finance & Accounting	23
1067	Bachelors	BS - International Relations	23
1068	Bachelors	BS - Psychology	23
1069	Bachelors	BS - Software Engineering	23
1070	Bachelors	BS - Biotechnology	24
1071	Bachelors	BS - Clinical Laboratory Sciences	24
1072	Bachelors	BS - Dental Hygienist	24
1073	Bachelors	BS - Finance & Accounting	24
1074	Bachelors	BS - Nursing Generic	24
1075	Bachelors	BS - Nutrition	24
1076	Bachelors	BS - Ophthalmic Technician	24
1077	Bachelors	BS - Optometry	24
1078	Bachelors	BS - Perfusion Sciences	24
1079	Bachelors	BS - Psychology	24
1080	Bachelors	BS - Public Health	24
1081	Bachelors	BS - Radiologic Technology	24
1082	Bachelors	BS - Respiratory Therapy	24
1083	Bachelors	BS - Surgery Technology	24
1084	Bachelors	BS - Artificial Intelligence	25
1085	Bachelors	BS - Business Administration	25
1086	Bachelors	BS - Business Management	25
1087	Bachelors	BS - Communication Design	25
1088	Bachelors	BS - Cyber Security	25
1089	Bachelors	BS - Data Science	25
1090	Bachelors	BS - Digital Marketing	25
1091	Bachelors	BS - Economics & Finance	25
1092	Bachelors	BS - English	25
1093	Bachelors	BS - Fashion Design	25
1094	Bachelors	BS - Fashion Marketing & Merchandizing	25
1095	Bachelors	BS - Film	25
1096	Bachelors	BS - Information Technology	25
1097	Bachelors	BS - Islamic Banking & Finance	25
1098	Bachelors	BS - Mass Communication & Media Studies	25
1099	Bachelors	BS - Networking	25
1100	Bachelors	BS - Psychology	25
1101	Bachelors	BS - Social Sciences	25
1102	Bachelors	BS - Software Engineering	25
1103	Bachelors	BS - Textile Designing	25
1104	Bachelors	BS - Visual Effects & Animation	25
1105	Bachelors	BS - Computer Engineering	26
1106	Bachelors	BS - Computer Science	26
1107	Bachelors	BS - Electrical	26
1108	Bachelors	BS - Artificial Intelligence	43
1109	Bachelors	BS - Automotive Engineering	43
1110	Bachelors	BS - Biotechnology	43
1111	Bachelors	BS(TECHNOLOGY) - Civil	43
1112	Bachelors	BS - Civil Technology	43
1113	Bachelors	BS - Computer Science	43
1114	Bachelors	BS - Computer System	43
1115	Bachelors	BS - Digital Forensics	43
1116	Bachelors	BS - Digital Marketing	43
1117	Bachelors	BS - Education	43
1118	Bachelors	BS - Education [early Child]	43
1119	Bachelors	BS(TECHNOLOGY) - Electrical Technology	43
1120	Bachelors	BS - English Linguistics	43
1121	Bachelors	BS - Finance & Accounting	43
1122	Bachelors	BS - Food Science & Technology	43
1123	Bachelors	BS - Health & Safety Management	43
1124	Bachelors	BS - Human Diet & Nutrition	43
1125	Bachelors	BS - Industrial Management	43
1126	Bachelors	BS - Islamic Studies	43
1127	Bachelors	BS(TECHNOLOGY) - Mechanical Technology	43
1128	Bachelors	BS - Media Studies	43
1129	Bachelors	BS - Medical Laboratory Technology	43
1130	Bachelors	MBBS - Medicine - Mbbs	43
1131	Bachelors	BS - Nursing	43
1132	Bachelors	BS - Nutrition & Dietetics	43
1133	Bachelors	BS - Psychology	43
1134	Bachelors	BS - Software Development	43
1135	Bachelors	BS - Software Engineering	43
1136	Bachelors	BS - Sports Sciences & Physical Education	43
1137	Bachelors	BS - Total Quality Management	43
1138	Bachelors	BS - Tourism & Hospitality	43
1139	Bachelors	BS - Computer Science	44
1140	Bachelors	BS - Digital Marketing	44
1141	Bachelors	BS - Finance & Accounting	44
1142	Bachelors	BS - Islamic Finance	44
1143	Bachelors	BS - Media Sciences	44
1144	Bachelors	BS - Software Engineering	44
1145	Bachelors	BS - Blood Transfusion Medicine	45
1146	Bachelors	BS - Clinical Laboratory Sciences	45
1147	Bachelors	BS - Nursing	45
1148	Bachelors	BS - Operation Theatre Sciences	45
1149	Bachelors	BS - Public Health	45
1150	Bachelors	BS - Radiological Imaging	45
1151	Bachelors	BS - Respiratory Therapy	45
1152	Bachelors	BS - Economics	47
1153	Bachelors	BS - Economics & Mathematics	47
1154	Bachelors	BS - Finance & Accounting	47
1155	Bachelors	BS - Mathematics	47
1156	Bachelors	BS - Social Sciences & Liberal Arts	47
1157	Bachelors	BS - Accounting, Finance & Law	48
1158	Bachelors	BS - Actuarial Sciences & Risk Management	48
1159	Bachelors	BS - Business Psychology	48
1160	Bachelors	BS - Computer Science	48
1161	Bachelors	BS - Data Science	48
1162	Bachelors	BS - Economics & Finance	48
1163	Bachelors	BS - Economics & Law	48
1164	Bachelors	BS - Economics & Mathematics	48
1165	Bachelors	BS (HONS) - Education	48
1166	Bachelors	BS - Education	48
1167	Bachelors	BS - Entrepreneurship	48
1168	Bachelors	BS - Finance & Accounting	48
1169	Bachelors	BS - Industrial Management	48
1170	Bachelors	BS - International Relations	48
1171	Bachelors	BS - Logistics, Supply Chain Management	48
1172	Bachelors	BS - Mathematics	48
1173	Bachelors	BS - Media Studies	48
1174	Bachelors	BS - Psychology	48
1175	Bachelors	BS - Software Engineering	48
1176	Bachelors	BS - Technology Management	48
1177	Bachelors	BS - Advertising	49
1178	Bachelors	BS - Animation	49
1179	Bachelors	BS - Artificial Intelligence	49
1180	Bachelors	BS - Biochemistry	49
1181	Bachelors	BS - Business Analytics	49
1182	Bachelors	BS - Computer Science	49
1183	Bachelors	BS - Cyber Security	49
1184	Bachelors	BS - Data Science	49
1185	Bachelors	BS - Digital Marketing	49
1186	Bachelors	BS - Economics & Finance	49
1187	Bachelors	BS - English	49
1188	Bachelors	BS - Entrepreneurship	49
1189	Bachelors	BS - Film/tv	49
1190	Bachelors	BS - Finance & Accounting	49
1191	Bachelors	BS - Human Diet & Nutrition	49
1192	Bachelors	BS - Information Security	49
1193	Bachelors	BS - Islamic Banking & Finance	49
1194	Bachelors	BS - Media Sciences	49
1195	Bachelors	BS - Microbiology	49
1196	Bachelors	BS - Nursing	49
1197	Bachelors	BS - Psychology	49
1198	Bachelors	BS - Public Administration	49
1199	Bachelors	BS - Software Engineering	49
1200	Bachelors	BS - Telecommunication	49
1201	Bachelors	BS - Cardiac Perfusion	50
1202	Bachelors	BS - Cardiovascular Sciences	50
1203	Bachelors	BS - Clinical Laboratory Sciences	50
1204	Bachelors	BS - Dental Hygienist	50
1205	Bachelors	BS - Dental Technology	50
1206	Bachelors	BS - Medical Technology	50
1207	Bachelors	MBBS - Medicine - Mbbs	50
1208	Bachelors	BS - Neonatology	50
1209	Bachelors	BS - Nuclear Medicine	50
1210	Bachelors	BS - Operation Theatre Sciences	50
1211	Bachelors	BS - Public Health	50
1212	Bachelors	BS - Radiological Imaging	50
1213	Bachelors	BS - Respiratory Therapy	50
1214	Bachelors	BS - Biotechnology	51
1215	Bachelors	BS - Computer Science	51
1216	Bachelors	BS - Data Science	51
1217	Bachelors	BS - Economics & Finance	51
1218	Bachelors	BS - English	51
1219	Bachelors	BS - Food Science & Technology	51
1220	Bachelors	BS - Human Diet & Nutrition	51
1221	Bachelors	BS - International Relations	51
1222	Bachelors	BS - Islamic Learning	51
1223	Bachelors	BS - Molecular Biology	51
1224	Bachelors	BS - Political Science	51
1225	Bachelors	BS - Psychology	51
1226	Bachelors	BS - Public Health	51
1227	Bachelors	BS - Sociology	51
1228	Bachelors	BS - Software Engineering	51
1229	Bachelors	BS - Actuarial Sciences & Risk Management	52
1230	Bachelors	BS - Computer Science	52
1231	Bachelors	BS - Data Science	52
1232	Bachelors	BS - English	52
1233	Bachelors	BS - Enterprise Resource Planning	52
1234	Bachelors	BS - Entrepreneurship	52
1235	Bachelors	BS - Film/tv	52
1236	Bachelors	BS - Finance & Accounting	52
1237	Bachelors	BS - Mathematics	52
1238	Bachelors	BS - Project Management	52
1239	Bachelors	BS - Software Engineering	52
1240	Bachelors	BS - Computer Science	41
1241	Bachelors	BS - Software Engineering	41
1242	Bachelors	BS - Arabic	54
1243	Bachelors	BS - Artificial Intelligence	54
1244	Bachelors	BS - Biotechnology	54
1245	Bachelors	BS - Botany	54
1246	Bachelors	BS - Business Analytics	54
1247	Bachelors	BS - Chemistry	54
1248	Bachelors	BS - Computer Science	54
1249	Bachelors	BS - Data Science	54
1250	Bachelors	BS - Development Studies	54
1251	Bachelors	BS - Economics	54
1252	Bachelors	BS - Economics & Finance	54
1253	Bachelors	BS - Education	54
1254	Bachelors	BS - Education	54
1255	Bachelors	BS - Electronics	54
1256	Bachelors	BS - English	54
1257	Bachelors	BS - Finance & Accounting	54
1258	Bachelors	BS - Geography	54
1259	Bachelors	BS - Islamic Theology	54
1260	Bachelors	BS - Mathematics	54
1261	Bachelors	BS - Microbiology	54
1262	Bachelors	BS - Molecular Biology	54
1263	Bachelors	BS - Pakistan Studies	54
1264	Bachelors	BS - Physics	54
1265	Bachelors	BS - Political Science	54
1266	Bachelors	BS - Psychology	54
1267	Bachelors	BS - Pushto	54
1268	Bachelors	BS - Social Sciences	54
1269	Bachelors	BS - Sociology	54
1270	Bachelors	BS - Software Engineering	54
1271	Bachelors	BS - Statistics	54
1272	Bachelors	BS - Telecom Systems	54
1273	Bachelors	BS - Tourism & Hotel Management	54
1274	Bachelors	BS - Urdu	54
1275	Bachelors	BS - Zoology	54
1276	Bachelors	BS - Audiology	55
1277	Bachelors	BS - Cardiac Perfusion	55
1278	Bachelors	BS - Cardiology	55
1279	Bachelors	BS - Emergency & Intensive Care Sciences	55
1280	Bachelors	BS - Health Technology	55
1281	Bachelors	BS - Microbiology	55
1282	Bachelors	BS - Neuro Physiology Technology	55
1283	Bachelors	BS - Nutrition	55
1284	Bachelors	BS - Occupational Therapy	55
1285	Bachelors	BS - Paramedics	55
1286	Bachelors	BS - Prosthetics & Orthotics	55
1287	Bachelors	BS - Public Health	55
1288	Bachelors	BS - Respiratory Therapy	55
1289	Bachelors	BS - Speech & Language Pathology	55
1290	Bachelors	BS - Surgery Technology	55
1291	Bachelors	BS - Vision Sciences	55
1292	Bachelors	BS - Biology	56
1293	Bachelors	BS - Computer Science	56
1294	Bachelors	BS - Economics	56
1295	Bachelors	BS - Electronics Technology	56
1296	Bachelors	BS - International Relations	56
1297	Bachelors	BS - Mathematics	56
1298	Bachelors	BS - Physics	56
1299	Bachelors	BS - Psychology	56
1300	Bachelors	BS - Telecommunication	56
1301	Bachelors	BBS - Anesthesia Technology	57
1302	Bachelors	BS - Architecture Technology	57
1303	Bachelors	BS - Biotechnology	57
1304	Bachelors	BS - Business Analytics	57
1305	Bachelors	BS - Cardiology	57
1306	Bachelors	BS(TECHNOLOGY) - Civil Technology	57
1307	Bachelors	BS - Computer Science	57
1308	Bachelors	BS - Computer Technology	57
1309	Bachelors	BS - Dental Technology	57
1310	Bachelors	BS - Economics	57
1311	Bachelors	BS(TECHNOLOGY) - Electrical Technology	57
1312	Bachelors	BS - Electronics	57
1313	Bachelors	BS(TECHNOLOGY) - Electronics & Telecom	57
1314	Bachelors	BS(TECHNOLOGY) - Electronics Technology	57
1315	Bachelors	BS - Emergency & Intensive Care Sciences	57
1316	Bachelors	BS - English Language & Literature	57
1317	Bachelors	BS - Health Technology	57
1318	Bachelors	BS - Information Security	57
1319	Bachelors	BS - Interior Design	57
1320	Bachelors	BS - Interior Design	57
1321	Bachelors	BS - Mathematics	57
1322	Bachelors	BS(TECHNOLOGY) - Mechanical Technology	57
1323	Bachelors	BS - Medical Laboratory Technology	57
1324	Bachelors	BS - Microbiology	57
1325	Bachelors	BS - Nursing	57
1326	Bachelors	BS - Optometry	57
1327	Bachelors	BS - Physical Education, Health And Sport Science	57
1328	Bachelors	BS - Public Health	57
1329	Bachelors	BS - Radiology	57
1330	Bachelors	BS - Software Engineering	57
1331	Bachelors	BS - Surgery Technology	57
1332	Bachelors	BS - Telecom Systems	57
1333	Bachelors	BS - Textile & Fashion Design	57
1334	Bachelors	BS - Urdu	57
1335	Bachelors	BS - Visual Communication & Design	57
1336	Bachelors	BS - Art & Design	58
1337	Bachelors	BS - Biochemistry	58
1338	Bachelors	BS - Bioinformatics	58
1339	Bachelors	BS - Biotechnology	58
1340	Bachelors	BS - Botany	58
1341	Bachelors	BS - Chemistry	58
1342	Bachelors	BS - Communication Studies	58
1343	Bachelors	BS - Computer Science	58
1344	Bachelors	BS - Economics	58
1345	Bachelors	BS - Education [health & Physical]	58
1346	Bachelors	BS - English	58
1347	Bachelors	BS - Environmental Sciences	58
1348	Bachelors	BS - Food & Nutrition	58
1349	Bachelors	BS - Geography	58
1350	Bachelors	BS - History	58
1351	Bachelors	BS - Home Economics	58
1352	Bachelors	BS - Human Diet & Nutrition	58
1353	Bachelors	BS - Islamic Studies	58
1354	Bachelors	BS - Mathematics	58
1355	Bachelors	BS - Microbiology	58
1356	Bachelors	BS - Molecular Biology	58
1357	Bachelors	BS - Pakistan Studies	58
1358	Bachelors	BS - Physics	58
1359	Bachelors	BS - Political Science	58
1360	Bachelors	BS - Psychology	58
1361	Bachelors	BS - Statistics	58
1362	Bachelors	BS - Urdu	58
1363	Bachelors	BS - Zoology	58
1364	Bachelors	BS - Agriculture Business Management	59
1365	Bachelors	BS - Animal Sciences	59
1366	Bachelors	BS - Artificial Intelligence	59
1367	Bachelors	BS - Biochemistry	59
1368	Bachelors	BS - Bioinformatics	59
1369	Bachelors	BS - Botany	59
1370	Bachelors	BS - Computer Science	59
1371	Bachelors	BS - Development Studies	59
1372	Bachelors	BS (HONS) - Economics	59
1373	Bachelors	BS - Fisheries & Aquaculture	59
1374	Bachelors	BS - Food Science & Technology	59
1375	Bachelors	BS - Human Diet & Nutrition	59
1376	Bachelors	BS - Information Technology	59
1377	Bachelors	BS - Islamic Banking & Finance	59
1378	Bachelors	BS - Microbiology	59
1379	Bachelors	BS - Rural Development	59
1380	Bachelors	BS - Sociology	59
1381	Bachelors	BS - Tourism & Hospitality	59
1382	Bachelors	BS - Artificial Intelligence	60
1383	Bachelors	BS - Communication Engineering	60
1384	Bachelors	BS - Computer Science	60
1385	Bachelors	BS - Cyber Security	60
1386	Bachelors	BS - Data Science	60
1387	Bachelors	BS - Interior Design	60
1388	Bachelors	BS - Power	60
1389	Bachelors	BS - Applied Linguistics	61
1390	Bachelors	BS - Arabic	61
1391	Bachelors	BS - Archaeology	61
1392	Bachelors	BS - Art & Design	61
1393	Bachelors	BS - Artificial Intelligence	61
1394	Bachelors	BS - Biodiversity & Plant Conservation	61
1395	Bachelors	BS - Biotechnology	61
1396	Bachelors	BS - Botany	61
1397	Bachelors	BS - Business Analytics	61
1398	Bachelors	BS - Cardiology	61
1399	Bachelors	BS - Chemistry	61
1400	Bachelors	BS - Computer Science	61
1401	Bachelors	BS - Conflict & Peace Studies	61
1402	Bachelors	BS - Criminology	61
1403	Bachelors	BS - Cyber Security	61
1404	Bachelors	BS - Data Science	61
1405	Bachelors	BS - Dental Technology	61
1406	Bachelors	BS - Development Studies	61
1407	Bachelors	BS - Disaster Preparedness & Management	61
1408	Bachelors	BS - Education	61
1409	Bachelors	BS - Education [health & Physical]	61
1410	Bachelors	BS - Electronics	61
1411	Bachelors	BS - Emergency & Intensive Care Sciences	61
1412	Bachelors	BS - English	61
1413	Bachelors	BS - Fashion Design	61
1414	Bachelors	BS - Finance & Accounting	61
1415	Bachelors	BS - Gender Studies	61
1416	Bachelors	BS - Geographical Information System & Remote Sensing	61
1417	Bachelors	BS - Geography	61
1418	Bachelors	BS - Government & Public Policy	61
1419	Bachelors	BS - History	61
1420	Bachelors	BS - Home Economics	61
1421	Bachelors	BS - Human Development (early Child Development)	61
1422	Bachelors	BS - Human Diet & Nutrition	61
1423	Bachelors	BS - International Relations	61
1424	Bachelors	BS - Islamic Studies	61
1425	Bachelors	BS - Journalism & Mass Communication	61
1426	Bachelors	BS - Library & Information Science	61
1427	Bachelors	BS - Logistics, Supply Chain Management	61
1428	Bachelors	BS - Mathematics	61
1429	Bachelors	BS - Medical Laboratory Technology	61
1430	Bachelors	BS - Molecular Biology	61
1431	Bachelors	BS - Optometry	61
1432	Bachelors	BS - Pakistan Studies	61
1433	Bachelors	BS - Philosophy	61
1434	Bachelors	BS - Physics	61
1435	Bachelors	BS - Political Science	61
1436	Bachelors	BS - Project Management	61
1437	Bachelors	BS - Psychology	61
1438	Bachelors	BS - Public Health	61
1439	Bachelors	BS - Pushto	61
1440	Bachelors	BS - Radiology	61
1441	Bachelors	BS - Regional Studies	61
1442	Bachelors	BS - Social Anthropology	61
1443	Bachelors	BS - Social Work	61
1444	Bachelors	BS - Sociology	61
1445	Bachelors	BS - Software Engineering	61
1446	Bachelors	BS - Statistics	61
1447	Bachelors	BS - Surgery Technology	61
1448	Bachelors	BS - Textile Design	61
1449	Bachelors	BS - Tourism & Hotel Management	61
1450	Bachelors	BS - Urban & Regional Planning	61
1451	Bachelors	BS - Urdu	61
1452	Bachelors	BS - Zoology	61
1453	Bachelors	BS - Artificial Intelligence	62
1454	Bachelors	BS - Computer Engineering	62
1455	Bachelors	BS - Computer Science	62
1456	Bachelors	BS - Electrical	62
1457	Bachelors	BS - Robotics	62
1458	Bachelors	BS - Software Engineering	62
1459	Bachelors	BS - Artificial Intelligence	63
1460	Bachelors	BS - Computer Science	63
1461	Bachelors	BS - English	63
1462	Bachelors	BS - International Relations	63
1463	Bachelors	BS - Media & Communication	63
1464	Bachelors	BS - Psychology	63
1465	Bachelors	BS - Public Administration	63
1466	Bachelors	BS - Pushto	63
1467	Bachelors	BS - Software Engineering	63
1468	Bachelors	BS - Botany	64
1469	Bachelors	BS - Chemistry	64
1470	Bachelors	BS - English	64
1471	Bachelors	BS - Finance & Accounting	64
1472	Bachelors	BS - International Relations	64
1473	Bachelors	BS - Mathematics	64
1474	Bachelors	BS - Physics	64
1475	Bachelors	BS - Political Science	64
1476	Bachelors	BS - Zoology	64
1477	Bachelors	BS - Civil Technology	65
1478	Bachelors	BS - Electrical Technology	65
1479	Bachelors	BS - English	65
1480	Bachelors	BS (HONS) - Finance & Accounting	65
1481	Bachelors	BS - Islamic Banking & Finance	65
1482	Bachelors	BS - Management Sciences	65
1483	Bachelors	BS - Mathematics	65
1484	Bachelors	BS - Social Sciences	65
1485	Bachelors	BS - Software Engineering	65
1486	Bachelors	BS - Anesthesia Technology	68
1487	Bachelors	BS - Civil Technology	68
1488	Bachelors	BS - Computer Science	68
1489	Bachelors	BS - Cyber Security	68
1490	Bachelors	BS - Dental Hygienist	68
1491	Bachelors	BS - Diet & Nutritional Sciences	68
1492	Bachelors	BS - Education	68
1493	Bachelors	BS - Education	68
1494	Bachelors	BS - Electrical Technology	68
1495	Bachelors	BS - Electronics Technology	68
1496	Bachelors	BS - English	68
1497	Bachelors	BS - Finance & Accounting	68
1498	Bachelors	BS - Information Technology	68
1499	Bachelors	BS - International Relations	68
1500	Bachelors	BS - Islamic Studies	68
1501	Bachelors	BS - Media Sciences	68
1502	Bachelors	BS - Medical Laboratory Technology	68
1503	Bachelors	BS - Optometry	68
1504	Bachelors	BS - Public Health	68
1505	Bachelors	BS - Radiology & Imaging Technology	68
1506	Bachelors	BS - Real State Management	68
1507	Bachelors	BS - Software Engineering	68
1508	Bachelors	BS - Sports Sciences & Physical Education	68
1509	Bachelors	BS - Telecom Technology	68
1510	Bachelors	BS - Urdu	68
1511	Bachelors	BS - Biochemistry	69
1512	Bachelors	BS - Biotechnology	69
1513	Bachelors	BS - Botany	69
1514	Bachelors	BS - Chemical	69
1515	Bachelors	BS - Chemistry	69
1516	Bachelors	BS - Civil	69
1517	Bachelors	BS - Commerce	69
1518	Bachelors	BS - Computer Engineering	69
1519	Bachelors	BS - Computer Science	69
1520	Bachelors	BS - Economics	69
1521	Bachelors	BS - Education	69
1522	Bachelors	BS - Electrical	69
1523	Bachelors	BS - Electronics	69
1524	Bachelors	BS - English	69
1525	Bachelors	BS - Environmental Sciences	69
1526	Bachelors	BS - Finance & Accounting	69
1527	Bachelors	BS - Geological Engineering	69
1528	Bachelors	BS - Information Technology	69
1529	Bachelors	BS - International Relations	69
1530	Bachelors	BS - Mass Communication	69
1531	Bachelors	BS - Mathematics	69
1532	Bachelors	BS - Mechanical	69
1533	Bachelors	BS - Microbiology	69
1534	Bachelors	BS - Mining	69
1535	Bachelors	BS - Physics	69
1536	Bachelors	BS - Psychology	69
1537	Bachelors	BS - Public Administration	69
1538	Bachelors	BS - Sociology	69
1539	Bachelors	BS - Telecommunication	69
1540	Bachelors	BS - Textile & Fashion Design	69
1541	Bachelors	BS - Textile & Fashion Design	69
1542	Bachelors	BS - Textile Engineering	69
1543	Bachelors	MBBS - Medicine - Mbbs	70
1544	Bachelors	BS - Nursing	70
1545	Bachelors	BS - Anesthesia Technology	71
1546	Bachelors	BS - Human Diet & Nutrition	71
1547	Bachelors	BS - Medical Image Technology	71
1548	Bachelors	BS - Medical Laboratory Technology	71
1549	Bachelors	BS - Occupational Therapy	71
1550	Bachelors	BS - Operation Theater Technology	71
1551	Bachelors	BS - Optometry & Orthoptics	71
1552	Bachelors	BS - Speech & Language Pathology	71
1553	Bachelors	BS - Biochemistry	72
1554	Bachelors	BS - Biotechnology	72
1555	Bachelors	BS - Botany	72
1556	Bachelors	BS - Chemistry	72
1557	Bachelors	BS - Commerce	72
1558	Bachelors	BS - Computer Science	72
1559	Bachelors	BS - English	72
1560	Bachelors	BS - Environmental Sciences	72
1561	Bachelors	BS - Fine Arts	72
1562	Bachelors	BS - Human Diet & Nutrition	72
1563	Bachelors	BS - Islamic Studies	72
1564	Bachelors	BS - Mathematics	72
1565	Bachelors	BS - Media Journalism	72
1566	Bachelors	BS - Medical Laboratory Technology	72
1567	Bachelors	BS - Microbiology	72
1568	Bachelors	BS - Pakistan Studies	72
1569	Bachelors	BS - Pharmacy	72
1570	Bachelors	BS - Physics	72
1571	Bachelors	BS - Psychology	72
1572	Bachelors	BS - Social Work	72
1573	Bachelors	BS - Sociology	72
1574	Bachelors	BS - Urdu	72
1575	Bachelors	BS - Zoology	72
1576	Bachelors	BS - Anthropology	73
1577	Bachelors	BS - Archaeology	73
1578	Bachelors	BS - Balochi	73
1579	Bachelors	BS - Biochemistry	73
1580	Bachelors	BS - Biotechnology	73
1581	Bachelors	BS - Botany	73
1582	Bachelors	BS - Brahvi	73
1583	Bachelors	BS - Chemistry	73
1584	Bachelors	BS - Computer Science	73
1585	Bachelors	BS - Development Studies	73
1586	Bachelors	BS - Disaster Management	73
1587	Bachelors	BS - Eastern Medicine & Surgery	73
1588	Bachelors	BS - Economics	73
1589	Bachelors	BS - English Literature	73
1590	Bachelors	BS - Environmental Sciences	73
1591	Bachelors	BS - Gender & Development	73
1592	Bachelors	BS - Geography	73
1593	Bachelors	BS - Geology	73
1594	Bachelors	BS - Geophysics	73
1595	Bachelors	BS - History	73
1596	Bachelors	BS - Information Technology	73
1597	Bachelors	BS - International Relations	73
1598	Bachelors	BS - Islamic Studies	73
1599	Bachelors	BS - Library & Information Science	73
1600	Bachelors	BS - Mathematics	73
1601	Bachelors	BS - Media Studies	73
1602	Bachelors	BS - Microbiology	73
1603	Bachelors	BBS - Nutrition & Dietetics	73
1604	Bachelors	BS - Pakistan Studies	73
1605	Bachelors	BS - Persian	73
1606	Bachelors	BS - Philosophy	73
1608	Bachelors	BS - Physiotherapy	73
1609	Bachelors	BS - Political Science	73
1610	Bachelors	BS - Psychology	73
1611	Bachelors	BS - Public Administration	73
1612	Bachelors	BS - Pushto	73
1613	Bachelors	BS - Renewable Energy Engineering	73
1614	Bachelors	BS - Seismology	73
1615	Bachelors	BS - Social Work	73
1616	Bachelors	BS - Sociology	73
1617	Bachelors	BS - Statistics	73
1618	Bachelors	BS - Urdu	73
1619	Bachelors	BS - Zoology	73
1620	Bachelors	BS - Economics	74
1621	Bachelors	BS - Economics & Finance	74
1622	Bachelors	BS - Education	74
1623	Bachelors	BS - English	74
1624	Bachelors	BS - Finance & Accounting	74
1625	Bachelors	BS - International Relations	74
1626	Bachelors	BS - Islamic Studies	74
1627	Bachelors	BS - Mathematics	74
1628	Bachelors	BS - Media & Communication	74
1629	Bachelors	BS - Psychology	74
1630	Bachelors	BS (HONS) - Public Administration	74
1631	Bachelors	BS - Urdu	74
1632	Bachelors	BS - Computer Science	75
\.


--
-- Data for Name: question_sub_main; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.question_sub_main (question_sub_main_id, quizquestion_id, quizsubcategorymaincategory_id) FROM stdin;
1	1	11
2	1	1
3	1	6
4	1	16
5	1	21
6	1	26
7	2	11
8	2	1
9	2	6
10	2	16
11	2	21
12	2	26
13	3	11
14	3	1
15	3	6
16	3	16
17	3	21
18	3	26
19	4	11
20	4	1
21	4	6
22	4	16
23	4	21
24	4	26
25	5	11
26	5	1
27	5	6
28	5	16
29	5	21
30	5	26
31	6	11
32	6	1
33	6	6
34	6	16
35	6	21
36	6	26
37	7	11
38	7	1
39	7	6
40	7	16
41	7	21
42	7	26
43	8	11
44	8	1
45	8	6
46	8	16
47	8	21
48	8	26
49	9	11
50	9	1
51	9	6
52	9	16
53	9	21
54	9	26
55	10	11
56	10	1
57	10	6
58	10	16
59	10	21
60	10	26
61	11	11
62	11	1
63	11	6
64	11	16
65	11	21
66	11	26
67	12	11
68	12	1
69	12	6
70	12	16
71	12	21
72	12	26
73	13	11
74	13	1
75	13	6
76	13	16
77	13	21
78	13	26
79	14	11
80	14	1
81	14	6
82	14	16
83	14	21
84	14	26
85	15	11
86	15	1
87	15	6
88	15	16
89	15	21
90	15	26
91	16	11
92	16	1
93	16	6
94	16	16
95	16	21
96	16	26
97	17	11
98	17	1
99	17	6
100	17	16
101	17	21
102	17	26
103	18	11
104	18	1
105	18	6
106	18	16
107	18	21
108	18	26
109	19	11
110	19	1
111	19	6
112	19	16
113	19	21
114	19	26
115	20	11
116	20	1
117	20	6
118	20	16
119	20	21
120	20	26
121	21	11
122	21	1
123	21	6
124	21	16
125	21	21
126	21	26
127	22	11
128	22	1
129	22	6
130	22	16
131	22	21
132	22	26
133	23	11
134	23	1
135	23	6
136	23	16
137	23	21
138	23	26
139	24	11
140	24	1
141	24	6
142	24	16
143	24	21
144	24	26
145	25	11
146	25	1
147	25	6
148	25	16
149	25	21
150	25	26
151	26	11
152	26	1
153	26	6
154	26	16
155	26	21
156	26	26
157	27	11
158	27	1
159	27	6
160	27	16
161	27	21
162	27	26
163	28	11
164	28	1
165	28	6
166	28	16
167	28	21
168	28	26
169	29	11
170	29	1
171	29	6
172	29	16
173	29	21
174	29	26
175	30	11
176	30	1
177	30	6
178	30	16
179	30	21
180	30	26
181	31	11
182	31	1
183	31	6
184	31	16
185	31	21
186	31	26
187	32	11
188	32	1
189	32	6
190	32	16
191	32	21
192	32	26
193	33	11
194	33	1
195	33	6
196	33	16
197	33	21
198	33	26
199	34	11
200	34	1
201	34	6
202	34	16
203	34	21
204	34	26
205	35	11
206	35	1
207	35	6
208	35	16
209	35	21
210	35	26
211	36	11
212	36	1
213	36	6
214	36	16
215	36	21
216	36	26
217	37	11
218	37	1
219	37	6
220	37	16
221	37	21
222	37	26
223	38	11
224	38	1
225	38	6
226	38	16
227	38	21
228	38	26
229	39	11
230	39	1
231	39	6
232	39	16
233	39	21
234	39	26
235	40	11
236	40	1
237	40	6
238	40	16
239	40	21
240	40	26
241	41	11
242	41	1
243	41	6
244	41	16
245	41	21
246	41	26
247	42	11
248	42	1
249	42	6
250	42	16
251	42	21
252	42	26
253	43	11
254	43	1
255	43	6
256	43	16
257	43	21
258	43	26
259	44	11
260	44	1
261	44	6
262	44	16
263	44	21
264	44	26
265	45	11
266	45	1
267	45	6
268	45	16
269	45	21
270	45	26
271	46	11
272	46	1
273	46	6
274	46	16
275	46	21
276	46	26
277	47	11
278	47	1
279	47	6
280	47	16
281	47	21
282	47	26
283	48	11
284	48	1
285	48	6
286	48	16
287	48	21
288	48	26
290	50	11
291	50	1
292	50	6
293	50	16
294	50	21
295	50	26
296	51	11
297	51	1
298	51	6
299	51	16
300	51	21
301	51	26
302	52	11
303	52	1
304	52	6
305	52	16
306	52	21
307	52	26
308	53	11
309	53	1
310	53	6
311	53	16
312	53	21
313	53	26
314	54	11
315	54	1
316	54	6
317	54	16
318	54	21
319	54	26
320	55	11
321	55	1
322	55	6
323	55	16
324	55	21
325	55	26
326	56	11
327	56	1
328	56	6
329	56	16
330	56	21
331	56	26
332	57	11
333	57	1
334	57	6
335	57	16
336	57	21
337	57	26
338	58	11
339	58	1
340	58	6
341	58	16
342	58	21
343	58	26
344	59	11
345	59	1
346	59	6
347	59	16
348	59	21
349	59	26
350	60	11
351	60	1
352	60	6
353	60	16
354	60	21
355	60	26
356	61	11
357	61	1
358	61	6
359	61	16
360	61	21
361	61	26
362	62	11
363	62	1
364	62	6
365	62	16
366	62	21
367	62	26
368	63	11
369	63	1
370	63	6
371	63	16
372	63	21
373	63	26
374	64	11
375	64	1
376	64	6
377	64	16
378	64	21
379	64	26
380	65	11
381	65	1
382	65	6
383	65	16
384	65	21
385	65	26
386	66	11
387	66	1
388	66	6
389	66	16
390	66	21
391	66	26
392	67	11
393	67	1
394	67	6
395	67	16
396	67	21
397	67	26
398	68	11
399	68	1
400	68	6
401	68	16
402	68	21
403	68	26
404	69	11
405	69	1
406	69	6
407	69	16
408	69	21
409	69	26
410	70	11
411	70	1
412	70	6
413	70	16
414	70	21
415	70	26
416	71	11
417	71	1
418	71	6
419	71	16
420	71	21
421	71	26
422	72	11
423	72	1
424	72	6
425	72	16
426	72	21
427	72	26
429	74	11
430	74	1
431	74	6
432	74	16
433	74	21
434	74	26
435	75	11
436	75	1
437	75	6
438	75	16
439	75	21
440	75	26
441	76	11
442	76	1
443	76	6
444	76	16
445	76	21
446	76	26
447	77	11
448	77	1
449	77	6
450	77	16
451	77	21
452	77	26
453	78	11
454	78	1
455	78	6
456	78	16
457	78	21
458	78	26
459	79	11
460	79	1
461	79	6
462	79	16
463	79	21
464	79	26
465	80	11
466	80	1
467	80	6
468	80	16
469	80	21
470	80	26
471	81	11
472	81	1
473	81	6
474	81	16
475	81	21
476	81	26
477	82	11
478	82	1
479	82	6
480	82	16
481	82	21
482	82	26
483	83	11
484	83	1
485	83	6
486	83	16
487	83	21
488	83	26
489	84	11
490	84	1
491	84	6
492	84	16
493	84	21
494	84	26
495	85	11
496	85	1
497	85	6
498	85	16
499	85	21
500	85	26
501	86	11
502	86	1
503	86	6
504	86	16
505	86	21
506	86	26
507	87	11
508	87	1
509	87	6
510	87	16
511	87	21
512	87	26
513	88	11
514	88	1
515	88	6
516	88	16
517	88	21
518	88	26
519	89	11
520	89	1
521	89	6
522	89	16
523	89	21
524	89	26
525	90	11
526	90	1
527	90	6
528	90	16
529	90	21
530	90	26
531	91	11
532	91	1
533	91	6
534	91	16
535	91	21
536	91	26
537	92	11
538	92	1
539	92	6
540	92	16
541	92	21
542	92	26
543	93	11
544	93	1
545	93	6
546	93	16
547	93	21
548	93	26
549	94	11
550	94	1
551	94	6
552	94	16
553	94	21
554	94	26
555	95	11
556	95	1
557	95	6
558	95	16
559	95	21
560	95	26
561	96	11
562	96	1
563	96	6
564	96	16
565	96	21
566	96	26
567	97	11
568	97	1
569	97	6
570	97	16
571	97	21
572	97	26
573	98	11
574	98	1
575	98	6
576	98	16
577	98	21
578	98	26
579	99	11
580	99	1
581	99	6
582	99	16
583	99	21
584	99	26
585	74	11
586	74	1
587	74	6
588	74	16
589	74	21
590	74	26
591	100	11
592	100	1
593	100	6
594	100	16
595	100	21
596	100	26
597	101	11
598	101	1
599	101	6
600	101	16
601	101	21
602	101	26
603	75	11
604	75	1
605	75	6
606	75	16
607	75	21
608	75	26
609	102	11
610	102	1
611	102	6
612	102	16
613	102	21
614	102	26
615	103	11
616	103	1
617	103	6
618	103	16
619	103	21
620	103	26
621	104	11
622	104	1
623	104	6
624	104	16
625	104	21
626	104	26
627	105	11
628	105	1
629	105	6
630	105	16
631	105	21
632	105	26
633	106	11
634	106	1
635	106	6
636	106	16
637	106	21
638	106	26
639	107	11
640	107	1
641	107	6
642	107	16
643	107	21
644	107	26
645	108	11
646	108	1
647	108	6
648	108	16
649	108	21
650	108	26
651	109	11
652	109	1
653	109	6
654	109	16
655	109	21
656	109	26
657	110	11
658	110	1
659	110	6
660	110	16
661	110	21
662	110	26
663	111	11
664	111	1
665	111	6
666	111	16
667	111	21
668	111	26
669	112	11
670	112	1
671	112	6
672	112	16
673	112	21
674	112	26
675	113	11
676	113	1
677	113	6
678	113	16
679	113	21
680	113	26
682	115	12
683	115	2
684	115	17
685	115	22
686	115	27
687	116	12
688	116	2
689	116	17
690	116	22
691	116	27
692	117	12
693	117	2
694	117	17
695	117	22
696	117	27
697	118	12
698	118	2
699	118	17
700	118	22
701	118	27
702	119	12
703	119	2
704	119	17
705	119	22
706	119	27
707	120	12
708	120	2
709	120	17
710	120	22
711	120	27
712	121	12
713	121	2
714	121	17
715	121	22
716	121	27
717	122	12
718	122	2
719	122	17
720	122	22
721	122	27
722	123	12
723	123	2
724	123	17
725	123	22
726	123	27
727	124	12
728	124	2
729	124	17
730	124	22
731	124	27
732	125	12
733	125	2
734	125	17
735	125	22
736	125	27
737	126	12
738	126	2
739	126	17
740	126	22
741	126	27
742	127	12
743	127	2
744	127	17
745	127	22
746	127	27
747	128	12
748	128	2
749	128	17
750	128	22
751	128	27
752	129	12
753	129	2
754	129	17
755	129	22
756	129	27
757	130	12
758	130	2
759	130	17
760	130	22
761	130	27
762	131	12
763	131	2
764	131	17
765	131	22
766	131	27
767	132	12
768	132	2
769	132	17
770	132	22
771	132	27
772	133	12
773	133	2
774	133	17
775	133	22
776	133	27
777	134	12
778	134	2
779	134	17
780	134	22
781	134	27
782	135	12
783	135	2
784	135	17
785	135	22
786	135	27
787	136	12
788	136	2
789	136	17
790	136	22
791	136	27
792	137	12
793	137	2
794	137	17
795	137	22
796	137	27
797	138	12
798	138	2
799	138	17
800	138	22
801	138	27
802	139	12
803	139	2
804	139	17
805	139	22
806	139	27
807	140	12
808	140	2
809	140	17
810	140	22
811	140	27
812	141	12
813	141	2
814	141	17
815	141	22
816	141	27
817	142	12
818	142	2
819	142	17
820	142	22
821	142	27
822	143	12
823	143	2
824	143	17
825	143	22
826	143	27
827	144	12
828	144	2
829	144	17
830	144	22
831	144	27
832	145	12
833	145	2
834	145	17
835	145	22
836	145	27
837	146	12
838	146	2
839	146	17
840	146	22
841	146	27
842	147	12
843	147	2
844	147	17
845	147	22
846	147	27
847	148	12
848	148	2
849	148	17
850	148	22
851	148	27
852	149	12
853	149	2
854	149	17
855	149	22
856	149	27
857	150	12
858	150	2
859	150	17
860	150	22
861	150	27
862	151	12
863	151	2
864	151	17
865	151	22
866	151	27
867	152	12
868	152	2
869	152	17
870	152	22
871	152	27
872	153	12
873	153	2
874	153	17
875	153	22
876	153	27
877	154	12
878	154	2
879	154	17
880	154	22
881	154	27
883	156	12
884	156	2
885	156	17
886	156	22
887	156	27
888	157	12
889	157	2
890	157	17
891	157	22
892	157	27
893	158	12
894	158	2
895	158	17
896	158	22
897	158	27
898	159	12
899	159	2
900	159	17
901	159	22
902	159	27
903	160	12
904	160	2
905	160	17
906	160	22
907	160	27
908	161	12
909	161	2
910	161	17
911	161	22
912	161	27
913	162	12
914	162	2
915	162	17
916	162	22
917	162	27
918	163	12
919	163	2
920	163	17
921	163	22
922	163	27
923	164	12
924	164	2
925	164	17
926	164	22
927	164	27
928	165	12
929	165	2
930	165	17
931	165	22
932	165	27
933	166	12
934	166	2
935	166	17
936	166	22
937	166	27
938	167	12
939	167	2
940	167	17
941	167	22
942	167	27
943	168	12
944	168	2
945	168	17
946	168	22
947	168	27
948	169	12
949	169	2
950	169	17
951	169	22
952	169	27
953	170	12
954	170	2
955	170	17
956	170	22
957	170	27
958	171	12
959	171	2
960	171	17
961	171	22
962	171	27
963	172	12
964	172	2
965	172	17
966	172	22
967	172	27
968	173	12
969	173	2
970	173	17
971	173	22
972	173	27
973	174	12
974	174	2
975	174	17
976	174	22
977	174	27
978	175	12
979	175	2
980	175	17
981	175	22
982	175	27
983	176	12
984	176	2
985	176	17
986	176	22
987	176	27
988	177	12
989	177	2
990	177	17
991	177	22
992	177	27
993	178	12
994	178	2
995	178	17
996	178	22
997	178	27
998	179	12
999	179	2
1000	179	17
1001	179	22
1002	179	27
1003	180	12
1004	180	2
1005	180	17
1006	180	22
1007	180	27
1008	181	12
1009	181	2
1010	181	17
1011	181	22
1012	181	27
1013	182	12
1014	182	2
1015	182	17
1016	182	22
1017	182	27
1018	183	12
1019	183	2
1020	183	17
1021	183	22
1022	183	27
1023	184	12
1024	184	2
1025	184	17
1026	184	22
1027	184	27
1028	185	12
1029	185	2
1030	185	17
1031	185	22
1032	185	27
1033	186	12
1034	186	2
1035	186	17
1036	186	22
1037	186	27
1038	187	12
1039	187	2
1040	187	17
1041	187	22
1042	187	27
1043	188	12
1044	188	2
1045	188	17
1046	188	22
1047	188	27
1048	189	12
1049	189	2
1050	189	17
1051	189	22
1052	189	27
1053	190	12
1054	190	2
1055	190	17
1056	190	22
1057	190	27
1058	191	12
1059	191	2
1060	191	17
1061	191	22
1062	191	27
1063	192	12
1064	192	2
1065	192	17
1066	192	22
1067	192	27
1068	193	12
1069	193	2
1070	193	17
1071	193	22
1072	193	27
1073	194	12
1074	194	2
1075	194	17
1076	194	22
1077	194	27
1078	195	12
1079	195	2
1080	195	17
1081	195	22
1082	195	27
1084	197	12
1085	197	2
1086	197	17
1087	197	22
1088	197	27
1089	198	12
1090	198	2
1091	198	17
1092	198	22
1093	198	27
1094	199	12
1095	199	2
1096	199	17
1097	199	22
1098	199	27
1099	200	12
1100	200	2
1101	200	17
1102	200	22
1103	200	27
1104	201	12
1105	201	2
1106	201	17
1107	201	22
1108	201	27
1109	202	12
1110	202	2
1111	202	17
1112	202	22
1113	202	27
1114	203	12
1115	203	2
1116	203	17
1117	203	22
1118	203	27
1119	204	12
1120	204	2
1121	204	17
1122	204	22
1123	204	27
1124	205	12
1125	205	2
1126	205	17
1127	205	22
1128	205	27
1129	206	12
1130	206	2
1131	206	17
1132	206	22
1133	206	27
1134	207	12
1135	207	2
1136	207	17
1137	207	22
1138	207	27
1139	208	12
1140	208	2
1141	208	17
1142	208	22
1143	208	27
1144	209	12
1145	209	2
1146	209	17
1147	209	22
1148	209	27
1149	210	12
1150	210	2
1151	210	17
1152	210	22
1153	210	27
1154	211	12
1155	211	2
1156	211	17
1157	211	22
1158	211	27
1159	212	12
1160	212	2
1161	212	17
1162	212	22
1163	212	27
1164	213	12
1165	213	2
1166	213	17
1167	213	22
1168	213	27
1169	214	12
1170	214	2
1171	214	17
1172	214	22
1173	214	27
1174	215	12
1175	215	2
1176	215	17
1177	215	22
1178	215	27
1179	216	12
1180	216	2
1181	216	17
1182	216	22
1183	216	27
1184	217	12
1185	217	2
1186	217	17
1187	217	22
1188	217	27
1189	218	12
1190	218	2
1191	218	17
1192	218	22
1193	218	27
1194	219	12
1195	219	2
1196	219	17
1197	219	22
1198	219	27
1199	220	12
1200	220	2
1201	220	17
1202	220	22
1203	220	27
1204	221	12
1205	221	2
1206	221	17
1207	221	22
1208	221	27
1209	222	12
1210	222	2
1211	222	17
1212	222	22
1213	222	27
1214	223	12
1215	223	2
1216	223	17
1217	223	22
1218	223	27
1219	224	12
1220	224	2
1221	224	17
1222	224	22
1223	224	27
1224	225	12
1225	225	2
1226	225	17
1227	225	22
1228	225	27
1229	226	12
1230	226	2
1231	226	17
1232	226	22
1233	226	27
1234	227	12
1235	227	2
1236	227	17
1237	227	22
1238	227	27
1239	228	12
1240	228	2
1241	228	17
1242	228	22
1243	228	27
1244	229	12
1245	229	2
1246	229	17
1247	229	22
1248	229	27
1249	230	12
1250	230	2
1251	230	17
1252	230	22
1253	230	27
1254	231	12
1255	231	2
1256	231	17
1257	231	22
1258	231	27
1259	232	12
1260	232	2
1261	232	17
1262	232	22
1263	232	27
1264	233	12
1265	233	2
1266	233	17
1267	233	22
1268	233	27
1269	234	12
1270	234	2
1271	234	17
1272	234	22
1273	234	27
1274	235	12
1275	235	2
1276	235	17
1277	235	22
1278	235	27
1279	236	12
1280	236	2
1281	236	17
1282	236	22
1283	236	27
1285	238	12
1286	238	2
1287	238	17
1288	238	22
1289	238	27
1290	239	12
1291	239	2
1292	239	17
1293	239	22
1294	239	27
1295	240	12
1296	240	2
1297	240	17
1298	240	22
1299	240	27
1300	241	12
1301	241	2
1302	241	17
1303	241	22
1304	241	27
1305	242	12
1306	242	2
1307	242	17
1308	242	22
1309	242	27
1310	243	12
1311	243	2
1312	243	17
1313	243	22
1314	243	27
1315	244	12
1316	244	2
1317	244	17
1318	244	22
1319	244	27
1320	245	12
1321	245	2
1322	245	17
1323	245	22
1324	245	27
1325	246	12
1326	246	2
1327	246	17
1328	246	22
1329	246	27
1330	247	12
1331	247	2
1332	247	17
1333	247	22
1334	247	27
1335	248	12
1336	248	2
1337	248	17
1338	248	22
1339	248	27
1340	249	12
1341	249	2
1342	249	17
1343	249	22
1344	249	27
1345	250	12
1346	250	2
1347	250	17
1348	250	22
1349	250	27
1350	251	12
1351	251	2
1352	251	17
1353	251	22
1354	251	27
1355	252	12
1356	252	2
1357	252	17
1358	252	22
1359	252	27
1360	253	12
1361	253	2
1362	253	17
1363	253	22
1364	253	27
1365	254	12
1366	254	2
1367	254	17
1368	254	22
1369	254	27
1370	255	12
1371	255	2
1372	255	17
1373	255	22
1374	255	27
1375	256	12
1376	256	2
1377	256	17
1378	256	22
1379	256	27
1380	257	12
1381	257	2
1382	257	17
1383	257	22
1384	257	27
1385	258	12
1386	258	2
1387	258	17
1388	258	22
1389	258	27
1390	259	12
1391	259	2
1392	259	17
1393	259	22
1394	259	27
1395	260	12
1396	260	2
1397	260	17
1398	260	22
1399	260	27
1400	261	12
1401	261	2
1402	261	17
1403	261	22
1404	261	27
1405	262	12
1406	262	2
1407	262	17
1408	262	22
1409	262	27
1410	263	12
1411	263	2
1412	263	17
1413	263	22
1414	263	27
1415	264	12
1416	264	2
1417	264	17
1418	264	22
1419	264	27
1420	265	12
1421	265	2
1422	265	17
1423	265	22
1424	265	27
1425	266	12
1426	266	2
1427	266	17
1428	266	22
1429	266	27
1430	267	12
1431	267	2
1432	267	17
1433	267	22
1434	267	27
1435	268	12
1436	268	2
1437	268	17
1438	268	22
1439	268	27
1440	269	12
1441	269	2
1442	269	17
1443	269	22
1444	269	27
1445	270	12
1446	270	2
1447	270	17
1448	270	22
1449	270	27
1450	271	12
1451	271	2
1452	271	17
1453	271	22
1454	271	27
1455	272	12
1456	272	2
1457	272	17
1458	272	22
1459	272	27
1460	273	12
1461	273	2
1462	273	17
1463	273	22
1464	273	27
1466	275	12
1467	275	2
1468	275	17
1469	275	22
1470	275	27
1471	276	12
1472	276	2
1473	276	17
1474	276	22
1475	276	27
1476	277	12
1477	277	2
1478	277	17
1479	277	22
1480	277	27
1481	278	12
1482	278	2
1483	278	17
1484	278	22
1485	278	27
1486	279	12
1487	279	2
1488	279	17
1489	279	22
1490	279	27
1491	280	12
1492	280	2
1493	280	17
1494	280	22
1495	280	27
1496	281	12
1497	281	2
1498	281	17
1499	281	22
1500	281	27
1501	282	12
1502	282	2
1503	282	17
1504	282	22
1505	282	27
1506	283	12
1507	283	2
1508	283	17
1509	283	22
1510	283	27
1511	284	12
1512	284	2
1513	284	17
1514	284	22
1515	284	27
1516	285	12
1517	285	2
1518	285	17
1519	285	22
1520	285	27
1521	286	12
1522	286	2
1523	286	17
1524	286	22
1525	286	27
1526	287	12
1527	287	2
1528	287	17
1529	287	22
1530	287	27
1531	288	12
1532	288	2
1533	288	17
1534	288	22
1535	288	27
1536	289	12
1537	289	2
1538	289	17
1539	289	22
1540	289	27
1541	290	12
1542	290	2
1543	290	17
1544	290	22
1545	290	27
1546	291	12
1547	291	2
1548	291	17
1549	291	22
1550	291	27
1551	292	12
1552	292	2
1553	292	17
1554	292	22
1555	292	27
1556	293	12
1557	293	2
1558	293	17
1559	293	22
1560	293	27
1561	294	12
1562	294	2
1563	294	17
1564	294	22
1565	294	27
1566	295	12
1567	295	2
1568	295	17
1569	295	22
1570	295	27
1571	296	12
1572	296	2
1573	296	17
1574	296	22
1575	296	27
1576	297	12
1577	297	2
1578	297	17
1579	297	22
1580	297	27
1581	298	12
1582	298	2
1583	298	17
1584	298	22
1585	298	27
1586	299	12
1587	299	2
1588	299	17
1589	299	22
1590	299	27
1591	300	12
1592	300	2
1593	300	17
1594	300	22
1595	300	27
1596	301	12
1597	301	2
1598	301	17
1599	301	22
1600	301	27
1601	302	12
1602	302	2
1603	302	17
1604	302	22
1605	302	27
1606	303	12
1607	303	2
1608	303	17
1609	303	22
1610	303	27
1611	304	12
1612	304	2
1613	304	17
1614	304	22
1615	304	27
1616	305	12
1617	305	2
1618	305	17
1619	305	22
1620	305	27
1621	306	12
1622	306	2
1623	306	17
1624	306	22
1625	306	27
1626	307	12
1627	307	2
1628	307	17
1629	307	22
1630	307	27
1631	308	12
1632	308	2
1633	308	17
1634	308	22
1635	308	27
1636	309	12
1637	309	2
1638	309	17
1639	309	22
1640	309	27
1642	311	12
1643	311	2
1644	311	17
1645	311	22
1646	311	27
1647	312	12
1648	312	2
1649	312	17
1650	312	22
1651	312	27
1652	313	12
1653	313	2
1654	313	17
1655	313	22
1656	313	27
1657	314	12
1658	314	2
1659	314	17
1660	314	22
1661	314	27
1662	315	12
1663	315	2
1664	315	17
1665	315	22
1666	315	27
1667	316	12
1668	316	2
1669	316	17
1670	316	22
1671	316	27
1672	317	12
1673	317	2
1674	317	17
1675	317	22
1676	317	27
1677	318	12
1678	318	2
1679	318	17
1680	318	22
1681	318	27
1682	319	12
1683	319	2
1684	319	17
1685	319	22
1686	319	27
1687	320	12
1688	320	2
1689	320	17
1690	320	22
1691	320	27
1692	321	12
1693	321	2
1694	321	17
1695	321	22
1696	321	27
1697	322	12
1698	322	2
1699	322	17
1700	322	22
1701	322	27
1702	323	12
1703	323	2
1704	323	17
1705	323	22
1706	323	27
1707	324	12
1708	324	2
1709	324	17
1710	324	22
1711	324	27
1712	325	12
1713	325	2
1714	325	17
1715	325	22
1716	325	27
1717	326	12
1718	326	2
1719	326	17
1720	326	22
1721	326	27
1722	327	12
1723	327	2
1724	327	17
1725	327	22
1726	327	27
1727	328	12
1728	328	2
1729	328	17
1730	328	22
1731	328	27
1732	329	12
1733	329	2
1734	329	17
1735	329	22
1736	329	27
1737	330	12
1738	330	2
1739	330	17
1740	330	22
1741	330	27
1742	331	12
1743	331	2
1744	331	17
1745	331	22
1746	331	27
1747	332	12
1748	332	2
1749	332	17
1750	332	22
1751	332	27
1752	333	12
1753	333	2
1754	333	17
1755	333	22
1756	333	27
1757	334	12
1758	334	2
1759	334	17
1760	334	22
1761	334	27
1762	335	12
1763	335	2
1764	335	17
1765	335	22
1766	335	27
1767	336	12
1768	336	2
1769	336	17
1770	336	22
1771	336	27
1772	337	12
1773	337	2
1774	337	17
1775	337	22
1776	337	27
1777	338	12
1778	338	2
1779	338	17
1780	338	22
1781	338	27
1782	339	12
1783	339	2
1784	339	17
1785	339	22
1786	339	27
1788	341	3
1789	341	18
1790	341	23
1791	342	3
1792	342	18
1793	342	23
1794	343	3
1795	343	18
1796	343	23
1797	344	3
1798	344	18
1799	344	23
1800	345	3
1801	345	18
1802	345	23
1803	346	3
1804	346	18
1805	346	23
1806	347	3
1807	347	18
1808	347	23
1809	348	3
1810	348	18
1811	348	23
1812	349	3
1813	349	18
1814	349	23
1815	350	3
1816	350	18
1817	350	23
1818	351	3
1819	351	18
1820	351	23
1821	352	3
1822	352	18
1823	352	23
1824	353	3
1825	353	18
1826	353	23
1827	354	3
1828	354	18
1829	354	23
1830	355	3
1831	355	18
1832	355	23
1833	356	3
1834	356	18
1835	356	23
1836	357	3
1837	357	18
1838	357	23
1839	358	3
1840	358	18
1841	358	23
1842	359	3
1843	359	18
1844	359	23
1845	360	3
1846	360	18
1847	360	23
1848	361	3
1849	361	18
1850	361	23
1851	362	3
1852	362	18
1853	362	23
1854	363	3
1855	363	18
1856	363	23
1857	364	3
1858	364	18
1859	364	23
1860	365	3
1861	365	18
1862	365	23
1863	366	3
1864	366	18
1865	366	23
1866	367	3
1867	367	18
1868	367	23
1869	368	3
1870	368	18
1871	368	23
1872	369	3
1873	369	18
1874	369	23
1875	370	3
1876	370	18
1877	370	23
1878	371	3
1879	371	18
1880	371	23
1881	372	3
1882	372	18
1883	372	23
1884	373	3
1885	373	18
1886	373	23
1887	374	3
1888	374	18
1889	374	23
1890	375	3
1891	375	18
1892	375	23
1893	376	3
1894	376	18
1895	376	23
1896	377	3
1897	377	18
1898	377	23
1899	378	3
1900	378	18
1901	378	23
1902	379	3
1903	379	18
1904	379	23
1905	380	3
1906	380	18
1907	380	23
1908	381	3
1909	381	18
1910	381	23
1911	382	3
1912	382	18
1913	382	23
1914	383	3
1915	383	18
1916	383	23
1917	384	3
1918	384	18
1919	384	23
1920	385	3
1921	385	18
1922	385	23
1923	386	3
1924	386	18
1925	386	23
1926	387	3
1927	387	18
1928	387	23
1929	388	3
1930	388	18
1931	388	23
1932	389	3
1933	389	18
1934	389	23
1935	390	3
1936	390	18
1937	390	23
1938	391	3
1939	391	18
1940	391	23
1941	392	3
1942	392	18
1943	392	23
1944	393	3
1945	393	18
1946	393	23
1947	394	3
1948	394	18
1949	394	23
1950	395	3
1951	395	18
1952	395	23
1953	396	3
1954	396	18
1955	396	23
1956	397	3
1957	397	18
1958	397	23
1959	398	3
1960	398	18
1961	398	23
1962	399	3
1963	399	18
1964	399	23
1965	400	3
1966	400	18
1967	400	23
1968	401	3
1969	401	18
1970	401	23
1971	402	3
1972	402	18
1973	402	23
1974	403	3
1975	403	18
1976	403	23
1977	404	3
1978	404	18
1979	404	23
1980	405	3
1981	405	18
1982	405	23
1983	406	3
1984	406	18
1985	406	23
1986	407	3
1987	407	18
1988	407	23
1989	408	3
1990	408	18
1991	408	23
1992	409	3
1993	409	18
1994	409	23
1995	410	3
1996	410	18
1997	410	23
1998	411	3
1999	411	18
2000	411	23
2001	412	3
2002	412	18
2003	412	23
2004	413	3
2005	413	18
2006	413	23
2007	414	3
2008	414	18
2009	414	23
2010	415	3
2011	415	18
2012	415	23
2013	416	3
2014	416	18
2015	416	23
2016	417	3
2017	417	18
2018	417	23
2019	418	3
2020	418	18
2021	418	23
2022	419	3
2023	419	18
2024	419	23
2025	420	3
2026	420	18
2027	420	23
2028	421	3
2029	421	18
2030	421	23
2031	422	3
2032	422	18
2033	422	23
2034	423	3
2035	423	18
2036	423	23
2037	424	3
2038	424	18
2039	424	23
2040	425	3
2041	425	18
2042	425	23
2043	426	3
2044	426	18
2045	426	23
2046	427	3
2047	427	18
2048	427	23
2049	428	3
2050	428	18
2051	428	23
2052	429	3
2053	429	18
2054	429	23
2055	430	3
2056	430	18
2057	430	23
2058	431	3
2059	431	18
2060	431	23
2061	432	3
2062	432	18
2063	432	23
2064	433	3
2065	433	18
2066	433	23
2067	434	3
2068	434	18
2069	434	23
2070	435	3
2071	435	18
2072	435	23
2073	436	3
2074	436	18
2075	436	23
2076	312	3
2077	312	18
2078	312	23
2079	437	3
2080	437	18
2081	437	23
2082	438	3
2083	438	18
2084	438	23
2085	439	3
2086	439	18
2087	439	23
2088	440	3
2089	440	18
2090	440	23
2091	441	3
2092	441	18
2093	441	23
2094	442	3
2095	442	18
2096	442	23
2097	443	3
2098	443	18
2099	443	23
2100	444	3
2101	444	18
2102	444	23
2103	445	3
2104	445	18
2105	445	23
2106	446	3
2107	446	18
2108	446	23
2109	447	3
2110	447	18
2111	447	23
2112	448	3
2113	448	18
2114	448	23
2115	449	3
2116	449	18
2117	449	23
2118	450	3
2119	450	18
2120	450	23
2121	451	3
2122	451	18
2123	451	23
2124	452	3
2125	452	18
2126	452	23
2127	453	3
2128	453	18
2129	453	23
2130	454	3
2131	454	18
2132	454	23
2133	455	3
2134	455	18
2135	455	23
2136	456	3
2137	456	18
2138	456	23
2139	457	3
2140	457	18
2141	457	23
2142	458	3
2143	458	18
2144	458	23
2145	459	3
2146	459	18
2147	459	23
2148	460	3
2149	460	18
2150	460	23
2151	461	3
2152	461	18
2153	461	23
2154	462	3
2155	462	18
2156	462	23
2157	463	3
2158	463	18
2159	463	23
2160	464	3
2161	464	18
2162	464	23
2163	465	3
2164	465	18
2165	465	23
2166	466	3
2167	466	18
2168	466	23
2169	467	3
2170	467	18
2171	467	23
2172	469	4
2173	469	19
2174	469	9
2175	470	4
2176	470	19
2177	470	9
2178	471	4
2179	471	19
2180	471	9
2181	472	4
2182	472	19
2183	472	9
2184	473	4
2185	473	19
2186	473	9
2187	474	4
2188	474	19
2189	474	9
2190	475	4
2191	475	19
2192	475	9
2193	476	4
2194	476	19
2195	476	9
2196	477	4
2197	477	19
2198	477	9
2199	478	4
2200	478	19
2201	478	9
2202	479	4
2203	479	19
2204	479	9
2205	480	4
2206	480	19
2207	480	9
2208	481	4
2209	481	19
2210	481	9
2211	482	4
2212	482	19
2213	482	9
2214	483	4
2215	483	19
2216	483	9
2217	484	4
2218	484	19
2219	484	9
2220	485	4
2221	485	19
2222	485	9
2223	486	4
2224	486	19
2225	486	9
2226	487	4
2227	487	19
2228	487	9
2229	488	4
2230	488	19
2231	488	9
2232	489	4
2233	489	19
2234	489	9
2235	490	4
2236	490	19
2237	490	9
2238	491	4
2239	491	19
2240	491	9
2241	492	4
2242	492	19
2243	492	9
2244	493	4
2245	493	19
2246	493	9
2247	494	4
2248	494	19
2249	494	9
2250	495	4
2251	495	19
2252	495	9
2253	496	4
2254	496	19
2255	496	9
2256	497	4
2257	497	19
2258	497	9
2259	498	4
2260	498	19
2261	498	9
2262	499	4
2263	499	19
2264	499	9
2265	500	4
2266	500	19
2267	500	9
2268	501	4
2269	501	19
2270	501	9
2271	502	4
2272	502	19
2273	502	9
2274	503	4
2275	503	19
2276	503	9
2277	504	4
2278	504	19
2279	504	9
2280	505	4
2281	505	19
2282	505	9
2283	506	4
2284	506	19
2285	506	9
2286	507	4
2287	507	19
2288	507	9
2289	508	4
2290	508	19
2291	508	9
2292	509	4
2293	509	19
2294	509	9
2295	510	4
2296	510	19
2297	510	9
2298	511	4
2299	511	19
2300	511	9
2301	512	4
2302	512	19
2303	512	9
2304	513	4
2305	513	19
2306	513	9
2307	514	4
2308	514	19
2309	514	9
2310	515	4
2311	515	19
2312	515	9
2313	516	4
2314	516	19
2315	516	9
2316	517	4
2317	517	19
2318	517	9
2319	518	4
2320	518	19
2321	518	9
2322	519	4
2323	519	19
2324	519	9
2325	520	4
2326	520	19
2327	520	9
2328	521	4
2329	521	19
2330	521	9
2331	522	4
2332	522	19
2333	522	9
2334	523	4
2335	523	19
2336	523	9
2337	524	4
2338	524	19
2339	524	9
2340	525	4
2341	525	19
2342	525	9
2343	526	4
2344	526	19
2345	526	9
2346	527	4
2347	527	19
2348	527	9
2349	528	4
2350	528	19
2351	528	9
2352	529	4
2353	529	19
2354	529	9
2355	530	4
2356	530	19
2357	530	9
2358	531	4
2359	531	19
2360	531	9
2361	532	4
2362	532	19
2363	532	9
2364	533	4
2365	533	19
2366	533	9
2367	534	4
2368	534	19
2369	534	9
2370	535	4
2371	535	19
2372	535	9
2373	536	4
2374	536	19
2375	536	9
2376	537	4
2377	537	19
2378	537	9
2379	538	4
2380	538	19
2381	538	9
2382	539	4
2383	539	19
2384	539	9
2385	540	4
2386	540	19
2387	540	9
2388	541	4
2389	541	19
2390	541	9
2391	542	4
2392	542	19
2393	542	9
2394	543	4
2395	543	19
2396	543	9
2397	544	4
2398	544	19
2399	544	9
2400	545	4
2401	545	19
2402	545	9
2403	546	4
2404	546	19
2405	546	9
2406	547	4
2407	547	19
2408	547	9
2409	548	4
2410	548	19
2411	548	9
2412	549	4
2413	549	19
2414	549	9
2416	551	5
2417	551	10
2418	552	5
2419	552	10
2420	553	5
2421	553	10
2422	554	5
2423	554	10
2424	555	5
2425	555	10
2426	556	5
2427	556	10
2428	557	5
2429	557	10
2430	558	5
2431	558	10
2432	559	5
2433	559	10
2434	560	5
2435	560	10
2436	561	5
2437	561	10
2438	562	5
2439	562	10
2440	563	5
2441	563	10
2442	564	5
2443	564	10
2444	565	5
2445	565	10
2446	566	5
2447	566	10
2448	567	5
2449	567	10
2450	568	5
2451	568	10
2452	569	5
2453	569	10
2454	570	5
2455	570	10
2456	571	5
2457	571	10
2458	572	5
2459	572	10
2460	573	5
2461	573	10
2462	574	5
2463	574	10
2464	575	5
2465	575	10
2466	576	5
2467	576	10
2468	577	5
2469	577	10
2470	578	5
2471	578	10
2472	579	5
2473	579	10
2474	580	5
2475	580	10
2476	581	5
2477	581	10
2478	582	5
2479	582	10
2480	583	5
2481	583	10
2482	584	5
2483	584	10
2484	585	5
2485	585	10
2486	586	5
2487	586	10
2488	587	5
2489	587	10
2490	588	5
2491	588	10
2492	589	5
2493	589	10
2494	590	5
2495	590	10
2496	591	5
2497	591	10
2498	592	5
2499	592	10
2500	593	5
2501	593	10
2502	594	5
2503	594	10
2504	595	5
2505	595	10
2506	596	5
2507	596	10
2508	597	5
2509	597	10
2510	598	5
2511	598	10
2512	599	5
2513	599	10
2514	600	5
2515	600	10
2516	601	5
2517	601	10
2518	602	5
2519	602	10
2520	603	5
2521	603	10
2522	604	5
2523	604	10
2524	605	5
2525	605	10
2526	606	5
2527	606	10
2528	607	5
2529	607	10
2530	608	5
2531	608	10
2532	609	5
2533	609	10
2534	610	5
2535	610	10
2536	611	5
2537	611	10
2538	612	5
2539	612	10
2540	613	5
2541	613	10
2542	614	5
2543	614	10
2544	615	5
2545	615	10
2546	616	5
2547	616	10
2548	617	5
2549	617	10
2550	618	5
2551	618	10
2552	619	5
2553	619	10
2554	576	5
2555	576	10
2556	620	5
2557	620	10
2558	621	5
2559	621	10
2560	622	5
2561	622	10
2562	623	5
2563	623	10
2564	624	5
2565	624	10
2566	625	5
2567	625	10
2568	626	5
2569	626	10
2570	627	5
2571	627	10
2572	628	5
2573	628	10
2574	629	5
2575	629	10
2576	551	5
2577	551	10
2578	630	5
2579	630	10
2580	631	5
2581	631	10
2582	632	5
2583	632	10
2584	633	5
2585	633	10
2586	634	5
2587	634	10
2588	635	5
2589	635	10
2590	636	5
2591	636	10
2592	637	5
2593	637	10
2594	589	5
2595	589	10
2596	638	5
2597	638	10
2598	639	5
2599	639	10
2600	640	5
2601	640	10
2602	641	5
2603	641	10
2604	586	5
2605	586	10
2717	751	8
2718	752	8
2719	753	8
2720	754	8
2721	755	8
2722	756	8
2723	757	8
2724	758	8
2725	759	8
2726	760	8
2727	761	8
2728	762	8
2729	763	8
2730	764	8
2731	765	8
2732	766	8
2733	767	8
2734	768	8
2735	769	8
2736	770	8
2737	771	8
2738	772	8
2739	773	8
2740	774	8
2741	775	8
2742	776	8
2743	777	8
2744	778	8
2745	779	8
2746	780	8
2747	781	8
2748	782	8
2749	783	8
2750	784	8
2751	785	8
2752	786	8
2753	787	8
2754	788	8
2755	789	8
2756	790	8
2757	751	8
2758	791	8
2759	792	8
2760	793	8
2761	794	8
2762	766	8
2763	795	8
2764	796	8
2765	797	8
2766	798	8
2767	799	8
2768	800	8
2769	801	8
2770	802	8
2771	803	8
2772	767	8
2773	804	8
2774	805	8
2775	806	8
2776	807	8
2777	808	8
2778	809	8
2779	810	8
2780	811	8
2781	812	8
2782	813	8
2783	814	8
2784	815	8
2785	816	8
2786	817	8
2787	818	8
2788	819	8
2789	820	8
2790	821	8
2791	822	8
2792	823	8
2793	824	8
2794	825	8
2795	826	8
2796	827	8
2797	777	8
2798	828	8
2799	829	8
2800	776	8
2801	830	8
2802	831	8
2803	832	8
2804	833	8
2805	834	8
2806	835	8
2807	836	8
2808	837	8
2809	838	8
2810	839	8
2811	840	8
2607	642	7
2608	643	7
2609	644	7
2610	645	7
2611	646	7
2612	647	7
2613	648	7
2614	649	7
2615	650	7
2616	651	7
2617	652	7
2618	653	7
2619	654	7
2620	655	7
2621	656	7
2622	657	7
2623	658	7
2624	659	7
2625	660	7
2626	661	7
2627	662	7
2628	663	7
2629	664	7
2630	665	7
2631	666	7
2632	667	7
2633	668	7
2634	669	7
2635	670	7
2636	671	7
2637	672	7
2638	673	7
2639	674	7
2640	675	7
2641	676	7
2642	677	7
2643	678	7
2644	679	7
2645	680	7
2646	681	7
2647	682	7
2648	683	7
2649	684	7
2650	685	7
2651	686	7
2652	687	7
2653	688	7
2654	689	7
2655	690	7
2656	691	7
2657	692	7
2658	693	7
2659	694	7
2660	695	7
2661	696	7
2662	697	7
2663	698	7
2664	699	7
2665	700	7
2666	701	7
2667	702	7
2668	703	7
2669	704	7
2670	705	7
2671	706	7
2672	707	7
2673	708	7
2674	709	7
2675	710	7
2676	711	7
2677	712	7
2678	713	7
2679	714	7
2680	715	7
2681	716	7
2682	717	7
2683	718	7
2684	719	7
2685	720	7
2686	683	7
2687	721	7
2688	722	7
2689	723	7
2690	724	7
2691	725	7
2692	726	7
2693	727	7
2694	728	7
2695	729	7
2696	730	7
2697	731	7
2698	732	7
2699	733	7
2700	734	7
2701	735	7
2702	736	7
2703	737	7
2704	738	7
2705	739	7
2706	740	7
2707	741	7
2708	742	7
2709	743	7
2710	744	7
2711	745	7
2712	746	7
2713	747	7
2714	748	7
2715	749	7
2812	841	8
2813	842	8
2814	843	8
2815	844	8
2816	845	8
2817	846	8
2818	847	8
2819	848	8
2820	849	8
2821	850	8
2822	851	8
2823	852	8
2824	853	8
2825	854	8
2826	855	8
2827	856	8
2828	857	8
2829	858	8
2830	859	8
2831	860	8
2832	861	8
2833	752	8
2834	862	8
2835	863	8
2836	757	8
2837	864	8
2838	865	8
2839	866	8
2840	867	8
2841	868	8
2842	763	8
2843	766	8
2844	804	8
2845	869	8
2846	777	8
2847	870	8
2848	871	8
2849	872	8
2850	873	8
2851	816	8
2852	874	8
2853	823	8
2854	875	8
2855	876	8
2856	814	8
2857	877	8
2858	878	8
2859	879	8
2860	821	8
2861	880	8
2862	881	8
2863	882	8
2864	883	8
2865	884	8
2866	885	8
2867	886	8
2868	771	8
2869	887	8
2870	888	8
2871	889	8
2872	890	8
2873	759	8
2874	891	8
2875	892	8
2876	893	8
2877	894	8
2878	895	8
2879	896	8
2880	897	8
2881	898	8
2882	899	8
2883	900	8
2884	776	8
2885	901	8
2886	902	8
2887	903	8
2888	904	8
2889	773	8
2890	823	8
2891	766	8
2892	905	8
2893	906	8
2894	907	8
2895	777	8
2896	908	8
2897	909	8
2898	802	8
2899	910	8
2900	911	8
2901	820	8
2902	912	8
2903	913	8
2904	914	8
2905	915	8
2906	763	8
2907	828	8
2908	916	8
2909	917	8
2910	918	8
2911	890	8
2912	919	8
2913	920	8
2914	921	8
2915	922	8
2916	923	8
2918	925	13
2919	926	13
2920	927	13
2921	928	13
2922	929	13
2923	930	13
2924	931	13
2925	932	13
2926	933	13
2927	934	13
2928	935	13
2929	936	13
2930	937	13
2931	938	13
2932	939	13
2933	940	13
2934	941	13
2935	942	13
2936	943	13
2937	944	13
2938	945	13
2939	946	13
2940	947	13
2941	948	13
2942	949	13
2943	950	13
2944	951	13
2945	952	13
2946	953	13
2947	954	13
2948	955	13
2949	956	13
2950	957	13
2951	958	13
2952	959	13
2953	960	13
2954	961	13
2955	962	13
2956	963	13
2957	964	13
2958	965	13
2959	966	13
2960	967	13
2961	968	13
2962	969	13
2963	970	13
2964	971	13
2965	972	13
2966	973	13
2967	974	13
2969	976	14
2970	977	14
2971	978	14
2972	979	14
2973	980	14
2974	981	14
2975	982	14
2976	983	14
2977	984	14
2978	985	14
2979	986	14
2980	987	14
2981	988	14
2982	989	14
2983	990	14
2984	991	14
2985	992	14
2986	993	14
2987	994	14
2988	995	14
2989	996	14
2990	997	14
2991	998	14
2992	999	14
2993	1000	14
2994	1001	14
2995	1002	14
2996	1003	14
2997	1004	14
2998	1005	14
2999	1006	14
3000	1007	14
3001	1008	14
3002	1009	14
3003	1010	14
3004	1011	14
3005	1012	14
3006	1013	14
3007	1014	14
3008	1015	14
3009	1016	14
3010	1017	14
3011	1018	14
3012	976	14
3013	977	14
3014	978	14
3015	979	14
3016	980	14
3017	981	14
3018	982	14
3019	983	14
3020	984	14
3021	985	14
3022	986	14
3023	987	14
3024	988	14
3025	989	14
3026	990	14
3027	1019	14
3028	992	14
3029	1020	14
3030	1021	14
3031	1022	14
3032	1023	14
3033	1024	14
3034	1025	14
3035	1026	14
3036	1027	14
3037	1028	14
3038	1029	14
3039	1030	14
3040	1031	14
3041	1032	14
3042	1003	14
3043	1033	14
3044	1034	14
3045	1035	14
3046	1011	14
3047	980	14
3048	1036	14
3049	1037	14
3050	1038	14
3051	1039	14
3052	1040	14
3053	1041	14
3054	1008	14
3055	1042	14
3056	1043	14
3057	1044	14
3058	1045	14
3059	982	14
3060	1046	14
3061	1047	14
3062	985	14
3063	1048	14
3064	1049	14
3065	1011	14
3066	980	14
3067	1036	14
3068	1037	14
3069	1038	14
3070	1039	14
3071	1040	14
3072	1041	14
3073	1008	14
3074	1050	14
3075	1051	14
3076	1052	14
3077	1053	14
3078	1043	14
3079	1054	14
3080	1055	14
3081	1056	14
3082	1057	14
3083	1058	14
3085	1060	20
3086	1061	20
3087	1062	20
3088	1063	20
3089	1064	20
3090	1065	20
3091	1066	20
3092	1067	20
3093	1068	20
3094	1069	20
3095	1070	20
3096	1071	20
3097	1072	20
3098	1073	20
3099	1074	20
3100	1075	20
3101	1076	20
3102	1077	20
3103	1078	20
3104	1079	20
3105	1080	20
3106	1081	20
3107	1082	20
3108	1083	20
3109	1084	20
3110	1085	20
3111	1086	20
3112	1087	20
3113	1088	20
3114	1089	20
3115	1090	20
3116	1091	20
3117	1092	20
3118	1093	20
3119	1094	20
3120	1095	20
3121	1096	20
3122	1097	20
3123	1098	20
3124	1099	20
3125	1100	20
3126	1101	20
3127	1102	20
3128	1103	20
3129	1104	20
3130	1105	20
3131	1106	20
3132	1107	20
3133	1108	20
3134	1109	20
3135	1110	20
3136	1111	20
3137	1064	20
3138	1112	20
3139	1113	20
3140	1114	20
3141	1115	20
3142	1116	20
3143	1117	20
3144	1118	20
3145	1119	20
3146	1120	20
3147	1121	20
3148	1122	20
3149	1123	20
3150	1124	20
3151	1125	20
3152	1126	20
3153	1127	20
3154	1128	20
3155	1129	20
3156	1130	20
3157	1131	20
3158	1132	20
3159	1133	20
3160	1134	20
3161	1135	20
3162	1136	20
3163	1137	20
3164	1138	20
3165	1139	20
3166	1140	20
3167	1141	20
3168	1142	20
3169	1143	20
3170	1144	20
3171	1145	20
3172	1146	20
3173	1147	20
3174	1148	20
3176	1150	24
3177	1151	24
3178	1152	24
3179	1153	24
3180	1154	24
3181	1155	24
3182	1156	24
3183	1157	24
3184	1158	24
3185	1159	24
3186	1160	24
3187	1161	24
3188	1162	24
3189	1163	24
3190	1164	24
3191	1165	24
3192	1166	24
3193	1167	24
3194	1168	24
3195	1169	24
3196	1152	24
3197	1170	24
3198	1171	24
3199	1172	24
3200	1173	24
3201	1174	24
3202	1175	24
3203	1176	24
3204	1177	24
3205	1178	24
3206	1179	24
3207	1180	24
3208	1181	24
3209	1182	24
3210	1183	24
3211	1184	24
3212	1185	24
3213	1186	24
3214	1187	24
3215	1188	24
3216	1189	24
3217	1190	24
3218	1191	24
3219	1192	24
3220	1193	24
3221	1194	24
3222	1195	24
3223	1196	24
3224	1197	24
3225	1198	24
3226	1199	24
3227	1200	24
3228	1201	24
3229	1202	24
3230	1203	24
3231	1204	24
3232	1205	24
3233	1206	24
3234	1207	24
3235	1208	24
3236	1209	24
3237	1210	24
3238	1211	24
3239	1212	24
3240	1213	24
3241	1214	24
3242	1164	24
3243	1215	24
3244	1216	24
3245	1217	24
3246	1218	24
3247	1219	24
3248	1220	24
3249	1221	24
3250	1222	24
3251	1223	24
3252	1224	24
3253	1225	24
3254	1195	24
3255	1152	24
3256	1226	24
3257	1227	24
3258	1228	24
3259	1229	24
3260	1230	24
3261	1231	24
3262	1232	24
3263	1233	24
3264	1234	24
3265	1235	24
3266	1236	24
3267	1237	24
3268	1238	24
3269	1239	24
3270	1240	24
3271	1241	24
3272	1242	24
3273	1243	24
3274	1244	24
3275	1245	24
3277	1247	25
3278	1247	30
3279	1248	25
3280	1248	30
3281	1249	25
3282	1249	30
3283	1250	25
3284	1250	30
3285	1251	25
3286	1251	30
3287	1252	25
3288	1252	30
3289	1253	25
3290	1253	30
3291	1254	25
3292	1254	30
3293	1255	25
3294	1255	30
3295	1256	25
3296	1256	30
3297	1257	25
3298	1257	30
3299	1258	25
3300	1258	30
3301	1259	25
3302	1259	30
3303	1260	25
3304	1260	30
3305	1261	25
3306	1261	30
3307	1262	25
3308	1262	30
3309	1263	25
3310	1263	30
3311	1264	25
3312	1264	30
3313	1265	25
3314	1265	30
3315	1266	25
3316	1266	30
3317	1267	25
3318	1267	30
3319	1268	25
3320	1268	30
3321	1269	25
3322	1269	30
3323	1270	25
3324	1270	30
3325	1271	25
3326	1271	30
3327	1272	25
3328	1272	30
3329	1273	25
3330	1273	30
3331	1274	25
3332	1274	30
3333	1275	25
3334	1275	30
3335	1276	25
3336	1276	30
3337	1277	25
3338	1277	30
3339	1278	25
3340	1278	30
3341	1279	25
3342	1279	30
3343	1280	25
3344	1280	30
3345	1281	25
3346	1281	30
3347	1282	25
3348	1282	30
3349	1283	25
3350	1283	30
3351	1284	25
3352	1284	30
3353	1285	25
3354	1285	30
3355	1286	25
3356	1286	30
3357	1287	25
3358	1287	30
3359	1288	25
3360	1288	30
3361	1289	25
3362	1289	30
3363	1290	25
3364	1290	30
3365	1291	25
3366	1291	30
3367	1292	25
3368	1292	30
3369	1293	25
3370	1293	30
3371	1294	25
3372	1294	30
3373	1295	25
3374	1295	30
3375	1296	25
3376	1296	30
3377	1297	25
3378	1297	30
3379	1298	25
3380	1298	30
3381	1299	25
3382	1299	30
3383	1300	25
3384	1300	30
3385	1301	25
3386	1301	30
3387	1302	25
3388	1302	30
3389	1303	25
3390	1303	30
3391	1304	25
3392	1304	30
3393	1305	25
3394	1305	30
3395	1277	25
3396	1277	30
3397	1306	25
3398	1306	30
3399	1257	25
3400	1257	30
3401	1307	25
3402	1307	30
3403	1308	25
3404	1308	30
3405	1251	25
3406	1251	30
3407	1309	25
3408	1309	30
3409	1310	25
3410	1310	30
3411	1250	25
3412	1250	30
3413	1247	25
3414	1247	30
3415	1311	25
3416	1311	30
3417	1312	25
3418	1312	30
3419	1313	25
3420	1313	30
3421	1314	25
3422	1314	30
3423	1315	25
3424	1315	30
3425	1316	25
3426	1316	30
3427	1262	25
3428	1262	30
3429	1317	25
3430	1317	30
3431	1318	25
3432	1318	30
3433	1253	25
3434	1253	30
3435	1291	25
3436	1291	30
3437	1319	25
3438	1319	30
3439	1320	25
3440	1320	30
3441	1321	25
3442	1321	30
3443	1322	25
3444	1322	30
3445	1323	25
3446	1323	30
3447	1324	25
3448	1324	30
3449	1285	25
3450	1285	30
3451	1325	25
3452	1325	30
3453	1326	25
3454	1326	30
3455	1327	25
3456	1327	30
3457	1272	25
3458	1272	30
3459	1328	25
3460	1328	30
3461	1329	25
3462	1329	30
3463	1255	25
3464	1255	30
3465	1330	25
3466	1330	30
3467	1331	25
3468	1331	30
3469	1332	25
3470	1332	30
3471	1274	25
3472	1274	30
3473	1333	25
3474	1333	30
3475	1334	25
3476	1334	30
3477	1335	25
3478	1335	30
3480	1337	28
3481	1338	28
3482	1339	28
3483	1340	28
3484	1341	28
3485	1342	28
3486	1343	28
3487	1344	28
3488	1345	28
3489	1346	28
3490	1347	28
3491	1348	28
3492	1349	28
3493	1350	28
3494	1351	28
3495	1352	28
3496	1353	28
3497	1354	28
3498	1355	28
3499	1356	28
3500	1357	28
3501	1358	28
3502	1359	28
3503	1360	28
3504	1361	28
3505	1362	28
3506	1363	28
3507	1364	28
3508	1365	28
3509	1366	28
3510	1367	28
3511	1368	28
3512	1369	28
3513	1370	28
3514	1371	28
3515	1372	28
3516	1373	28
3517	1374	28
3518	1375	28
3519	1376	28
3520	1377	28
3521	1378	28
3522	1379	28
3523	1380	28
3524	1381	28
3525	1382	28
3526	1383	28
3527	1384	28
3528	1385	28
3529	1386	28
3530	1387	28
3531	1388	28
3532	1389	28
3533	1390	28
3534	1391	28
3535	1392	28
3536	1393	28
3537	1394	28
3538	1395	28
3539	1396	28
3540	1397	28
3541	1398	28
3542	1399	28
3543	1400	28
3544	1401	28
3545	1402	28
3546	1403	28
3547	1404	28
3548	1405	28
3549	1406	28
3550	1407	28
3551	1408	28
3552	1409	28
3553	1410	28
3554	1411	28
3555	1412	28
3556	1413	28
3557	1414	28
3558	1415	28
3559	1416	28
3560	1417	28
3561	1418	28
3562	1419	28
3563	1420	28
3564	1421	28
3565	1355	28
3566	1422	28
3567	1423	28
3568	1424	28
3569	1425	28
3570	1426	28
3571	1427	28
3572	1428	28
3573	1429	28
3574	1430	28
3575	1431	28
3576	1432	28
3577	1433	28
3578	1434	28
3579	1435	28
3580	1436	28
3581	1437	28
3582	1438	28
3583	1439	28
3584	1440	28
3585	1441	28
3586	1442	28
3857	1411	29
3858	1338	29
3859	1443	29
3860	1444	29
3861	1445	29
3862	1446	29
3863	1447	29
3864	1448	29
3865	1449	29
3866	1450	29
3867	1451	29
3868	1452	29
3869	1453	29
3870	1454	29
3871	1455	29
3872	1456	29
3873	1457	29
3874	1458	29
3875	1459	29
3876	1460	29
3877	1461	29
3878	1462	29
3879	1463	29
3880	1464	29
3881	1465	29
3882	1466	29
3883	1467	29
3884	1468	29
3885	1469	29
3886	1470	29
3887	1471	29
3888	1472	29
3889	1473	29
3890	1474	29
3891	1475	29
3892	1476	29
3893	1477	29
3894	1478	29
3895	1479	29
3896	1480	29
3897	1394	29
3898	1481	29
3899	1482	29
3900	1483	29
3901	1484	29
3902	1485	29
3903	1486	29
3904	1487	29
3905	1488	29
3906	1489	29
3907	1490	29
3908	1491	29
3909	1492	29
3910	1493	29
3911	1494	29
3912	1495	29
3913	1496	29
3914	1497	29
3915	1498	29
3916	1499	29
3917	1500	29
3918	1501	29
3919	1502	29
3920	1306	29
3921	1503	29
3922	1368	29
3923	1504	29
3924	1505	29
3925	1506	29
3926	1507	29
3927	1508	29
3928	1453	29
3929	1509	29
3930	1510	29
3931	1511	29
3932	1343	29
3933	1512	29
3934	1513	29
3935	1514	29
3936	1515	29
3937	1312	29
3938	1516	29
3939	1517	29
3940	1518	29
3941	1519	29
3942	1520	29
3943	1259	29
3944	1521	29
3945	1522	29
3946	1342	29
3947	1374	29
3948	1257	29
3949	1252	29
3950	1523	29
3951	1524	29
3952	1525	29
3953	1526	29
3954	1527	29
3955	1248	29
3956	1528	29
\.


--
-- Data for Name: quiz; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.quiz (quiz_id, subject, university) FROM stdin;
\.


--
-- Data for Name: quiz_category; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.quiz_category (quizcategory_id, name) FROM stdin;
1	ECAT
2	MDCAT
3	Arts and Humanities
4	Computer Science
5	General Science
6	Commerce
\.


--
-- Data for Name: quiz_question; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.quiz_question (quizquestion_id, correct_answer, difficulty_level, option1, option2, option3, option4, question, quiz_id) FROM stdin;
1	School	1	Classroom	School	Book	Student	Doctor : Hospital :: Teacher : ?	\N
2	Cut	1	Cut	Break	Sharpen	Cook	Pen : Write :: Knife : ?	\N
3	Night	1	Darkness	Night	Clouds	Sky	Sun : Day :: Moon : ?	\N
4	Hive	1	Hive	Garden	Tree	Colony	Bird : Nest :: Bee : ?	\N
5	Ocean	1	Ocean	Liquid	Hydrogen	River	Oxygen : Air :: Water : ?	\N
6	Water	1	Sky	Water	Track	Desert	Car : Road :: Boat : ?	\N
7	Book	1	Pen	Book	Paper	Reader	Artist : Painting :: Writer : ?	\N
8	Artifacts	1	Statues	Paintings	Artifacts	Exhibits	Library : Books :: Museum : ?	\N
9	Light	1	Bulb	Light	Wire	Electricity	Battery : Charge :: Lamp : ?	\N
10	Bird	1	Hatch	Nest	Fry	Bird	Seed : Plant :: Egg : ?	\N
11	Army	1	Battle	Army	War	Gun	Teacher : School :: Soldier : ?	\N
12	Temperature	1	Weather	Temperature	Heat	Mercury	Clock : Time :: Thermometer : ?	\N
13	Cold	1	Melt	Snow	Cold	Water	Fire : Heat :: Ice : ?	\N
14	Fly	1	Run	Jump	Fly	Climb	Legs : Walk :: Wings : ?	\N
15	Hear	1	Hear	Listen	Feel	Speak	Eyes : See :: Ears : ?	\N
16	Sheep	1	Sheep	Cotton	Silk	Fur	Milk : Cow :: Wool : ?	\N
17	Flower	1	Flower	Fruit	Stem	Branch	Leaf : Tree :: Petal : ?	\N
18	Trim	1	Fix	Paint	Break	Trim	Knife : Cut :: Scissors : ?	\N
19	Sweet	1	Spicy	Sour	Bitter	Sweet	Salt : Salty :: Sugar : ?	\N
20	Air	1	Egg	Nest	Air	Feathers	Fish : Water :: Bird : ?	\N
21	Train	1	Compete	Train	Play	Run	Student : Study :: Athlete : ?	\N
22	Listen	1	Listen	Write	Compose	Sing	Book : Read :: Music : ?	\N
23	Frog	1	Lizard	Fish	Turtle	Frog	Caterpillar : Butterfly :: Tadpole : ?	\N
24	Breathe	1	Breathe	Expand	Circulate	Move	Heart : Pump :: Lungs : ?	\N
25	Burn	1	Heat	Smoke	Burn	Explode	Plant : Grow :: Fire : ?	\N
26	Hands	1	Feet	Hands	Fingers	Arms	Helmet : Head :: Gloves : ?	\N
27	Leather	1	Sock	Rubber	Leather	Feet	Shirt : Fabric :: Shoe : ?	\N
28	Decide	1	Argue	Vote	Decide	Rule	Doctor : Treat :: Judge : ?	\N
29	Den	1	Jungle	Cage	Den	Pack	Bee : Hive :: Lion : ?	\N
30	Paint	1	Clean	Paint	Write	Color	Fork : Eat :: Brush : ?	\N
31	Dark	1	Stars	Dark	Sleep	Moon	Sun : Bright :: Night : ?	\N
32	Magnify	1	Glasses	See	Magnify	Image	Mirror : Reflect :: Lens : ?	\N
33	Access	1	Account	Security	Data	Access	Key : Lock :: Password : ?	\N
34	Biologist	1	Biologist	Engineer	Doctor	Scientist	Telescope : Astronomer :: Microscope : ?	\N
35	Glove	1	Bracelet	Ring	Watch	Glove	Foot : Shoe :: Hand : ?	\N
36	Galaxy	1	Galaxy	Sun	Planet	Comet	Tree : Forest :: Star : ?	\N
37	Sleep	1	Lie	Dream	Rest	Sleep	Chair : Sit :: Bed : ?	\N
38	Wood	1	Saw	Hammer	Nail	Wood	Mason : Brick :: Carpenter : ?	\N
39	Classroom	1	Book	Student	Classroom	School	Judge : Courtroom :: Teacher : ?	\N
40	Artist	1	Singer	Sculptor	Painter	Artist	Piano : Musician :: Canvas : ?	\N
41	Sentence	1	Dictionary	Sentence	Book	Page	Letter : Alphabet :: Word : ?	\N
42	Puppy	1	Calf	Puppy	Foal	Cub	Cat : Kitten :: Dog : ?	\N
43	Eat	1	Chew	Bite	Swallow	Eat	Water : Drink :: Food : ?	\N
44	Hot	1	Rainy	Dry	Warm	Hot	Winter : Cold :: Summer : ?	\N
45	Airplane	1	Flight	Airplane	Sky	Cockpit	Captain : Ship :: Pilot : ?	\N
46	Sibling	1	Cousin	Nephew	Uncle	Sibling	Mother : Parent :: Brother : ?	\N
47	Client	1	Court	Judge	Client	Law	Doctor : Patient :: Lawyer : ?	\N
48	Pump	1	Love	Move	Pump	Beat	Brain : Think :: Heart : ?	\N
1247	Control inflation	2	Increase exports	Increase taxation	Control inflation	Reduce government spending	What is the primary goal of monetary policy?	\N
50	The sun helps plants grow	2	Plants do not need sunlight	The sun is cold	The sun helps plants grow	Energy is not important	What is the main idea of the passage: 'The sun provides energy for plants to grow.'?	\N
51	She was sick	2	She was outside	She was happy	She was energetic	She was sick	What does the sentence mean: 'She was feeling under the weather today.'?	\N
52	It might rain	1	He likes umbrellas	He was going to the beach	It was sunny	It might rain	Why did Tom bring an umbrella? 'Tom looked at the dark clouds and grabbed his umbrella.'	\N
53	It was easy	1	It was easy	It was delicious	It was long	It was difficult	What does 'a piece of cake' mean in the sentence: 'The test was a piece of cake'?	\N
54	It was cold	1	It was hot	It was cold	She likes jackets	She was tired	Why did Sarah wear a jacket? 'Sarah shivered as she stepped outside.'	\N
55	Start a conversation	1	Destroy ice	Start a conversation	Be serious	Feel cold	What is the meaning of 'Break the ice' in 'He tried to break the ice by telling a joke'?	\N
56	Go to bed	2	Play a game	Go to bed	Punch a sack	Go outside	What is the meaning of 'Hit the sack' in 'I'm tired; I'm going to hit the sack'?	\N
57	She was happy	1	She was surprised	She was happy	She was sad	She was tired	Why was Lisa smiling? 'Lisa received a letter with good news.'	\N
58	Work late at night	2	Go to bed early	Set fire to oil	Relax	Work late at night	What does 'Burn the midnight oil' mean in 'He burned the midnight oil to finish his project'?	\N
59	He was late	1	He was playing a game	He was angry	He was exercising	He was late	Why did Jake run? 'Jake heard the school bell ring and ran to class.'	\N
60	Reveal a secret	2	Drop beans	Clean the house	Cook food	Reveal a secret	What is the meaning of 'Spill the beans' in 'She accidentally spilled the beans about the surprise party'?	\N
61	Very expensive	1	Very expensive	Very fast	Very cheap	Very old	What does 'cost an arm and a leg' mean in 'That car costs an arm and a leg'?	\N
62	He won something	1	He was tired	He won something	He was bored	He was in trouble	Why was Tom excited? 'Tom saw his name on the winners' list.'	\N
63	Don't be upset about something that can't be changed	1	Don't be upset about something that can't be changed	Be sad	Clean up the mess	Drink milk	What does 'cry over spilled milk' mean in 'Don't cry over spilled milk'?	\N
64	It was a birthday	1	It was a birthday	She wanted to give a gift	She was going shopping	She was moving	Why did Anna bring a gift? 'Anna was invited to a birthday party.'	\N
65	Do something difficult	2	Talk loudly	Do something difficult	Eat something	Run away	What is the meaning of 'Bite the bullet' in 'He had to bite the bullet and finish his work'?	\N
66	It was hungry	1	It was hungry	It was happy	It was playing	It was sleepy	Why did the baby cry? 'The baby was hungry and had not eaten for hours.'	\N
67	Passed away	2	Kicked something	Played soccer	Went on vacation	Passed away	What does 'Kick the bucket' mean in 'The old man finally kicked the bucket'?	\N
68	They won	1	They won	They were tired	They lost	They were practicing	Why did the team celebrate? 'The team won the championship match.'	\N
69	Revealed a secret	2	Lost something	Found a cat	Adopted a pet	Revealed a secret	What does 'Let the cat out of the bag' mean in 'She let the cat out of the bag about the secret'?	\N
70	To pass the exam	1	To go on vacation	To play a game	To pass the exam	To skip class	Why did Mark study hard? 'Mark wanted to pass the exam with good grades.'	\N
71	Find hidden meaning	2	Read faster	Find hidden meaning	Skip reading	Ignore details	What does 'Read between the lines' mean in 'You need to read between the lines to understand the message'?	\N
72	She was late	1	She was bored	She was tired	She was early	She was late	Why was Jane in a hurry? 'Jane was running late for her appointment.'	\N
74	Joyful	1	Joyful	Angry	Sad	Gloomy	What is the synonym of Happy?	\N
75	Cowardly	1	Bold	Fearless	Cowardly	Strong	What is the antonym of Brave?	\N
76	Big	1	Tiny	Small	Big	Narrow	What is the synonym of Large?	\N
77	Late	1	Soon	Late	Prompt	Fast	What is the antonym of Early?	\N
78	Fast	1	Sluggish	Fast	Slow	Dull	What is the synonym of Quick?	\N
79	Stingy	1	Giving	Kind	Stingy	Benevolent	What is the antonym of Generous?	\N
80	Smart	1	Dumb	Smart	Unwise	Foolish	What is the synonym of Intelligent?	\N
81	Strong	1	Timid	Frail	Strong	Meek	What is the antonym of Weak?	\N
82	Peaceful	1	Peaceful	Loud	Noisy	Chaotic	What is the synonym of Calm?	\N
83	Complex	1	Easy	Effortless	Basic	Complex	What is the antonym of Simple?	\N
84	Hard	1	Hard	Simple	Light	Easy	What is the synonym of Difficult?	\N
85	Dull	1	Luminous	Radiant	Dull	Shiny	What is the antonym of Bright?	\N
86	Truthful	1	Liar	Dishonest	Truthful	Deceitful	What is the synonym of Honest?	\N
87	Ugly	1	Pretty	Gorgeous	Ugly	Attractive	What is the antonym of Beautiful?	\N
88	Chilly	1	Warm	Chilly	Fiery	Hot	What is the synonym of Cold?	\N
89	Failure	1	Failure	Achievement	Triumph	Victory	What is the antonym of Success?	\N
90	Swift	1	Lazy	Slow	Swift	Sluggish	What is the synonym of Rapid?	\N
91	Hard	1	Gentle	Fluffy	Smooth	Hard	What is the antonym of Soft?	\N
92	Powerful	1	Powerful	Fragile	Feeble	Weak	What is the synonym of Strong?	\N
93	Narrow	1	Vast	Broad	Expansive	Narrow	What is the antonym of Wide?	\N
94	Kind	1	Greedy	Kind	Selfish	Stingy	What is the synonym of Generous?	\N
95	Quiet	1	Rowdy	Noisy	Deafening	Quiet	What is the antonym of Loud?	\N
96	Idle	1	Hardworking	Diligent	Active	Idle	What is the synonym of Lazy?	\N
97	Shallow	1	Abyss	Immense	Shallow	Profound	What is the antonym of Deep?	\N
98	Risky	1	Harmless	Secure	Risky	Safe	What is the synonym of Dangerous?	\N
99	Pessimistic	1	Positive	Hopeful	Cheerful	Pessimistic	What is the antonym of Optimistic?	\N
100	Messy	1	Organized	Clean	Neat	Messy	What is the antonym of Tidy?	\N
101	Quiet	1	Loud	Noisy	Quiet	Deafening	What is the synonym of Silent?	\N
102	Wealthy	1	Destitute	Penniless	Poor	Wealthy	What is the synonym of Rich?	\N
103	Weak	1	Tough	Powerful	Weak	Mighty	What is the antonym of Strong?	\N
104	Tiredness	1	Strength	Vitality	Energy	Tiredness	What is the synonym of Fatigue?	\N
105	Rare	1	Regular	Common	Often	Rare	What is the antonym of Frequent?	\N
106	Intelligent	1	Unwise	Intelligent	Foolish	Dumb	What is the synonym of Clever?	\N
107	Joy	1	Sadness	Grief	Joy	Despair	What is the antonym of Sorrow?	\N
108	Angry	1	Happy	Mild	Angry	Calm	What is the synonym of Furious?	\N
109	Contract	1	Increase	Stretch	Grow	Contract	What is the antonym of Expand?	\N
110	Sad	1	Cheerful	Sad	Joyful	Bright	What is the synonym of Gloomy?	\N
111	Artificial	1	Real	Artificial	Genuine	Organic	What is the antonym of Natural?	\N
112	Essential	1	Unimportant	Essential	Trivial	Minor	What is the synonym of Vital?	\N
113	Discourage	1	Inspire	Support	Motivate	Discourage	What is the antonym of Encourage?	\N
115	8	1	6	10	8	4	Solve for x: 5x-7=3x+9	\N
116	10	1	8	12	10	6	Solve for x: 2(x+4)=3(x-2)	\N
117	3, 2	1	4, 1	3, 2	5, -1	6, -2	Solve for x: x2-5x+6=0	\N
118	3	1	1	2	3	4	Solve for x: 4x-3=9	\N
119	2, -5	1	3,-4	2,-5	1,-6	4,-3	Solve for x: (x-2)(x+5)=0	\N
120	2, 1/3	1	3, -1	2, 1/3	4, -2	1, 1/2	Solve for x: 3x2-7x+2=0	\N
121	5	1	4	5	6	7	Solve for x: log_3(2x-1)=2	\N
122	1/2	1	1	1/2	2	3	Solve for x: 4x+4-x=5	\N
123	1	1	0	1	2	3	Solve for x: e(x+2)=e3	\N
124	1, 3/5	1	2, 1/5	1, 3/5	4, -3	2, -1	Solve for x: 5x2-8x+3=0	\N
125	-1, 4	1	0, 3	-1, 4	2, -3	5, -2	Solve for x: (x+1)(x-4)=0	\N
126	3, -5/3	1	4, -3	3, -5/3	2, -4	6, -2	Solve for x: |3x-2|=7	\N
127	3	1	2	3	4	5	Solve for x: 2x+1=16	\N
128	5, 4	1	3, 7	5, 4	2, 8	6, 1	Solve for x: x2-9x+20=0	\N
129	2	1	1	2	3	4	Solve for x: x3-8=0	\N
130	6, -2	1	4, -3	6, -2	5, -4	3, -1	Solve for x: x2-4x-12=0	\N
131	3, 4	1	2, 6	3, 4	5, 1	4, -2	Solve for x: x2-7x+12=0	\N
132	8	1	6	8	10	12	Solve for x: log_2(x)+log_2(4)=5	\N
133	3, 2/3	1	4, 1/2	3, 2/3	2, 1/4	5, 1/3	Solve for x: 3x2-11x+6=0	\N
134	5, -3	1	6, -4	5, -3	4, -2	3, -1	Solve for x: x2-2x-15=0	\N
135	3/2, 1	1	2, 1	3/2, 1	4, 2	5, 1	Solve for x: 2x2-5x+3=0	\N
136	-3	1	-2	-3	-4	-5	Solve for x: x2+6x+9=0	\N
137	4	1	3	4	5	7	Solve for x: x+5=x-1	\N
138	5, -2	1	4, -3	5, -2	6, -1	3, -4	Solve for x: x2-3x-10=0	\N
139	123	1	121	123	125	127	Solve for x: log_5(x+2)=3	\N
140	5, -6	1	4, -7	5, -6	6, -5	3, -8	Solve for x: x2+x-30=0	\N
141	(1 ± √16)/3	1	(2 ± √20)/3	(1 ± √16)/3	(3 ± √12)/3	(4 ± √10)/3	Solve for x: 3x2-2x-5=0	\N
142	5/2	1	2	5/2	3	7/2	Solve for x: x-2x+1=3	\N
143	5, 2, -1	1	3, -2, 1	5, 2, -1	4, -3, 2	6, -1, 3	Solve for x: x3-4x2-7x+10=0	\N
144	4, -1	1	5, -2	4, -1	6, -3	3, -4	Solve for x: |2x-3|=5	\N
145	4, -2	1	3, -3	4, -2	5, -1	6, -4	Solve for x: x2-2x-8=0	\N
146	5	1	3	4	5	6	Solve for x: log_4(2x-1)=2	\N
147	4, 1	1	2, 3	4, 1	5, 0	6, -1	Solve for x: x2-5x+4=0	\N
148	3	1	2	3	4	5	Solve for x: e2x=e6	\N
149	-1, 2, 3	1	-2, 1, 3	-1, 2, 3	-3, 2, 1	-1, -2, 3	Solve for x: x3-7x+6=0	\N
150	4	1	3	4	5	6	Solve for x: 2x+1=32	\N
151	7, 3	1	6, 4	7, 3	5, 2	8, 1	Solve for x: x2-10x+21=0	\N
152	9	1	8	20	17	9	Solve for x: log_3(x)+log_3(4)=3	\N
153	3, -7	1	2, -8	3, -7	4, -6	5, -5	Solve for x: x2+4x-21=0	\N
154	10, -2	1	11, -3	10, -2	9, -1	8, 0	Solve for x: |x-4|=6	\N
156	PKR 90,000,000	3	PKR 85,000,000	PKR 88,000,000	PKR 90,000,000	PKR 95,000,000	A cricket stadium in Karachi sells 45,000 tickets for a PSL final at an average price of PKR 2,500 per ticket. If 8% of the total revenue is spent on stadium maintenance, how much is spent on maintenance?	\N
157	PKR 360,000	2	PKR 300,000	PKR 360,000	PKR 400,000	PKR 420,000	A textile factory in Faisalabad produces 1,200 meters of fabric daily. If 40% of it is exported and the rest is sold locally at PKR 500 per meter, what is the daily local revenue?	\N
158	PKR 50,400,000	1	PKR 45,000,000	PKR 50,400,000	PKR 55,200,000	PKR 60,000,000	A farmer in Punjab grows wheat on 30 acres of land. If the yield per acre is 2,400 kg and the market rate is PKR 70 per kg, what is the total revenue from selling the entire crop?	\N
159	5.75 hours	2	5.5 hours	5.75 hours	6 hours	6.25 hours	A bus travels from Lahore to Islamabad, a distance of 380 km, at an average speed of 80 km/h. If it makes three 15-minute stops along the way, how long does the total journey take?	\N
160	PKR 500,000	3	PKR 400,000	PKR 500,000	PKR 600,000	PKR 700,000	A software company in Karachi earns PKR 5 million per month. If operational expenses consume 40% of earnings, salaries take 30%, and 20% is reinvested in new projects, how much profit remains?	\N
161	PKR 126,600	2	PKR 124,000	PKR 126,600	PKR 128,500	PKR 130,200	A customer in Lahore purchases a mobile phone priced at PKR 120,000. After applying a 12% GST and a 5% discount, how much does the customer pay?	\N
162	PKR 112,500	3	PKR 100,000	PKR 110,000	PKR 112,500	PKR 120,000	A family in Islamabad spends 35% of their monthly income on rent, 25% on groceries, and 15% on utilities. If their monthly income is PKR 450,000, how much remains after these expenses?	\N
163	PKR 237,620	2	PKR 230,000	PKR 235,000	PKR 237,620	PKR 240,000	A bank in Pakistan offers a savings account with a 9% annual compound interest rate. If Ayesha deposits PKR 200,000, what will be her total amount after 2 years?	\N
164	PKR 9.76 million	1	PKR 9.5 million	PKR 9.76 million	PKR 10 million	PKR 10.5 million	A real estate developer in Lahore buys a plot for PKR 8 million and sells it at a 22% profit. What is the selling price?	\N
165	PKR 3.1875 billion	3	PKR 3 billion	PKR 3.1875 billion	PKR 3.25 billion	PKR 3.5 billion	A university in Karachi enrolls 15,000 students. If the tuition fee per student is PKR 250,000 per year and 15% of students receive a 50% scholarship, what is the total tuition revenue?	\N
166	PKR 6,789,000	2	PKR 6,750,000	PKR 6,789,000	PKR 6,825,000	PKR 6,900,000	A textile exporter in Pakistan ships 3,500 meters of fabric to Dubai at a cost of PKR 1,750 per meter. The shipping cost per meter is PKR 150, and an import duty of 8% is charged on the total shipment value. What is the total cost including the duty?	\N
167	PKR 175.5 million	2	PKR 170 million	PKR 172.5 million	PKR 175.5 million	PKR 180 million	A company in Lahore has 5 product lines. Each product line contributes 22%, 18%, 27%, 15%, and 18% to total revenue, which is PKR 650 million annually. What is the contribution of the largest product line?	\N
168	PKR 21 billion	1	PKR 18.5 billion	PKR 19.6 billion	PKR 21 billion	PKR 22.3 billion	A construction company is building a 42-story skyscraper in Karachi. If the construction cost per square foot is PKR 7,500 and the total area covered is 2.8 million square feet, what is the total construction cost?	\N
169	PKR 30.36 million	1	PKR 29.75 million	PKR 30.36 million	PKR 31.50 million	PKR 32 million	A farmer in Sindh cultivates mangoes on a 120-acre farm. The average yield per acre is 2.3 tons, and the market price per ton is PKR 125,000. If transportation and packaging costs reduce total revenue by 12%, what is the farmer’s final earning?	\N
170	PKR 14,009,600	2	PKR 13,800,000	PKR 14,009,600	PKR 14,250,000	PKR 14,500,000	A business owner in Islamabad takes a loan of PKR 10 million at an annual interest rate of 14% compounded yearly. How much will he owe after 3 years?	\N
199	4	1	2	3	5	4	The mode of the data set {1, 2, 2, 3, 4, 4, 4, 5, 6} is:	\N
200	20	1	10	15	20	25	The range of the data set {5, 10, 15, 20, 25} is:	\N
171	PKR 12.26 million	2	PKR 11.95 million	PKR 12.10 million	PKR 12.26 million	PKR 12.50 million	A high-end car dealership in Karachi sells imported SUVs with a 25% profit margin on the purchase price. If an SUV is bought for PKR 9.2 million, what is its selling price after adding a 7% luxury tax?	\N
172	19.4% faster	2	17.5% faster	18.2% faster	19.4% faster	20.1% faster	An airline in Pakistan operates a direct flight from Lahore to Dubai, covering 1,880 km in 3.5 hours. If strong headwinds slow the flight by 15% for the first half of the journey, how much faster must the second half be flown to reach on time?	\N
173	PKR 660,000	3	PKR 580,000	PKR 600,000	PKR 660,000	PKR 700,000	A restaurant in Karachi spends 28% of its revenue on ingredients, 25% on salaries, 18% on rent, and the remaining on miscellaneous expenses. If the restaurant generates PKR 7.5 million monthly, how much is left after all expenses?	\N
174	PKR 210 million	2	PKR 205 million	PKR 208 million	PKR 210 million	PKR 212 million	A real estate firm in Lahore buys a commercial property for PKR 150 million and renovates it for 12% of the purchase price. If the firm sells it at a 25% profit on total investment, what is the final selling price?	\N
175	PKR 2,432,678	3	PKR 2,400,000	PKR 2,432,678	PKR 2,450,000	PKR 2,500,000	A university in Pakistan increases tuition fees by 8% annually. If the current tuition fee is PKR 520,000 per year, what will be the total fee for a four-year degree, assuming a yearly increase?	\N
176	PKR 798,000	3	PKR 765,000	PKR 780,000	PKR 798,000	PKR 810,000	A Pakistani freelancer charges USD 25 per hour for software development. If the exchange rate is PKR 280 per USD and he works 120 hours in a month, what is his total earning in PKR after a 5% tax deduction?	\N
177	PKR 10 million	2	PKR 8.5 million	PKR 9.3 million	PKR 10 million	PKR 10.8 million	A cement factory in Pakistan produces 2,400 tons of cement per day. If each ton sells for PKR 8,750 and operational costs are PKR 11 million daily, what is the daily profit of the factory?	\N
178	PKR 48,600	2	PKR 49,500	PKR 48,600	PKR 47,500	PKR 50,000	A car rental service in Islamabad charges PKR 4,500 per day for a luxury car. If a customer rents it for 12 days and gets a 10% discount for renting more than 10 days, what is the total cost?	\N
179	PKR 57,037,500	1	PKR 56,800,000	PKR 57,037,500	PKR 58,200,000	PKR 59,000,000	A mobile phone retailer in Karachi imports 500 smartphones at USD 350 each. If the exchange rate is PKR 285 per USD, and the import tax is 15% of the total cost, what is the total amount paid in PKR?	\N
180	PKR 61.88 million	2	PKR 60.75 million	PKR 61.88 million	PKR 62.50 million	PKR 63.00 million	A real estate investor buys land in Lahore for PKR 35 million. If the land appreciates at an annual rate of 12% compounded yearly, what will be its value after 5 years?	\N
181	PKR 2 million	3	PKR 1.8 million	PKR 2 million	PKR 2.2 million	PKR 2.4 million	A Pakistani university offers a scholarship covering 60% of tuition fees. If the full fee is PKR 1,250,000 per year, how much does a scholarship student pay over a 4-year degree?	\N
182	PKR 138,552	2	PKR 135,000	PKR 136,800	PKR 138,552	PKR 140,000	A businessman in Lahore sells imported watches with a 35% profit margin. If he buys a watch for PKR 92,000, what is its selling price after adding a 12% luxury tax?	\N
183	PKR 220,172	2	PKR 210,500	PKR 215,750	PKR 220,172	PKR 225,600	A Pakistani airline increases ticket prices by 7% annually. If a ticket from Karachi to London costs PKR 180,000 today, what will it cost after 3 years?	\N
184	PKR 2,280	2	PKR 2,280	PKR 2,340	PKR 2,400	PKR 2,500	A grocery store in Islamabad offers a “Buy 3, Get 1 Free” deal on imported chocolates. If each chocolate costs PKR 380, how much does a customer pay for 8 chocolates?	\N
185	PKR 495 million	1	PKR 480 million	PKR 490 million	PKR 495 million	PKR 500 million	A steel manufacturer in Pakistan produces 18,000 metric tons of steel monthly. If production costs PKR 92,500 per ton and the company sells steel at PKR 120,000 per ton, what is the monthly profit?	\N
186	PKR 28 million	2	PKR 25 million	PKR 26 million	PKR 28 million	PKR 29 million	A Pakistani cricketer signs a sponsorship deal of PKR 140 million for 3 years. If he gets 40% upfront and the rest in equal annual payments, how much does he receive per year for the remaining years?	\N
187	PKR 102,750	2	PKR 100,000	PKR 102,750	PKR 105,000	PKR 107,500	A student in Karachi gets a discount of 25% on a laptop priced at PKR 125,000. If he also pays 8% sales tax on the discounted price, what is the final amount he pays?	\N
188	PKR 46.5 million	1	PKR 44 million	PKR 45.6 million	PKR 46.5 million	PKR 47 million	A farmer in Punjab grows wheat on a 300-acre farm, yielding 2.5 tons per acre. If wheat sells for PKR 62,000 per ton, what is the total revenue?	\N
189	PKR 9.36 billion	2	PKR 9.10 billion	PKR 9.25 billion	PKR 9.36 billion	PKR 9.50 billion	A shopping mall in Lahore has 120 stores. If the average monthly rent per store is PKR 650,000, what is the total annual rental income of the mall?	\N
190	PKR 108 million	3	PKR 102 million	PKR 105 million	PKR 108 million	PKR 110 million	A telecom company in Pakistan introduces a 10 GB internet package for PKR 450 per month. If 240,000 customers subscribe, what is the total monthly revenue?	\N
191	PKR 54 million	2	PKR 50 million	PKR 52.5 million	PKR 55 million	PKR 54 million	A textile factory in Faisalabad produces 15,000 shirts per month. If production costs PKR 900 per shirt and they sell at PKR 1,500 each, how much profit does the factory make in 6 months?	\N
192	PKR 5,605	2	PKR 5,600	PKR 5,605	PKR 5,610	PKR 5,650	A student in Lahore buys books for PKR 4,500 and stationery for PKR 2,200. If he gets a 10% discount on books and 15% on stationery, what is the final amount he pays?	\N
193	PKR 10.03 billion	2	PKR 9.85 billion	PKR 10.03 billion	PKR 10.20 billion	PKR 10.50 billion	A company in Karachi is constructing a high-rise building. The estimated budget is PKR 8.5 billion, but due to rising material costs, the actual cost increased by 18%. What is the final construction cost?	\N
194	PKR 1.69 million	1	PKR 1.62 million	PKR 1.65 million	PKR 1.69 million	PKR 1.72 million	A student in Islamabad takes a 4-year education loan of PKR 1.2 million at a 9% annual interest rate, compounded yearly. How much does he owe after 4 years?	\N
195	PKR 3.75 million	2	PKR 3.5 million	PKR 3.75 million	PKR 4 million	PKR 4.2 million	A Pakistani startup raises PKR 15 million in funding. If they allocate 40% for marketing, 35% for operations, and the remaining for research, how much is left for research?	\N
197	6	1	5	7	9	6	The mean of the data set {2, 4, 6, 8, 10} is:	\N
198	9	1	7	9	12	15	The median of the data set {3, 7, 9, 12, 15} is:	\N
201	60	1	50	55	60	65	If the mean of five numbers is 12, what is the sum of the numbers?	\N
202	1/3	2	1/6	1/2	2/3	1/3	A fair six-sided die is rolled. What is the probability of rolling a number greater than 4?	\N
203	5/15	2	4/15	5/15	6/15	7/15	A box contains 4 red, 5 blue, and 6 green balls. What is the probability of randomly drawing a blue ball?	\N
204	85	1	80	85	90	95	A student scores 65, 70, 80, and 75 in four tests. What score must he get in the fifth test to have an average of 75?	\N
205	4	1	3	4	5	6	The variance of the data set {2, 4, 4, 6, 8} is:	\N
206	3/4	2	1/4	1/2	3/4	1	If a coin is flipped twice, what is the probability of getting at least one heads?	\N
207	14.29	1	13.5	14.29	14.75	15	The mean of a set of 8 numbers is 15. If one number, 20, is removed, what is the new mean?	\N
208	12	1	10	11	12	16	The median of the data set {5, 7, 9, x, 15, 20, 25} is 12. What is the value of x?	\N
209	7	1	3	5	7	9	The mode of the data set {2, 3, 3, 5, 5, 7, 7, 7, 9, 9} is:	\N
210	2.83	1	2	2.5	2.83	3	The standard deviation of {2, 4, 6, 8, 10} is:	\N
211	1/13	2	1/26	1/13	1/10	1/9	The probability of drawing an ace from a standard deck of 52 cards is:	\N
212	1/6	1	1/6	1/5	1/4	1/3	A fair die is rolled twice. What is the probability that the sum of the two numbers is at least 10?	\N
213	67.5	2	65	66	67.5	68	A class has 60 students, and their average score is 70. If the top 10 students with an average score of 85 are removed, what is the new class average?	\N
214	0.24	1	0.2	0.24	0.28	0.3	If P(A) = 0.6 and P(B) = 0.4, and A and B are independent, what is P(A |and B)?	\N
215	12	1	10	12	14	16	The interquartile range (IQR) of the data set {12, 15, 18, 22, 25, 30, 35} is:	\N
216	0.1587	3	0.1	0.1587	0.2	0.25	A factory produces light bulbs with a mean lifespan of 800 hours and a standard deviation of 60 hours. What is the probability that a randomly selected bulb lasts more than 860 hours (assuming a normal distribution)?	\N
217	4	1	2	4	8	16	A set of numbers has a variance of 16. What is the standard deviation?	\N
218	7/13	2	5/13	6/13	7/13	8/13	The probability of drawing a red card or a face card from a standard deck of 52 cards is:	\N
219	68%	3	50%	68%	75%	95%	In a normal distribution, approximately what percentage of values lie within one standard deviation of the mean?	\N
220	36	1	35	36	38	40	The mean of five numbers is 40. One of the numbers is changed from 50 to 30. What is the new mean?	\N
221	0.35	1	0.25	0.5	0.45	0.35	If P(A) = 0.7 and P(B|A) = 0.5, what is P(A |and B)?	\N
222	It is symmetric	2	It is skewed right	It is skewed left	It is symmetric	It has no mode	The mean and median of a dataset are equal. What does this suggest about the distribution?	\N
223	2	1	1	2	3	4	A data set has a mean of 50 and a standard deviation of 5. What is the z-score of a value 60?	\N
224	95%	3	68%	80%	90%	95%	In a normal distribution, approximately what percentage of values lie within two standard deviations of the mean?	\N
225	2/57	1	1/21	2/57	3/28	4/35	A box contains 5 red, 7 blue, and 8 green balls. If two balls are drawn at random, what is the probability that both are red?	\N
226	The value below which 75% of the data lies	1	The highest value in the dataset	The mean value	The value below which 75% of the data lies	The most frequent value	The 75th percentile of a dataset represents:	\N
227	1/8	2	1/6	1/8	1/4	1/12	The probability of flipping three heads in a row with a fair coin is:	\N
228	0.8171	2	0.7312	0.7896	0.8171	0.8524	A company produces pens with a defect rate of 2%. If 10 pens are selected randomly, what is the probability that none are defective?	\N
229	2.83	1	2.5	2.83	3	3.25	The standard deviation of {10, 12, 14, 16, 18} is	\N
230	Strong negative correlation	2	No correlation	Weak positive correlation	Strong negative correlation	Strong positive correlation	The correlation coefficient between two variables is -0.9. What does this imply?	\N
231	4/663	3	2/221	4/663	6/715	8/833	The probability of drawing an ace and a king consecutively without replacement from a deck of 52 cards is:	\N
232	18.75	1	15	18.75	20	22.5	The variance of {3, 6, 9, 12, 15} is:	\N
233	5/16	2	1/8	3/16	5/16	7/16	A coin is tossed 5 times. What is the probability of getting exactly 3 heads?	\N
234	It shifts to the right	3	It becomes wider	It shifts to the right	It becomes skewed	It remains unchanged	If the mean of a dataset increases while the standard deviation remains constant, what happens to the shape of the distribution?	\N
235	1/6	2	1/8	1/7	1/6	1/9	The probability of rolling two fair dice and getting a sum of 7 is:	\N
236	68%	2	50%	60%	68%	75%	A dataset is normally distributed with a mean of 500 and a standard deviation of 100. What percentage of data lies between 400 and 600?	\N
238	27	1	25	32	27	30	If f(x) = 2x² - 3x + 5, what is f(4)?	\N
239	12	1	12	8	15	10	Solve for x: 3x - 7 = 2x + 5	\N
240	4	1	7	4	6	5	If g(x) = x² - 4x + 7, what is g(3)?	\N
241	15	1	18	10	15	12	The sum of two numbers is 24, and their difference is 6. What is the larger number?	\N
242	-12	1	-12	-6	12	6	Solve for x: 2(x - 3) = 3(x + 2)	\N
243	x = 2, 3	1	x = 1, 6	x = 3, 4	x = 2, 4	x = 2, 3	Find the roots of the equation x² - 5x + 6 = 0	\N
244	3	1	1	4	2	3	If h(x) = 4x - 7, find h⁻¹(5)	\N
245	11	1	10	11	9	12	If f(x) = 3x + 4 and g(x) = 2x - 1, what is (f ∘ g)(2)?	\N
246	32	1	64	16	32	25	Solve for x: log₂(x) = 5	\N
247	4	1	5	4	3	6	If f(x) = 5x - 2 and f(a) = 18, find a	\N
248	3	1	4	3	2	5	Solve for x: 2^(x+1) = 16	\N
249	2, -3	1	3, -2	2, -3	2, 3	1, -3	If (x - 2)(x + 3) = 0, what are the possible values of x?	\N
250	x ≠ 4	1	x ≥ 4	x > 4	x < 4	x ≠ 4	Find the domain of f(x) = 1/(x - 4)	\N
251	3, -3	1	3, -3	4, -4	5, -5	2, -2	Solve for x: x² - 9 = 0	\N
252	-2	1	8	-6	-2	-10	If f(x) = x³ - 4x + 2, find f(-2)	\N
419	1/e	2	∞	1/e	1	e	Find the radius of convergence of the series sum(n!x^n)/n^n.	\N
253	f⁻¹(x) = 2x + 3	1	f⁻¹(x) = x/2 + 3	f⁻¹(x) = 2x - 3	f⁻¹(x) = x/2 - 3	f⁻¹(x) = 2x + 3	Find the inverse of f(x) = (x - 3)/2	\N
254	2	1	5	4	3	2	If f(x) = 2x² - 3x and f(2) = k, find k	\N
255	3	1	2	3	4	5	Solve for x: 3x + 2 = 5x - 4	\N
256	2	1	4	2	1	3	Find the slope of the line passing through (2, 5) and (4, 9)	\N
257	-6	1	-3	-6	-4	-5	If f(x) = 2x² + 5x - 3, find f(-1)	\N
258	3/2, -3/2	1	2/3, -2/3	3/2, -3/2	4, -4	3, -3	Solve for x: 4x² - 9 = 0	\N
259	(4,0)	1	(4,0)	(3,0)	(0,4)	(0,3)	Find the x-intercept of the line 3x + 4y = 12	\N
260	6, -1	1	5, -3	6, -1	4, -2	3, -4	Solve for x: |2x - 5| = 7	\N
261	y ≥ -3	1	y < -3	y > -3	y ≤ -3	y ≥ -3	Find the range of f(x) = x² - 3	\N
262	5x + 1	1	6x - 9	4x + 3	5x + 1	5x - 2	If f(x) = 3x - 4 and g(x) = 2x + 5, find (f + g)(x)	\N
263	2	1	4	2	3	-2	Solve for x: x³ - 8 = 0	\N
264	{1, 4}	1	{2, 4}	{2, 3}	{1, 4}	{1, 3}	Find the solution set of x² - 5x + 4 = 0	\N
265	2	1	4	2	3	5	If g(x) = √(x - 1), find g(5)	\N
266	(0, -7)	1	(0, -7)	(0, 7)	(0, 2)	(0, -2)	Find the y-intercept of y = 2x - 7	\N
267	3	1	2	3	4	5	If log₃(27) = x, find x	\N
268	(3, -4)	1	(3, -4)	(4, -3)	(3, 4)	(-3, 4)	Find the vertex of f(x) = (x - 3)² - 4	\N
269	y ≤ 4	1	y < 4	y ≤ 4	y ≥ 4	y > 4	Find the range of f(x) = -x² + 4	\N
270	4, -2	1	3, -3	2, -4	4, -2	5, -1	Solve for x: x² - 2x - 8 = 0	\N
271	x > 2	1	x > 2	x < 2	x ≤ 2	x ≥ 2	Find the domain of f(x) = log(x - 2)	\N
272	y = 3x - 1	1	y = 3x + 2	y = 3x + 1	y = 3x - 1	y = 3x - 3	Find the equation of a line with slope 3 passing through (2, 5)	\N
273	-2	1	2	-2	3	-1	Find the determinant of the matrix [[2, 3], [4, 5]]	\N
275	$38.25	1	$42.75	$40.50	$38.25	$36.00	A store sells a shirt for $45. If there is a 15% discount, what is the final price?	\N
276	29	1	27	29	25	31	If x = 5 and y = 3, what is the value of 2x² - 3y?	\N
277	10 hours	1	10 hours	11 hours	9 hours	8 hours	A car travels 240 miles in 4 hours. If it continues at the same speed, how long will it take to travel 600 miles?	\N
278	$1,000	1	$1,000	$980	$1,050	$950	The price of a laptop increased by 20% to $1,200. What was the original price?	\N
279	8 cm	1	12 cm	6 cm	8 cm	10 cm	A rectangle has a length 3 times its width. If its perimeter is 64 cm, what is the width?	\N
280	$600	1	$650	$700	$720	$600	John invested $5,000 in a bank that gives a 6% annual interest rate. How much interest will he earn in 2 years?	\N
281	6	1	6	8	5	7	If 3x - 7 = 11, what is the value of x?	\N
282	20%	1	15%	20%	25%	18%	A sum of money doubles in 5 years at simple interest. What is the annual rate of interest?	\N
283	270	1	270	280	290	250	A school has 600 students. If 55% are boys, how many girls are there?	\N
284	40	1	36	38	42	40	The ratio of two numbers is 3:5. If their sum is 64, what is the larger number?	\N
285	247.5 km	1	255 km	250 km	245 km	247.5 km	A train is moving at a speed of 90 km/h. How far will it travel in 2 hours 45 minutes?	\N
286	15 days	2	15 days	14 days	12 days	18 days	If 12 workers can complete a task in 10 days, how long will it take 8 workers to do the same task?	\N
287	50	1	50	48	55	45	The average of five numbers is 42. If one number is removed, the average becomes 40. What is the removed number?	\N
288	24	1	24	22	30	26	If 3/4 of a number is 18, what is the number?	\N
289	12%	1	15%	14%	12%	10%	A trader marks up the price of an item by 40% and then gives a discount of 20%. What is the effective profit percentage?	\N
290	420	2	400	440	420	460	What is the sum of the first 20 positive even numbers?	\N
291	60,500	3	61,000	55,000	62,000	60,500	If the population of a town increases by 10% annually, what will be its population after 2 years if the current population is 50,000?	\N
292	7.2 days	1	7.2 days	6.5 days	8 days	9 days	A can complete a task in 12 days, and B can complete the same task in 18 days. How long will it take if they work together?	\N
293	$2,000	1	$1,800	$1,500	$1,700	$2,000	A man spends 30% of his salary on rent, 20% on food, and 10% on transport. If his salary is $5,000, how much does he save?	\N
294	87.6	1	86.8	89.4	87.6	88.2	A student scores 85, 78, 92, 88, and 95 in five subjects. What is the average score?	\N
295	8 cm	1	6 cm	10 cm	12 cm	8 cm	If a cube has a volume of 512 cm³, what is the length of one side?	\N
296	45 km/h	1	45 km/h	40 km/h	55 km/h	50 km/h	A train 120 meters long crosses a bridge of length 180 meters in 24 seconds. What is its speed in km/h?	\N
297	$3,472.88	2	$3,472.88	$3,490	$3,500	$3,450	A sum of $3,000 is compounded annually at a rate of 5% per annum. What will be the amount after 3 years?	\N
298	10.3 liters	1	10 liters	9.6 liters	10.3 liters	8.7 liters	A mixture contains milk and water in the ratio 7:3. If there are 24 liters of milk, how much water is there?	\N
299	3	1	4	2	5	3	If 5a - 3b = 7 and 2a + b = 4, what is the value of a?	\N
300	0.3	1	0.3	0.25	0.4	0.35	A bag contains 8 red, 6 blue, and 4 green balls. What is the probability of picking a blue ball?	\N
301	133.3	2	133.3	140	125	120	A student got 80 marks in an exam where 40% of the marks were deducted. What were the total marks before deduction?	\N
302	30 hours	1	32 hours	35 hours	28 hours	30 hours	A tank is filled in 12 hours by a pipe and emptied in 20 hours by another pipe. How long will it take to fill the tank when both pipes are open?	\N
303	8% increase	2	6% increase	10% increase	5% increase	8% increase	A rectangle's length is increased by 20% and width is decreased by 10%. What is the percentage change in its area?	\N
304	$6,690	1	$6,690	$6,900	$6,700	$6,800	A sum becomes $8,100 in 2 years at compound interest at 10% per annum. What was the principal amount?	\N
305	84 cm²	1	72 cm²	84 cm²	90 cm²	80 cm²	A triangle has sides 7 cm, 24 cm, and 25 cm. What is its area?	\N
676	21	1	19	21	25	23	What is the next number in the sequence? 1, 3, 6, 10, 15, ?	\N
306	56	1	56	65	50	60	A box contains coins of 25 cents, 50 cents, and $1 in the ratio 3:5:7. If the total amount is $120, how many $1 coins are there?	\N
307	32	1	64	16	32	25	If log_2(x) = 5, what is the value of x?	\N
308	33	1	29	31	33	35	The sum of three consecutive odd numbers is 99. What is the middle number?	\N
309	$6,000	1	$6,500	$5,000	$6,000	$5,400	A man spends 40% of his salary and saves the rest. If his savings are $3,600, what is his salary?	\N
311	Right triangle	1	Isosceles triangle	Equilateral triangle	Scalene triangle	Right triangle	A triangle has sides of lengths 5 cm, 12 cm, and 13 cm. What type of triangle is this?	\N
312	720°	2	540°	360°	900°	720°	What is the sum of the interior angles of a hexagon?	\N
313	7 cm	2	10 cm	3.5 cm	7 cm	14 cm	If the area of a circle is 49pi square cm, what is the radius?	\N
314	64 cm³	1	64 cm³	48 cm³	32 cm³	16 cm³	What is the volume of a cube with a side length of 4 cm?	\N
315	10 cm	1	10 cm	14 cm	12 cm	15 cm	A right triangle has legs of lengths 6 cm and 8 cm. What is the length of the hypotenuse?	\N
316	15 cm	2	10 cm	15 cm	18 cm	14 cm	What is the length of the diagonal of a rectangle with length 9 cm and width 12 cm?	\N
317	6 cm	1	6 cm	10 cm	8 cm	4 cm	The perimeter of a square is 24 cm. What is the length of one side?	\N
318	45pi cm³	2	45pi cm³	30pi cm³	75pi cm³	60pi cm³	What is the volume of a cylinder with a radius of 3 cm and a height of 5 cm?	\N
319	Corresponding angles	2	Alternate exterior angles	Supplementary angles	Corresponding angles	Interior angles	If two parallel lines are cut by a transversal, which angles are always equal?	\N
320	65°	1	65°	75°	85°	55°	A triangle has angles measuring 40° and 75°. What is the measure of the third angle?	\N
321	16 cm	2	16 cm	10 cm	12 cm	8 cm	If the circumference of a circle is 16pi cm, what is the diameter?	\N
322	50 cm²	2	60 cm²	40 cm²	50 cm²	70 cm²	What is the area of a trapezoid with bases of 8 cm and 12 cm, and a height of 5 cm?	\N
323	55°	2	55°	50°	45°	65°	In a right triangle, one acute angle measures 35°. What is the measure of the other acute angle?	\N
324	144pi cm²	2	288pi cm²	256pi cm²	144pi cm²	324pi cm²	What is the surface area of a sphere with radius 6 cm?	\N
325	70°	3	120°	70°	90°	110°	If a parallelogram has one angle measuring 70°, what is the measure of the opposite angle?	\N
326	540°	1	720°	600°	360°	540°	A regular pentagon has a side length of 5 cm. What is the sum of its interior angles?	\N
327	5pi cm	2	10pi cm	20pi cm	15pi cm	5pi cm	What is the length of an arc with a central angle of 90° in a circle of radius 10 cm?	\N
328	Square	3	Both are equal	Rectangle	Square	Cannot determine	If a square and a rectangle have equal perimeters but different side lengths, which has the larger area?	\N
329	20	2	20	24	16	12	What is the number of diagonals in an octagon?	\N
330	6 cm	1	8 cm	6 cm	10 cm	4 cm	If a sphere has a volume of 288pi cm³, what is its radius?	\N
331	38	2	35	40	38	45	In a parallelogram, two adjacent angles measure (3x + 10)° and (2x - 20)°. Find x.	\N
332	27pi cm²	2	81pi cm²	36pi cm²	27pi cm²	54pi cm²	A sector of a circle has a central angle of 120° and a radius of 9 cm. What is its area?	\N
333	60°	2	90°	60°	45°	120°	Find the measure of an exterior angle of a regular hexagon.	\N
334	360°	2	540°	180°	720°	360°	The sum of the exterior angles of any polygon is always:	\N
335	30 cm	1	32 cm	28 cm	30 cm	35 cm	A quadrilateral has sides of length 6 cm, 7 cm, 8 cm, and 9 cm. What is its perimeter?	\N
336	Scalene	2	Equilateral	Right	Isosceles	Scalene	If a triangle has sides of 3 cm, 4 cm, and 6 cm, what type of triangle is it?	\N
337	5√3 cm	3	10√3 cm	7√3 cm	15√3 cm	5√3 cm	What is the height of an equilateral triangle with side length 10 cm?	\N
338	22 cm	2	28 cm	25 cm	21 cm	22 cm	Find the perimeter of a semicircle with a diameter of 14 cm.	\N
339	180°	2	160°	180°	220°	200°	A quadrilateral has two opposite angles measuring 80° and 100°. What is the sum of the other two angles?	\N
341	7	1	7	6	8	5	If 3x - 5 = 16, what is the value of x?	\N
342	4	1	4	5	3	6	Solve for x: 2(x + 3) = 14.	\N
343	180 degrees	1	270 degrees	360 degrees	90 degrees	180 degrees	The sum of the angles in a triangle is always:	\N
344	49pi	2	49pi	28pi	21pi	14pi	What is the area of a circle with a radius of 7?	\N
345	+-3	1	9	-3	+-3	3	Solve for x: x² - 9 = 0.	\N
346	2	1	3	5	2	6	Find the slope of the line passing through (2,3) and (5,9).	\N
347	7	1	8	7	9	5	If f(x) = 2x + 1, find f(3).	\N
348	50 mph	1	45 mph	55 mph	60 mph	50 mph	A car travels 150 miles in 3 hours. What is its average speed?	\N
349	6x + 5	1	3x + 5	6x + 7	6x + 5	6x - 5	What is the derivative of f(x) = 3x² + 5x - 7?	\N
350	10	1	10	12	14	16	If a right triangle has legs of length 6 and 8, what is the hypotenuse?	\N
351	32	1	25	64	32	16	Solve for x: log_2(x) = 5.	\N
352	1/4	2	1/3	1/4	1/8	1/2	The probability of flipping a fair coin and getting heads twice in a row is:	\N
353	-2	2	0	-2	1	3	What is the determinant of the matrix [[2,3],[4,5]]?	\N
354	6x⁵y³	1	6x⁶y²	5x⁶y²	5x⁵y³	6x⁵y³	Simplify: (2x³y²)(3x²y).	\N
355	3	1	5	4	2	3	Find the value of x if 4^(x+1) = 64.	\N
356	1275	1	5050	1000	2550	1275	The sum of the first 50 natural numbers is:	\N
357	x⁴ - x² + C	1	x⁴ + 2x² + C	2x⁴ - x² + C	x⁴ - x² + C	4x⁴ - 2x² + C	Find the integral of Integral(4x³ - 2x) dx.	\N
358	4/5	1	4/5	5/3	2/5	3/4	If sintheta = 3/5, find costheta.	\N
359	2 and 3	1	2 and 3	1 and 6	1 and 5	3 and 4	The roots of x² - 5x + 6 = 0 are:	\N
360	1.5	1	2.5	2	1.5	3	Solve for x: 5^(2x) = 125.	\N
361	20	1	25	20	18	22	What is the median of the data set {12, 15, 18, 20, 22, 25, 30}?	\N
362	y = -3x + 14	1	y = -2x + 8	y = -3x + 14	y = 3x - 14	y = -3x + 12	Find the equation of a line with slope -3 passing through (4,2).	\N
363	5/13	1	13/5	13/12	12/13	5/13	If tantheta = 5/12, find sintheta.	\N
364	5050	1	5100	5050	4950	5000	What is the sum of the first 100 positive integers?	\N
365	The spread of data	2	The sum of data	The mode of data	The spread of data	The mean of data	The standard deviation of a data set measures:	\N
366	2	1	2	1	4	3	If 5x - 2y = 10 and 2x + y = 3, solve for x.	\N
367	(x - 7)/3	1	3x - 7	(x - 7)/3	x/3 + 7	(x + 7)/3	Find the inverse of the function f(x) = 3x + 7.	\N
368	x > 6	2	x > 5	x > 4	x > 6	x > 3	What is the solution to the inequality 2x - 4 > 8?	\N
369	540 degrees	2	360 degrees	900 degrees	720 degrees	540 degrees	Find the sum of the interior angles of a pentagon.	\N
370	8	1	6	7	8	10	Solve for x: 4x - 7 = 2x + 9.	\N
371	4	1	4	3	2	5	If f(x) = x² - 4x + 7, find f(3).	\N
372	-2	1	1	0	-2	2	Find the determinant of the matrix [[1,2],[3,4]].	\N
373	3	1	3	2	4	5	Solve for x: 2^(x+1) = 16.	\N
374	+-3	1	3	-3	+-2	+-3	Find the x-intercepts of y = x² - 9.	\N
375	540 degrees	1	720 degrees	360 degrees	540 degrees	900 degrees	The sum of the angles in a pentagon is:	\N
376	x³ + x² + C	1	x³ + 2x² + C	3x³/3 + 2x²/2 + C	2x³ + x² + C	x³ + x² + C	Evaluate the integral Integral(3x² + 2x)dx.	\N
377	1/2	1	0	√3/2	1	1/2	Find the value of sin 30°.	\N
378	(x-3)² + (y+2)² = 16	2	(x-3)² + (y-2)² = 16	(x-3)² + (y+2)² = 16	(x+3)² + (y+2)² = 16	(x+3)² + (y-2)² = 16	Find the equation of a circle with center (3,-2) and radius 4.	\N
379	3x + 5	1	x/3 - 5	3x + 5	(x + 5)/3	(x - 5)/3	Find the inverse of f(x) = (x - 5)/3.	\N
380	x²/25 + y²/9 = 1	3	x²/16 + y²/4 = 1	x²/25 + y²/9 = 1	x²/9 + y²/25 = 1	x²/36 + y²/16 = 1	What is the equation of an ellipse centered at (0,0) with a major axis of 10 and minor axis of 6?	\N
381	cos(x) - sin(x)	1	sin(x) + cos(x)	cos(x) + sin(x)	cos(x) - sin(x)	-sin(x) - cos(x)	Find the derivative of f(x) = sin(x) + cos(x).	\N
382	ln(7)/2	1	ln(7)/2	7/2	2ln(7)	ln(7)	Solve for x: e^(2x) = 7.	\N
383	81	1	64	81	9	27	If log_3(x) = 4, what is x?	\N
384	(2,-5)	1	(1,5)	(2,3)	(2,-5)	(1,-3)	Find the vertex of y = 2x² - 8x + 3.	\N
385	36pi	1	81pi	4pi	27pi	36pi	Find the volume of a sphere with radius 3.	\N
386	110	2	120	100	130	110	Find the sum of an arithmetic series with first term 2, last term 20, and 10 terms.	\N
387	5	1	5	2	6	3	Find the sum of the roots of x² - 5x + 6 = 0.	\N
388	x ≠ 3	1	x ≥ 3	All real numbers	x < 3	x ≠ 3	Find the domain of f(x) = 1/(x-3).	\N
389	[0, ∞)	1	(-∞, 0]	(-∞, ∞)	[2, ∞)	[0, ∞)	Find the range of f(x) = (x - 2)^1/2.	\N
390	6x - 8	1	6x - 8	6x + 4	3x² - 8x + 5	2x - 4	Find the second derivative of f(x) = x³ - 4x² + 5x - 2.	\N
391	5	1	1	5	10	0	Find the amplitude of y = 5sin(x).	\N
392	pi	1	4pi	pi/2	pi	2pi	Find the period of y = sin(2x).	\N
393	1/2	1	√3/2	0	1/2	√2/2	Find the exact value of cos(pi/3).	\N
394	x²/25 + y²/9 = 1	2	x²/25 + y²/16 = 1	x²/25 + y²/9 = 1	x²/16 + y²/25 = 1	x²/9 + y²/25 = 1	Find the equation of an ellipse with foci at (+-4,0) and vertices at (+-5,0).	\N
395	pi/6, 5pi/6	1	pi/4, 3pi/4	pi/2, 3pi/2	pi/3, 2pi/3	pi/6, 5pi/6	Solve for x: sin(x) = 1/2 in [0, 2pi].	\N
396	(+-√7,0)	1	(0,+-√7)	(+-√7,0)	(+-4,0)	(0,+-3)	Find the foci of the ellipse x²/16 + y²/9 = 1.	\N
397	(3,-2)	1	(3,2)	(3,-2)	(-3,-2)	(-3,2)	Find the center of the ellipse (x-3)²/9 + (y+2)²/4 = 1.	\N
398	x²/25 - y²/9 = 1	2	x²/25 - y²/9 = 1	y²/25 - x²/9 = 1	x²/16 - y²/25 = 1	x²/9 - y²/25 = 1	Find the equation of a hyperbola with vertices (+-5,0) and asymptotes y = +-(3/5)x.	\N
399	2pi/3	1	5pi/6	pi/4	pi/3	2pi/3	Convert 120° to radians.	\N
400	7/25	1	16/25	12/25	7/25	9/25	Find cos(2theta) if sin(theta) = 3/5.	\N
401	3/5	2	3/5	5/4	4/5	3/4	Find the eccentricity of the ellipse x²/25 + y²/16 = 1.	\N
402	(+-5,0)	1	(+-5,0)	(0,+-4)	(0,+-5)	(+-√25,0)	Find the foci of the hyperbola x²/9 - y²/16 = 1.	\N
403	pi/3, 5pi/3	1	pi/6, 11pi/6	pi/2, 3pi/2	pi/3, 5pi/3	pi/4, 7pi/4	Solve for x: cos²(x) - sin²(x) = 1/2.	\N
404	-1	1	√3	1	0	-1	Find the exact value of tan(3pi/4).	\N
405	3	1	1	3	0	∞	Evaluate the limit: lim (x->0) (sin(3x)/x).	\N
406	2e^(2x) + 1/x	1	e^(2x) + 1/x	2e^(2x) + 1/x	e^(2x) - 1/x	2e^x + ln(x)	Find the derivative of f(x) = e^(2x) + ln(x).	\N
407	x³/3 + 3x²/2 - 5x + C	1	x³/2 + 3x² - 5x + C	x³/3 + 3x²/2 - 5x + C	x²/3 + x - 5 + C	x² + 3x - 5 + C	Find the integral of Integral(x² + 3x - 5)dx.	\N
408	32	2	12	16	8	32	If A is a 3x3 matrix with determinant 4, what is the determinant of 2A?	\N
409	3	1	1	4	3	2	Solve for x: ln(x) + ln(x-2) = ln(3).	\N
410	1 + x + x²/2 + x³/6	1	1 + x + x²/4 + x³/6	1 + x + x²/2 + x³/6	1 + x²/2 + x³/6	1 + x + x²/3 + x³/2	Find the Maclaurin series expansion of e^x up to the x³ term.	\N
411	3,2	1	0,3	2,3	3,2	1,2	Find the eigenvalues of the matrix [[3,1],[0,2]].	\N
412	11/36	2	11/36	1/6	25/36	5/6	What is the probability of getting at least one 6 in two rolls of a fair die?	\N
413	4/3	1	2	4/3	1	3	Solve for x: 2^(3x) = 16.	\N
414	8pi/5	2	32pi/5	4pi/3	8pi/5	16pi/3	Find the volume of a solid obtained by rotating y = x² around the x-axis from x=0 to x=2.	\N
415	tan(x) + C	1	cos(x) + C	tan(x) + C	sin(x) + C	sec(x) + C	Evaluate Integral(sec²x)dx.	\N
416	x - x²/2	1	x - x²/2	x - x³/3	x + x²/2	x + x³/3	Find the Taylor series of ln(1+x) centered at x=0 up to x².	\N
417	2	1	0	1	2	3	Find the rank of the matrix [[1,2,3],[4,5,6],[7,8,9]].	\N
418	y = (C₁ + C_2x)e^(2x)	1	y = C₁e^x + C_2e^(2x)	y = (C₁ + C_2)e^(-2x)	y = (C₁ + C_2x)e^(2x)	y = e^(2x)	Solve: d²y/dx² - 4(dy/dx) + 4y = 0.	\N
420	sin(2t)/2	1	sin(2t)	e^(-2t)	sin(2t)/2	cos(2t)	Find the inverse Laplace transform of F(s) = 1/(s² + 4).	\N
421	ln(√2 + 1)	1	1	ln(√2 + 1)	√2	pi/2	Find the arc length of y = ln(sec(x)) from x = 0 to x = pi/4.	\N
422	0.5	2	0.5	0.16	0.84	0.68	If X is a normal random variable with mean 3 and variance 9, what is P(X <= 3)?	\N
423	∑ (2(-1)^n / n) sin(nx)	1	∑ (4/n) sin(nx)	∑ (2/n²) sin(nx)	∑ (2/n) cos(nx)	∑ (2(-1)^n / n) sin(nx)	Find the Fourier series of f(x) = x on [-pi, pi].	\N
424	2x + 2y + 2z	1	x + y + z	2x + 2y + 2z	2(x + y + z)	3(x + y + z)	Find the divergence of F = (x², y², z²).	\N
425	6	1	0	2	4	6	Find the Laplacian of phi = x² + y² + z².	\N
426	1/10	3	1/10	1/5	2/5	2/3	Find the probability of selecting 3 defective items from a batch of 10 if 4 are defective.	\N
427	-x cos x + sin x + C	1	cos x + x sin x + C	-x cos x + sin x + C	x cos x - sin x + C	x cos x + sin x + C	Evaluate Integral(x sin x)dx.	\N
428	pi	1	2pi	pi	pi/2	pi/4	Find the area enclosed by one loop of the curve r = 2 cos(theta).	\N
429	8pi	1	32pi	4pi	8pi	16pi	Find the volume of the region bounded by z = 4 - x² - y² and z = 0.	\N
430	3	1	1	3	2	0	Find the divergence of the vector field F = (x, y, z).	\N
431	ln(3 + √8)	1	ln(3 + √8)	ln(3 + √7)	ln(4 + √7)	ln(2 + √3)	Solve for x: cosh(x) = 3.	\N
432	(x - 1)² + (y - 1)² = 5/4	2	(x - 1)² + (y - 1)² = 5/4	(x - 1)² + (y - 1)² = 2	(x - 1)² + (y - 1)² = 1/2	(x - 1)² + (y - 1)² = 3/2	Find the equation of the osculating circle at (1,1) for y = x².	\N
433	9	1	13	9	7	11	If f(x) = 3x² - 4x + 5, what is f(2)?	\N
434	6	1	8	7	5	6	Solve for x: 2x + 5 = 17	\N
435	32	1	25	32	16	64	If log_2(x) = 5, what is x?	\N
436	15x² - 4x + 1	1	15x² - 4x + 1	10x² - 4x	15x² + 2x	5x² - 4	Find the derivative of f(x) = 5x³ - 2x² + x	\N
437	0	1	6	9	3	0	If a function g(x) is defined as g(x) = x² - 6x + 9, find g(3)	\N
438	0.7	2	0.6	0.8	0.5	0.7	The probability of an event happening is 0.3. What is the probability of it not happening?	\N
439	60 cm^2	2	70 cm^2	40 cm^2	60 cm^2	50 cm^2	Find the area of a triangle with base 10 cm and height 12 cm	\N
440	17	1	8	9	12	17	Solve for x: 3(x - 4) = 2x + 5	\N
441	1275	1	1375	1325	1275	1225	What is the sum of the first 50 natural numbers?	\N
442	4	1	6	8	4	3	If x³ = 64, what is x?	\N
443	0.5	1	0.5	0.8	0.7	0.6	Find the value of sin(30°)	\N
444	1	1	5	7	1	3	What is the remainder when 1234 is divided by 9?	\N
445	2	1	3	4	1	2	If 4^x = 16, what is x?	\N
446	6 cm	1	10 cm	6 cm	4 cm	8 cm	The length of a rectangle is twice its width. If the perimeter is 36 cm, find the width.	\N
447	15	1	21	9	23	15	Find the median of the data set: {3, 7, 9, 15, 21, 23, 25}	\N
448	-2	2	-4	-2	4	2	What is the determinant of the matrix [[2, 3], [4, 5]]?	\N
449	3/5	1	3/4	4/5	3/5	5/6	If tantheta = 3/4, find sintheta	\N
450	1/6	2	1/6	1/12	1/10	1/8	What is the probability of getting a sum of 7 when rolling two dice?	\N
451	+-2	1	+-4	+-2	+-5	+-3	Solve for x: 5x² - 20 = 0	\N
452	5	1	5	4	6	7	Find the distance between points (3, 4) and (6, 8)	\N
453	5 cm	1	6 cm	5 cm	4 cm	7 cm	If a circle has an area of 78.5 cm^2, what is its radius? (Use pi ≈ 3.14)	\N
454	7	1	8	7	6	5	Solve for x: 3x + 2 = 4x - 5	\N
455	5.16	1	6.32	4.25	3.89	5.16	Find the standard deviation of {4, 8, 12, 16}	\N
456	(x + 7)/2	1	(x + 7)/2	(x - 7)/2	2x + 7	(x + 5)/2	If a function h(x) is defined as h(x) = 2x - 7, what is h^-1(x)?	\N
457	0.5	1	0.8	0.5	0.7	0.6	Find the value of cos(60°)	\N
458	4x - 1	1	4x - 1	4x + 1	3x - 1	2x - 1	If f(x) = 2x² - x + 3, what is f'(x)?	\N
459	y = 4x - 5	1	y = 3x + 4	y = 5x - 2	y = 4x + 3	y = 4x - 5	Find the equation of the line passing through (2,3) with slope 4	\N
460	2, 3	1	2, 3	1, 2	2, 4	1, 3	Solve for x: x² - 5x + 6 = 0	\N
461	81	1	16	64	81	27	If log_3(x) = 4, find x	\N
462	100pi cm³	1	120pi cm³	160pi cm³	150pi cm³	100pi cm³	The height of a cone is 12 cm, and the radius is 5 cm. Find its volume.	\N
463	7	1	8	6	5	7	Find the sum of the roots of x² - 7x + 12 = 0	\N
464	1/2	2	2/3	1/3	1/4	1/2	If a die is rolled, what is the probability of getting a prime number?	\N
465	[[-2, 1], [1.5, -0.5]]	1	[[-2, 1], [1.5, -0.5]]	[[3, -2], [-4, 1]]	[[4, -3], [2, -1]]	[[2, -1], [-3, 4]]	Find the inverse of the matrix [[1, 2], [3, 4]]	\N
466	2	1	1.5	2	3	2.5	Find the sum of 1 + 1/2 + 1/4 + 1/8 + ... to infinity	\N
467	5040	1	4030	6050	5040	3020	Find the value of 7! (7 factorial)	\N
469	20.4 m	1	30.6 m	10.2 m	40.8 m	20.4 m	A ball is thrown vertically upward with an initial velocity of 20 m/s. What is its maximum height? (g = 9.8 m/s²)	\N
470	250 J	1	250 J	125 J	100 J	500 J	A 5 kg object is moving with a velocity of 10 m/s. What is its kinetic energy?	\N
471	Ohm	1	Volt	Watt	Ohm	Farad	What is the unit of electrical resistance?	\N
472	5 m/s²	1	20 m/s²	5 m/s²	10 m/s²	2 m/s²	A force of 10 N is applied to a 2 kg object. What is its acceleration?	\N
473	4.33 s	1	8.67 s	6.12 s	3.25 s	4.33 s	A projectile is launched at an angle of 45° with an initial velocity of 30 m/s. What is its time of flight? (g = 9.8 m/s²)	\N
474	10 J	3	10 J	20 J	5 J	2 J	A 2 C charge moves through a potential difference of 5 V. How much work is done?	\N
475	0.02 s	1	0.5 s	2 s	0.02 s	0.05 s	What is the period of a wave with a frequency of 50 Hz?	\N
476	2 m	1	2 m	1 m	0.5 m	4 m	If a sound wave travels at 340 m/s and has a frequency of 170 Hz, what is its wavelength?	\N
477	20 W	1	10 W	20 W	5 W	25 W	What is the power dissipated by a 5 Ohm resistor with a current of 2 A?	\N
478	4 m/s²	1	10 m/s²	5 m/s²	4 m/s²	2 m/s²	A car accelerates from rest to 20 m/s in 5 seconds. What is its acceleration?	\N
479	5 m/s²	1	20 m/s²	2 m/s²	10 m/s²	5 m/s²	A box of mass 10 kg is pushed with a force of 50 N. What is its acceleration? (Ignore friction)	\N
480	5 Ohm	1	10 Ohm	2 Ohm	20 Ohm	5 Ohm	What is the equivalent resistance of two 10 Ohm resistors in parallel?	\N
481	100 Hz	1	200 Hz	50 Hz	100 Hz	150 Hz	A wave has a speed of 300 m/s and a wavelength of 3 m. What is its frequency?	\N
482	490 J	1	50 J	980 J	98 J	490 J	What is the potential energy of a 5 kg object lifted 10 m above the ground? (g = 9.8 m/s²)	\N
483	40%	1	50%	30%	40%	60%	A heat engine absorbs 500 J of heat and does 200 J of work. What is its efficiency?	\N
484	1.26 s	1	3.14 s	2.51 s	1.26 s	0.89 s	A 2 kg mass is attached to a spring with a constant of 50 N/m. What is the period of oscillation?	\N
485	8.34 × 10?¹¹ N	1	1.67× 10?¹¹ N	6.67 × 10?¹¹ N	8.34 × 10?¹¹ N	3.34 × 10?¹¹ N	What is the magnitude of the gravitational force between two 5 kg masses separated by 2 m?(G = 6.67 × 10?¹¹ N·m²/kg²)	\N
486	31.42 rad/s	1	31.42 rad/s	15.71 rad/s	62.84 rad/s	94.26 rad/s	What is the angular velocity of a wheel rotating at 300 RPM?	\N
487	240 V	1	240 V	120 V	60 V	300 V	A transformer has a primary coil with 100 turns and a secondary coil with 200 turns. If the input voltage is 120 V, what is the output voltage?	\N
488	6 m/s²	1	6 m/s²	10 m/s²	5 m/s²	15 m/s²	A car traveling at 30 m/s comes to a stop in 5 seconds. What is its deceleration?	\N
489	100 J	1	10 J	50 J	200 J	100 J	What is the work done when a force of 20 N moves an object 5 m in the direction of the force?	\N
490	11.2 km/s	1	7.8 km/s	9.8 km/s	15.4 km/s	11.2 km/s	What is the escape velocity from Earth? (Mass of Earth = 5.97 x 10^24 kg, Radius of Earth = 6.37 x 10^6 m, G = 6.67 x 10^-11 N·m²/kg²)	\N
491	pi/4 rad/s	1	pi/2 rad/s	pi rad/s	2pi rad/s	pi/4 rad/s	An object moving in a circular path has an angular displacement of pi/2 radians in 2 seconds. What is its angular velocity?	\N
492	Newton	1	Joule	Watt	Newton	Pascal	What is the SI unit of force?	\N
493	Speed	2	Speed	Acceleration	Force	Velocity	Which of the following is a scalar quantity?	\N
494	9.8 m/s²	1	10.2 m/s²	8.9 m/s²	9.8 m/s²	7.5 m/s²	What is the acceleration due to gravity on Earth?	\N
495	Law of Inertia	1	Law of Inertia	Law of Motion	Law of Action-Reaction	Law of Acceleration	What is the first law of motion stated by Newton?	\N
496	Gravity	3	Gravity	Electric	Magnetic	Friction	If an object is in free fall, what force is acting on it?	\N
497	Sound waves	2	Gamma rays	Sound waves	X-rays	Light waves	Which of the following waves require a medium to travel?	\N
498	Watt	1	Joule	Pascal	Watt	Newton	What is the unit of power?	\N
499	1/2 mv²	1	mv	mgh	F = ma	1/2 mv²	What is the formula for kinetic energy?	\N
500	Length and cross-sectional area	2	Only length	Length and cross-sectional area	Only cross-sectional area	Material and volume	The resistance of a wire depends on which factor?	\N
501	V = IR	1	F = ma	KE = 1/2 mv²	V = IR	P = IV	What is Ohm's law?	\N
502	Concave	2	Cylindrical	Convex	Concave	Biconvex	What type of lens is used to correct myopia?	\N
503	Coulomb	1	Newton	Watt	Coulomb	Ohm	What is the unit of electric charge?	\N
504	Elastic potential energy	3	Elastic potential energy	Chemical energy	Kinetic energy	Thermal energy	The energy stored in a stretched or compressed spring is called?	\N
505	Violet	2	Violet	Green	Red	Yellow	Which color of light has the shortest wavelength?	\N
506	Strong nuclear force	3	Strong nuclear force	Gravitational force	Weak nuclear force	Electromagnetic force	Which fundamental force is responsible for holding atomic nuclei together?	\N
507	50 Hz	1	25 Hz	10 Hz	100 Hz	50 Hz	What is the frequency of a wave if its period is 0.02 seconds?	\N
508	It is less than water	2	It is twice the waters density	It is less than water	It is greater than water	It is equal to water	If an object floats on water, what can be said about its density?	\N
509	A virtual, upright, and reduced image	2	A virtual, upright, and reduced image	A real, upright, and magnified image	A real, inverted, and magnified image	A virtual, inverted, and reduced image	What does a convex mirror always produce?	\N
510	Transverse	2	Longitudinal	Transverse	Electromagnetic and longitudinal	Mechanical	What type of wave is light?	\N
511	Halves	2	Halves	Doubles	Remains the same	Becomes zero	What happens to the pressure of a gas if its volume is doubled while keeping the temperature constant?	\N
512	Solid	2	Gas	Solid	Vacuum	Liquid	The speed of sound is highest in which medium?	\N
513	Solar	3	Nuclear fuel	Coal	Solar	Natural gas	Which of the following is a renewable energy source?	\N
514	J.J. Thomson	2	Rutherford	Bohr	J.J. Thomson	Einstein	Which scientist is credited with discovering the electron?	\N
515	20 m/s	1	20 m/s	5 m/s	25 m/s	10 m/s	If a car travels 100 meters in 5 seconds, what is its speed?	\N
516	11.2 km/s	1	9.8 km/s	7.6 km/s	11.2 km/s	15.3 km/s	What is the escape velocity from Earth's surface?	\N
517	To change voltage levels	1	To measure current	To store electrical energy	To generate electricity	To change voltage levels	What is the purpose of a transformer?	\N
518	2 ohms	1	1 ohm	4 ohms	2 ohms	8 ohms	What is the equivalent resistance of two 4-ohm resistors connected in parallel?	\N
519	Gamma rays	3	X-rays	Infrared rays	Ultraviolet rays	Gamma rays	Which type of radiation has the highest energy?	\N
520	Mass and distance from axis	2	Only distance	Mass and distance from axis	Only mass	Shape only	The moment of inertia depends on which factors?	\N
521	Amplitude	2	Frequency	Wavelength	Speed	Amplitude	Which property of a wave determines its loudness?	\N
522	3.0 x 10^8 m/s	1	1.5 x 10^8 m/s	9.8 x 10^8 m/s	3.0 x 10^8 m/s	6.2 x 10^7 m/s	What is the speed of light in a vacuum?	\N
523	To store charge	1	To increase current	To store charge	To decrease resistance	To convert energy	What is the function of a capacitor?	\N
524	Inverse	1	No relation	Inverse	Direct	Exponential	What is the relationship between pressure and volume in Boyle's Law?	\N
525	Static	2	Rolling	Static	Sliding	Kinetic	Which type of friction acts on an object at rest?	\N
526	Concave	2	Convex	Plane	Concave	Parabolic	Which type of mirror is used in headlights of cars?	\N
527	Mercury	2	Gold	Iron	Lead	Mercury	Which element is used in thermometers?	\N
528	Joule	1	Newton	Watt	Joule	Pascal	What is the SI unit of work?	\N
529	Parallel	2	Series	Parallel	Open	Short	What type of circuit allows current to flow through multiple paths?	\N
530	Neutron	2	Proton	Neutron	Photon	Electron	Which subatomic particle is neutral?	\N
531	10 m/s²	1	15 m/s²	5 m/s²	20 m/s²	10 m/s²	A block of mass 5 kg is pushed with a force of 50 N on a frictionless surface. What is its acceleration?	\N
532	10 s	1	20 s	10 s	5 s	15 s	A projectile is fired at an angle of 45° with an initial velocity of 100 m/s. What is the time of flight? (Assume g = 10 m/s²)	\N
533	490 J	1	245 J	490 J	980 J	500 J	What is the work done in lifting a 10 kg object to a height of 5 meters? (g = 9.8 m/s²)	\N
534	4 m/s²	1	10 m/s²	5 m/s²	4 m/s²	8 m/s²	A car accelerates uniformly from 20 m/s to 40 m/s in 5 seconds. What is its acceleration?	\N
535	Quadruples	3	Doubles	Triples	Remains the same	Quadruples	If the momentum of an object is doubled, what happens to its kinetic energy?	\N
536	2.4 s	1	2.4 s	3.0 s	4.8 s	1.2 s	A simple pendulum has a length of 1.44 m. What is its period of oscillation? (g = 9.8 m/s²)	\N
537	20 m/s	1	10 m/s	15 m/s	20 m/s	25 m/s	A force of 100 N is applied to a 20 kg object for 4 seconds. What is the final velocity?	\N
538	100 W	1	200 W	250 W	100 W	50 W	What is the power output of a machine that does 500 J of work in 5 seconds?	\N
539	40%	1	50%	40%	60%	30%	A Carnot engine operates between 500 K and 300 K. What is its maximum efficiency?	\N
540	40 cm behind the lens	2	20 cm behind the lens	40 cm behind the lens	60 cm behind the lens	80 cm behind the lens	A convex lens has a focal length of 20 cm. If an object is placed 40 cm from the lens, where is the image formed?	\N
541	Halves	2	Halves	Doubles	Remains the same	Quadruples	An electron moves in a circular path in a magnetic field. If the field strength doubles, what happens to the radius of the path?	\N
542	340 m/s	1	340 m/s	400 m/s	600 m/s	500 m/s	A sound wave has a frequency of 500 Hz and a wavelength of 0.68 m. What is the speed of sound?	\N
543	100 V	1	50 V	100 V	400 V	200 V	A transformer has a primary voltage of 200 V and a turns ratio of 2:1. What is the secondary voltage?	\N
544	90 min	1	90 min	150 min	60 min	120 min	A satellite orbits Earth at a height where the acceleration due to gravity is 4.9 m/s². What is its orbital period?	\N
545	387 nm	1	387 nm	700 nm	250 nm	500 nm	A photon has an energy of 3.2 eV. What is its wavelength? (h = 6.626 x 10^-34 J·s, c = 3 x 10^8 m/s, 1 eV = 1.6 x 10^-19 J)	\N
546	400 kJ	1	400 kJ	600 kJ	800 kJ	200 kJ	A gas expands at constant pressure of 2 x 10^5 Pa from 1 m³ to 3 m³. What is the work done?	\N
547	12.50%	2	25%	12.50%	6.25%	50%	If the half-life of a radioactive substance is 10 hours, how much remains after 30 hours?	\N
548	16 Ohm	1	2 Ohm	4 Ohm	16 Ohm	8 Ohm	A wire of length 2 m and resistance 4 Ohm is stretched to double its length. What is the new resistance?	\N
549	1 m/s	1	1.5 m/s	2 m/s	1 m/s	0.5 m/s	An object is moving in SHM with amplitude 0.5 m and angular frequency 2 rad/s. What is its maximum speed?	\N
551	Azimuthal quantum number	2	Spin quantum number	Magnetic quantum number	Principal quantum number	Azimuthal quantum number	Which quantum number determines the shape of an orbital?	\N
552	2	1	4	3	1	2	What is the pH of a 0.01 M HCl solution?	\N
553	Ionic bond	1	Covalent bond	Hydrogen bond	Ionic bond	Metallic bond	Which type of bond is present in NaCl?	\N
554	7	1	5	7	2	3	What is the oxidation state of Mn in KMnO4?	\N
555	PV = nRT	1	V/T = constant	PV = nRT	PV = constant	P1V1 = P2V2	What is the general gas equation?	\N
556	Fluorine	1	Chlorine	Oxygen	Fluorine	Nitrogen	Which element has the highest electronegativity?	\N
557	Linear	1	Linear	Tetrahedral	Bent	Trigonal planar	What is the molecular geometry of CO2?	\N
558	Acetic acid	1	Lactic acid	Formic acid	Citric acid	Acetic acid	Which acid is present in vinegar?	\N
559	Salt and water	2	Carbon dioxide and water	Oxygen and hydrogen	Alcohol and ester	Salt and water	What is the main product of the reaction between an acid and a base?	\N
560	Helium	2	Neon	Nitrogen	Oxygen	Helium	Which gas is commonly used in balloons due to its low density?	\N
561	Dalton's Law	3	Avogadro's Law	Charles' Law	Dalton's Law	Boyle's Law	Which law states that the total pressure of a gas mixture is equal to the sum of the partial pressures of its components?	\N
562	Iron	2	Sulfur	Sodium	Iron	Aluminum	Which of the following elements is a transition metal?	\N
563	Distillation	2	Distillation	Filtration	Sublimation	Crystallization	Which process is used to separate components of a mixture based on boiling points?	\N
564	Ethanol	1	Ethanol	Methanol	Propanol	Butanol	What is the IUPAC name of CH3CH2OH?	\N
565	Geometrical isomerism	1	Conformational isomerism	Optical isomerism	Geometrical isomerism	Structural isomerism	Which type of isomerism is exhibited by but-2-ene and but-1-ene?	\N
566	6	2	2	6	8	4	What is the coordination number of Na+ in NaCl?	\N
567	Silver	2	Copper	Gold	Aluminum	Silver	Which metal is the best conductor of electricity?	\N
568	CO2 and H2O	3	C and H2	CO2 and H2O	CO2 and O2	CO and H2O	What is the product of the complete combustion of methane?	\N
569	Pauli Exclusion Principle	3	Pauli Exclusion Principle	Hund's Rule	Heisenberg's Uncertainty Principle	Aufbau Principle	Which principle states that no two electrons in an atom can have the same set of four quantum numbers?	\N
570	CaO	1	CaO	CaCO3	Ca(OH)2	CaCl2	What is the chemical formula of quicklime?	\N
571	HCl	2	HF	CH3COOH	H2CO3	HCl	Which of the following is an example of a strong acid?	\N
572	Aluminum	1	Aluminum	Zinc	Copper	Iron	Which metal is extracted from bauxite ore?	\N
573	Hydrogen	2	Carbon dioxide	Hydrogen	Oxygen	Nitrogen	Which gas is evolved when an acid reacts with a metal?	\N
574	Trigonal pyramidal	1	Trigonal pyramidal	Linear	Bent	Tetrahedral	What is the shape of an ammonia (NH3) molecule?	\N
575	#NAME?	1	#NAME?	#NAME?	0	#NAME?	Which functional group is present in alcohols?	\N
576	6	2	2	0	6	4	What is the oxidation state of sulfur in H2SO4?	\N
577	Sublimation	2	Evaporation	Fusion	Condensation	Sublimation	What is the name of the process by which a solid directly converts into a gas?	\N
578	Teflon	2	Teflon	Nylon	Polyethylene	Polypropylene	Which polymer is used to make non-stick cookware?	\N
579	Boiling point elevation	2	Viscosity	Boiling point elevation	Refractive index	Density	Which of the following is a colligative property?	\N
580	Covalent bond	1	Metallic bond	Covalent bond	Ionic bond	Hydrogen bond	What type of bond is formed between two nonmetals?	\N
581	Iron	2	Iron	Platinum	Nickel	Copper	Which catalyst is used in the Haber process for ammonia synthesis?	\N
582	Gypsum	2	Limestone	Gypsum	Quartz	Dolomite	What is the common name of calcium sulfate dihydrate?	\N
583	Chlorofluorocarbons (CFCs)	2	Carbon dioxide	Sulfur dioxide	Chlorofluorocarbons (CFCs)	Methane	Which of the following gases is responsible for the depletion of the ozone layer?	\N
584	Avogadro's Law	3	Avogadro's Law	Boyle's Law	Charles' Law	Dalton's Law	Which law states that equal volumes of gases at the same temperature and pressure contain equal numbers of molecules?	\N
585	g/mol	1	mol/L	mol	g/mol	kg	What is the SI unit of molar mass?	\N
586	Argon	1	Argon	Nitrogen	Hydrogen	Oxygen	Which element is a noble gas?	\N
587	Sulfuric acid	1	Nitric acid	Hydrochloric acid	Sulfuric acid	Acetic acid	Which acid is known as the king of chemicals?	\N
588	Methane	2	Ethane	Propane	Butane	Methane	What is the main component of natural gas?	\N
589	Baking soda	2	Washing soda	Quicklime	Baking soda	Plaster of Paris	What is the common name for sodium bicarbonate?	\N
590	Tritium	1	Protium	Deuterium	Tritium	None of these	Which isotope of hydrogen contains two neutrons?	\N
591	-2	1	1	-1	2	-2	What is the charge of a sulfate ion (SO4)?	\N
592	Nickel	2	Iron	Copper	Platinum	Nickel	Which metal is used as a catalyst in the hydrogenation of vegetable oils?	\N
593	Boyle's Law	2	Avogadro's Law	Charles' Law	Dalton's Law	Boyle's Law	Which law explains the relationship between gas pressure and volume?	\N
594	Mercury	1	Gallium	Sodium	Bromine	Mercury	Which element is liquid at room temperature?	\N
595	Ethyne	1	Ethyne	Benzene	Ethane	Ethene	Which of the following compounds has a triple bond?	\N
596	Boiling	2	Boiling	Filtration	Chlorination	Distillation	Which process is used to remove temporary hardness of water?	\N
597	Ionization energy	2	Electronegativity	Ionization energy	Lattice energy	Electron affinity	What is the term for the amount of energy required to remove an electron from an atom?	\N
598	Propanone	1	Butanone	Methanone	Ethanone	Propanone	What is the IUPAC name of acetone?	\N
599	Magnesium	1	Zinc	Calcium	Magnesium	Iron	Which metal is found in chlorophyll?	\N
600	Double displacement	2	Decomposition	Oxidation-reduction	Double displacement	Combination	Which type of reaction involves the exchange of ions between two reactants?	\N
601	Carbon dioxide	1	Nitrogen	Oxygen	Carbon dioxide	Hydrogen	Which gas turns limewater milky?	\N
602	Nitrogen	1	Oxygen	Nitrogen	Carbon dioxide	Argon	What is the primary constituent of air?	\N
603	H+	2	Cl-	OH-	Na+	H+	Which ion is responsible for the acidic nature of a solution?	\N
604	Magnesium hydroxide	3	Sodium chloride	Sulfuric acid	Magnesium hydroxide	Glucose	Which substance is used to neutralize excess stomach acid?	\N
605	Carbon dioxide	1	Nitrogen	Hydrogen	Oxygen	Carbon dioxide	Which of the following is a greenhouse gas?	\N
606	Iron(III) oxide	1	Copper sulfate	Magnesium carbonate	Iron(II) chloride	Iron(III) oxide	What is the chemical name of rust?	\N
607	Single displacement	2	Combination	Decomposition	Single displacement	Double displacement	What type of reaction is Fe + CuSO4 = FeSO4 + Cu?	\N
608	Combustion	2	Evaporation	Combustion	Boiling	Melting	Which of the following is an exothermic process?	\N
609	-1	1	-1	-2	0	1	What is the charge on an electron?	\N
610	Carbon dioxide	1	Hydrogen	Carbon dioxide	Oxygen	Nitrogen	Which gas is used in fire extinguishers?	\N
611	Dmitri Mendeleev	1	John Dalton	Marie Curie	Antoine Lavoisier	Dmitri Mendeleev	Which scientist developed the periodic table?	\N
612	Photosynthesis	2	Freezing water	Photosynthesis	Combustion	Respiration	Which of the following is an example of an endothermic reaction?	\N
613	4	2	2	4	-4	0	What is the oxidation number of carbon in CO2?	\N
614	Slaked lime	1	Limestone	Quicklime	Slaked lime	Chalk	What is the common name of Ca(OH)2?	\N
615	Biuret test	2	Biuret test	Benedict's test	Iodine test	Tollen's test	Which chemical test is used to detect the presence of proteins?	\N
616	Helium	2	Neon	Helium	Oxygen	Fluorine	Which element has the highest first ionization energy?	\N
617	sp	2	sp	sp3	sp2	sp3d	What is the hybridization of the central carbon in ethyne (C2H2)?	\N
618	Ionic	1	Ionic	Covalent	Metallic	Hydrogen	Which type of bonding is present in NaCl?	\N
619	Chlorobenzene	3	Chlorobenzene	Benzyl chloride	Dichlorobenzene	Cyclohexane	What is the major product of the reaction between benzene and chlorine in the presence of FeCl3?	\N
620	Oxygen	2	Hydrogen	Oxygen	Chlorine	Nitrogen	Which gas is collected at the anode during the electrolysis of water?	\N
621	#NAME?	1	#NAME?	0	#NAME?	#NAME?	Which functional group is present in aldehydes?	\N
622	BF3	2	CH4	BF3	NH3	H2O	Which of the following is an example of a Lewis acid?	\N
623	3	1	7	1	3	4	What is the pH of a 0.001 M HCl solution?	\N
624	Avogadro's Law	3	Boyle's Law	Dalton's Law	Avogadro's Law	Charles' Law	Which law states that equal volumes of gases contain equal numbers of molecules at the same temperature and pressure?	\N
677	50	1	50	32	16	8	Which number does not belong in the sequence? 2, 4, 8, 16, 32, 50	\N
625	Tritium	2	Hydronium	Protium	Deuterium	Tritium	Which isotope of hydrogen contains one proton and two neutrons?	\N
626	Zero	2	One	Zero	Depends on the element	-1	What is the standard enthalpy of formation of an element in its most stable form?	\N
627	Water (H2O)	1	Methane (CH4)	Water (H2O)	Ammonia (NH3)	Hydrogen sulfide (H2S)	Which of the following has the highest boiling point?	\N
628	Combustion	3	Combustion	Elimination	Addition	Substitution	Which type of reaction occurs when a hydrocarbon reacts with oxygen to form CO2 and H2O?	\N
629	Tetrahedral	1	Octahedral	Tetrahedral	Linear	Trigonal planar	What is the molecular geometry of CH4?	\N
630	Hydrogen bonding	1	Hydrogen bonding	Ionic bonding	Covalent bonding	Van der Waals forces	What is the main reason behind the high boiling point of water?	\N
631	Ethylene glycol	1	Propane	Glycerol	Ethylene glycol	Methanol	Which compound is used as an antifreeze in car engines?	\N
632	Methane	2	Methane	Ethane	Butane	Propane	What is the primary component of natural gas?	\N
633	Carbon	2	Carbon	Oxygen	Sulfur	Nitrogen	Which element is found in all organic compounds?	\N
634	Carbon dioxide and water	2	Carbon monoxide and water	Carbon dioxide and water	Hydrogen and carbon	Carbon and oxygen	What is the main product of the complete combustion of methane?	\N
635	Double displacement	2	Decomposition	Double displacement	Single displacement	Synthesis	Which type of reaction involves the exchange of ions between two compounds?	\N
636	Molarity (M)	1	Parts per million (ppm)	Normality (N)	Molality (m)	Molarity (M)	What is the SI unit of concentration?	\N
637	Sublimation	2	Deposition	Condensation	Evaporation	Sublimation	What is the name of the process by which solid turns directly into gas?	\N
638	Potassium	2	Zinc	Potassium	Copper	Iron	Which metal is the most reactive in the reactivity series?	\N
639	Ionic bond	2	Ionic bond	Hydrogen bond	Metallic bond	Covalent bond	What type of bond is formed in the reaction between a metal and a nonmetal?	\N
640	98 g/mol	2	98 g/mol	120 g/mol	80 g/mol	100 g/mol	What is the molar mass of sulfuric acid (H2SO4)?	\N
641	Sulfur dioxide (SO2)	1	Methane (CH4)	Ozone (O3)	Carbon monoxide (CO)	Sulfur dioxide (SO2)	Which compound is responsible for acid rain?	\N
642	30	1	32	28	34	30	What comes next in the sequence? 2, 6, 12, 20, ?	\N
643	True	1	Uncertain	None of the above	True	False	If all Bloops are Razzies and all Razzies are Lazzies, then all Bloops are definitely Lazzies. This statement is:	\N
644	His son	1	His son	His brother	His uncle	His father	A man is looking at a picture of someone. His son says, 'Father, who is that?' The man replies, 'Brothers and sisters, I have none. But that man's father is my father's son.' Who is in the picture?	\N
645	25	1	36	30	20	25	Which number should come next in the pattern? 1, 4, 9, 16, ?	\N
646	Ocean	1	Country	Ocean	City	Animal	If you rearrange the letters 'CIFAIPC', you would get the name of a:	\N
647	6	1	3	9	12	6	A clock shows 3:15. The minute hand is pointing to 3. If the clock is rotated 90 degrees clockwise, where will the minute hand point?	\N
648	U	1	T	R	U	S	What is the missing letter in the sequence? A, C, F, J, O, ?	\N
649	64	1	49	100	81	64	Which number is missing in the sequence? 8, 27, ?, 125, 216	\N
650	9	1	8	0	9	17	A farmer has 17 sheep and all but 9 run away. How many sheep does he have left?	\N
651	32	1	32	25	28	30	If 2+3=10, 3+4=21, 4+5=?	\N
652	Carrot	2	Carrot	Orange	Banana	Apple	Find the odd one out: Apple, Banana, Carrot, Orange	\N
653	64	1	64	25	36	49	What is the next number in the series? 144, 121, 100, 81, ?	\N
654	80	1	60	70	80	100	Find the missing term: 5, 10, 20, 40, ?	\N
655	24	1	18	22	24	27	If FISH is coded as 219, how is CAT coded?	\N
656	30	1	35	25	40	30	John is twice as old as Mary was when John was as old as Mary is now. If Mary is 20 years old, how old is John?	\N
657	7.5 degrees	1	15 degrees	7.5 degrees	45 degrees	30 degrees	What is the angle between the hour and minute hand at 3:15?	\N
658	TNBQU	2	TNBPV	UMCRV	SNBQU	TNBQU	If TOMORROW is written as URNQPSQX, how is SMART written?	\N
659	24 meters	1	18 meters	20 meters	12 meters	24 meters	A rope is cut into 4 equal pieces. If each piece is 6 meters long, what was the original length of the rope?	\N
660	False	1	False	None of the above	True	Uncertain	If all Plops are Blips and some Blips are Glops, then some Plops are definitely Glops. This statement is:	\N
661	IPVTF	1	HRVTF	HOVTE	IQWUE	IPVTF	If TREE is coded as UQFF, how is HOUSE coded?	\N
662	27	1	25	27	29	30	What is the missing number in the sequence? 3, 6, 11, 18, ?	\N
663	5	2	5	10	25	20	If 5 cats catch 5 mice in 5 minutes, how many cats are needed to catch 100 mice in 100 minutes?	\N
664	7.5 degrees	1	30 degrees	15 degrees	45 degrees	7.5 degrees	A clock shows 3:15. What is the angle between the hour and minute hands?	\N
665	Alice	2	Alice	Cannot be determined	Sam	John	If John is older than Sam and Sam is older than Alice, who is the youngest?	\N
666	Cube	1	Cube	Sphere	Oval	Circle	Find the odd one out: Circle, Sphere, Cube, Oval	\N
667	30	1	28	24	32	30	What is the next number in the pattern? 2, 6, 12, 20, ?	\N
668	$0.05	1	$0.15	$0.10	$0.20	$0.05	A bat and a ball cost $1.10 together. The bat costs $1.00 more than the ball. How much does the ball cost?	\N
669	Clear	1	Clear	Blurred	Hidden	Dark	Which word is the opposite of 'obscure'?	\N
670	U	1	U	P	S	R	Which is the missing letter in the sequence? A, C, F, J, O, ?	\N
671	Lizard	1	Elephant	Lizard	Cat	Dog	Find the odd one out: Dog, Cat, Elephant, Lizard	\N
672	43	1	41	48	45	43	If 2 + 3 = 10, 3 + 4 = 21, 4 + 5 = 32, then 5 + 6 = ?	\N
673	64	1	36	64	49	25	Which number should come next? 144, 121, 100, 81, ?	\N
674	25	1	30	20	36	25	What is the missing term in the sequence? 1, 4, 9, 16, ?	\N
675	A	1	A	B	C	D	A is taller than B, and B is taller than C. If D is shorter than B, who is the tallest?	\N
678	Thursday	1	Sunday	Saturday	Thursday	Friday	If today is Monday, what day will it be in 17 days?	\N
679	45 miles	1	45 miles	60 miles	55 miles	50 miles	A train is moving at 60 mph. How far will it travel in 45 minutes?	\N
680	40	1	30	50	40	60	Which number replaces the question mark? 5, 10, 20, ?, 80	\N
681	13	1	13	11	15	18	Find the next number in the sequence: 1, 1, 2, 3, 5, 8, ?	\N
682	37	1	41	37	35	39	Find the missing term: 2, 5, 10, 17, 26, ?	\N
683	9	1	0	17	9	8	A farmer has 17 sheep, all but 9 run away. How many are left?	\N
684	60 km/h	1	70 km/h	90 km/h	80 km/h	60 km/h	If a car is traveling 90 km in 1.5 hours, what is its speed?	\N
685	27	2	27	12	24	18	Which number completes the analogy: 2 is to 8 as 3 is to ?	\N
686	P	1	O	P	M	N	Find the missing letter in the sequence: B, D, G, K, ?	\N
687	Cube	1	Square	Cube	Circle	Triangle	Which shape does not belong? Triangle, Square, Cube, Circle	\N
688	112	1	96	112	120	84	What is the next number in the sequence? 7, 14, 28, 56, ?	\N
689	Once	1	Zero times	Ten times	Once	Five times	How many times can you subtract 5 from 25?	\N
690	1/3	1	1/3	1/5	1/4	1/6	Which fraction is the largest? 1/3, 1/4, 1/5, 1/6	\N
691	Square	1	Yellow	Red	Blue	Square	Find the odd one out: Red, Blue, Yellow, Square	\N
692	$1.75	1	$1.25	$1.50	$1.75	$2.00	If 3 pencils cost 75 cents, how much do 7 pencils cost?	\N
693	55	1	44	55	22	33	Which number comes next? 99, 88, 77, 66, ?	\N
694	1.5 mph	2	2 mph	2.5 mph	3 mph	1.5 mph	If a boat travels at 8 mph downstream and 5 mph upstream, what is the speed of the current?	\N
695	4	1	2	4	6	3	A shopkeeper has 6 apples, he gives away 2. How many are left?	\N
696	44	1	44	60	50	40	Which is the missing number? 11, 22, 33, ?, 55	\N
697	Contract	1	Contract	Increase	Grow	Spread	Which word is the opposite of 'Expand'?	\N
698	27	1	30	24	29	27	Find the next term in the pattern: 3, 6, 11, 18, ?	\N
699	180 degrees	1	180 degrees	120 degrees	150 degrees	90 degrees	A clock reads 6:00. What is the angle between the hands?	\N
700	U	1	U	V	W	T	Find the missing letter: C, F, J, O, ?	\N
701	Same weight	1	Cannot be determined	Same weight	Steel	Feathers	Which is heavier? 1 kg of feathers or 1 kg of steel?	\N
702	30	2	20	30	25	35	If a bicycle wheel completes 10 revolutions in 20 seconds, how many in 1 minute?	\N
703	Carrot	2	Banana	Apple	Carrot	Mango	Which word does not belong? Apple, Banana, Carrot, Mango	\N
704	90	1	60	45	90	180	How many degrees in a right angle?	\N
705	11	1	10	13	11	12	What is the square root of 121?	\N
706	35	1	40	30	36	35	Find the missing number: 4, 8, 15, 24, ?	\N
707	9 seconds	1	12 seconds	9 seconds	11 seconds	10 seconds	If a clock takes 5 seconds to strike 5 times, how long will it take to strike 10 times?	\N
708	42	1	48	42	40	44	Which number comes next in the sequence? 2, 6, 12, 20, 30, ?	\N
709	10	1	12	8	10	5	A man is 4 times as old as his son. In 20 years, he will be twice as old. How old is his son now?	\N
710	13	1	12	10	15	13	Find the missing term: 1, 1, 2, 3, 5, 8, ?	\N
711	Carrot	1	Apple	Banana	Grape	Carrot	Which word does not belong in the group? Apple, Banana, Carrot, Grape	\N
712	81	1	90	72	81	99	What is the missing number? 3, 9, 27, ?, 243	\N
713	No	2	Cannot be determined	No	Maybe	Yes	If all Bloops are Razzies and some Razzies are Lazzies, then are all Bloops definitely Lazzies?	\N
714	20	1	20	15	30	25	If John is twice as old as Alice, and Alice is 10, how old is John?	\N
715	60 km	1	60 km	55 km	50 km	65 km	A train is moving at 80 km/h. How far will it travel in 45 minutes?	\N
716	12	1	12	6	8	16	A cube has how many edges?	\N
717	Sphere	1	Square	Sphere	Circle	Triangle	Find the odd one out: Circle, Square, Triangle, Sphere	\N
718	3	2	50	100	3	10	If 3 cats can catch 3 mice in 3 minutes, how many cats are needed to catch 100 mice in 100 minutes?	\N
719	36	1	40	30	35	36	Which number is missing in the sequence? 4, 9, 16, 25, ?, 49	\N
720	U	1	V	S	U	T	What is the next letter in the sequence? A, C, F, J, O, ?	\N
721	Octagon	2	Hexagon	Pentagon	Octagon	Heptagon	Which shape has the most sides? Pentagon, Hexagon, Octagon, Heptagon	\N
722	12.5	1	20	15	10	12.5	Find the missing number: 100, 50, 25, ?	\N
723	John	1	Frank	John	Edward	Sam	John’s father has 5 sons: Alan, Brian, Carl, Dave. What is the name of the fifth son?	\N
724	24 days	1	16 days	20 days	18 days	24 days	If 8 workers can build a house in 12 days, how long will it take 4 workers?	\N
725	$0.05	1	$0.10	$0.20	$0.15	$0.05	A bat and a ball cost $1.10 together. The bat costs $1 more than the ball. How much does the ball cost?	\N
726	Uncle	2	Father	Grandfather	Uncle	Cousin	If A is B’s brother, and B is C’s father, how is A related to C?	\N
727	17	1	16	17	15	18	What comes next in the series? 2, 3, 5, 8, 12, ?	\N
728	600	2	650	550	600	500	If a car’s wheels rotate 100 times in 10 seconds, how many rotations in one minute?	\N
729	14	1	9	18	6	14	Which number does not belong? 3, 6, 9, 12, 14, 18	\N
730	12 hours	1	9 hours	10 hours	15 hours	12 hours	If it takes 4 men 6 hours to paint a house, how long would it take 2 men?	\N
731	15	1	15	12	18	10	A father is 3 times as old as his son. In 15 years, he will be twice as old. How old is the son now?	\N
732	Triangle	2	Rectangle	Triangle	Square	Hexagon	Which figure is different? Triangle, Square, Rectangle, Hexagon	\N
733	City	1	Fruit	Country	City	Animal	If you rearrange the letters of 'CITRO' you get the name of a?	\N
734	36	1	40	30	36	45	Which number comes next? 1, 4, 9, 16, 25, ?	\N
735	$3	1	$4	$3	$5	$2	If 5 apples cost $1, how much do 15 apples cost?	\N
736	27	1	26	24	27	25	What comes next? 3, 6, 11, 18, ?	\N
737	Mother	1	Grandmother	Mother	Sister	Aunt	A is B’s mother. B is C’s sister. How is A related to C?	\N
738	80	1	80	120	60	100	What is the next term in the series? 5, 10, 20, 40, ?	\N
739	Saturday	1	Sunday	Friday	Thursday	Saturday	If today is Wednesday, what day will it be in 10 days?	\N
740	512	1	256	64	1024	512	What is the next term? 2, 8, 32, 128, ?	\N
741	24 hours	2	24 hours	20 hours	16 hours	18 hours	If 6 workers can complete a task in 12 hours, how long will it take 3 workers?	\N
742	$39	1	$40	$39	$42	$38	A book costs $12. A pen costs $5. How much do 2 books and 3 pens cost?	\N
743	60	1	60	65	50	55	What is the missing number? 10, 15, 25, 40, ?	\N
744	150 km	1	160 km	130 km	150 km	140 km	If a train is traveling at 60 km/h, how far will it go in 2.5 hours?	\N
745	12 meters	1	12 meters	10 meters	9 meters	15 meters	A rope is cut into 4 equal parts. If each part is 3 meters, what was the original length?	\N
746	Square	1	Red	Square	Blue	Green	Which word does not belong? Red, Blue, Green, Square	\N
747	7	1	8	6	5	7	If a + b = 10 and a - b = 4, what is a?	\N
748	21	1	21	22	19	20	What comes next? 1, 3, 6, 10, 15, ?	\N
749	$8	1	$6	$8	$12	$10	A store sells 3 pens for $2. How much for 12 pens?	\N
751	Mitochondrion	2	Mitochondrion	Nucleus	Ribosome	Golgi apparatus	Which organelle is responsible for energy production in a cell?	\N
752	Protein synthesis	2	Cell division	Lipid storage	DNA replication	Protein synthesis	What is the primary function of the ribosomes?	\N
753	Carbohydrates	3	Carbohydrates	Nucleic acids	Proteins	Lipids	Which macromolecule serves as the primary source of energy in most living organisms?	\N
754	DNA	2	Lipids	DNA	RNA	Proteins	What is the genetic material in most living organisms?	\N
755	Photosynthesis	1	Fermentation	Photosynthesis	Glycolysis	Respiration	Which process converts sunlight into chemical energy?	\N
756	Transport oxygen	2	Digest proteins	Store energy	Fight infections	Transport oxygen	What is the role of hemoglobin in the human body?	\N
757	Cerebellum	2	Cerebellum	Medulla oblongata	Hypothalamus	Cerebrum	Which part of the brain controls balance and coordination?	\N
758	Fight infections	1	Fight infections	Digest food	Carry oxygen	Transmit nerve signals	What is the primary function of white blood cells?	\N
759	Proteins	1	Carbohydrates	Proteins	Lipids	Nucleic acids	What type of biomolecule are enzymes?	\N
760	Chloroplast	2	Ribosome	Chloroplast	Vacuole	Mitochondria	Which structure in the plant cell is responsible for photosynthesis?	\N
761	Osmosis	3	Endocytosis	Osmosis	Active transport	Diffusion	What is the process by which water moves across a semipermeable membrane?	\N
762	Filtration of blood	1	Digestion of proteins	Filtration of blood	Absorption of nutrients	Production of bile	What is the function of the nephron in the kidney?	\N
763	Smooth muscle	3	Cardiac muscle	Smooth muscle	Tendon	Skeletal muscle	Which type of muscle is involuntary and found in the walls of internal organs?	\N
764	Roots	2	Flowers	Leaves	Stems	Roots	Which part of the plant is primarily responsible for water absorption?	\N
765	Gas exchange	1	Transport nutrients	Photosynthesis	Water absorption	Gas exchange	What is the function of the stomata in plants?	\N
766	Insulin	1	Insulin	Thyroxine	Adrenaline	Estrogen	Which hormone regulates blood sugar levels?	\N
767	Asexual reproduction	2	Sexual reproduction	Meiosis	Asexual reproduction	Crossbreeding	Which type of reproduction produces genetically identical offspring?	\N
768	Aorta	2	Aorta	Vein	Capillary	Pulmonary artery	Which blood vessel carries oxygenated blood from the heart to the body?	\N
769	Platelets	3	White blood cells	Plasma	Red blood cells	Platelets	Which component of blood is responsible for clotting?	\N
770	Cell	1	Organ	Molecule	Cell	Tissue	What is the smallest unit of life?	\N
771	Liver	1	Lungs	Stomach	Kidney	Liver	Which organ removes toxins from the blood?	\N
772	Medulla oblongata	2	Cerebrum	Medulla oblongata	Cerebellum	Thalamus	Which part of the brain controls involuntary actions like heartbeat and breathing?	\N
773	Water absorption	1	Water absorption	Protein digestion	Oxygen transport	Hormone production	What is the function of the large intestine?	\N
774	Iron	2	Iron	Calcium	Potassium	Sodium	Which element is essential for making hemoglobin in red blood cells?	\N
775	Absorption of nutrients	1	Absorption of nutrients	Filtering blood	Storage of waste	Production of bile	What is the main function of the small intestine?	\N
776	Mitochondria	1	Ribosome	Nucleus	Chloroplast	Mitochondria	What is the powerhouse of the cell?	\N
777	Vitamin K	1	Vitamin A	Vitamin C	Vitamin K	Vitamin D	Which vitamin is essential for blood clotting?	\N
778	Cellular respiration	1	Fermentation	Cellular respiration	Photosynthesis	Osmosis	What is the process by which cells break down glucose for energy?	\N
779	Carbon dioxide	1	Nitrogen	Oxygen	Carbon dioxide	Hydrogen	Which gas do plants absorb during photosynthesis?	\N
780	Fight infections	1	Produce hormones	Fight infections	Transport oxygen	Break down food	What is the function of antibodies?	\N
781	Integumentary system	1	Endocrine system	Nervous system	Respiratory system	Integumentary system	Which system in the body includes the skin, hair, and nails?	\N
782	Ball and socket	1	Pivot	Fixed	Hinge	Ball and socket	Which type of joint allows the widest range of motion?	\N
783	Produces insulin and digestive enzymes	1	Stores bile	Filters waste	Absorbs nutrients	Produces insulin and digestive enzymes	What is the role of the pancreas in digestion?	\N
784	Somatic nervous system	2	Somatic nervous system	Autonomic nervous system	Parasympathetic nervous system	Sympathetic nervous system	Which part of the nervous system controls voluntary movements?	\N
785	Adrenal gland	1	Pancreas	Thyroid gland	Pituitary gland	Adrenal gland	Which gland produces adrenaline?	\N
786	Gas exchange	1	Gas exchange	Filter toxins	Pump blood	Digest food	What is the role of alveoli in the lungs?	\N
787	Mycology	2	Zoology	Botany	Virology	Mycology	What is the scientific name for the study of fungi?	\N
788	Gallbladder	1	Gallbladder	Pancreas	Liver	Stomach	Which organ stores and releases bile?	\N
789	Skull	1	Skull	Ribcage	Sternum	Spinal cord	Which structure protects the brain?	\N
790	Transport water	1	Transport water	Produce energy	Transport nutrients	Absorb sunlight	What is the function of xylem in plants?	\N
791	Photosynthesis	3	Respiration	Transpiration	Photosynthesis	Fermentation	What is the process by which green plants convert sunlight into energy?	\N
792	DNA	2	DNA	Carbohydrate	Protein	Lipid	Which macromolecule is primarily responsible for storing genetic information?	\N
793	tRNA	2	rRNA	tRNA	mRNA	siRNA	Which type of RNA carries amino acids to the ribosome for protein synthesis?	\N
794	Transport oxygen	1	Transport oxygen	Fight infections	Digest food	Produce hormones	What is the primary function of red blood cells?	\N
795	Nephron	2	Alveolus	Nephron	Osteon	Neuron	What is the structural and functional unit of the kidney?	\N
796	Cerebellum	2	Cerebrum	Thalamus	Medulla	Cerebellum	Which part of the brain controls coordination and balance?	\N
797	Femur	1	Humerus	Radius	Femur	Tibia	What is the longest bone in the human body?	\N
798	Left ventricle	2	Right ventricle	Left ventricle	Right atrium	Left atrium	Which part of the heart pumps oxygenated blood to the body?	\N
799	Plantae	1	Protista	Fungi	Plantae	Animalia	Which kingdom includes multicellular, photosynthetic organisms?	\N
800	Mutualism	2	Mutualism	Commensalism	Parasitism	Predation	What type of symbiotic relationship benefits both organisms involved?	\N
801	Protein	1	Nucleic acid	Carbohydrate	Protein	Lipid	Which biomolecule is an enzyme composed of?	\N
802	Fight infections	1	Fight infections	Digest food	Store energy	Transport oxygen	What is the main function of white blood cells?	\N
803	Population	2	Population	Ecosystem	Community	Biosphere	What is the term for a group of organisms of the same species living in the same area?	\N
804	Osmosis	2	Active transport	Osmosis	Endocytosis	Diffusion	What is the process by which water moves across a semi-permeable membrane?	\N
805	Flagella	1	Flagella	Pseudopodia	Cilia	Pili	Which structure allows bacteria to move?	\N
806	Endocrine system	2	Digestive system	Respiratory system	Endocrine system	Nervous system	Which human body system is responsible for hormone production?	\N
807	Genetics	1	Anatomy	Physiology	Ecology	Genetics	What is the term for the study of heredity?	\N
808	Arteries	1	Capillaries	Veins	Lymphatics	Arteries	Which blood vessels carry blood away from the heart?	\N
809	Iron	2	Sodium	Magnesium	Calcium	Iron	Which element is essential for hemoglobin to transport oxygen?	\N
810	Survival of the fittest	3	Speciation	Survival of the fittest	Mutation	Genetic drift	What is the term for the natural selection process where organisms better adapted to their environment survive and reproduce?	\N
811	Smooth muscle	2	Cardiac muscle	Striated muscle	Smooth muscle	Skeletal muscle	Which type of muscle is involuntary and found in internal organs?	\N
812	Absorb water	3	Digest proteins	Produce enzymes	Break down fats	Absorb water	What is the function of the large intestine in digestion?	\N
813	Aerobic respiration	2	Fermentation	Aerobic respiration	Photosynthesis	Anaerobic respiration	Which process results in the production of ATP in the presence of oxygen?	\N
814	Leaves	3	Roots	Flowers	Stem	Leaves	Which part of the plant is responsible for photosynthesis?	\N
815	Amylase	2	Amylase	Pepsin	Protease	Lipase	Which enzyme is responsible for breaking down starch into simple sugars?	\N
816	Liver	2	Gallbladder	Liver	Pancreas	Small intestine	Which organ in the human body produces bile?	\N
817	O-	3	O-	O+	AB+	A-	Which blood type is considered the universal donor?	\N
818	Chloroplast	2	Nucleus	Chloroplast	Ribosome	Mitochondria	Which of the following structures is found in plant cells but not in animal cells?	\N
819	Homeostasis	2	Homeostasis	Metabolism	Equilibrium	Adaptation	Which term describes the process of maintaining a stable internal environment?	\N
820	Ball and socket	1	Ball and socket	Gliding	Pivot	Hinge	What type of joint is found in the shoulder and hip?	\N
821	Thyroxine	1	Insulin	Adrenaline	Testosterone	Thyroxine	Which hormone is responsible for regulating metabolism?	\N
822	Medulla oblongata	2	Medulla oblongata	Cerebellum	Hypothalamus	Cerebrum	Which part of the brain controls involuntary actions like breathing and heartbeat?	\N
823	Oxygen	2	Nitrogen	Methane	Carbon dioxide	Oxygen	Which gas is released as a byproduct of photosynthesis?	\N
824	Small intestine	3	Esophagus	Stomach	Small intestine	Large intestine	Which part of the digestive system absorbs most of the nutrients?	\N
825	Blood clotting	1	Fighting infections	Digesting food	Blood clotting	Oxygen transport	What is the primary function of platelets in blood?	\N
826	Ribosome	1	Golgi apparatus	Ribosome	Mitochondria	Nucleus	Which organelle is responsible for protein synthesis?	\N
827	Mitosis	2	Mitosis	Fertilization	Meiosis	Binary fission	Which process leads to the formation of identical daughter cells?	\N
828	Pancreas	1	Liver	Thyroid	Adrenal	Pancreas	Which gland produces insulin?	\N
829	Cardiac muscle	1	Smooth muscle	Skeletal muscle	Cardiac muscle	Striated muscle	Which type of muscle is found only in the heart?	\N
830	Autotrophs	2	Carnivores	Autotrophs	Heterotrophs	Omnivores	What is the term for organisms that produce their own food?	\N
831	Pupil	2	Pupil	Retina	Cornea	Lens	Which structure in the eye controls the amount of light entering?	\N
832	Absorb water	3	Absorb water	Produce bile	Store nutrients	Digest fats	What is the primary function of the large intestine?	\N
833	Decomposers	2	Decomposers	Producers	Consumers	Herbivores	Which type of organism breaks down dead material and recycles nutrients?	\N
834	Binary fission	3	Meiosis	Binary fission	Budding	Mitosis	What is the process of cell division in bacteria called?	\N
835	Pulmonary vein	2	Aorta	Pulmonary vein	Vena cava	Pulmonary artery	Which blood vessel carries oxygenated blood from the lungs to the heart?	\N
836	Kidney	2	Liver	Pancreas	Kidney	Lungs	Which organ is responsible for filtering waste from the blood?	\N
837	DNA	1	DNA	RNA	Lipid	Protein	Which molecule carries genetic information?	\N
838	White blood cells	1	Red blood cells	Platelets	Plasma	White blood cells	Which blood component fights infections?	\N
839	Bacteria	2	Protista	Bacteria	Plantae	Fungi	Which kingdom includes single-celled organisms with no nucleus?	\N
840	Xylem	3	Phloem	Cambium	Xylem	Epidermis	Which plant tissue is responsible for transporting water?	\N
841	Osmosis	2	Filtration	Diffusion	Osmosis	Active transport	Which term describes the movement of water from high to low concentration?	\N
842	Adaptation	2	Mutation	Evolution	Variation	Adaptation	What is the term for a trait that increases an organism's chance of survival?	\N
843	Golgi apparatus	1	Golgi apparatus	Nucleus	Ribosome	Endoplasmic reticulum	Which organelle packages and modifies proteins?	\N
844	Chemical digestion	2	Chemical digestion	Mechanical digestion	Osmosis	Filtration	Which type of digestion breaks food into smaller molecules?	\N
845	Sexual reproduction	1	Sexual reproduction	Asexual reproduction	Binary fission	Budding	Which type of reproduction increases genetic diversity?	\N
846	Thalamus	2	Medulla	Thalamus	Hypothalamus	Cerebellum	Which part of the brain processes sensory information?	\N
847	Diffusion	2	Active transport	Filtration	Osmosis	Diffusion	Which process results in the exchange of gases in the lungs?	\N
848	Protein channels	1	Carbohydrates	DNA	Protein channels	Lipid bilayer	Which part of the cell membrane helps with transport?	\N
849	Parathyroid hormone	2	Glucagon	Insulin	Parathyroid hormone	Adrenaline	Which hormone controls calcium levels in the blood?	\N
850	Archaea	1	Fungi	Bacteria	Protists	Archaea	Which organisms can survive in extreme environments?	\N
851	Artery	2	Artery	Lymph vessel	Capillary	Vein	Which type of blood vessel has thick, muscular walls to withstand pressure?	\N
852	Dendrite	1	Axon	Dendrite	Synapse	Cell body	Which part of the neuron receives signals?	\N
853	Gills	1	Trachea	Skin	Lungs	Gills	Which structure allows oxygen exchange in fish?	\N
854	Animalia	1	Animalia	Fungi	Protista	Plantae	Which kingdom includes multicellular, heterotrophic organisms?	\N
855	Pollen formation	1	Photosynthesis	Fertilization	Pollen formation	Pollination	What is the process of producing male gametes in plants?	\N
856	Active immunity	2	Active immunity	Passive immunity	Natural immunity	Innate immunity	Which type of immunity is gained through vaccination?	\N
857	Protection against UV rays	1	Temperature regulation	Sweat production	Vitamin D production	Protection against UV rays	What is the function of melanin in the skin?	\N
858	Right atrium	1	Left ventricle	Left atrium	Right ventricle	Right atrium	Which part of the heart receives oxygen-poor blood?	\N
859	Mitochondria	1	Mitochondria	Golgi apparatus	Ribosome	Nucleus	Which organelle is known as the powerhouse of the cell?	\N
860	Cell	2	Cell	Organ	Tissue	Organ system	What is the basic unit of structure and function in living organisms?	\N
861	Carbohydrates	2	Carbohydrates	Proteins	Lipids	Nucleic acids	Which biomolecule serves as the primary source of energy for the body?	\N
862	Photosynthesis	2	Respiration	Photosynthesis	Fermentation	Transpiration	Which process converts light energy into chemical energy in plants?	\N
863	DNA	1	Carbohydrate	Protein	DNA	Lipid	Which macromolecule stores genetic information?	\N
864	White blood cells	2	Red blood cells	White blood cells	Platelets	Plasma cells	Which blood cells are responsible for fighting infections?	\N
865	Asexual reproduction	3	Asexual reproduction	Budding	Sexual reproduction	Binary fission	What type of reproduction produces genetically identical offspring?	\N
866	mRNA	2	mRNA	tRNA	rRNA	snRNA	Which type of RNA carries the genetic message from DNA to ribosomes?	\N
867	Anther	1	Ovary	Anther	Petal	Stigma	Which part of the flower produces pollen?	\N
868	Nephron	2	Neuron	Nephron	Alveolus	Glomerulus	What is the functional unit of the kidney?	\N
869	Ball and socket	1	Gliding	Hinge	Ball and socket	Pivot	Which type of joint is found in the shoulder and hip?	\N
870	Hemoglobin	1	Platelets	White blood cells	Hemoglobin	Plasma	Which component of blood carries oxygen?	\N
871	Kidney	1	Liver	Lungs	Kidney	Heart	Which organ filters waste from the blood?	\N
872	Medulla oblongata	2	Thalamus	Cerebellum	Hypothalamus	Medulla oblongata	Which part of the brain controls involuntary actions such as heartbeat and breathing?	\N
873	Water absorption	1	Absorption of fats	Water absorption	Digestion of proteins	Production of bile	What is the main function of the large intestine?	\N
874	Fight infections	2	Produce red blood cells	Transport oxygen	Digest food	Fight infections	What is the primary function of the lymphatic system?	\N
875	Closed	2	Closed	Open	Incomplete	Single	What type of circulatory system do humans have?	\N
876	Amylase	1	Amylase	Lipase	Maltase	Protease	Which enzyme breaks down starch into sugar?	\N
877	Arthropoda	2	Mollusca	Cnidaria	Chordata	Arthropoda	Which animal phylum includes organisms with jointed appendages and exoskeletons?	\N
878	Increase signal transmission speed	1	Produce neurotransmitters	Filter blood	Store energy	Increase signal transmission speed	What is the function of the myelin sheath in neurons?	\N
879	Phagocytosis	1	Endocytosis	Pinocytosis	Phagocytosis	Exocytosis	What is the name of the process where a cell engulfs large particles?	\N
880	Small intestine	2	Stomach	Large intestine	Small intestine	Esophagus	Which organ in the digestive system is responsible for most nutrient absorption?	\N
881	Artery	1	Vein	Artery	Capillary	Venule	What type of blood vessel carries blood away from the heart?	\N
882	Central nervous system	2	Autonomic nervous system	Somatic nervous system	Peripheral nervous system	Central nervous system	Which component of the nervous system includes the brain and spinal cord?	\N
883	Charles Darwin	2	Isaac Newton	Louis Pasteur	Charles Darwin	Gregor Mendel	Which scientist proposed the theory of evolution by natural selection?	\N
884	Golgi apparatus	2	Ribosome	Mitochondria	Golgi apparatus	Nucleus	Which organelle is involved in packaging and transporting proteins?	\N
885	Chlorophyll	1	Anthocyanin	Chlorophyll	Hemoglobin	Carotenoid	Which pigment gives plants their green color?	\N
886	Cell	2	Molecule	Tissue	Organ	Cell	What is the smallest structural unit of life?	\N
887	Meiosis	2	Mitosis	Budding	Binary fission	Meiosis	Which type of cell division results in four genetically unique daughter cells?	\N
888	Dendrites	2	Dendrites	Cell body	Axon	Myelin sheath	Which part of the neuron receives incoming signals?	\N
889	Produce blood cells	1	Store calcium	Protect organs	Transmit nerve signals	Produce blood cells	What is the function of red bone marrow?	\N
890	Iris	2	Cornea	Iris	Lens	Retina	Which part of the eye controls the amount of light entering the pupil?	\N
891	Diffusion	2	Diffusion	Osmosis	Active transport	Endocytosis	Which process moves molecules from an area of high concentration to low concentration?	\N
892	Oxygen	1	Nitrogen	Methane	Oxygen	Carbon dioxide	Which gas is required for aerobic respiration?	\N
893	Sexual reproduction	2	Sexual reproduction	Binary fission	Budding	Asexual reproduction	Which type of reproduction involves the fusion of gametes?	\N
894	Prevent food from entering the airway	1	Produce digestive enzymes	Absorb water	Prevent food from entering the airway	Help in swallowing	What is the function of the epiglottis?	\N
895	Mitochondria	2	Golgi apparatus	Mitochondria	Lysosome	Ribosome	Which organelle is responsible for producing ATP in a eukaryotic cell?	\N
896	Protein synthesis	2	Energy production	Protein synthesis	Lipid synthesis	Waste elimination	What is the primary function of ribosomes in a cell?	\N
897	Proteins	1	Proteins	Lipids	Carbohydrates	Nucleic acids	Which type of biomolecule are enzymes?	\N
898	Metaphase	2	Telophase	Anaphase	Prophase	Metaphase	Which phase of mitosis involves the alignment of chromosomes in the center of the cell?	\N
899	Oxygen transport	2	Blood clotting	Fighting infections	Oxygen transport	Digestion of proteins	What is the primary function of hemoglobin in the blood?	\N
900	Glucose	2	Starch	Glucose	Cellulose	Sucrose	Which of the following is an example of a monosaccharide?	\N
901	Brings amino acids to the ribosome	2	Replicates DNA	Brings amino acids to the ribosome	Translates RNA into DNA	Carries the genetic code	What is the function of tRNA in protein synthesis?	\N
902	Leaf	3	Stem	Root	Flower	Leaf	Which part of the plant is primarily responsible for photosynthesis?	\N
903	Cerebellum	2	Cerebellum	Medulla oblongata	Cerebrum	Thalamus	Which structure in the human brain is responsible for coordinating voluntary movements?	\N
904	Filtering blood and forming urine	1	Digesting proteins	Producing red blood cells	Filtering blood and forming urine	Regulating body temperature	What is the role of the nephron in the kidney?	\N
905	Cell	1	Cell	Tissue	Atom	Molecule	What is the basic unit of life?	\N
906	Sexual reproduction	2	Asexual reproduction	Sexual reproduction	Binary fission	Budding	Which type of reproduction involves two parents and produces genetically diverse offspring?	\N
907	Nucleic acids	2	Lipids	Nucleic acids	Carbohydrates	Proteins	What type of macromolecule are DNA and RNA?	\N
908	Remove waste from the body	2	Remove waste from the body	Produce hormones	Transport oxygen	Break down food	What is the primary function of the excretory system?	\N
909	Nucleus	2	Ribosome	Nucleus	Cell membrane	Mitochondria	Which part of the cell contains genetic material?	\N
910	Auxin	2	Ethylene	Auxin	Cytokinin	Gibberellin	Which plant hormone is responsible for cell elongation and growth?	\N
911	Osmosis	2	Osmosis	Diffusion	Filtration	Active transport	Which process allows water to move through a selectively permeable membrane?	\N
912	Plantae	1	Plantae	Fungi	Animalia	Protista	Which kingdom includes multicellular autotrophs?	\N
913	Clotting	1	Oxygen transport	Carrying nutrients	Fighting infections	Clotting	What is the function of platelets in the blood?	\N
914	Liver	1	Heart	Stomach	Liver	Lungs	Which organ filters toxins from the blood?	\N
915	Axon	2	Synapse	Soma	Dendrite	Axon	Which part of the neuron carries signals away from the cell body?	\N
916	Nitrogen fixation	2	Denitrification	Photosynthesis	Transpiration	Nitrogen fixation	Which process describes the conversion of nitrogen gas into ammonia by bacteria?	\N
917	mRNA	2	tRNA	DNA polymerase	mRNA	rRNA	Which molecule carries genetic instructions from DNA to the ribosome?	\N
918	Tendon	2	Fascia	Ligament	Cartilage	Tendon	Which structure in the human body connects muscles to bones?	\N
919	Immune defense and fluid balance	3	Protein digestion	Immune defense and fluid balance	Blood sugar regulation	Oxygen transport	What is the function of the lymphatic system?	\N
920	Nitrogen	2	Oxygen	Carbon dioxide	Nitrogen	Argon	Which gas is the primary component of Earth's atmosphere?	\N
921	Control involuntary bodily functions	2	Process sensory information	Control involuntary bodily functions	Control muscle contraction	Regulate voluntary movement	What is the primary function of the autonomic nervous system?	\N
922	Igneous	1	Igneous	Metamorphic	Basaltic	Sedimentary	Which type of rock is formed from cooled lava or magma?	\N
923	Rainforest	2	Savanna	Tundra	Desert	Rainforest	Which biome is characterized by high biodiversity and a warm, wet climate?	\N
925	Surah Al-Baqarah, Ayah 282	1	Surah Al-Baqarah, Ayah 255	Surah Al-Ma'idah, Ayah 3	Surah Al-Baqarah, Ayah 282	Surah An-Nisa, Ayah 59	Which Surah of the Qur'an contains the longest verse?	\N
926	Prophet Musa (AS)	1	Prophet Ibrahim (AS)	Prophet Muhammad (PBUH)	Prophet Musa (AS)	Prophet Isa (AS)	Which Prophet is mentioned the most times in the Qur'an?	\N
927	86	1	82	86	90	92	What is the total number of Makki Surahs in the Qur'an?	\N
928	Battle of Badr	2	Battle of Uhud	Battle of Khyber	Battle of Badr	Battle of Hunain	Which battle is also known as "Ghazwat al-Furqan" (The Battle of Criterion)?	\N
929	Hazrat Sumayyah (RA)	1	Hazrat Aisha (RA)	Hazrat Fatima (RA)	Hazrat Sumayyah (RA)	Hazrat Khadija (RA)	Who was the first female martyr in Islam?	\N
930	6 AH	1	5 AH	6 AH	7 AH	8 AH	In which Hijri year did the Treaty of Hudaibiya take place?	\N
931	Surah An-Nisa	2	Surah Al-Baqarah	Surah An-Nisa	Surah Al-Ma'idah	Surah Ar-Rum	Which Surah is called "Surah al-Nikah" as it discusses marriage laws in detail?	\N
932	Hazrat Khalid bin Waleed (RA)	2	Hazrat Umar (RA)	Hazrat Ali (RA)	Hazrat Khalid bin Waleed (RA)	Hazrat Abu Ubaidah bin Jarrah (RA)	Who was given the title of "Saifullah" (Sword of Allah)?	\N
933	4	2	2	4	6	5	How many times is the name of Prophet Muhammad (PBUH) mentioned in the Qur'an?	\N
934	Surah Al-Ahzab	2	Surah An-Nisa	Surah Al-Noor	Surah Al-Ahzab	Surah Al-Mujadilah	Which Surah contains the first commandment of Hijab?	\N
935	Hazrat Khadija (RA)	3	Hazrat Aisha (RA)	Hazrat Khadija (RA)	Hazrat Hafsa (RA)	Hazrat Umm Salama (RA)	Which wife of Prophet Muhammad (PBUH) was known as the "Mother of the Believers" and was the first to accept Islam?	\N
936	6236	1	5883	7348	6233	6237	How many verses are in the Qur'an?	\N
937	Trials and tribulations of faith	1	Importance of Salah	Trials and tribulations of faith	Laws of inheritance	Rewards of Jannah	What is the main theme of Surah Al-Kahf?	\N
938	Prophet Ibrahim (AS)	2	Prophet Musa (AS)	Prophet Isa (AS)	Prophet Ibrahim (AS)	Prophet Muhammad (PBUH)	Which Prophet is associated with the construction of the Kaaba?	\N
939	Battle of Ahzab	1	Battle of Hunain	Battle of Khyber	Battle of Ahzab	Battle of Tabuk	Which battle is known as "The Battle of the Trench"?	\N
940	8	2	5	6	8	10	How many categories of people are eligible to receive Zakat according to the Qur'an?	\N
941	Angel Azrael	2	Angel Jibreel	Angel Mikail	Angel Azrael	Angel Israfil	What is the name of the Angel responsible for taking souls at the time of death?	\N
942	Imam Bukhari	2	Imam Muslim	Imam Abu Dawood	Imam Bukhari	Imam Tirmidh	Which Islamic scholar is credited with compiling the most authentic Hadith collection, Sahih al-Bukhari?	\N
943	40 years	2	35 years	38 years	40 years	42 years	What was the age of Prophet Muhammad (PBUH) when he received the first revelation?	\N
944	Battle of Ahzab	3	Battle of Uhud	Battle of Khyber	Battle of Ahzab	Battle of Hunain	During which battle did the Muslim army employ the strategy of digging a trench around Madinah?	\N
945	Surah Al-Ikhlas	2	Surah Al-Fatiha	Surah Al-Baqarah	Surah Al-Ikhlas	Surah Al-Mulk	Which Surah of the Qur'an is equivalent to one-third of the entire Qur'an in terms of reward?	\N
946	Treaty of Medina	3	Treaty of Hudaybiyyah	Treaty of Medina	Treaty of Aqabah	Treaty of Khyber	What was the first treaty signed between Muslims and non-Muslims, granting peace and religious freedom to all communities?	\N
947	15 AH	2	10 AH	12 AH	15 AH	18 AH	In which Hijri year did the Battle of Yarmouk take place, leading to the Muslim conquest of the Levant?	\N
948	Saad ibn Abi Waqqas (RA)	2	Khalid bin Walid (RA)	Saad ibn Abi Waqqas (RA)	Amr bin Aas (RA)	Abdullah bin Masood (RA)	Who was the first person to be appointed as the governor of Kufa by Hazrat Umar (RA)?	\N
949	Prophet Yunus (AS)	2	Prophet Ayub (AS)	Prophet Yunus (AS)	Prophet Zakariya (AS)	Prophet Shuaib (AS)	Which Prophet was swallowed by a whale as a test of patience and devotion to Allah?	\N
950	32 times	1	25 times	32 times	40 times	45 times	How many times is the word "Zakat" mentioned in the Qur'an?	\N
951	Hazrat Umar (RA)	2	Hazrat Abu Bakr (RA)	Hazrat Umar (RA)	Hazrat Uthman (RA)	Hazrat Ali (RA)	Which Caliph established the Islamic calendar, beginning with the Hijra of Prophet Muhammad (PBUH)?	\N
952	Hazrat Ali (RA)	2	Hazrat Umar (RA)	Hazrat Abu Bakr (RA)	Hazrat Ali (RA)	Hazrat Muadh bin Jabal (RA)	Who was the first Qazi (chief judge) in Islamic history, appointed by Prophet Muhammad (PBUH)?	\N
953	Surah An-Nisa	2	Surah Al-Baqarah	Surah An-Nisa	Surah Al-Ma'idah	Surah Al-Ahzab	Which Surah in the Qur'an discusses the laws of inheritance in the most detail?	\N
954	To suppress apostasy and rebellion	2	To conquer Persia	To spread Islam in Egypt	To suppress apostasy and rebellion	To fight against the Byzantines	What was the main purpose of the Ridda Wars fought during the Caliphate of Hazrat Abu Bakr (RA)?	\N
955	99	2	70	80	99	110	How many names of Allah (Asma'ul Husna) are mentioned directly in the Qur'an?	\N
956	Battle of Badr	3	Battle of Uhud	Battle of Khyber	Battle of Badr	Battle of Hunain	Which battle is also called the "Mother of All Battles" due to its significance in early Islamic history?	\N
957	Ibn al-Haytham	2	Al-Khwarizmi	Al-Razi	Ibn al-Haytham	Ibn Sina	Which famous Muslim scientist wrote the book "Kitab al-Manazir" (Book of Optics)?	\N
958	Surah Al-Isra	2	Surah Al-Anbiya	Surah Al-Isra	Surah Al-Qamar	Surah Al-Ma'arij	Which Qur'anic Surah describes the event of "Isra and Miraj" (Night Journey and Ascension)?	\N
959	Al-Farabi	3	Ibn Sina	Al-Farabi	Al-Ghazali	Ibn Rushd	Which Islamic philosopher is known for his contributions to logic, medicine, and philosophy, earning the title "The Second Teacher" after Aristotle?	\N
960	4	2	3	4	5	6	What is the total number of prohibited months in Islam where fighting is forbidden?	\N
961	80 lashes	2	50 lashes	80 lashes	100 lashes	Death penalty	What is the punishment for falsely accusing a chaste woman of adultery in Islamic law?	\N
962	Asma bint Abu Bakr (RA)	1	Hazrat Aisha (RA)	Asma bint Abu Bakr (RA)	Hazrat Hafsa (RA)	Hazrat Umm Salama (RA)	Which companion of the Prophet (PBUH) is known as "The Man with Two Belts"?	\N
963	Battle of Badr	2	Battle of Uhud	Battle of Khyber	Battle of Badr	Battle of Tabuk	Which battle is mentioned in the Quran with the words "Yawma al-Furqan" (The Day of Criterion)?	\N
964	Guidelines for dealing with non-Muslims in war and peace	2	Inheritance laws	Dietary prohibitions	Guidelines for dealing with non-Muslims in war and peace	Family ethics	What is the primary theme of Surah Al-Mumtahina?	\N
965	Zaid bin Thabit (RA)	3	Abdullah bin Masood (RA)	Zaid bin Thabit (RA)	Abu Huraira (RA)	Ubayy bin Ka'b (RA)	Which companion of Prophet Muhammad (PBUH) compiled the first official Mushaf (written copy of the Quran) during the Caliphate of Hazrat Abu Bakr (RA)?	\N
966	Maryam (AS)	1	Aasiya (AS)	Maryam (AS)	Khadija (RA)	Fatima (RA)	Who is the only woman mentioned by name in the Quran?	\N
1154	4	1	2	4	16	8	A set of data has a variance of 16. What is the standard deviation?	\N
967	Battle of Ahzab	3	Battle of Hunain	Battle of Ahzab	Battle of Tabuk	Battle of Khandaq	Which battle is also known as the "Battle of the Confederates" due to the alliance of Quraysh and other tribes?	\N
968	Prophet Musa (AS)	2	Prophet Isa (AS)	Prophet Yusuf (AS)	Prophet Musa (AS)	Prophet Nuh (AS)	Which Prophet is also known as “Kalimullah” (The one who spoke directly with Allah)?	\N
969	Mus'ab bin Umair (RA)	2	Zubair bin Awwam (RA)	Mus'ab bin Umair (RA)	Abu Ubaidah bin Jarrah (RA)	Saad bin Abi Waqqas (RA)	Who was the first ambassador sent by Prophet Muhammad (PBUH) to Medina before Hijrah?	\N
970	Abu Lahab’s opposition to Islam and Prophet Muhammad (PBUH)	2	The laws of inheritance	The story of Prophet Ibrahim (AS)	Abu Lahab’s opposition to Islam and Prophet Muhammad (PBUH)	The importance of patience	What was the main reason behind the revelation of Surah Lahab?	\N
971	Hazrat Uthman (RA)	2	Hazrat Abu Bakr (RA)	Hazrat Umar (RA)	Hazrat Uthman (RA)	Hazrat Ali (RA)	Which Caliph was assassinated while reciting the Quran at his home?	\N
972	"Read! In the name of your Lord who created" (Surah Al-Alaq)	1	"By the time! Verily, man is in loss" (Surah Al-Asr)	"Say, He is Allah, One" (Surah Al-Ikhlas)	"Read! In the name of your Lord who created" (Surah Al-Alaq)	"Verily, We have sent it down in the Night of Decree" (Surah Al-Qadr)	What was the first verse revealed to Prophet Muhammad (PBUH)?	\N
973	Fakhr al-Din al-Razi	2	Ibn Taymiyyah	Fakhr al-Din al-Razi	Al-Tabari	Al-Qurtubi	Which famous Islamic scholar is known for his commentary on the Quran titled "Tafsir al-Kabir"?	\N
974	3	2	2	3	4	10	What is the minimum number of people required for a congregational Friday (Jumu'ah) prayer?	\N
976	Sugarcane juice	1	Lassi	Tea	Coffee	Milk	What is the national drink of Pakistan?	\N
977	Faisalabad	1	Karachi	Lahore	Sialkot	Multan	Which city is known as the 'Manchester of Pakistan'?	\N
978	Amiruddin Kidwai	1	Allama Iqbal	Liaquat Ali Khan	Muhammad Ali Jinnah	Abdur Rab Nishtar	Who designed the national flag of Pakistan?	\N
979	India	1	China	Iran	Afghanistan	Bangladesh	Which country shares the longest border with Pakistan?	\N
980	Field Hockey	1	Cricket	Football	Kabaddi	Squash	What is the national sport of Pakistan?	\N
981	British India	2	Hindustan	Indus Valley	United India	East India	What was the name of Pakistan before 1947?	\N
982	Benazir Bhutto	2	Fatima Jinnah	Hina Rabbani Khar	Shireen Mazari	Asma Jahangir	Who was the first female Prime Minister of Pakistan?	\N
983	Nishan-e-Pakistan	2	Sitara-e-Jurat	Hilal-e-Imtiaz	Tamgha-e-Imtiaz	Pride of Performance	What is the highest civil award in Pakistan?	\N
984	Sialkot	2	Lahore	Faisalabad	Karachi	Rawalpindi	Which Pakistani city is known for producing sports goods?	\N
985	Abdul Rashid	2	Cornelius	Muhammad Munir	A.R. Cornelius	Iftikhar Chaudhry	Who was the first Chief Justice of Pakistan?	\N
986	1960 Indus Water Treaty	3	Simla Agreement	Tashkent Agreement	Geneva Accord	Delhi Pact	Which agreement led to the Indus Water Treaty?	\N
987	Zulfikar Ali Bhutto	3	Ayub Khan	Benazir Bhutto	Pervez Musharraf	Liaquat Ali Khan	Which Pakistani leader nationalized major industries in the 1970s?	\N
988	Project-706	3	Operation Kahuta	Chagai-I	Green Project	Nuclear Shield	What is the official name of Pakistan's nuclear program?	\N
989	Dawn	3	Jang	The Nation	Express Tribune	Pakistan Times	Which is the oldest newspaper in Pakistan?	\N
990	23 March 1956	3	14 August 1947	16 December 1971	8 June 1962	10 April 1973	When did Pakistan become a republic?	\N
991	14 August 1947	1	15 August 1947	23 March 1940	26 January 1950	14 August 1948	When did Pakistan gain independence?	\N
992	Muhammad Ali Jinnah	1	Liaquat Ali Khan	Allama Iqbal	Ayub Khan	Iskander Mirza	Who was the first Governor-General of Pakistan?	\N
993	Urdu	1	English	Punjabi	Sindhi	Pashto	What is the national language of Pakistan?	\N
994	Islamabad	1	Karachi	Lahore	Peshawar	Quetta	What is the capital of Pakistan?	\N
995	Muhammad Ali Jinnah	1	Liaquat Ali Khan	Allama Iqbal	Benazir Bhutto	Zulfikar Ali Bhutto	Who is known as the Father of the Nation in Pakistan?	\N
996	Pakistani Rupee	1	Indian Rupee	Dollar	Euro	Pound	Which currency is used in Pakistan?	\N
997	Lahore	1	Karachi	Islamabad	Peshawar	Quetta	Which city is called the 'City of Gardens' in Pakistan?	\N
998	23 March	1	14 August	25 December	6 September	21 April	Which day is celebrated as Pakistan Day?	\N
999	Jasmine	1	Rose	Tulip	Sunflower	Lily	What is the national flower of Pakistan?	\N
1000	Markhor	1	Tiger	Elephant	Lion	Horse	What is the national animal of Pakistan?	\N
1001	Demand for a separate Muslim state	2	Support for British rule	Agreement between Hindus and Muslims	Formation of Indian National Congress	Declaration of Pakistan's independence	What was the Lahore Resolution of 1940?	\N
1002	Indus River	2	Jhelum River	Ravi River	Chenab River	Sutlej River	Which river is the longest in Pakistan?	\N
1003	Abdus Salam	2	Dr. AQ Khan	Pervez Hoodbhoy	Atta-ur-Rahman	Salimuzzaman Siddiqui	Which Pakistani scientist won the Nobel Prize in Physics?	\N
1004	Karachi	2	Lahore	Islamabad	Peshawar	Quetta	Which city is called the 'City of Lights' in Pakistan?	\N
1005	23 March 1956	2	14 August 1947	16 December 1971	8 June 1962	10 April 1973	What was the first constitution of Pakistan enforced?	\N
1006	Balochistan	2	Punjab	Sindh	Khyber Pakhtunkhwa	Gilgit-Baltistan	Which province is the largest in Pakistan by area?	\N
1007	Karakoram	2	Himalayas	Hindu Kush	Margalla Hills	Sulaiman Range	Which mountain range is the K2 peak located in?	\N
1008	Punjab	2	Sindh	Balochistan	Khyber Pakhtunkhwa	Gilgit-Baltistan	Which is the smallest province of Pakistan by area?	\N
1009	Allama Iqbal	2	Faiz Ahmed Faiz	Ahmed Faraz	Habib Jalib	Mir Taqi Mir	What is the name of Pakistan's national poet?	\N
1010	Younis Khan	2	Inzamam-ul-Haq	Javed Miandad	Misbah-ul-Haq	Hanif Mohammad	Which Pakistani cricketer has the highest number of Test centuries?	\N
1011	Iskander Mirza	3	Liaquat Ali Khan	Zulfikar Ali Bhutto	Ayub Khan	Yahya Khan	Who was the first President of Pakistan?	\N
1012	Zulfikar Ali Bhutto	3	Liaquat Ali Khan	Benazir Bhutto	Pervez Musharraf	Imran Khan	Which Pakistani leader gave the famous speech at the UN in 1965?	\N
1013	To resolve conflicts between India and Pakistan	3	To declare war	To make Kashmir independent	To sign a trade deal	To create a nuclear treaty	What was the purpose of the Simla Agreement of 1972?	\N
1014	16 December 1971	3	23 March 1971	14 August 1947	6 September 1965	11 March 1972	When did East Pakistan become Bangladesh?	\N
1015	2nd Amendment	3	1st Amendment	3rd Amendment	5th Amendment	8th Amendment	Which constitutional amendment made Pakistan an Islamic Republic?	\N
1016	3,323 km	3	2,900 km	3,000 km	3,500 km	2,700 km	What is the total length of the Pakistan-India border?	\N
1017	1998	3	1990	2000	1985	2005	Which year did Pakistan conduct its first nuclear tests?	\N
1018	Operation Searchlight	3	Operation Gibraltar	Operation Grand Slam	Operation Chengiz Khan	Operation Blue Star	Which operation led to the separation of East Pakistan?	\N
1019	14 August 1947	1	15 August 1947	23 March 1940	26 January 1950	14 August 1947	When was Pakistan founded?	\N
1020	Pakistan Resolution	1	Delhi Pact	Nehru Report	Cabinet Mission Plan	Lucknow Pact	What was the Lahore Resolution of 1940 also known as?	\N
1021	Liaquat Ali Khan	1	Ayub Khan	Zulfikar Ali Bhutto	Benazir Bhutto	Nawaz Sharif	Who was the first Prime Minister of Pakistan?	\N
1022	Urdu	1	Punjabi	Sindhi	Pashto	Balochi	Which is the national language of Pakistan?	\N
1023	881,913 sq km	2	700,000 sq km	1,000,000 sq km	900,000 sq km	750,000 sq km	What is the total area of Pakistan?	\N
1024	1956	2	1949	1962	1973	1985	In which year was the first constitution of Pakistan enacted?	\N
1025	K2	1	Nanga Parbat	Mount Everest	Tirich Mir	Rakaposhi	What is the name of Pakistan’s highest peak?	\N
1026	India	2	Afghanistan	China	Iran	Bangladesh	The Indus Waters Treaty was signed between Pakistan and which country?	\N
1027	Sir Syed Ahmed Khan	2	Muhammad Ali Jinnah	Allama Iqbal	Liaquat Ali Khan	Maulana Shaukat Ali	Who presented the 'Two-Nation Theory'?	\N
1028	1971	2	1965	1956	1980	1999	When did Bangladesh separate from Pakistan?	\N
1029	Islamabad	1	Karachi	Lahore	Peshawar	Quetta	What is the capital city of Pakistan?	\N
1030	Karachi	1	Lahore	Islamabad	Faisalabad	Rawalpindi	Which city is known as the economic hub of Pakistan?	\N
1031	Indus River	1	Jhelum River	Ravi River	Chenab River	Sutlej River	Which is the longest river in Pakistan?	\N
1032	1958	2	1949	1962	1977	1999	When was the first Martial Law imposed in Pakistan?	\N
1033	Simla Agreement	3	Tashkent Agreement	Delhi Agreement	Geneva Accords	Lahore Declaration	Which agreement led to the creation of Bangladesh?	\N
1034	Lahore	1	Karachi	Islamabad	Multan	Peshawar	Which Pakistani city is called the 'City of Gardens'?	\N
1035	Allama Iqbal	1	Faiz Ahmed Faiz	Habib Jalib	Josh Malihabadi	Mirza Ghalib	What is the name of Pakistan’s national poet?	\N
1036	Karachi	1	Lahore	Islamabad	Peshawar	Quetta	Which Pakistani city is known as the 'City of Lights'?	\N
1037	Jasmine	1	Rose	Sunflower	Lily	Tulip	What is the name of Pakistan’s national flower?	\N
1038	Thar Desert	2	Sahara Desert	Kalahari Desert	Gobi Desert	Atacama Desert	Which desert is located in Pakistan?	\N
1039	Markhor	1	Lion	Tiger	Snow Leopard	Wolf	What is the name of Pakistan’s national animal?	\N
1040	Nawaz Sharif	2	Benazir Bhutto	Yousaf Raza Gillani	Shaukat Aziz	Zulfikar Ali Bhutto	Which Pakistani Prime Minister was dismissed in 1993?	\N
1041	Balochistan	1	Punjab	Sindh	Khyber Pakhtunkhwa	Gilgit-Baltistan	Which province of Pakistan is the largest by area?	\N
1042	Maulana Mohammad Ali Jauhar	2	Allama Iqbal	Sir Syed Ahmed Khan	Liaquat Ali Khan	Muhammad Ali Jinnah	Who was the founder of the Khilafat Movement in the subcontinent?	\N
1043	Liaquat Ali Khan	3	Zulfikar Ali Bhutto	Benazir Bhutto	Iskander Mirza	Ayub Khan	Which Pakistani leader was assassinated in Rawalpindi in 1951?	\N
1044	1962	2	1956	1973	1985	1999	When was the second constitution of Pakistan enacted?	\N
1045	Iran	2	Saudi Arabia	Turkey	China	Afghanistan	Which country was the first to recognize Pakistan after independence?	\N
1046	Chenab River	2	Jhelum River	Ravi River	Sutlej River	Beas River	Which river is the largest tributary of the Indus River?	\N
1047	Faisalabad	1	Karachi	Lahore	Multan	Sialkot	Which Pakistani city is known as the 'Manchester of Pakistan'?	\N
1048	Zulfikar Ali Bhutto	2	Ayub Khan	Pervez Musharraf	Liaquat Ali Khan	Benazir Bhutto	Which Pakistani leader nationalized industries in the 1970s?	\N
1049	Nishan-e-Haider	1	Sitara-e-Jurat	Tamgha-e-Shujaat	Hilal-e-Imtiaz	Tamgha-e-Imtiaz	What is the name of the highest military award in Pakistan?	\N
1050	Liaquat Ali Khan’s speech	3	First Constitution	Creation of Bangladesh	Partition of India	Simla Agreement	Which event led to the creation of the Objective Resolution?	\N
1051	2019	3	2006	2012	2021	1993	When was the Reko Diq agreement signed?	\N
1052	Lahore Declaration	3	Simla Agreement	Tashkent Agreement	Delhi Pact	Agra Summit	Which agreement ended the Kargil conflict?	\N
1053	Ayub Khan	3	Yahya Khan	Zia-ul-Haq	Pervez Musharraf	Tikka Khan	Who was the first Chief Martial Law Administrator of Pakistan?	\N
1054	World Bank	3	United Nations	USA	China	UK	Which country mediated the Indus Waters Treaty between India and Pakistan?	\N
1055	Infiltration in Kashmir	3	Defense against India	Nuclear tests	Military coup	Economic reforms	What was the main objective of Operation Gibraltar?	\N
1056	Captain Raja Sarwar	3	Major Aziz Bhatti	Havildar Lalak Jan	Pilot Officer Rashid Minhas	Naik Saif Ali Janjua	Who was the first Pakistani to receive the Nishan-e-Haider?	\N
1057	Gilgit-Baltistan	3	FATA	Balochistan	Sindh	Khyber Pakhtunkhwa	Which province was last to be merged into Pakistan’s constitutional framework?	\N
1058	Dr. Abdul Qadeer Khan	3	Dr. Samar Mubarakmand	Dr. Atta-ur-Rahman	Dr. Pervez Hoodbhoy	Dr. Ishfaq Ahmad	Who was the mastermind behind Pakistan’s nuclear program?	\N
1060	O(log n)	2	O(n)	O(n log n)	O(log n)	O(1)	What is the time complexity of binary search in a sorted array?	\N
1061	Stack	1	Linked List	Stack	Queue	Heap	Which data structure follows LIFO?	\N
1062	Bubble Sort	2	Heap Sort	Bubble Sort	Quick Sort	Merge Sort	Which sorting algorithm has the worst-case time complexity of O(n^2)?	\N
1063	HyperText Transfer Protocol	1	Hyper Transfer Text Protocol	HyperText Transfer Protocol	Hyperlink Transfer Process	HyperText Transmission Protocol	What does HTTP stand for?	\N
1064	Network Layer	2	Data Link Layer	Transport Layer	Network Layer	Application Layer	Which layer of the OSI model handles routing?	\N
1065	443	1	22	443	80	21	What is the default port for HTTPS?	\N
1066	HTML	2	HTML	Python	C++	Java	Which of the following is not a programming language?	\N
1067	Stack	3	Stack	Array	Queue	Heap	Which data structure is used for implementing recursion?	\N
1068	AND	2	XOR	NAND	OR	AND	Which logical gate outputs true only if both inputs are true?	\N
1069	Random Access Memory	1	Random Access Memory	Read Access Memory	Runtime Allocation Memory	Rapid Access Memory	What does RAM stand for?	\N
1070	O(n^2)	2	O(n log n)	O(n)	O(n^2)	O(log n)	What is the worst-case time complexity of QuickSort?	\N
1071	Java	2	Java	Swift	C#	Kotlin	Which language is primarily used for developing Android apps?	\N
1072	MongoDB	1	MySQL	PostgreSQL	SQLite	MongoDB	Which of these is an example of NoSQL database?	\N
1073	ALU	2	Cache	ALU	Control Unit	Registers	Which part of the CPU is responsible for arithmetic operations?	\N
1074	SMTP	1	HTTP	SNMP	FTP	SMTP	Which protocol is used to send email?	\N
1075	Convert source code to machine code	1	Execute code line by line	Manage network requests	Store data in memory	Convert source code to machine code	What is the function of a compiler?	\N
1076	Algorithm efficiency	1	Algorithm efficiency	Database indexing	Memory usage	Programming language complexity	What does 'Big O' notation describe?	\N
1077	Huffman Coding	1	MPEG	JPEG	Huffman Coding	MP3	Which is a lossless compression algorithm?	\N
1078	Phishing	2	Caching	Phishing	Rendering	Compiling	Which of the following is a cybersecurity attack?	\N
1079	Manage hardware and software resources	3	Manage hardware and software resources	Create databases	Execute network protocols	Run a specific application	What is the primary function of an operating system?	\N
1080	Worm	2	Trojan	Spyware	Worm	Virus	What type of malware replicates itself without user intervention?	\N
1081	Recursion	1	Encapsulation	Recursion	Inheritance	Polymorphism	Which of these is not an OOP principle?	\N
1082	Round Robin	1	FCFS	Priority Scheduling (non-preemptive)	SJF (non-preemptive)	Round Robin	Which scheduling algorithm is preemptive?	\N
1083	A key that links two tables	1	A key that links two tables	A duplicate key	A primary key	A randomly generated key	What is a foreign key in a database?	\N
1084	Fibonacci sequence	2	Stack operations	Merge Sort	Fibonacci sequence	Binary search	What is an example of a dynamic programming problem?	\N
1085	Scalability	3	Slower performance	Lower security	Limited accessibility	Scalability	What is a major advantage of using cloud computing?	\N
1086	Python	2	Python	JavaScript	Swift	C	Which programming language is used for machine learning?	\N
1087	Transmission Control Protocol	1	Transfer Communication Protocol	Transport Computer Protocol	Transmission Control Protocol	Telecommunication Control Protocol	What does TCP stand for?	\N
1088	Deriving a class from another	1	Deriving a class from another	Hiding data	Polymorphism	Encapsulation	What does 'inheritance' mean in OOP?	\N
1089	WAN	2	MAN	WAN	LAN	PAN	Which type of network covers the largest geographical area?	\N
1090	Generating fixed-size output	1	Generating fixed-size output	Storing large files	Encrypting messages	Sorting an array	What is a hash function used for?	\N
1091	Python	2	C	Python	Java	C++	Which of the following is an interpreted language?	\N
1092	SELECT	2	SELECT	ALTER	UPDATE	DELETE	Which SQL command is used to retrieve data?	\N
1093	Rendering	1	Unit Testing	Rendering	Integration Testing	System Testing	Which of these is not a type of software testing?	\N
1094	Application Programming Interface	1	Automated Process Integration	Application Protocol Interface	Application Programming Interface	Advanced Program Implementation	What does API stand for?	\N
1095	Priority Queue	2	Array	Stack	Linked List	Priority Queue	Which data structure is best for implementing Dijkstra’s algorithm?	\N
1096	Round Robin	1	Round Robin	FCFS	SJF	Priority Scheduling	Which scheduling algorithm assigns time slices?	\N
1097	XOR	2	AND	XOR	NOR	OR	Which logic gate produces a 1 only when inputs differ?	\N
1098	Secure internet access	1	Faster internet speed	Data compression	File encryption	Secure internet access	What is a VPN used for?	\N
1099	A theoretical computational model	1	A programming language	A theoretical computational model	A security protocol	A type of network	What is a Turing machine?	\N
1100	Haskell	2	Java	Perl	C++	Haskell	Which of these is a functional programming language?	\N
1101	Encryption	1	Encryption	Sorting	Rendering	Compiling	Which technique is used in cryptography?	\N
1102	AWS	1	Windows OS	Java	MS Excel	AWS	Which of these is an example of cloud computing?	\N
1103	Linux	1	Adobe Photoshop	Microsoft Word	Windows	Linux	Which of these is an example of open-source software?	\N
1104	Translates domain names to IP addresses	1	Encrypts emails	Optimizes web performance	Manages cloud computing	Translates domain names to IP addresses	What does DNS do?	\N
1105	Merge Sort	2	Merge Sort	Bubble Sort	Selection Sort	Insertion Sort	Which sorting algorithm has the best average-case time complexity?	\N
1106	O(log n)	2	O(1)	O(n log n)	O(log n)	O(n)	What is the time complexity of searching in a balanced binary search tree?	\N
1107	ROM	2	Cache	ROM	Register	RAM	Which of the following is an example of a non-volatile memory?	\N
1108	Stack	2	Heap	Graph	Stack	Queue	Which data structure uses LIFO (Last In, First Out) order?	\N
1109	HTTPS	2	FTP	HTTPS	HTTP	SMTP	Which of the following protocols is used for secure communication over the Internet?	\N
1110	O(n^2)	2	O(n^2)	O(n log n)	O(log n)	O(n)	In Big-O notation, what is the worst-case complexity of QuickSort?	\N
1111	Object-Oriented Programming	2	Object-Oriented Programming	Functional Programming	Procedural Programming	Logic Programming	Which programming paradigm focuses on objects and their interactions?	\N
1112	Structured Query Language	1	Structured Query Language	Standard Query Language	System Query Language	Sequential Query Language	What does SQL stand for?	\N
1113	Hierarchical Database	3	Object-Oriented Database	Relational Database	NoSQL Database	Hierarchical Database	Which type of database model organizes data in a tree-like structure?	\N
1114	Heap	2	Array	Heap	Stack	Linked List	Which data structure is typically used for implementing priority queues?	\N
1115	Prevent unauthorized access	3	Encrypt data	Increase internet speed	Prevent unauthorized access	Monitor hardware performance	What is the primary purpose of a firewall in network security?	\N
1116	Assembly	2	Java	Python	C#	Assembly	Which of the following is an example of a low-level programming language?	\N
1117	16	2	2	10	16	8	What is the base of the hexadecimal number system?	\N
1118	RSA	1	DES	AES	RSA	SHA-256	Which algorithm is used in public-key cryptography?	\N
1119	Processes are stuck waiting for resources held by each other	2	Multiple processes share the same resource	Processes are stuck waiting for resources held by each other	The system runs out of memory	A process exceeds its allocated memory	Which of the following best describes a deadlock in operating systems?	\N
1120	Stack	2	Graph	Stack	Array	Queue	Which data structure is used to implement recursion?	\N
1121	80	3	80	25	21	443	What is the default port number for HTTP?	\N
1122	Star	2	Bus	Mesh	Star	Ring	Which type of network topology is characterized by a single point of failure?	\N
1123	AND	1	XOR	NAND	AND	OR	Which logic gate returns true if both inputs are true?	\N
1124	Converts source code to machine code	1	Manages memory allocation	Translates code at runtime	Converts source code to machine code	Executes code line by line	What does a compiler do?	\N
1125	malloc()	2	int a[10];	char str[20];	malloc()	int x = 5;	Which of the following is an example of dynamic memory allocation in C?	\N
1126	Elements are stored in non-contiguous memory locations	1	Elements are stored in non-contiguous memory locations	Elements have a fixed size	Elements are stored in an array	Elements are stored in contiguous memory locations	What is the key characteristic of a linked list?	\N
1127	ALU	2	ALU	Cache	Control Unit	Register	Which component of the CPU is responsible for executing instructions?	\N
1128	Manages CPU execution of processes	1	Allocates memory to processes	Manages CPU execution of processes	Handles device input/output	Manages user authentication	What is the function of the OS scheduler?	\N
1129	Huffman Coding	2	MPEG	JPEG	Huffman Coding	MP3	Which of the following is an example of a lossless compression algorithm?	\N
1130	Redundant Array of Independent Disks	1	Rapid Automated Input Device	Remote Automated Intelligent Disk	Redundant Array of Independent Disks	Random Access Integrated Data	What does RAID stand for in computer storage?	\N
1131	Man-in-the-Middle Attack	2	Phishing Attack	SQL Injection	Man-in-the-Middle Attack	Denial of Service Attack	Which type of attack involves intercepting communication between two parties?	\N
1132	NoSQL	1	Object-Oriented	Hierarchical	NoSQL	Relational	Which type of database does MongoDB use?	\N
1133	Uniquely identifies a device on a network	1	Controls network traffic speed	Uniquely identifies a device on a network	Stores website content	Encrypts data for transmission	What is the function of an IP address?	\N
1134	Python	2	C	Java	Swift	Python	Which programming language is commonly used for AI development?	\N
1135	404	1	500	403	200	404	Which HTTP status code indicates 'Not Found'?	\N
1136	Decision Tree	2	Decision Tree	Stack	Bubble Sort	Merge Sort	Which of the following is a machine learning algorithm?	\N
1137	Allow communication between software applications	1	Run background tasks	Allow communication between software applications	Manage computer memory	Optimize web page performance	What is the purpose of an API?	\N
1138	Presentation Layer	2	Network Layer	Session Layer	Presentation Layer	Transport Layer	Which layer of the OSI model is responsible for encryption?	\N
1139	Converts domain names to IP addresses	1	Optimizes web content	Manages network bandwidth	Converts domain names to IP addresses	Encrypts internet traffic	What is the function of DNS?	\N
1140	MySQL	2	Cassandra	Redis	MongoDB	MySQL	Which of the following is an example of a relational database?	\N
1141	R	2	Swift	C#	PHP	R	Which programming language is mainly used for statistical computing?	\N
1142	O(log n)	3	O(log n)	O(n)	O(1)	O(n^2)	What is the time complexity of binary search?	\N
1143	Round Robin	2	SJF	Round Robin	Multilevel Queue	FCFS	Which scheduling algorithm is used in real-time operating systems?	\N
1144	Uniquely identifies each record	2	Represents foreign data	Uniquely identifies each record	Stores duplicate values	Holds numerical data only	Which of the following is a primary key characteristic?	\N
1145	Reduce access time to frequently used data	1	Increase system storage capacity	Reduce access time to frequently used data	Encrypt data	Store all system data	What is the main purpose of a cache memory?	\N
1146	Mutex	3	Pointer	Mutex	Loop	Stack	Which technique is used to avoid race conditions in concurrent programming?	\N
1147	Python	2	C++	C	Java	Python	Which of the following is an example of an interpreted language?	\N
1148	Distribute network traffic across multiple servers	2	Encrypt data	Increase bandwidth speed	Distribute network traffic across multiple servers	Reduce packet loss	What is the function of a load balancer in networking?	\N
1150	2	2	1.5	3	2.5	2	A dataset has a mean of 50 and a standard deviation of 10. What is the z-score of a value 70?	\N
1151	0.75	3	0.5	0.85	0.75	0.25	If the probability of an event occurring is 0.25, what is the probability of it not occurring?	\N
1152	Mean	2	Range	Median	Mean	Mode	Which measure of central tendency is most affected by extreme values?	\N
1153	68%	3	50%	68%	95%	99%	In a normal distribution, approximately what percentage of data falls within one standard deviation of the mean?	\N
1155	Median	2	Range	Variance	Median	Standard Deviation	Which of the following is NOT a measure of dispersion?	\N
1156	3/8	2	5/8	1/2	1/4	3/8	A coin is flipped 3 times. What is the probability of getting exactly 2 heads?	\N
1157	Simple Random Sampling	3	Simple Random Sampling	Systematic Sampling	Cluster Sampling	Stratified Sampling	What type of sampling method is used when every member of a population has an equal chance of being selected?	\N
1158	Mean	2	Median	Mean	Mode	None, all are equal	If a dataset is skewed to the right, which measure of central tendency is the highest?	\N
1159	Binomial	3	Poisson	Normal	Exponential	Binomial	Which distribution is used to model the number of successes in a fixed number of independent trials?	\N
1160	Q3 - Q1	1	Q3 / Q1	Q3 + Q1	Q1 - Q3	Q3 - Q1	The interquartile range (IQR) is calculated as:	\N
1161	Type I Error	2	Type II Error	Type I Error	P-value	Power of the test	In hypothesis testing, the probability of rejecting a true null hypothesis is called:	\N
1162	Spread and outliers of data	1	Raw data values	Spread and outliers of data	Only the median	Only the mean	A boxplot is used to display:	\N
1163	Strength and direction of a linear relationship	1	The mean of the dataset	The variance of data	Strength and direction of a linear relationship	The probability of success	The correlation coefficient measures:	\N
1164	P(A) * P(B)	1	P(A) * P(B)	P(A) - P(B)	P(A) / P(B)	P(A) + P(B)	If two events A and B are independent, what is P(A and B)?	\N
1165	Continuous	2	Discrete	Ordinal	Continuous	Nominal	A researcher wants to study the heights of university students. What type of data is this?	\N
1166	Mode	2	Median	Mean	Mode	Standard Deviation	Which measure of central tendency is best for categorical data?	\N
1167	1 - P(no success)	3	P(success) * trials	P(success) / trials	P(success) ^ trials	1 - P(no success)	The probability of at least one success in a binomial experiment is calculated as:	\N
1168	Poisson	2	Binomial	Uniform	Poisson	Normal	Which of the following distributions is used to model rare events?	\N
1169	10	2	20	15	10	5	If the mean of a dataset is 40 and the sum of all values is 400, how many values are there?	\N
1170	10/32	1	5/16	3/8	1/4	10/32	A fair coin is flipped 5 times. What is the probability of getting exactly 3 heads?	\N
1171	All values are the same	2	Data is highly variable	All values are the same	Mean is zero	Distribution is skewed	What does a standard deviation of 0 indicate?	\N
1172	Normal distribution	1	Poisson distribution	Binomial distribution	Exponential distribution	Normal distribution	Which distribution is symmetric and bell-shaped?	\N
1173	68%	3	68%	99.7%	50%	95%	In a normal distribution, what percentage of data lies within one standard deviation of the mean?	\N
1174	0.2	1	0.4	0.5	0.2	0.9	If P(A) = 0.4 and P(B) = 0.5, what is P(A ∩ B) if A and B are independent?	\N
1175	35	1	40	30	45	35	What is the median of the dataset: {10, 20, 30, 40, 50, 60}?	\N
1176	Right-skewed	2	Right-skewed	Uniform	Left-skewed	Symmetric	If a dataset has a mean of 25 and a median of 20, the distribution is likely to be?	\N
1177	Empirical probability	2	Empirical probability	Classical probability	Conditional probability	Subjective probability	Which type of probability is based on direct observation or experiments?	\N
1178	25	2	25	5	50	10	What is the variance if the standard deviation is 5?	\N
1179	Ogive	2	Box plot	Histogram	Ogive	Pie chart	Which graphical representation is used to display cumulative frequencies?	\N
1180	True positive rate	2	False positive rate	True positive rate	True negative rate	False negative rate	If a test has 80% 'sensitivity and 90% 'specificity, what does sensitivity measure?	\N
1181	A statement of no effect	2	Always rejected	A statement of effect	Always accepted	A statement of no effect	In hypothesis testing, what is the null hypothesis?	\N
1182	Strong negative correlation	2	Strong positive correlation	No correlation	Weak correlation	Strong negative correlation	If the correlation coefficient is -0.9, what does this indicate?	\N
1183	Fixed	2	Infinite	Fixed	Unknown	Variable	In a binomial experiment, the number of trials is?	\N
1184	Greater than median	1	Greater than median	Equal to median	Equal to mode	Less than median	If a data set is skewed to the right, the mean is?	\N
1185	Strong evidence against the null hypothesis	2	Strong evidence against the null hypothesis	No evidence against null hypothesis	No conclusion	Strong evidence for the null hypothesis	What does a p-value of 0.03 indicate in hypothesis testing?	\N
1186	1/13	2	1/13	1/26	1/4	1/52	What is the probability of drawing a king from a standard deck of cards?	\N
1187	t-test	2	t-test	Regression analysis	Chi-square test	ANOVA	Which statistical test is used to compare means of two independent groups?	\N
1188	85% 'of variability explained by model	3	85% 'correlation	85% prediction accuracy	85% 'of variability explained by model	85% 'error rate	What does an R² value of 0.85 in regression analysis indicate?	\N
1189	Binomial distribution	2	Exponential distribution	Binomial distribution	Normal distribution	Poisson distribution	Which distribution models the number of successes in fixed trials?	\N
1190	0	2	1	0	-1	10	What is the mean of a standard normal distribution?	\N
1191	22	1	25	22	18	12	What is the range of a dataset {3, 7, 15, 20, 25}?	\N
1192	68%	3	68%	95%	99%	50%	In a normal distribution, what percentage of data falls within one standard deviation of the mean?	\N
1193	5	1	4	6	3	5	What is the mode of the data set: {2, 3, 3, 4, 5, 5, 5, 6}?	\N
1194	Median	2	Standard Deviation	Median	Range	Mean	Which of the following is not affected by extreme values?	\N
1195	Strong evidence against the null hypothesis	2	The null hypothesis is true	No evidence against the null hypothesis	Strong evidence against the null hypothesis	The alternative hypothesis is false	What does a p-value of 0.02 indicate in hypothesis testing?	\N
1196	Strong negative correlation	3	Strong negative correlation	No correlation	Strong positive correlation	Weak positive correlation	If the correlation coefficient is -0.9, what can be inferred about the relationship between two variables?	\N
1197	Five-number summary	1	Mean and standard deviation	Five-number summary	Scatter plot	Regression analysis	What does a box plot primarily display?	\N
1198	2	2	1	0	2	-2	If the mean of a dataset is 70 and the standard deviation is 5, what is the z-score of a value of 80?	\N
1199	Mean	2	Mean	Median	Interquartile Range	Mode	Which measure of central tendency is most affected by outliers?	\N
1200	There is a 95% probability the true value lies within the interval	2	The population mean is exactly in the middle of this range	95% of the data points are in this range	The sample mean is within this range	There is a 95% probability the true value lies within the interval	What does a confidence interval of 95% mean?	\N
1201	Mode	3	Mode	Mean	Median	Range	If a dataset has a left-skewed distribution, which measure of central tendency will be the largest?	\N
1202	0	2	0.5	1	0	Infinity	Which of the following best describes the probability of an impossible event?	\N
1203	0	2	It depends on the data	0.5	0	1	If two events are mutually exclusive, what is their joint probability?	\N
1204	The best fit line for predicting a dependent variable	2	The probability of an event occurring	The average value of a dataset	The best fit line for predicting a dependent variable	The range of a dataset	What does a regression line represent in statistics?	\N
1205	0.75	2	0.25	0.5	0.75	1	If an event has a probability of 0.25, what is the probability of its complement?	\N
1206	1	2	Infinity	1	0.5	0	What is the sum of probabilities of all possible outcomes in a probability distribution?	\N
1207	Discrete	2	Nominal	Discrete	Continuous	Categorical	What type of variable is 'number of students in a class'?	\N
1208	It is multiplied by the square of the constant	3	It decreases	It is multiplied by the square of the constant	It is multiplied by the constant	It remains unchanged	What happens to the variance when all values in a dataset are multiplied by a constant?	\N
1209	0.5	3	1	0.25	0	0.5	If a standard normal distribution has a mean of 0, what is the probability of a z-score greater than 0?	\N
1210	The frequency distribution of data	1	The mean and median of data	The probability of an event	The frequency distribution of data	The relationship between two variables	What does a histogram display?	\N
1211	The likelihood of a continuous random variable	2	The number of occurrences of a discrete event	The likelihood of a continuous random variable	The sample mean	The interquartile range	What does a probability density function (PDF) describe?	\N
1212	3.5	2	3	6	3.5	4	What is the expected value of rolling a fair six-sided die?	\N
1213	1:4	2	2:3	1:5	1:4	4:1	If the probability of an event happening is 0.2, what are the odds in favor of the event?	\N
1214	0	2	0	Equal to the mean	1	Undefined	What is the variance of a dataset if all its values are the same?	\N
1215	Q3 - Q1	1	Q3/Q1	Q3 - Q1	Q1 + Q3	Q1 - Q3	What is the interquartile range (IQR)?	\N
1216	Fail to reject the null hypothesis	2	Accept the alternative hypothesis	Reject both hypotheses	Fail to reject the null hypothesis	Reject the null hypothesis	A hypothesis test results in a p-value of 0.07. At a significance level of 0.05, what is the decision?	\N
1217	0.25	2	1	0.25	0.75	0.5	What is the probability of flipping two heads in a row with a fair coin?	\N
1218	All values are the same	2	All values are the same	The mean is 0	The data is normally distributed	There is high variability	If a dataset has a standard deviation of 0, what does it imply?	\N
1219	Addition Rule	1	Bayes' Theorem	Addition Rule	Law of Large Numbers	Multiplication Rule	Which probability rule states that P(A or B) = P(A) + P(B) - P(A and B)?	\N
1220	1.645	2	1.96	0	1.645	2.33	In a standard normal distribution, what z-score corresponds to the 95th percentile?	\N
1221	No linear relationship	2	Perfect positive correlation	Perfect negative correlation	No linear relationship	Causation between variables	If the correlation coefficient is 0, what does it imply?	\N
1222	68%	2	50%	99%	95%	68%	A dataset has a bell-shaped curve with a mean of 50 and a standard deviation of 10. What percentage of data lies between 40 and 60?	\N
1223	To show relationships between two variables	1	To display frequency distribution	To represent probabilities	To calculate mean and median	To show relationships between two variables	What is the primary purpose of a scatter plot?	\N
1224	Random sampling	3	Random sampling	Convenience sampling	Quota sampling	Judgmental sampling	A researcher wants to estimate the average height of students in a university. What type of sampling method should be used for unbiased results?	\N
1225	2	3	-2	-1	1	2	If a dataset has a mean of 50 and a standard deviation of 5, what is the z-score of a value 60?	\N
1226	1/2	2	1/2	1/3	2/3	1/6	What is the probability of rolling an even number on a fair six-sided die?	\N
1227	Poisson distribution	3	Exponential distribution	Normal distribution	Poisson distribution	Binomial distribution	What type of distribution is used for modeling the number of occurrences in a fixed interval of time or space?	\N
1228	3.5	2	3	4	3.5	3.8	What is the expected value of a fair six-sided die roll?	\N
1229	Strong negative correlation	2	Strong negative correlation	No correlation	Weak negative correlation	Strong positive correlation	If the correlation coefficient between two variables is -0.85, what does this indicate?	\N
1230	ANOVA	2	ANOVA	t-test	Chi-square test	Regression analysis	Which statistical test is used to compare the means of three or more groups?	\N
1231	68%	3	50%	68%	95%	75%	In a normal distribution, what percentage of values fall within one standard deviation of the mean?	\N
1232	Categorical	1	Ordinal	Continuous	Categorical	Ratio	What type of data is 'blood type' (A, B, AB, O)?	\N
1233	There is a 75% chance of an event occurring	1	The event is impossible	There is a 75% chance of an event occurring	The event is certain	The event has a 25% chance of occurring	A probability of 0.75 means:	\N
1234	Range	2	Range	Interquartile range	Standard deviation	Variance	Which measure of dispersion represents the difference between the highest and lowest values?	\N
1235	The null hypothesis is rejected when it is actually true	1	There is no error	The null hypothesis is rejected when it is actually true	The sample size is too large	The null hypothesis is accepted when it is false	A Type I error occurs when:	\N
1248	Gross Domestic Product	1	Gross Domestic Product	Government Development Plan	General Domestic Production	Global Development Projection	What does GDP stand for?	\N
1236	Change in the dependent variable per unit change in the independent variable	2	Change in the dependent variable per unit change in the independent variable	The correlation coefficient	The y-intercept	The residual sum of squares	In a regression equation, what does the slope represent?	\N
1237	90% of the variance in the dependent variable is explained by the independent variable	1	The correlation is weak	90% of the variance in the dependent variable is explained by the independent variable	The data is not linear	The model is incorrect	What does an R-squared value of 0.9 indicate?	\N
1238	Bar chart	2	Bar chart	Scatter plot	Histogram	Box plot	Which graphical representation is best for displaying the frequency of a categorical variable?	\N
1239	0	2	1	P(A) + P(B)	0	P(A) * P(B)	If two events A and B are mutually exclusive, what is P(A and B)?	\N
1240	The hypothesis that there is an effect or difference	2	The hypothesis that the data is skewed	The hypothesis that there is no effect	The hypothesis that there is an effect or difference	The hypothesis that the sample is biased	In hypothesis testing, what is the alternative hypothesis?	\N
1241	10	1	12	11	10	8	What is the median of the data set {4, 8, 10, 12, 14}?	\N
1242	Median	2	Standard Deviation	Mean	Median	Range	Which of the following is not affected by extreme values? 	\N
1243	The frequency distribution of data	1	The probability of an event	The frequency distribution of data	The relationship between two variables	The mean and median of data	What does a histogram display? 	\N
1244	3.5	2	6	3	3.5	4	What is the expected value of rolling a fair six-sided die? 	\N
1245	Categorical	1	Ordinal	Ratio	Categorical	Continuous	What type of data is 'blood type' (A, B, AB, O)? 	\N
1249	The next best alternative foregone	1	The profit earned from a business	The amount spent on investment	The total cost of production	The next best alternative foregone	What is the opportunity cost?	\N
1250	Government spending exceeds revenue	1	A balanced budget	A decrease in taxes	Government spending exceeds revenue	Government revenue exceeds spending	What is a budget deficit?	\N
1251	When price increases, quantity demanded decreases	1	Demand and price are unrelated	When price increases, quantity demanded increases	When price increases, quantity demanded decreases	Demand is always equal to supply	What is the law of demand?	\N
1252	A market dominated by a few firms	1	A market with no barriers to entry	A market with many sellers	A market dominated by a few firms	A market with only one seller	What is an oligopoly?	\N
1253	Exports exceed imports	1	Trade is balanced	Imports exceed exports	Exports exceed imports	There is no international trade	What is a trade surplus?	\N
1254	World Trade Organization (WTO)	1	International Monetary Fund (IMF)	World Bank	World Trade Organization (WTO)	United Nations (UN)	Which organization regulates global trade?	\N
1255	Higher income earners pay a higher percentage	1	Higher income earners pay a higher percentage	Everyone pays the same percentage	Lower income earners pay more tax	No tax is imposed	What is a progressive tax?	\N
1256	Government spending and taxation	1	Government spending and taxation	Foreign exchange rates	Interest rate adjustments	Stock market regulations	What does fiscal policy involve?	\N
1257	A sustained increase in the general price level	1	A sustained increase in the general price level	An increase in employment	A decrease in the money supply	A decrease in overall demand	What is inflation?	\N
1258	Many buyers and sellers with no market power	2	Many buyers and sellers with no market power	Government-imposed pricing	A single seller controlling supply	Few large firms dominating the industry	What is a perfectly competitive market characterized by?	\N
1259	A group of firms that agree to control prices	1	A group of firms that agree to control prices	A government agency regulating markets	A nonprofit trade organization	A labor union	What is a cartel?	\N
1260	Regulate the money supply and interest rates	1	Control stock markets	Approve government budgets	Regulate the money supply and interest rates	Collect taxes	What is the function of the central bank?	\N
1261	Shows the inverse relationship between inflation and unemployment	1	Shows the inverse relationship between inflation and unemployment	Represents changes in supply and demand	Illustrates economic growth over time	Shows the positive correlation between GDP and inflation	What is the Phillips curve?	\N
1262	A tax on imported goods	1	A tax on imported goods	A restriction on domestic production	A subsidy for local businesses	A tax on exports	What is a tariff?	\N
1263	As price increases, quantity supplied increases	1	As price increases, quantity supplied decreases	Supply remains constant regardless of price	Price and supply are unrelated	As price increases, quantity supplied increases	What is the law of supply?	\N
1264	A market controlled by one seller	1	A market with no barriers to entry	A market with many competing firms	A market controlled by one seller	A market regulated by the government	What is a monopoly?	\N
1265	Combine resources to create goods and services	1	Regulate financial markets	Set wage policies	Combine resources to create goods and services	Work in government institutions	What is the role of an entrepreneur?	\N
1266	An economy with minimal government intervention	1	An economy fully controlled by the government	An economy where businesses are state-owned	An economy with fixed pricing	An economy with minimal government intervention	What is a free market economy?	\N
1267	How quantity demanded responds to price changes	1	The number of firms in an industry	The ability of firms to produce different goods	The total revenue generated by a firm	How quantity demanded responds to price changes	What does elasticity of demand measure?	\N
1268	A decline in economic activity lasting at least two quarters	1	A period of high inflation	An increase in consumer spending	A rapid expansion of GDP	A decline in economic activity lasting at least two quarters	What is a recession?	\N
1269	Tools, machinery, and infrastructure used for production	1	Money held by the government	Tools, machinery, and infrastructure used for production	Total wealth of a country	Natural resources like oil and gas	What is capital in economics?	\N
1270	A cost or benefit affecting third parties	1	A government policy to control prices	A cost or benefit affecting third parties	An international trade agreement	A tax imposed on businesses	What is an externality?	\N
1444	Monopoly	2	Monopoly	Perfect competition	Monopolistic competition	Oligopoly	Which market structure is characterized by a single seller?	\N
1271	Adding more of a factor of production results in lower additional output	2	More labor always increases productivity	Increasing demand lowers prices	Increasing production leads to lower costs	Adding more of a factor of production results in lower additional output	What is the law of diminishing marginal returns?	\N
1272	The ability to produce more of a good than another entity using the same resources	1	The ability to trade without tariffs	The ability to produce more of a good than another entity using the same resources	A firm dominating an industry	The process of outsourcing production	What is absolute advantage?	\N
1273	The ability to produce a good at a lower opportunity cost	1	The ability to produce a good at a lower opportunity cost	Having the largest market share	Avoiding international trade	Producing everything domestically	What is comparative advantage?	\N
1274	A combination of high inflation and high unemployment	1	A phase where GDP and inflation are both low	A period of rapid economic growth	A combination of high inflation and high unemployment	A reduction in overall demand	What is stagflation?	\N
1275	A legally established maximum price for a good	1	A legally established maximum price for a good	A regulation on exports	A minimum wage law	A tax on luxury goods	What is a price ceiling?	\N
1276	A legally established minimum price for a good	1	A tax on imported goods	A requirement for minimum production levels	A cap on company profits	A legally established minimum price for a good	What is a price floor?	\N
1277	Medium of exchange	1	Means of production	Government revenue	Fixed asset	Medium of exchange	What is the primary function of money?	\N
1278	A sudden change in supply affecting prices	1	A sudden change in supply affecting prices	A shift in labor market policies	A long-term increase in demand	A government-imposed price control	What is a supply shock?	\N
1279	To prevent monopolies and promote competition	1	To prevent monopolies and promote competition	To support large corporations	To regulate international trade	To increase corporate taxation	What is the purpose of antitrust laws?	\N
1280	A good that is non-excludable and non-rivalrous	1	A good that has only private benefits	A good that is non-excludable and non-rivalrous	A good produced by a private firm	A good that is highly taxed	What is a public good?	\N
1281	The relationship between tax rates and tax revenue	1	The effect of trade barriers on imports	The relationship between unemployment and GDP growth	The impact of monetary policy on inflation	The relationship between tax rates and tax revenue	What does the Laffer Curve illustrate?	\N
1282	Regulating the money supply and setting interest rates	1	Managing stock market investments	Controlling government spending	Setting global oil prices	Regulating the money supply and setting interest rates	What is the role of the Federal Reserve?	\N
1283	The additional cost of producing one more unit	1	The total cost of all production	The price at which a good is sold	The cost of hiring additional workers	The additional cost of producing one more unit	What is meant by 'marginal cost'?	\N
1284	An extremely rapid increase in prices	1	A decrease in government spending	A reduction in the money supply	An extremely rapid increase in prices	A slight increase in inflation over time	What is hyperinflation?	\N
1285	A good that is used together with another good	1	A good that is used together with another good	A good produced by a monopoly	A good that has no substitutes	A good that replaces another good	What is a complementary good?	\N
1286	A firm that cannot influence market prices	1	A government-regulated firm	A firm that cannot influence market prices	A firm that sets prices in an industry	A firm with significant market power	What is a price taker?	\N
1287	When imports exceed exports	1	When imports exceed exports	When exports exceed imports	When there is no international trade	When a country imposes high tariffs	What is a trade deficit?	\N
1288	Demand for a resource based on demand for the final product	1	Demand for a resource based on demand for the final product	Demand that is artificially created by firms	Demand that is completely independent of supply	Demand that decreases over time	What is meant by 'derived demand'?	\N
1289	An economy where the government makes all economic decisions	1	An economy where the government makes all economic decisions	An economy driven by international trade	An economy that operates without money	An economy based on free market principles	What is a command economy?	\N
1290	All market participants have complete knowledge	2	Firms have exclusive access to data	Consumers make random purchasing decisions	All market participants have complete knowledge	Information is restricted by governments	What is meant by 'perfect information' in economics?	\N
1291	A tax that takes a larger percentage from low-income earners	1	A tax that increases as income rises	A tax that takes a larger percentage from low-income earners	A tax that is applied equally to all incomes	A tax on imported goods	What is a regressive tax?	\N
1292	The profit from selling an asset for more than its purchase price	1	The total value of capital in a country	The profit from selling an asset for more than its purchase price	An increase in worker wages	A rise in overall economic output	What is a capital gain?	\N
1293	The process where new innovations replace outdated industries	1	The loss of value in international trade	A decrease in economic growth due to unemployment	The intentional collapse of an industry by the government	The process where new innovations replace outdated industries	What is creative destruction?	\N
1294	The ease with which an asset can be converted into cash	1	The total amount of money in an economy	The ability of firms to remain profitable	The stability of financial markets	The ease with which an asset can be converted into cash	What does the term 'liquidity' refer to?	\N
1295	Analyzing strategic interactions between agents	2	Regulating monopolies	Predicting inflation trends	Analyzing strategic interactions between agents	Managing stock market investments	What is game theory used for in economics?	\N
1296	A cost that has already been incurred and cannot be recovered	1	A cost that has already been incurred and cannot be recovered	A cost that is determined by government policies	A cost that decreases over time	A cost that depends on future decisions	What is a sunk cost?	\N
1297	A good whose demand decreases as income increases	1	A good whose demand decreases as income increases	A good of low quality	A good that is illegal to sell	A good that is only sold in developing countries	What is an inferior good?	\N
1331	When monetary policy is ineffective	1	Decrease in interest rates	When monetary policy is ineffective	Increase in bank reserves	Shortage of money supply	What is a liquidity trap?	\N
1298	Government intervention is necessary to stabilize the economy	2	Government intervention is necessary to stabilize the economy	Trade deficits should be maximized	Free markets always correct themselves	Inflation should always be increased	What is the Keynesian approach to economic policy?	\N
1299	Inflation caused by rising production costs	1	A sudden increase in interest rates	Inflation caused by rising production costs	Inflation caused by increased demand	A decrease in price levels	What is cost-push inflation?	\N
1300	Inflation caused by excessive demand for goods	1	An increase in government savings	Inflation caused by excessive demand for goods	A decrease in wages across industries	Inflation caused by rising costs of production	What is demand-pull inflation?	\N
1301	To support businesses or individuals financially	1	To support businesses or individuals financially	To regulate inflation	To increase the cost of imports	To decrease national income	What is the purpose of subsidies?	\N
1302	A loss of economic efficiency due to market distortions	1	An increase in unemployment	A decrease in demand for consumer goods	A drop in national GDP	A loss of economic efficiency due to market distortions	What is a deadweight loss?	\N
1303	The practice of taking advantage of price differences in different markets	1	A system for setting minimum wages	A method of government taxation	A form of monopolistic competition	The practice of taking advantage of price differences in different markets	What is arbitrage?	\N
1304	To allow governments and corporations to borrow money	1	To facilitate currency exchange	To regulate global trade	To allow governments and corporations to borrow money	To manage inflation rates	What is the function of a bond market?	\N
1305	Social security benefits	2	Social security benefits	Wages paid by employers	Dividends from stock investments	Payments for government contracts	What is an example of a transfer payment?	\N
1306	Total value of goods and services produced	1	Total value of goods and services produced	Government spending	National debt	Tax revenue	What does GDP measure?	\N
1307	Monopoly	1	Oligopoly	Monopoly	Perfect competition	Monopolistic competition	Which type of market structure has a single seller?	\N
1308	Next best alternative forgone	1	Total cost of production	Next best alternative forgone	Difference between revenue and cost	Profit earned	What is an opportunity cost?	\N
1309	Inverse relationship between inflation and unemployment	1	Constant wages and changing prices	Positive relationship between GDP and inflation	Inverse relationship between inflation and unemployment	Relationship between supply and demand	What does the Phillips curve illustrate?	\N
1310	Government spending and taxation policies	1	Stock market regulations	Foreign trade policies	Government spending and taxation policies	Central bank’s monetary policies	What is fiscal policy?	\N
1311	Market economy	2	Market economy	Mixed economy	Traditional economy	Command economy	Which economic system is based on supply and demand with little government intervention?	\N
1312	Measure of responsiveness of quantity demanded to price changes	1	Total quantity demanded	Decrease in demand due to competition	Increase in demand due to advertising	Measure of responsiveness of quantity demanded to price changes	What is elasticity of demand?	\N
1313	Harmful effect on third parties	1	Increase in demand	Harmful effect on third parties	Positive effect on third parties	Increase in supply	What does a negative externality indicate?	\N
1314	Control money supply and interest rates	1	Control money supply and interest rates	Manage foreign exchange rates	Set fiscal policy	Regulate stock markets	What is the role of the central bank?	\N
1315	GDP declines	1	Inflation rises	Government spending increases	GDP declines	Unemployment decreases	What happens in a recession?	\N
1316	Non-excludable and non-rivalrous	2	High production cost	Non-excludable and non-rivalrous	Limited availability	Provided by private companies	What is the main characteristic of a public good?	\N
1317	Increase in production costs	1	Decrease in consumer demand	Increase in production costs	Higher GDP growth	Expansionary monetary policy	Which factor can cause cost-push inflation?	\N
1318	Prevent prices from rising too high	1	Encourage production	Prevent prices from rising too high	Increase inflation	Control wages	What is the purpose of price ceilings?	\N
1319	Consumer Price Index (CPI)	2	Unemployment rate	Gross Domestic Product (GDP)	Consumer Price Index (CPI)	Interest rate	Which economic indicator measures changes in the cost of living?	\N
1320	Single firm due to high fixed costs	1	Government-controlled market	Multiple firms in competition	Single firm due to high fixed costs	Illegal market power	What is a natural monopoly?	\N
1321	Skills and knowledge of workers	1	Government subsidies	Skills and knowledge of workers	Total financial resources	Physical machinery	What is human capital?	\N
1322	Increase in government spending	2	Increase in government spending	Increase in tax rates	Reduction in employment	Decrease in money supply	What is the impact of expansionary fiscal policy?	\N
1323	Fluctuations in economic activity over time	1	Fluctuations in economic activity over time	Government spending patterns	Inflation rate changes	Trade cycle between countries	What is the business cycle?	\N
1324	Structural unemployment	2	Cyclical unemployment	Structural unemployment	Frictional unemployment	Seasonal unemployment	Which type of unemployment occurs when workers' skills do not match available jobs?	\N
1325	Price decreases	2	Price fluctuates	Price decreases	Price remains unchanged	Price increases	What happens to equilibrium price when supply increases and demand remains constant?	\N
1326	Limit on quantity of imports	1	Limit on quantity of imports	Control on government spending	Tax on exports	Subsidy for domestic industries	What is a quota?	\N
1327	Relationship between tax rates and tax revenue	1	Relationship between tax rates and tax revenue	Impact of monetary policy on GDP	Effect of inflation on unemployment	Connection between interest rates and investment	What does the Laffer curve illustrate?	\N
1328	Say’s Law	2	Keynesian theory	Say’s Law	Ricardian equivalence	Law of demand	Which economic theory states that supply creates its own demand?	\N
1329	People benefiting without paying	1	People benefiting without paying	Overuse of public resources	Inability to measure externalities	Increase in trade deficits	What is a free rider problem?	\N
1330	Exports become cheaper	1	Government revenue increases	Imports become cheaper	Exports become cheaper	Inflation decreases	What happens when a country’s currency depreciates?	\N
1332	Increase productivity and economic growth	2	Increase demand	Reduce government spending	Control inflation	Increase productivity and economic growth	What is the primary objective of supply-side policies?	\N
1333	Charging different prices for the same product	1	Charging different prices for the same product	Setting a single market price	Creating a price ceiling	Government intervention in pricing	What is the effect of price discrimination?	\N
1334	Fixed cost	1	Total cost	Marginal cost	Fixed cost	Variable cost	Which type of cost does not change with the level of output?	\N
1335	Higher savings can lead to higher investment	2	Investment leads to lower savings	Savings and investment are unrelated	Higher savings can lead to higher investment	Higher investment reduces GDP	What is the relationship between savings and investment in an economy?	\N
1337	Assets = Liabilities + Equity	1	Assets = Revenue + Expenses	Liabilities = Assets + Equity	Equity = Revenue - Expenses	Assets = Liabilities + Equity	What is the accounting equation?	\N
1338	Balance Sheet	2	Balance Sheet	Statement of Retained Earnings	Income Statement	Cash Flow Statement	Which financial statement shows a company’s financial position at a specific point in time?	\N
1339	Income Statement	2	Statement of Shareholders’ Equity	Statement of Cash Flows	Balance Sheet	Income Statement	Which financial statement shows a company’s revenues and expenses?	\N
1340	To provide financial information for decision-making	1	To monitor sales performance	To provide financial information for decision-making	To track cash flow	To calculate taxes owed	What is the primary purpose of accounting?	\N
1341	A resource owned by a company	1	A company’s obligation	A company’s earnings	A company’s equity	A resource owned by a company	What is an asset?	\N
1342	A company’s obligation to pay debts	1	A company’s assets	A company’s obligation to pay debts	A company’s equity	A company’s earnings	What is a liability?	\N
1343	Allocation of the cost of a tangible asset over time	1	Allocation of the cost of a tangible asset over time	Cash payment for an asset	Reduction in liabilities	Increase in asset value	What is depreciation?	\N
1344	Recording revenues and expenses when they are incurred	1	Recording transactions only when cash is received or paid	Recording only expenses	Recording revenues and expenses when they are incurred	Recording only revenues	What is accrual accounting?	\N
1345	Matching Principle	2	Revenue Recognition Principle	Historical Cost Principle	Consistency Principle	Matching Principle	Which principle requires accountants to report expenses in the same period as related revenues?	\N
1346	Each transaction affects at least two accounts	1	Each transaction involves cash	Each transaction is recorded only once	Each transaction affects at least two accounts	Each transaction only affects income statement accounts	What is double-entry accounting?	\N
1347	Intangible asset representing excess purchase price of a company	1	Physical asset value	Intangible asset representing excess purchase price of a company	The value of company goodwill programs	A liability on the balance sheet	What is goodwill in accounting?	\N
1348	To provide an independent review of financial statements	1	To calculate taxes	To provide an independent review of financial statements	To determine a company’s profits	To record transactions	What is the purpose of an audit?	\N
1349	Historical Cost Principle	2	Fair Value Principle	Matching Principle	Revenue Recognition Principle	Historical Cost Principle	Which accounting principle requires recording assets at their original cost?	\N
1350	A formal record of a financial transaction	1	A statement of cash flow activities	A formal record of a financial transaction	A summary of financial statements	A report of financial performance	What is a journal entry?	\N
1351	Statement of Cash Flows	2	Balance Sheet	Statement of Retained Earnings	Income Statement	Statement of Cash Flows	Which financial statement summarizes cash inflows and outflows?	\N
1352	Amounts a company owes to suppliers	1	Amounts a company is owed	Company assets	Company profits	Amounts a company owes to suppliers	What is accounts payable?	\N
1353	Amounts owed to a company by customers	1	Company’s total expenses	Company’s total liabilities	Amounts owed to a company by customers	Amounts a company owes to suppliers	What is accounts receivable?	\N
1354	Accumulated net income kept in the business	1	Total assets minus total liabilities	Accumulated net income kept in the business	Cash held by the company	Revenue from sales	What is retained earnings?	\N
1355	First In, First Out	2	Fast Inventory Flow Operation	First In, First Out	Final Inventory Figure Order	Fixed Inventory Financial Order	What does FIFO stand for in inventory accounting?	\N
1356	Last In, First Out	2	Last In, First Out	Latest In, Final Out	Lowest Inventory Financial Order	Long-term Investment Funding Order	What does LIFO stand for in inventory accounting?	\N
1357	A potential liability that may occur in the future	1	A liability that must be paid immediately	A liability with a fixed payment schedule	An asset held in reserve	A potential liability that may occur in the future	What is a contingent liability?	\N
1358	To match the company's records with the bank statement	1	To adjust for inflation	To prepare tax filings	To calculate interest payments	To match the company's records with the bank statement	What is the purpose of bank reconciliation?	\N
1359	A report that ensures total debits equal total credits	1	A summary of expenses	A tax calculation sheet	A report that ensures total debits equal total credits	A profit and loss statement	What is a trial balance?	\N
1360	Liability	1	Revenue	Expense	Asset	Liability	Which type of account is increased with a credit?	\N
1361	Asset	1	Revenue	Asset	Liability	Equity	Which type of account is increased with a debit?	\N
1362	An expense paid in advance	1	An expense paid in advance	An outstanding liability	A loan received	A liability recorded before payment	What is a prepaid expense?	\N
1363	Reduction in the value of goodwill	1	Reduction in the value of goodwill	Depreciation of goodwill	Increase in goodwill value	Recognition of an asset loss	What is goodwill impairment?	\N
1364	Net profit accounts for all expenses, while gross profit only considers cost of goods sold	1	Net profit accounts for all expenses, while gross profit only considers cost of goods sold	Gross profit includes all expenses	Net profit is before tax deductions	Gross profit excludes revenue calculations	What is the difference between gross and net profit?	\N
1365	Generally Accepted Accounting Principles	1	General Application of Accounting Policies	Generally Accepted Accounting Principles	Global Accounting and Audit Process	Governmental Accounting and Auditing Practices	What does GAAP stand for?	\N
1366	A lease where the lessee assumes ownership risks and benefits	1	A short-term rental agreement	A lease with no ownership transfer	A lease paid monthly	A lease where the lessee assumes ownership risks and benefits	What is a capital lease?	\N
1367	An asset that lacks physical substance	1	An asset that lacks physical substance	A liability owned by the company	An asset that depreciates quickly	A short-term investment	What is an intangible asset?	\N
1368	Current assets minus current liabilities	1	Current liabilities minus cash	Total revenue minus total expenses	Total liabilities minus total assets	Current assets minus current liabilities	What is working capital?	\N
1369	Ownership interest in a company	1	Company's bank balance	Ownership interest in a company	Company liabilities	Revenue from sales	What is equity?	\N
1370	Revenue should be recorded when earned, not when received	1	Revenue should be recorded at the time of invoice generation	Revenue should only be recorded for credit transactions	Revenue should be recorded when cash is received	Revenue should be recorded when earned, not when received	What is a revenue recognition principle?	\N
1371	Financial accounting focuses on external reporting, managerial on internal decision-making	2	Managerial accounting deals only with tax calculations	Managerial accounting is for shareholders	Financial accounting is used only for audits	Financial accounting focuses on external reporting, managerial on internal decision-making	What is the difference between financial and managerial accounting?	\N
1372	The point where total revenue equals total costs	1	The point where total revenue equals total costs	The lowest level of production	The point where sales stop	The highest level of profit	What is break-even point?	\N
1373	A document issued when returning goods to a supplier	1	A payment request to a customer	A loan agreement document	A document issued when returning goods to a supplier	A record of company’s bank transactions	What is a debit note?	\N
1374	Return on Investment	1	Return on Investment	Recording of Invoices	Rate of Inflation	Revenue on Income	What does ROI stand for?	\N
1375	To track and control costs	2	To prepare financial statements	To analyze tax liabilities	To manage company cash flow	To track and control costs	What is the main objective of cost accounting?	\N
1376	The value of an asset as recorded in accounting books	1	The value of an asset as recorded in accounting books	The market value of an asset	The depreciation value of an asset	The estimated future value of an asset	What is book value?	\N
1377	Revenue Recognition Principle	3	Matching Principle	Materiality Principle	Revenue Recognition Principle	Historical Cost Principle	Which accounting principle states that revenue should be recognized when it is earned, regardless of when cash is received?	\N
1378	Income Statement	2	Income Statement	Balance Sheet	Cash Flow Statement	Statement of Changes in Equity	Which financial statement reports a company's financial performance over a specific period?	\N
1379	LIFO	2	Specific Identification	Weighted Average	LIFO	FIFO	Which inventory valuation method results in the lowest income tax expense during inflationary periods?	\N
1380	Interest expense decreases	2	Interest expense remains the same	Interest expense is not affected	Interest expense increases	Interest expense decreases	If a company issues bonds at a premium, how does it affect the interest expense over time?	\N
1381	To show cash inflows and outflows	1	To calculate net income	To report financial position	To show cash inflows and outflows	To list expenses	What is the main purpose of the Statement of Cash Flows?	\N
1382	Double Declining Balance	2	Sum-of-the-Years' Digits	Straight-Line	Units of Production	Double Declining Balance	Which depreciation method results in the highest expense in the early years?	\N
1383	Trademark	2	Inventory	Trademark	Accounts Receivable	Equipment	Which of the following is classified as an intangible asset?	\N
1384	$200,000	2	$300,000	$800,000	$200,000	$500,000	A company has total assets of $500,000 and total liabilities of $300,000. What is the owner's equity?	\N
1385	To ensure financial statements are free from material misstatement	2	To calculate net income	To manage company operations	To ensure financial statements are free from material misstatement	To detect fraud	What is the primary purpose of an audit?	\N
1386	Going Concern	2	Monetary Unit	Consistency	Conservatism	Going Concern	Which accounting assumption assumes a business will continue operating indefinitely?	\N
1387	Contra Asset	1	Equity	Contra Asset	Expense	Liability	What type of account is accumulated depreciation?	\N
1388	Decreases	3	Cannot be determined	Increases	Remains the same	Decreases	If a company’s total liabilities increase while total assets remain unchanged, what happens to owner's equity?	\N
1389	Current Ratio	2	Current Ratio	Gross Margin Ratio	Debt-to-Equity Ratio	Return on Assets	Which financial ratio measures a company’s ability to pay its short-term liabilities?	\N
1390	$250,000	3	$500,000	$1,750,000	$250,000	$750,000	If a company's total revenue is $1,000,000 and its total expenses are $750,000, what is its net income?	\N
1391	To match revenues with expenses	2	To match revenues with expenses	To record expenses when cash is paid	To recognize revenue when earned	To prevent fraud	What is the purpose of the matching principle?	\N
1392	Accounts Payable	2	Inventory	Retained Earnings	Prepaid Expenses	Accounts Payable	Which of the following accounts is classified as a liability?	\N
1393	Rent Expense	1	Rent Expense	Commissions	Raw Materials	Direct Labor	Which cost is considered a fixed cost?	\N
1394	Balance Sheet	3	Statement of Retained Earnings	Cash Flow Statement	Income Statement	Balance Sheet	Which financial statement provides a snapshot of a company's financial position at a specific point in time?	\N
1395	Revenue	2	Equity	Revenue	Assets	Liabilities	Which of the following is NOT a component of the accounting equation?	\N
1396	Asset Turnover Ratio	2	Debt Ratio	Asset Turnover Ratio	Quick Ratio	Operating Margin	Which financial ratio indicates how efficiently a company uses its assets to generate revenue?	\N
1443	Gross Domestic Product	1	Gross Domestic Product	General Domestic Profit	Global Domestic Price	Gross Development Plan	What does GDP stand for in economics?	\N
1397	It is probable and can be reasonably estimated	2	It is immaterial	It is probable and can be reasonably estimated	It is remote	It is possible but not probable	A contingent liability should be recorded in the financial statements if:	\N
1398	No change	2	Decreases	No change	Increases	Doubles	What is the effect of a stock dividend on total shareholders’ equity?	\N
1399	Absorption Costing	2	Activity-Based Costing	Absorption Costing	Process Costing	Variable Costing	Which costing method is required for external financial reporting under GAAP?	\N
1400	High financial risk	2	High financial risk	Low leverage	High profitability	High liquidity	If a company has a high debt-to-equity ratio, what does this indicate?	\N
1401	Accumulated Depreciation	2	Equipment	Cash	Depreciation Expense	Accumulated Depreciation	Which of the following accounts would be credited when recording depreciation?	\N
1402	Amortization	2	Amortization	Depletion	Impairment	Depreciation	Which term describes the process of spreading the cost of an intangible asset over its useful life?	\N
1403	$200	1	$300	$800	$500	$200	A company sells a product for $500 with a cost of $300. What is the gross profit per unit?	\N
1404	Income Statement	2	Balance Sheet	Cash Flow Statement	Income Statement	Statement of Retained Earnings	Which financial statement summarizes a company's revenues and expenses?	\N
1405	Salaries Expense	2	Salaries Expense	Issuing Bonds	Loan Repayment	Purchase of Equipment	Which of the following is an example of an operating expense?	\N
1406	Decreases assets	2	Decreases assets	Doubles assets	No effect	Increases assets	How does writing off an uncollectible account affect total assets?	\N
1407	Economic Entity Assumption	2	Accrual Basis Accounting	Economic Entity Assumption	Political Stability Assumption	Full Disclosure Principle	Which of the following is NOT a generally accepted accounting principle (GAAP)?	\N
1408	Non-operating Expense	2	Operating Expense	Non-operating Expense	Equity	Revenue	The interest expense on a company's income statement is classified as:	\N
1409	Raw Materials	2	Office Supplies	Raw Materials	Rent	Marketing Expenses	Which of the following is a direct cost for a manufacturing company?	\N
1410	Cash Flow Statement	2	Cash Flow Statement	Income Statement	Balance Sheet	Statement of Retained Earnings	Which financial statement shows how much money a company generated and used during a period?	\N
1411	To provide financial information to external users	2	To manage company operations	To maximize revenue	To provide financial information to external users	To ensure tax compliance	What is the primary objective of financial accounting?	\N
1412	Pending lawsuit	2	Accounts Payable	Salaries Payable	Deferred Revenue	Pending lawsuit	Which of the following represents a contingent liability?	\N
1413	A contra asset	2	A liability	An expense	A contra asset	An equity account	The allowance for doubtful accounts is classified as:	\N
1414	FIFO	2	Weighted Average	LIFO	FIFO	Specific Identification	Which inventory valuation method is most commonly used under IFRS?	\N
1415	Matching Principle	3	Consistency Principle	Conservatism Principle	Matching Principle	Revenue Recognition Principle	Which accounting principle states that expenses should be recognized in the same period as the revenue they help to generate?	\N
1416	Balance Sheet	2	Balance Sheet	Cash Flow Statement	Income Statement	Statement of Retained Earnings	Which financial statement shows a company's financial position at a specific point in time?	\N
1417	Double Declining Balance	3	Sum-of-the-Years’ Digits	Units of Production	Straight-Line	Double Declining Balance	Which method of depreciation results in higher expenses in the earlier years of an asset’s life?	\N
1418	To ensure financial statements are accurate and comply with regulations	1	To ensure financial statements are accurate and comply with regulations	To manage employee salaries	To increase company profits	To prepare financial statements	What is the main purpose of an audit in accounting?	\N
1419	Activity-Based Costing	2	Absorption Costing	Job Order Costing	Marginal Costing	Activity-Based Costing	Which type of costing assigns fixed and variable costs separately to better understand product profitability?	\N
1420	Prevent corporate fraud and increase financial transparency	1	Prevent corporate fraud and increase financial transparency	Standardize inventory accounting	Eliminate tax loopholes	Simplify accounting standards	The Sarbanes-Oxley Act was enacted primarily to:	\N
1421	Quick Ratio	3	Return on Assets	Debt-to-Equity Ratio	Current Ratio	Quick Ratio	Which financial ratio measures a company’s ability to meet short-term obligations using its most liquid assets?	\N
1422	Current Liability	2	Long-Term Liability	Contingent Liability	Deferred Liability	Current Liability	Which type of liability is expected to be settled within one year?	\N
1423	Contra Asset	1	Revenue	Expense	Liability	Contra Asset	Which type of account is ‘Accumulated Depreciation’?	\N
1424	An intangible asset	1	An intangible asset	A liability	Revenue	A current asset	In financial statements, goodwill is classified as:	\N
1425	A company will continue operating for the foreseeable future	2	A company will continue operating for the foreseeable future	A company is merging with another entity	A company is being liquidated	A company is issuing dividends	What does the ‘Going Concern’ assumption imply in accounting?	\N
1426	Historical Cost Principle	2	Materiality Principle	Fair Value Principle	Consistency Principle	Historical Cost Principle	Which accounting principle requires businesses to record assets at their original purchase price?	\N
1427	A company's short-term financial health	1	Net income	Total liabilities	Operating expenses	A company's short-term financial health	What does working capital measure?	\N
1428	Income Statement	2	Balance Sheet	Income Statement	Cash Flow Statement	Statement of Equity	Which financial statement shows the profitability of a business over a period of time?	\N
1429	LIFO	3	LIFO	Weighted Average	FIFO	Specific Identification	Which method of inventory valuation generally results in lower taxable income during periods of rising prices?	\N
1430	Convertible Bond	2	Convertible Bond	Callable Bond	Zero-Coupon Bond	Secured Bond	Which type of bond allows the holder to convert it into a specified number of shares?	\N
1431	To check the accuracy of debits and credits	2	To summarize net income	To report revenue	To check the accuracy of debits and credits	To calculate taxes	What is the primary purpose of a trial balance?	\N
1432	Earnings Before Interest, Taxes, Depreciation, and Amortization	1	Earnings Balance Including Total Depreciation Adjustments	Earnings Before Interest, Tax, and Dividend Allocation	Earnings Before Income, Taxes, and Direct Allocation	Earnings Before Interest, Taxes, Depreciation, and Amortization	What does EBITDA stand for?	\N
1433	It is probable and can be reasonably estimated	1	It is possible but not probable	It is probable and can be reasonably estimated	It has already been paid	It is remote	A contingent liability should be recorded if:	\N
1434	Asset Turnover Ratio	2	Asset Turnover Ratio	Quick Ratio	Interest Coverage Ratio	Debt-to-Equity Ratio	Which financial ratio measures a company’s efficiency in using its assets to generate revenue?	\N
1435	Faster collection of receivables	2	Decreasing sales	Higher outstanding debts	Faster collection of receivables	Slower cash flow	What does an increasing accounts receivable turnover ratio indicate?	\N
1436	Inventory	2	Cost of Goods Sold	Sales Revenue	Accounts Payable	Inventory	In double-entry accounting, which account is debited when inventory is purchased on credit?	\N
1437	Gross Profit Margin	2	Operating Margin	Net Profit Margin	Return on Equity	Gross Profit Margin	Which financial metric represents the percentage of revenue remaining after deducting cost of goods sold?	\N
1438	Capital Lease	2	Deferred Lease	Operating Lease	Equity Lease	Capital Lease	Which type of lease is recorded as an asset and liability on the balance sheet?	\N
1439	Substance Over Form	2	Matching Principle	Monetary Unit Assumption	Consistency Principle	Substance Over Form	Which accounting concept ensures that financial reports reflect economic reality rather than just legal form?	\N
1440	Cash Flow Statement	2	Cash Flow Statement	Income Statement	Statement of Retained Earnings	Balance Sheet	Which financial statement reports cash inflows and outflows over a period of time?	\N
1441	The discount rate at which the net present value is zero	2	The discount rate at which the net present value is zero	The book value of assets	The tax liability of a company	The total profit of a project	The internal rate of return (IRR) is used in capital budgeting to determine:	\N
1442	Straight-Line	2	Double Declining Balance	Units of Production	Straight-Line	Sum-of-the-Years’ Digits	Which depreciation method results in equal annual depreciation expenses?	\N
1445	Revenue Recognition Principle	2	Revenue Recognition Principle	Matching Principle	Full Disclosure Principle	Historical Cost Principle	Which principle states that revenue should be recognized when earned, not when received?	\N
1446	Revenue	3	Net Profit	Gross Profit	Operating Income	Revenue	What is the term for the total amount of money received from sales before any expenses are deducted?	\N
1447	Net Profit Margin	2	Inventory Turnover Ratio	Debt-to-Equity Ratio	Current Ratio	Net Profit Margin	Which financial ratio measures a company’s profitability in relation to revenue?	\N
1448	Facilitating buying and selling of stocks	1	Facilitating buying and selling of stocks	Providing loans to businesses	Managing government funds	Issuing government bonds	What is the function of a stock exchange?	\N
1449	Matching Principle	2	Cost Principle	Matching Principle	Revenue Recognition Principle	Full Disclosure Principle	Which accounting principle ensures expenses are recorded in the same period as related revenues?	\N
1450	Sole Proprietorship	2	Partnership	Franchise	Corporation	Sole Proprietorship	What is the term for a business owned and operated by a single individual?	\N
1451	Regulating monetary policy	1	Managing stock market trades	Selling insurance policies	Providing commercial loans	Regulating monetary policy	What is the primary role of the central bank?	\N
1452	Fixed Cost	2	Marginal Cost	Opportunity Cost	Fixed Cost	Variable Cost	Which type of cost remains constant regardless of production levels?	\N
1453	Strengths, Weaknesses, Opportunities, Threats	1	Strategy, Wealth, Objectives, Tactics	Strengths, Weaknesses, Opportunities, Threats	Sales, Workforce, Operations, Trade	Systems, Workflows, Operations, Targets	What does SWOT analysis stand for?	\N
1454	Profit	2	Profit	Capital	Expense	Loss	What is the term for the difference between total revenue and total cost?	\N
1455	Capitalism	2	Socialism	Communism	Mixed Economy	Capitalism	Which economic system allows private ownership with minimal government intervention?	\N
1456	Return on Investment	1	Rate of Inflation	Retail of Inventory	Return on Investment	Revenue on Interest	What does ROI stand for in business?	\N
1457	Income Statement	2	Cash Flow Statement	Balance Sheet	Retained Earnings Statement	Income Statement	Which financial document summarizes a company’s financial performance over a period?	\N
1458	Partnership	2	Corporation	Franchise	Partnership	Sole Proprietorship	Which type of business involves two or more individuals sharing ownership and responsibility?	\N
1459	Accounts Payable	2	Revenue	Accounts Payable	Retained Earnings	Accounts Receivable	What is the term for money owed by a company to suppliers?	\N
1460	Opportunity Cost	2	Marginal Cost	Sunk Cost	Opportunity Cost	Fixed Cost	Which concept refers to the potential benefits lost when choosing one alternative over another?	\N
1461	Risk Management	1	Increasing Profits	Risk Management	Avoiding Taxation	Raising Capital	What is the primary function of insurance?	\N
1462	Corporation	2	Partnership	Sole Proprietorship	Corporation	Joint Venture	Which type of business structure protects owners from personal liability?	\N
1463	Gross Domestic Product (GDP)	2	Balance of Trade	Gross Domestic Product (GDP)	Net National Income	Consumer Price Index	What is the term for the total market value of all goods and services produced within a country?	\N
1464	Franchise Agreement	2	Joint Venture	Merger	Franchise Agreement	Partnership Agreement	What is the term for an agreement between a franchisor and a franchisee?	\N
1465	FIFO (First-In, First-Out)	2	LIFO (Last-In, First-Out)	Weighted Average	Specific Identification	FIFO (First-In, First-Out)	Which type of inventory valuation method assumes the oldest inventory is sold first?	\N
1466	Franchise	2	Franchise	Trademark	Copyright	Patent	What is the term for the legal right to use another company’s name and brand?	\N
1467	Balance Sheet	2	Balance Sheet	Annual Report	Income Statement	Cash Flow Statement	Which document provides details about a company’s financial position for a specific time?	\N
1468	Cash Flow Statement	2	Cash Flow Statement	Income Statement	Balance Sheet	Statement of Retained Earnings	Which financial statement provides insights into a company’s cash inflows and outflows?	\N
1469	Monopolistic Competition	2	Perfect Competition	Monopolistic Competition	Oligopoly	Monopoly	Which type of market has many sellers offering similar but not identical products?	\N
1470	Availability of Substitutes	2	Government Regulations	Availability of Substitutes	Company Profits	Level of Inflation	Which factor directly affects the elasticity of demand?	\N
1471	Aggregate Demand	3	Aggregate Demand	Derived Demand	Consumer Surplus	Market Demand	What is the term for the total amount of goods and services demanded in an economy?	\N
1472	Cost Leadership	2	Niche Marketing	Cost Leadership	Market Segmentation	Differentiation	Which strategy focuses on reducing production costs to offer lower prices?	\N
1473	Merger	2	Merger	Acquisition	Franchising	Joint Venture	What is the process of combining two businesses into one called?	\N
1474	Public Corporation	1	Public Corporation	Partnership	Sole Proprietorship	Private Limited Company	Which type of business involves selling shares to the public?	\N
1475	Distributes goods to retailers	1	Manufactures products	Manages production facilities	Sells directly to consumers	Distributes goods to retailers	What is the role of a wholesaler in the supply chain?	\N
1476	Price Skimming	2	Price Skimming	Bundle Pricing	Penetration Pricing	Loss Leader Pricing	Which pricing strategy involves setting high prices for new products?	\N
1477	International Trade	2	International Trade	Diversification	Retail Expansion	Domestic Market	What is the term for selling products in multiple countries?	\N
1478	Value-Added Tax (VAT)	1	Corporate Tax	Income Tax	Value-Added Tax (VAT)	Property Tax	Which type of tax is based on the value of goods and services sold?	\N
1479	Shortage	2	Shortage	Equilibrium	Market Failure	Surplus	Which term refers to a situation where demand exceeds supply?	\N
1480	Creating demand for products	1	Setting financial policies	Creating demand for products	Regulating supply chain	Managing production	What is the primary function of marketing?	\N
1514	Satisfy customer needs profitably	1	Satisfy customer needs profitably	Reduce competition	Lower product costs	Limit advertising expenses	What is the main goal of marketing?	\N
1481	The ability of an asset to be quickly converted into cash	2	The total assets of a business	The level of risk in an investment	The ability of an asset to be quickly converted into cash	The profitability of a company	What does the term 'liquidity' refer to in finance?	\N
1482	Current Ratio	2	Gross Profit Margin	Current Ratio	Return on Investment	Debt-to-Equity Ratio	Which ratio is used to evaluate a company's short-term liquidity position?	\N
1483	To guarantee payment to the seller	2	To provide a discount on future purchases	To guarantee payment to the seller	To reduce taxation on imports	To ensure the quality of goods delivered	What is the main purpose of a 'Letter of Credit' in international trade?	\N
1484	First In, First Out	2	Fixed Interest Finance Operation	Final Input, Final Output	First In, First Out	Fast Inventory Flow Optimization	What does 'FIFO' stand for in inventory management?	\N
1485	Penetration Pricing	3	Penetration Pricing	Cost-Plus Pricing	Premium Pricing	Price Skimming	Which pricing strategy involves setting a low initial price to attract customers and increase market share?	\N
1486	To evaluate long-term investment projects	2	To determine annual tax liability	To allocate funds for employee salaries	To manage day-to-day expenses	To evaluate long-term investment projects	What is the main purpose of 'Capital Budgeting'?	\N
1487	Recording expenses in the same period as related revenues	2	Reconciling all bank transactions monthly	Recording expenses in the same period as related revenues	Using the same accounting method for all transactions	Ensuring that cash inflows and outflows are equal	In accounting, what does the 'Matching Principle' refer to?	\N
1488	Command Economy	2	Mixed Economy	Market Economy	Traditional Economy	Command Economy	Which economic system is characterized by government control over production and distribution?	\N
1489	The point where total revenue equals total costs	1	The point where total revenue equals total costs	The point where profit is maximized	The point where market competition is lowest	The point where demand and supply intersect	What does 'Break-even Point' mean in business?	\N
1490	Asset Turnover Ratio	3	Equity Multiplier	Asset Turnover Ratio	Earnings Per Share	Debt Service Ratio	Which financial metric is used to measure the efficiency of a company's assets in generating revenue?	\N
1491	To facilitate international trade agreements	2	To provide financial aid to developing countries	To facilitate international trade agreements	To set interest rates for global economies	To regulate exchange rates	What is the primary function of the WTO (World Trade Organization)?	\N
1492	Corporation	2	Franchise	Partnership	Corporation	Sole Proprietorship	Which type of business ownership provides the highest level of personal liability protection?	\N
1493	Strengths, Weaknesses, Opportunities, Threats	2	Sales, Wages, Operations, Turnover	Strengths, Weaknesses, Opportunities, Threats	Stock, Worth, Output, Trade	Supply, Workload, Optimization, Taxes	What does 'SWOT Analysis' stand for in business strategy?	\N
1494	Dividing a market into distinct groups with similar needs	2	Reducing the price of a product to increase sales	Offering the same product to all consumers	Dividing a market into distinct groups with similar needs	Expanding operations to new geographic areas	Which of the following best describes 'Market Segmentation'?	\N
1495	Maximizing shareholder wealth	2	Increasing market share	Minimizing taxation	Enhancing customer satisfaction	Maximizing shareholder wealth	What is the primary goal of financial management?	\N
1496	Accrual Accounting	3	Cash Accounting	Materiality Concept	Accrual Accounting	Historical Cost Principle	Which accounting concept ensures that revenues and expenses are recorded when they are incurred rather than when cash is received or paid?	\N
1497	Investigating financial fraud and irregularities	2	Investigating financial fraud and irregularities	Optimizing supply chain logistics	Managing payroll systems	Developing marketing strategies	What is the role of 'Forensic Accounting' in business?	\N
1498	Fixed Cost	2	Variable Cost	Marginal Cost	Fixed Cost	Opportunity Cost	Which type of cost remains constant regardless of the level of production?	\N
1499	Using borrowed capital to increase potential returns	1	Maximizing product differentiation	Reducing operational expenses	Using borrowed capital to increase potential returns	Investing in low-risk assets	What does 'Leverage' mean in financial management?	\N
1500	Regulate monetary policy	1	Control stock market	Set product prices	Issue credit cards	Regulate monetary policy	What is the primary function of the central bank?	\N
1501	Income statement	1	Income statement	Trial balance	Balance sheet	Cash flow statement	Which financial statement shows a company's profitability?	\N
1502	Monopoly	1	Duopoly	Monopoly	Oligopoly	Perfect competition	What is the term for a market structure with a single seller?	\N
1503	Price skimming	2	Loss leader pricing	Penetration pricing	Psychological pricing	Price skimming	Which pricing strategy involves setting a high price initially?	\N
1504	Stock certificate	1	Bond	Invoice	Stock certificate	Check	Which document represents ownership in a company?	\N
1505	Taxes	2	Taxes	Loans	Exports	Donations	What is the primary source of government revenue?	\N
1506	Accounts payable	2	Accounts payable	Cash reserves	Revenue	Inventory	Which of the following is a liability for a company?	\N
1507	Combination of two companies	1	Launching a new product	Hiring more employees	Issuing more stock	Combination of two companies	What is a merger?	\N
1508	Rent	1	Utility bill	Sales commission	Rent	Raw materials	What is an example of a fixed cost?	\N
1509	B2C (Business to Consumer)	2	P2P (Peer to Peer)	B2B (Business to Business)	C2C (Consumer to Consumer)	B2C (Business to Consumer)	What is the term for a company that sells directly to consumers?	\N
1510	Market economy	2	Command economy	Mixed economy	Market economy	Traditional economy	Which economic system is based on supply and demand with minimal government control?	\N
1511	Show financial position	1	Forecast future sales	Track daily transactions	Analyze competitors	Show financial position	What is the purpose of a balance sheet?	\N
1512	A business operating under a parent company’s brand	1	An investment in the stock market	A business operating under a parent company’s brand	A non-profit organization	A government-owned enterprise	What is a franchise?	\N
1513	Bond	2	Stock	Dividend	Bond	Mutual fund	Which financial instrument represents a loan to a company or government?	\N
1515	Legal protection for a brand name or logo	1	A type of investment	A financial statement	A government tax	Legal protection for a brand name or logo	What is a trademark?	\N
1516	Bank guarantee for payment	1	A tax incentive	A customer loyalty program	Bank guarantee for payment	A type of marketing strategy	What is a letter of credit?	\N
1517	Corporation	1	Franchise	Corporation	Partnership	Sole proprietorship	Which business structure has limited liability?	\N
1518	Examination of financial records	1	Hiring process	Marketing strategy	New product launch	Examination of financial records	What is an audit?	\N
1519	Structural unemployment	2	Structural unemployment	Cyclical unemployment	Seasonal unemployment	Frictional unemployment	Which type of unemployment occurs due to technological advancements?	\N
1520	First In, First Out	2	Final Income, Final Outcome	Financial Investment, Financial Output	First In, First Out	Fastest Inventory, Fastest Out	What does FIFO stand for in inventory management?	\N
1521	A payment to shareholders	1	A form of debt	A type of bond	A financial statement	A payment to shareholders	What is a dividend?	\N
1522	Fluctuations in economic activity	1	Fluctuations in economic activity	Government tax policy	Annual financial reports	Marketing campaign schedule	What is a business cycle?	\N
1523	Withdrawing more money than available	1	A marketing strategy	A business expense	Withdrawing more money than available	A type of stock investment	What is an overdraft?	\N
1524	Measure of a company's ability to pay short-term obligations	1	Measure of a company's ability to pay short-term obligations	Annual tax payment	Profitability measurement	Total market value of a company	What is a liquidity ratio?	\N
1525	Cost of production	1	Employee salaries	Consumer preference	Cost of production	Advertising budget	Which factor affects supply the most?	\N
1526	Value of one currency in terms of another	1	Value of one currency in terms of another	The stock market growth rate	The interest rate set by banks	The annual inflation rate	What is an exchange rate?	\N
1527	Identifying and mitigating business risks	1	Increasing customer loyalty	Expanding business operations	Setting product prices	Identifying and mitigating business risks	What is risk management?	\N
1528	A business owned by its members	1	A business owned by its members	A type of stock exchange	An advertising strategy	A government program	What is a cooperative?	\N
\.


--
-- Data for Name: quiz_sub_category; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.quiz_sub_category (quizsubcategory_id, name) FROM stdin;
1	Verbal Reasoning
2	Quantitative Reasoning
3	Physics
4	Chemistry
5	Mathematics
6	Biology
7	Islamiat/Ethics
8	Pakistan Studies
9	General Knowledge / IQ
10	Computer Science
11	Statistics
12	Economics
13	Accounting
14	Commerce
\.


--
-- Data for Name: quiz_sub_category_main_category; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.quiz_sub_category_main_category (quiz_sub_category_main_category_id, quizcategory_id, quizsubcategory_id) FROM stdin;
1	1	1
2	1	2
3	1	5
4	1	3
5	1	4
6	2	1
7	2	9
8	2	6
9	2	3
10	2	4
11	3	1
12	3	2
13	3	7
14	3	8
15	3	9
16	4	1
17	4	2
18	4	5
19	4	3
20	4	10
21	5	1
22	5	2
23	5	5
24	5	11
25	5	12
26	6	1
27	6	2
28	6	13
29	6	14
30	6	12
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

COPY public.university (id, created_by, created_date, last_modified_by, last_modified_date, about, accrediatetion_body, apply_date, average_fees, name, rank, start_date, website_link, entry_test_date) FROM stdin;
28	Hannan	2024-12-10 01:00:47.677189	\N	\N	National University of Sciences and Technology (NUST) is a premier national university with global standing. Since its inception in 1991, it has developed into a comprehensive university with a focus on science and technology. Today, it is ranked among the top 100 world universities aged under 50 and No 1 engineering and technology university of Pakistan. Moreover, it is among the elite league of world universities in the disciplines of Electrical and Electronic Engineering and Computer Science and Information Systems, besides its recognition among the top universities from emerging economies, which speaks of the hard work of its leadership, faculty, researchers and students.\nNUST has earned a premier position because of its stringent quality assurance regime and robust research ecosystem. It has won "International Quality Award" at Asia Pacific Quality Network (APQN) Conference and Annual General Meeting held at Vietnam in 2014 and "Turnitin Academic Integrity Award" in 2015.\nAs many as 18 constituent institutions, functioning under the umbrella of NUST, are imparting high-quality education at both undergraduate and postgraduate levels with the central campus located in Islamabad. The University offers 164 academic programs, including 46 multidisciplinary programs, in the fields of Engineering, Information Technology, Natural Sciences, Management Sciences, Social Sciences and Humanities, and Art and Architecture. NUST simultaneously pursues a wide range of research areas. As many as 100 patents have been filed by the University till date, out of which 27 have already been awarded.\nThe role of faculty in the University's development is of paramount importance. Most of them hold PhD degrees from renowned universities of the world. Another important facet of its growth is the development of international academic linkages. Currently, it has active collaboration with 125 institutions and research organizations from across 32 different countries.\nNUST programs and activities are aligned with the United Nation's Sustainable Development Goals (SDGs), Pakistan Government's Vision 2015, especially in the field of development of sustainable technologies, Medium Term Development Framework (MTDF) of HEC and Science, Technology and Innovation Policy of Ministry of Science and Technology.\nWith its strong emphasis on community-focused learning, NUST shapes morally conscientious, socially responsible and ethically sensitive citizens. Community Service Course is mandatory for all undergraduate students. Student-run Community Service Club, with more than 3,000 members, is active in different areas. The University also houses the secretariat of Pakistan Chapter of The Talloires Network, with as many as 67 national universities on board. In recognition of civic engagement activities in the area of education for empowerment, NUST was awarded first place in "MacJannet Prize for Global Citizenship" in 2015.	HEC,INQAAHE, APQN	2024-11-27 00:00:00	108608.69	National University Of Science & Technology, Islamabad	4	2025-02-01 00:00:00	https://www.nust.edu.pk	2025-02-01 00:00:00
55	Hannan	2025-02-23 13:43:39.198966	\N	\N	Mission Statement\r\nKhyber Medical University aims to promote professional competence through learning and innovation for providing comprehensive quality health care to the nation.\r\n\r\nKMU Vision\r\nKhyber Medical University will be the global leader in health sciences academics and research for efficient and compassionate health care.	CME, CDCE	2024-11-22 00:00:00	114978.68	Khyber Medical University, Peshawar	68	\N	https://www.kmu.edu.pk	2024-11-22 00:00:00
63	Hannan	2025-02-23 13:43:39.198966	\N	\N	Vision\r\nTo become a leading institution in creating knowledge and competencies for inclusive development.\r\n\r\nMission\r\nTo foster creative pedagogy, innovative research and inclusive communication.	HEC, PEC	2024-08-25 00:00:00	58407.48	National University Of Modern Languages ( Peshawar Campus ), Peshawar	123	\N	https://www.numl.edu.pk/peshawar	2024-08-25 00:00:00
68	Hannan	2025-02-23 13:43:39.198966	\N	\N	Al-Hamd Islamic University (AIU), established in 2005, is a private institution located in quetta, balochistan, Pakistan. Recognized by the Higher Education Commission (HEC) of Pakistan, AIU offers a diverse range of undergraduate and postgraduate programs across various disciplines. AIU is committed to providing quality education with an emphasis on Islamic teachings. The university aims to produce well-rounded academicians and individuals with strong ethical values.	HEC	2024-08-18 00:00:00	60000	Al- Hamd Islamic University, quetta	160	\N	https://www.aiu.edu.pk	\N
69	Hannan	2025-02-23 13:43:39.198966	\N	\N	balochistan University of Information Technology & Management Sciences (BUITEMS), established in 2002, is a public research university located in quetta, balochistan, Pakistan. The university offers a diverse range of undergraduate and postgraduate programs across various disciplines, including engineering, information technology, and management sciences. BUITEMS is dedicated to providing quality education with a focus on research and development. The university operates multiple campuses, each specializing in different academic fields, and is committed to fostering an environment conducive to learning and innovation.	HEC,PEC	2021-10-15 00:00:00	48095.27	balochistan University Of It & Management Sciences, quetta	116	\N	https://www.buitms.edu.pk	\N
70	Hannan	2025-02-23 13:43:39.198966	\N	\N	Bolan Medical College (BMC), established in 1972, is a public medical institution located in quetta, balochistan, Pakistan. It serves as a leading center for medical education and research in the region. BMC offers undergraduate and postgraduate programs in various medical and health sciences disciplines. The college is affiliated with the Bolan University of Medical and Health Sciences (BUMHS), which oversees its academic and administrative functions.	HEC,PMDC	2024-08-19 00:00:00	35030	Bolan Medical College / Bolan Hospital, quetta	174	\N	https://www.bmc.edu.pk	\N
71	Hannan	2025-02-23 13:43:39.198966	\N	\N	Bolan University of Medical & Health Sciences (BUMHS), established in 2017, is a public medical university located in quetta, balochistan, Pakistan. It serves as the first and only medical university in the province, aiming to provide quality education and research opportunities in the medical and health sciences fields. \r\nBUMHS.EDU.PK\r\n\r\nAbout BUMHS: BUMHS offers a range of undergraduate and postgraduate programs in medical and health sciences, including MBBS, BDS, and various allied health sciences courses. The university is committed to fostering an environment conducive to learning and research, with a focus on producing skilled healthcare professionals to meet the region's needs.	HEC,PMDC	2024-08-30 00:00:00	42500	Bolan University Of Medical & Health Sciences, quetta	156	\N	https://www.bumhs.edu.pk	\N
72	Hannan	2025-02-23 13:43:39.198966	\N	\N	balochistan has the privilege to house its first Women’s University at quetta. The need for a Women’s University in balochistan was felt from many decades, this need was finally realized when the Governor of balochistan, Mr. Owais Ahmed Ghani , promulgated an Ordinance No. 1 of 2004 to establish the Sardar Bahadur Khan Women’s University at quetta. On 26th August 2004, balochistan Provincial Assembly passed The Sardar Bahadur Khan Women’s University Act. The University has been established in Sardar Bahadur Khan Santorium very generously donated by the Pakistan Railways without any compensation. The premises of the University spread over 40 acres. Keys of the building were handed over to the Vice Chancellor on 18 March 2004, the building was witness to a historic transformation where it was given the status of balochistan's first and Pakistan's third Women's University. From that day onwards, the Sardar Bahadur Khan Women's University of balochistan has been striving to provide a safe haven to the women of balochistan and Pakistan who are interested in educational and intellectual pursuits.	HEC	2024-08-26 00:00:00	20178.55	Sardar Bahadur Khan Women University, quetta	196	\N	https://www.sbkwu.edu.pk	\N
73	Hannan	2025-02-23 13:43:39.198966	\N	\N	The University of balochistan was established in October-1970 through an Ordinance issued by the then Governor balochistan. In June 1996, the balochistan Assembly passed an ACT called the University of balochistan ACT 1996, later-on the provincial assembly had passed a unified ACT in 2022 for all public sector Universities. Therefore, presently UoB is governed by same Act of 2022. The University of balochistan is the biggest general University of the Province imparting Higher Education to the entire population of the province in Science, Arts and Humanities.\r\nPresently the University has 06 faculties, 52 departments, 06 specialized centers, 57 affiliated colleges, 03 institutes, 04 campuses and 01 constituent law college. The University initially started with three departments i.e. Physics, Chemistry and Geology. With the passage of time, new departments have been established, three Institutes (Institute of Management Sciences, Institute of Bio-Chemistry, Institute of Education & Research) and following specialized centers : Center of Excellence in Mineralogy, Pakistan Study Center, Area Study Center, balochistan Study Center, China Study Centre, Center for Advance Studies in Vaccinology and Bio-Technology, one constituent Law College, following sub-campuses : Jungle Bagh campus quetta, City Campus quetta, Mastung Campus, Kharan Campus, Pishin Campus, Killa-Saifullah Campus, and  several other affiliated colleges are there. Furthermore, the Abdul Samad Khan Shaheed Chair, and Nawab Yousaf Aziz Magsi Chair has been established at UoB.\r\n\r\nFour year BS program has only been started in different departments and likewise departments are successfully running Master's, M.Phil and PhD degree programs. The University has shifted to semester system w.e.f.. 2017. \r\nThe current enrolment is over 12000 in different degree programs. 48 UG , 41 M.Phil /MS and 21 PhD programs are offered.\r\nAdmission is given to the local as well as domicile residents of the province on the following basis:-\r\na. Open Merit balochistan 10%.\r\nb. Open merit quetta District 15%.\r\nc. Open Merit: District other than quetta. 75%.\r\nd. A number of seats are also reserved for other disciplines.\r\nThe University of balochistan campus is ISO 9001:2008 and ISO 14001:2004 certified	HEC	2024-07-23 00:00:00	48248.68	University Of balochistan, quetta	87	\N	https://www.uob.edu.pk	\N
74	Hannan	2025-02-23 13:43:39.198966	\N	\N	The National University of Modern Languages was established as an institute in 1969 to help people communicate and understand each other in different oriental and occidental languages, to assimilate different cultures and to act as springboard for emerging disciplines. Initially, the institute provided language training facilities to personnel of armed forces and other government services of Pakistan. It was upgraded to University on May 29, 2000. In achieving this benchmark of a fully autonomous University, it has crossed many barriers and achieved a status of a seat of learning contributing new knowledge in local and global perspective and now teaches 27 oriental and occidental languages in addition to a number of emerging disciplines. Now, the University has a vibrant and well-grounded research program, offering MS/MPhil and PhD research degrees in various disciplines.	HEC	2023-03-24 00:00:00	39617.67	National University Of Modern Languages ( quetta Campus ), quetta	123	\N	https://www.numl.edu.pk/quetta	\N
75	Hannan	2025-02-23 13:43:39.198966	\N	\N	National University of Sciences and Technology (NUST) is a premier national university with global standing. Since its inception in 1991, it has developed into a comprehensive university with a focus on science and technology. Today, it is ranked among the top 100 world universities aged under 50 and No 1 engineering and technology university of Pakistan. Moreover, it is among the elite league of world universities in the disciplines of Electrical and Electronic Engineering and Computer Science and Information Systems, besides its recognition among the top universities from emerging economies, which speaks of the hard work of its leadership, faculty, researchers and students.\r\nNUST has earned a premier position because of its stringent quality assurance regime and robust research ecosystem. It has won "International Quality Award" at Asia Pacific Quality Network (APQN) Conference and Annual General Meeting held at Vietnam in 2014 and "Turnitin Academic Integrity Award" in 2015.\r\nAs many as 18 constituent institutions, functioning under the umbrella of NUST, are imparting high-quality education at both undergraduate and postgraduate levels with the central campus located in Islamabad. The University offers 164 academic programs, including 46 multidisciplinary programs, in the fields of Engineering, Information Technology, Natural Sciences, Management Sciences, Social Sciences and Humanities, and Art and Architecture. NUST simultaneously pursues a wide range of research areas. As many as 100 patents have been filed by the University till date, out of which 27 have already been awarded.\r\nThe role of faculty in the University's development is of paramount importance. Most of them hold PhD degrees from renowned universities of the world. Another important facet of its growth is the development of international academic linkages. Currently, it has active collaboration with 125 institutions and research organizations from across 32 different countries.\r\nNUST programs and activities are aligned with the United Nation's Sustainable Development Goals (SDGs), Pakistan Government's Vision 2015, especially in the field of development of sustainable technologies, Medium Term Development Framework (MTDF) of HEC and Science, Technology and Innovation Policy of Ministry of Science and Technology.\r\nWith its strong emphasis on community-focused learning, NUST shapes morally conscientious, socially responsible and ethically sensitive citizens. Community Service Course is mandatory for all undergraduate students. Student-run Community Service Club, with more than 3,000 members, is active in different areas. The University also houses the secretariat of Pakistan Chapter of The Talloires Network, with as many as 67 national universities on board. In recognition of civic engagement activities in the area of education for empowerment, NUST was awarded first place in "MacJannet Prize for Global Citizenship" in 2015.	HEC,INQAAHE, APQN	2024-11-27 00:00:00	143005	National University Of Science And Technology, quetta Campus, quetta	4	\N	https://www.nust.edu.pk	\N
44	Hannan	2025-02-23 13:43:39.198966	\N	\N	Ilma University, formerly known as the Institute of Business & Technology (IBT), is a private institution in Karachi, Pakistan, established in 2001 and granted university status in 2017. The campus features modern facilities, including spacious classrooms, advanced labs, a digital library, a mosque, and sports clubs, fostering a supportive learning environment.\r\n\r\nThe university offers accredited programs in Management Sciences, Computer Science, Science & Technology, and Media & Design, emphasizing industry-oriented skills, research, and innovation. With global partnerships in the UK, US, Far East, and Middle East, Ilma University provides students with a world-class education, promoting academic excellence, personal growth, and social responsibility.	HEC,NBEAC,NCEAC,PEC	2022-09-10 00:00:00	113671.88	Ilma University, karachi	151	\N	https://www.ilmauniversity.edu.pk	2022-09-10 00:00:00
7	Hannan	2024-12-10 01:00:47.677189	\N	\N	Alhamd Islamic University, established by the Alhamd Educational System (AES) in 1995, was founded with the vision of promoting education across various sectors. AES operates several educational institutions, including Balochistan Institute of Technology, BIT Girls College, Dar-e-Arqam School of Islam and Modern Sciences, Dar-e-Arqam Girls College, and Quran Research Academy. The university was formally chartered by the Government of Balochistan under Act II of 2005, granting it degree-awarding authority in multiple fields, including Islam, Science, Technology, Education, Law, Arts, and Engineering. Alhamd Islamic University aims to provide quality education while integrating Islamic values with modern learning. It is known for its commitment to academic excellence, research, and community service, serving as a key educational institution in the region.	HEC	2023-02-28 00:00:00	57000	Alhamd Islamic University [ibd], Islamabad	75	2025-04-15 00:00:00	https://www.aiu.edu.pk	2025-04-15 00:00:00
42	Hannan	2025-02-23 13:43:39.198966	\N	\N	The National College of Arts (NCA), founded in 1875, is Pakistan's premier institution for higher education in the fields of fine arts, design, and architecture. Renowned for its legacy and academic excellence, NCA offers diverse programs that cultivate creativity, critical thinking, and practical skills. The college prepares students for successful careers in various art forms, architecture, and design disciplines, with a distinguished faculty guiding them toward professional achievements. With a focus on both traditional techniques and modern innovations, NCA continues to shape the cultural landscape of Pakistan.	HEC,PEC,NACAD	2024-09-10 00:00:00	109655.43	National College Of Arts, Lahore	75	2024-08-26 00:00:00	https://www.nca.edu.pk	2024-09-10 00:00:00
8	Hannan	2024-12-10 01:00:47.677189	\N	\N	National College of Business Administration and Economics (NCBA&E) was established in 1994 as a private institution with a focus on delivering excellence in teaching and fostering strong partnerships with industry. The college quickly earned recognition in management studies and expanded its academic offerings with the introduction of Computer Science in 1997. In 2002, NCBA&E received its charter from the Government of Punjab, further solidifying its status as a leader in higher education. \r\n\r\nLocated in Lahore, Pakistan's second-largest city and an educational hub, NCBA&E plays a vital role in the local and national education landscape. It offers a wide range of programs, including professional certifications, and undergraduate, graduate, and postgraduate degrees, catering to the diverse needs of students. The collegeÔÇÖs commitment to providing world-class education is evident in its advanced facilities, investment in technology, and robust research culture. This dedication not only prepares students for successful careers but also contributes to the broader economic and social development of the region and the country.\r\n\r\nThe institution emphasizes intellectual curiosity, innovation, and integrity, aiming to equip students with the knowledge and skills required to make meaningful contributions to society. NCBA&E's mission is to promote lifelong learning and personal growth, preparing its students for productive careers through a blend of scholarly and professional pursuits. With a focus on research and development, NCBA&E continues to be a center of excellence in education, guiding its students toward a brighter future.	HEC,NBEAC,NCEAC	2024-12-15 00:00:00	99579.55	National College Of Business Administration And Economics, Lahore, Lahore	122	2025-02-17 00:00:00	https://www.ncbae.edu.pk	2025-02-17 00:00:00
9	Hannan	2024-12-10 01:00:47.677189	\N	\N	NUR International University (NIU), located in Lahore, Pakistan, offers an innovative and globally-oriented education with a strong emphasis on research and academic excellence. The university integrates Eastern and Western educational principles to develop well-rounded professionals equipped to lead in various sectors. NIU is committed to preparing students for successful careers by providing them with a broad knowledge base, critical thinking skills, and hands-on learning experiences. With a state-of-the-art campus and a focus on integrity and innovation, NIU aims to make a positive impact on society through education	HEC,PNC	2024-09-30 00:00:00	167257.5	Nur International University, Lahore	177	2024-10-17 00:00:00	https://www.niu.edu.pk	2024-10-17 00:00:00
10	Hannan	2024-12-10 01:00:47.677189	\N	\N	The Pakistan Institute of Fashion and Design (PIFD) in Lahore is a public sector university, chartered by the Government of Pakistan, dedicated to fostering excellence in fashion, design, and allied disciplines. Located in Johar Town, Lahore, PIFD is a prominent institution specializing in design education, offering both undergraduate and postgraduate programs across various creative fields. These programs include Fashion Design, Textile Design, Leather Accessories and Footwear, Furniture Design, and Jewellery Design, along with an MPhil in Art and Design.\n\nThe university aims to bridge the gap between academia and industry by producing skilled graduates prepared to meet the evolving demands of the creative sector. PIFD prides itself on its state-of-the-art facilities and a campus environment that encourages innovation and critical thinking. The institute also emphasizes affordability while maintaining high-quality education, making it accessible to a broad range of students.\n\n	HEC	2024-07-30 00:00:00	158636.36	Pakistan Institute Of Fashion Design, Lahore	140	2024-09-09 00:00:00	https://www.pifd.edu.pk	2024-09-09 00:00:00
11	Hannan	2024-12-10 01:00:47.677189	\N	\N	Punjab Tianjin University of Technology (PTUT) in Lahore stands as Pakistan's first public sector technological university dedicated to bridging the gap between academic learning and industry needs. Established in collaboration with the Government of Punjab and three prestigious Tianjin universities in China, PTUT aims to revolutionize technical education. The university provides advanced programs in engineering technology, emphasizing applied knowledge and practical skills tailored for industry employment. Its focus on hands-on training makes it a pioneering institution for producing skilled technologists in fields like mechanical, civil, electrical, and automotive engineering, as well as fashion and textile designÔÇï	HEC,TEVTA	2024-07-25 00:00:00	25500	Punjab Tianjin University Of Technology, Lahore	185	\N	https://www.ptut.edu.pk	2024-07-25 00:00:00
45	Hannan	2025-02-23 13:43:39.198966	\N	\N	Indus University, located in Karachi, Pakistan, was established in 2004 as the Indus Institute of Higher Education and was granted university status in 2012. The university offers undergraduate, graduate, and postgraduate programs across various disciplines, including engineering, business administration, film and TV, and art and design. It is recognized by the Higher Education Commission of Pakistan and has received a five-star ranking from the Charter Inspection and Evaluation Committee of the Sindh Government. Indus University has also established international collaborations with over 40 universities worldwide	HEC,PEC,NBEAC,NCEAC	2024-11-30 00:00:00	125732	Indus University, karachi	99	\N	https://www.indus.edu.pk	2024-11-30 00:00:00
12	Hannan	2024-12-10 01:00:47.677189	\N	\N	Established in March 2011, Qarshi University has swiftly established itself as a progressive institution focused on delivering quality education. Obtaining its charter the same year, the university embarked on a journey of rapid expansion and development, aiming to become a leading center of higher education. Backed by Qarshi Industries, the university benefits from a solid foundation that supports its sustainable growth and achievement of strategic goals.\r\n\r\nQarshi University offers a broad array of programs through its four faculties: Eastern Medicine & Allied Health Sciences, Management and Social Sciences, Computer Science, and Sciences. This diverse selection ensures that the university is able to meet the needs of the dynamic and ever-evolving business and healthcare sectors. The institution is committed to nurturing both academic excellence and personal growth, offering a nurturing environment for intellectual and professional development.\r\n\r\nThe university prides itself on its competent faculty, high levels of student satisfaction, and strong graduate employability. Students benefit from a comprehensive range of support services, including on-campus counseling aimed at mental health and personal development. This holistic approach ensures that students are well-equipped for both their professional careers and personal lives. Situated on Canal Road in a prime location, Qarshi University is easily accessible from surrounding residential areas, providing a conducive setting for both academic and extracurricular activities. The universityÔÇÖs vibrant campus life is enriched with a wide variety of clubs, sports, and cultural events, creating a well-rounded educational experience for its students.\r\n\r\nQarshi University is committed to offering programs that are aligned with international standards, making it a preferred choice for students who seek a comprehensive educational journey. With the backing of Qarshi Foundation and a distinguished Board of Trustees, the university is on a path to excellence in both education and research.	HEC,NCEAC	2024-01-24 00:00:00	142900	Qarshi University (lhr), Lahore	194	2025-02-25 00:00:00	https://www.qu.edu.pk	2025-02-25 00:00:00
13	Hannan	2024-12-10 01:00:47.677189	\N	\N	Rashid Latif Khan University (RLKU), located in Lahore, Pakistan, is a private institution founded with a mission to deliver quality education across multiple disciplines. The university offers programs in various fields such as medical sciences, allied health, business administration, law, computer science, and social sciences. It is known for its commitment to academic excellence, robust faculty, and extensive infrastructure that supports both academic and extracurricular activities. RLKU aims to provide a student-centered learning environment with modern facilities, including a hospital, library, and wellness center. Additionally, students have opportunities to engage in various student societies and clubs that foster personal and professional development.\r\n\r\nThe university provides a range of undergraduate and graduate programs, focusing on both academic rigor and practical application. It emphasizes preparing students for the workforce by offering programs that meet the needs of modern industries. \r\n\r\nRLKU is dedicated to maintaining high standards of teaching, research, and student welfare, aiming to become a recognized leader in higher education in Pakistan. It is fully equipped to support the diverse educational needs of students, blending technology with traditional methods to foster an effective learning environment.	HEC	2024-10-18 00:00:00	150000	Rashid Latif Khan University, Lahore	217	\N	https://www.rlku.edu.pk	2024-10-18 00:00:00
14	Hannan	2024-12-10 01:00:47.677189	\N	\N	Superior University Lahore, established in 2003, has emerged as a prominent educational institution dedicated to fostering innovation in higher education. The universityÔÇÖs commitment to providing quality education is evident in its diverse range of academic offerings, which include undergraduate, postgraduate, and professional degree programs across multiple disciplines. Its academic faculties encompass business, economics, computer science, engineering, allied health sciences, art and design, and more.\n\nSuperior University aims to equip students with the skills necessary to thrive in the competitive global market. The universityÔÇÖs emphasis on research, innovation, and real-world application helps students gain valuable industry experience. Furthermore, Superior is committed to creating a supportive environment that promotes not only academic excellence but also personal and professional growth.\n\nStudents benefit from state-of-the-art facilities, including modern libraries, advanced research labs, and a wide range of extracurricular activities. The university is also focused on global connections, offering international programs and partnerships to help students broaden their perspectives.	HEC,NBEAC,PEC,	2024-09-28 00:00:00	187202.41	The Superior University, Lahore	37	2025-03-03 00:00:00	https://www.superior.edu.pk	2025-03-03 00:00:00
15	Hannan	2024-12-10 01:00:47.677189	\N	\N	The University of Lahore (UOL) is a leading private institution established in 1999. It has grown significantly, with campuses in multiple locations across Pakistan, including Lahore, Islamabad, Sargodha, and Gujrat, and even extending internationally to Uganda. UOL offers a wide range of undergraduate, graduate, and doctoral programs across its faculties, which include engineering, management sciences, law, arts and social sciences, and health sciences.\r\n\r\nThe university is dedicated to high-quality research and provides various research centers, such as the Center for Research in Molecular Medicine and the Lahore Incubation Center. UOL maintains an international presence, with students from various countries, and offers exchange programs and collaborations with global academic institutions.\r\n\r\nIn terms of student support, UOL provides a rich campus life with extracurricular activities, clubs, and sports facilities. The university also places a strong emphasis on student welfare, offering career counseling, mental health services, and academic advising.\r\n\r\nUOL has also been recognized internationally, featuring in global rankings like QS and Times Higher Education, with a focus on sustainable practices, including green energy projects.\r\n\r\nFor more details about programs and offerings, the universityÔÇÖs comprehensive infrastructure, and its impact on education, visit their official site.	HEC,NBEAC,NCEAC,NTC,PBC,PCATP,PEC,NAEAC,PNC,PMC,PCP	2024-09-14 00:00:00	178108.79	The University Of Lahore ( Main Campus ), Lahore	16	\N	https://www.uol.edu.pk	2024-09-14 00:00:00
16	Hannan	2024-12-10 01:00:47.677189	\N	\N	University College of Medicine & Dentistry offers one of the most forward-looking educational environments in Medicine & Dentistry in the country.\r\n\r\nSince its founding, UCMD has been committed to excellence in education, research, patient care and community service. The educational system of UCMD is at par with the international education standards. UCMD prides itself as a place where facilities for students and patients are at their best: students are being taught and patients are managed by highly qualified academicians and clinicians. Teaching facilities, laboratories, pre-clinical & clinical area, library, and IT Centre have been designed in a way that students are milled to be at their best.\r\n\r\nSo far 17 batches of doctors and 18 batches of dentists have passed out and are working in various public and private institutions in and outside Pakistan. There is a shift of paradigm from conventional teaching to problem-oriented learning in this College that has lead students to grow in excellence in patient management.\r\n\r\nThe College of Medicine & Dentistry has its own ÔÇ£University of Lahore Teaching HospitalÔÇØ at Defence Road Campus, University Dental Hospital at Raiwind Road Campus while ÔÇ£Social Security Teaching HospitalÔÇØ, Multan Road, ÔÇ£Social Security Teaching HospitalÔÇØ, Kot Lakhpat and ÔÇ£Al-Khidmat Teaching HospitalÔÇØ, Mansoorah are attached to the University for the training of students in various clinical specialties.	PMDC,HEC,CPS,PHC,PPC,PNC	2024-12-19 00:00:00	1640000	University College Of Medicine And Dentistry, Lahore	16	\N	https://www.ucmd.uol.edu.pk	2024-12-19 00:00:00
17	Hannan	2024-12-10 01:00:47.677189	\N	\N	The University of Central Punjab (UCP) is a private institution in Lahore, Pakistan, chartered in 2002 by the Government of Punjab. It was initially formed through the merger of institutions under the Punjab Group of Colleges, including the Punjab College of Business Administration (PCBA), Punjab Institute of Computer Sciences (PICS), and others.\n\nUCP offers a broad range of academic programs across various disciplines. These programs are distributed across nine faculties: Engineering, Humanities and Social Sciences, Pharmaceutical Sciences, Law, Media and Communication Studies, Life Sciences, Information Technology and Computer Science, Language and Literature, and Science & Technology. The university provides both undergraduate and graduate programs, along with an emphasis on research and employability.\n\nIn terms of facilities, UCP boasts a modern campus equipped with state-of-the-art classrooms, laboratories, and a large auditorium. It also prioritizes sustainability, having installed solar panels to reduce its environmental footprint. The university is committed to fostering creativity, entrepreneurship, and critical thinking through its diverse student activities and its focus on research.\n\nUCP is accredited by several national bodies, including the Higher Education Commission (HEC) of Pakistan, the Pakistan Engineering Council (PEC) for its engineering programs, and the Pharmacy Council of Pakistan for its Pharm-D program	PEC,Washington Accord,NBEAC,PBC,NCEAC,PCP,NAEAC	2022-11-19 00:00:00	216817.72	University Of Central Punjab, Lahore	8	\N	https://www.ucp.edu.pk	2022-11-19 00:00:00
18	Hannan	2024-12-10 01:00:47.677189	\N	\N	Aga Khan University (AKU) is a prestigious institution dedicated to improving quality of life globally, with a focus on health, education, and community development. Founded in 1983 as Pakistan's first private university, AKU is a not-for-profit institution and part of the Aga Khan Development Network. The University aims to address local and global challenges through world-class education, innovative research, and exceptional healthcare delivery. AKUÔÇÖs mission emphasizes empowering women, supporting the disadvantaged, promoting pluralism, and working with global and local partners to achieve shared goals.\r\n\r\nInitially established as a health sciences university, AKU has grown to become one of the largest private healthcare providers in Pakistan and East Africa, with hospitals accredited by the Joint Commission International. Its influence extends beyond healthcare, with research and graduates contributing to health policy and practice both locally and internationally. In recent years, AKU has expanded its academic offerings, launching programs in teacher education, journalism, public policy, early childhood development, and Muslim civilizations. In 2023, the university launched a Faculty of Arts and Sciences, marking a new phase of growth with programs designed to develop future leaders in various fields.\r\n\r\nAs a leader in education and research, AKU continues to strive to be at the forefront of scientific and humanistic knowledge, contributing to the development of progressive economies, legal systems, and healthcare practices across the globe.	HEC,PMDC,CPSP,JCI,ACPE,RCSI,	2024-09-30 00:00:00	525630.36	Aga Khan University, karachi	1	\N	https://www.aku.edu	2024-09-30 00:00:00
19	Hannan	2024-12-10 01:00:47.677189	\N	\N	Baqai Medical University (BMU) is a prominent private institution established in 1996 under a bill passed by the Sindh Assembly, subsequently notified by the Governor of Sindh. Located in the rural setting of Gadap, karachi, the university spans a campus of 72 acres and includes seven blocks with a built-up area of 727,374 square feet. It houses 13 institutions, educates approximately 1,800 students, and offers 19 degrees and diplomas across various specialties. BMU employs over 1,000 individuals in diverse capacities, embodying its mission of community-based and community-oriented medical education.\r\n\r\nBMU stands out as PakistanÔÇÖs only university designed around the theme of Community-Based and Community-Oriented Medical Education. It integrates its academic objectives with social welfare, hosting projects such as free medical facilities and education initiatives for underserved communities. Its facilities include the Social Obstetric Unit in Gadap and Baqai Medical Complex in Surjani Town, which offer free outpatient services and support for rural communities. Furthermore, the university also emphasizes education without cost, providing resources like textbooks, uniforms, and meals at its affiliated schools.\r\n\r\nThe institution maintains a futuristic approach, continually refining its educational paradigms to meet international standards and produce skilled medical professionals who contribute significantly to societyÔÇï	HEC,PMDC,PCP,PNC,CPSP	2024-10-12 00:00:00	175602.33	Baqai Medical University, karachi	116	\N	https://www.baqai.edu.pk	2024-10-12 00:00:00
20	Hannan	2024-12-10 01:00:47.677189	\N	\N	Benazir Bhutto Shaheed University Lyari (BBSUL), located in karachi, Sindh, Pakistan, was established in 2010 to provide higher education opportunities, especially for the youth in underprivileged areas. The university's mission focuses on fostering education and development in various disciplines while promoting socioeconomic advancement. It emphasizes accessibility, offering stipends and scholarships to support students, particularly female learners, from low-income backgrounds.\r\n\r\nBBSUL offers undergraduate, graduate, and postgraduate programs in diverse fields, including business administration, computer science, pharmacy, education, and arts. It features facilities such as computer labs, libraries, and a sports complex to support holistic student development. The university prioritizes maintaining academic standards through its Quality Enhancement Cell (QEC), established under the Higher Education Commission (HEC).	HEC	2024-12-10 00:00:00	31066.5	Benazir Bhutto Shaheed University, Lyari, karachi	189	2025-01-20 00:00:00	https://www.bbsul.edu.pk	2025-01-20 00:00:00
21	Hannan	2024-12-10 01:00:47.677189	\N	\N	The Dadabhoy Institute of Higher Education (DIHE) was established in 2003, and received its charter as a degree awarding institute from the Government of Sindh, Pakistan through an act of Sindh Assembly. On the basis of its well designed academic programs, well qualified teaching faculty and state-of-art facilities; in 2005, DIHE was placed in the W ÔÇÿAÔÇÖ category by the Higher Education Commission. DIHE aspires to integrate academic excellence in different areas of studies to ensure unique educational experience. It incorporates the value based education system and best academic practices along with various technical as well as cultural initiatives in all the programs being offerd.\r\n\r\nOur academic programs are designed to provide students with the skills which helps them to prosper in the future workplace and beyond. This is achieved by imparting experiential knowledge in selected areas of study along with hands-on learning experiences through practicals, tutorials delivered faculty members. To summarize ÔÇô DIHE aims to provide its students an opportunity for personal and professional development for their future.\r\n\r\nDIHE offers following academic programs at its two campuses in karachi:\r\nFaculty of Business Administration\r\nFaculty of Computer Science\r\nFaculty of Law\r\nFaculty of Science\r\nFaculty of Social Sciences\r\n\r\nAll together there are 17 undergraduate, 7 graduate & 9 post graduate programs being run at Dadabhoy Institute of\r\nHigher Education.	HEC,PBC,AHPC	2021-03-31 00:00:00	91339.88	Dadabhoy Institute Of Higher Education, karachi	143	\N	https://www.dadabhoy.edu.pk	2021-03-31 00:00:00
22	Hannan	2024-12-10 01:00:47.677189	\N	\N	Dawood University of Engineering and Technology (DUET) in karachi, Pakistan, is a prominent institution that specializes in engineering, technology, and applied sciences. Established in 1962, it initially began as Dawood College of Engineering and Technology, envisioned by its founder, Mr. Ahmed Dawood, to support PakistanÔÇÖs industrial development. It became a university in 2013 through an Act of the Sindh Provincial Assembly.\r\n\r\nDUET offers a wide range of undergraduate and postgraduate programs across multiple faculties, including Civil Engineering, Electrical Engineering, Information and Computing Sciences, and more. Its programs are accredited by the Pakistan Engineering Council (PEC) and the Pakistan Council of Architects and Town Planners (PCATP). The university emphasizes practical, research-oriented learning and aligns its education with global standards like the Washington Accord.\r\n\r\nThe university actively fosters interdisciplinary research, entrepreneurship, and innovation. Its initiatives include the Center for Entrepreneurship Management and Emerging Technologies (CEMET) and sustainability-focused research aligned with the United NationsÔÇÖ Sustainable Development Goals (SDGs). DUET has also made significant strides in digital transformation and infrastructure development, supported by modern laboratories and state-of-the-art facilities.	PEC,PCATP,	2024-07-31 00:00:00	65285.71	Dawood University Of Engineering And Technology, karachi	136	\N	https://www.duet.edu.pk	2024-07-31 00:00:00
23	Hannan	2024-12-10 01:00:47.677189	\N	\N	DHA Suffa University (DSU), established in the year 2012, has systematically taken giant strides to become the institution of choice in Pakistan. The university offers undergraduate, graduate and doctoral programs in Engineering, Computer Science, Management Sciences, Humanities and Social Sciences and newly launched programs BS Business Analytics & Programming, BS Computational & Industrial Mathematics, BS Accounting & Finance, BS Software Engineering, BS Data Sciences, BE Civil Engineering, BS International Relations, BS English and BS Psychology. At DSU, students receive quality education and become part of an academic community sharing diverse interests. DSU not only helps to expand the mental faculties of individuals but also transforms them into more open-minded, accepting and involved citizens. With a vision to move forward, DSU intends on becoming a globally recognized institution of higher education and research by extending the frontiers of knowledge and contributing towards grooming the scholars of tomorrow. From the expansion of infrastructure to the development of technology, revamping of curricula to the formation of pedagogy, addition of foreign qualified faculty to the international collaborations multi face, DSU has been committed to provide well-equipped engineers, computer scientists, entrepreneurs and corporate leaders.	PEC,NCEAC,NBEAC,CIEC	2024-07-21 00:00:00	144028.57	Dha Suffa University(main Campus), karachi	77	\N	https://www.dsu.edu.pk	2024-07-21 00:00:00
24	Hannan	2024-12-10 01:00:47.677189	\N	\N	The Dow University of Health Sciences (DUHS), located in karachi, Pakistan, is one of the country's premier medical institutions. Established initially as Dow Medical College in 1945, it was restructured into DUHS in 2003. The university focuses on producing highly qualified medical and health professionals and is recognized for its emphasis on integrating research and community service within its academic framework.\r\n\r\nDUHS offers a broad spectrum of undergraduate, postgraduate, and doctoral programs in various health science fields, aiming to cater to the diverse healthcare needs of the community. Its state-of-the-art facilities include advanced laboratories, IT resources, and simulation centers for medical training. Additionally, DUHS is deeply committed to community outreach, providing diagnostic, preventive, and rehabilitative services, especially for underprivileged populations.\r\n\r\nThe university has consistently been ranked among Pakistan's top medical institutions and features prominently in international rankings, showcasing its impact on education, healthcare, and sustainable development goals.	HEC,PMDC,PCP,CPSP,FAIMER,PNAC,DRAP	2024-12-16 00:00:00	99847.45	Dow University Of Health Sciences, karachi	26	\N	https://www.duhs.edu.pk	2024-12-16 00:00:00
25	Hannan	2024-12-10 01:00:47.677189	\N	\N	Greenwich University, established in 1987, is a private educational institution located in karachi, Pakistan. Initially focused on management sciences, the university expanded over time to include faculties like Social Sciences, Humanities, Media Studies, and Fashion. In 1998, it became an autonomous degree-awarding institution under the Act of the Sindh Government.\r\n\r\nGreenwich is recognized for its modern, purpose-built campus in karachi, featuring air-conditioned facilities, advanced computer labs, a well-stocked library, and a vibrant academic environment. Its teaching philosophy emphasizes a student-centered approach and fosters well-rounded personality development. The university also incorporates Islamic values while promoting a global outlook in its education system.\r\n\r\nWith a history of achievements, Greenwich has expanded its international presence with a branch campus in Mauritius and developed robust research capabilities through initiatives like the Greenwich Research & Development Department (GRDC). It holds memberships with global organizations such as NAFSA, AACSB, and INQAAHE, underscoring its academic reputation and international reachÔÇï	HEC,TEC,AACSB,INQAAHHE	2024-07-14 00:00:00	97638.95	Greenwich University, karachi	124	\N	https://www.greenwich.edu.pk	2024-07-14 00:00:00
26	Hannan	2024-12-10 01:00:47.677189	\N	\N	Habib University in karachi is a premier institution dedicated to providing a world-class undergraduate education in liberal arts and sciences. Established with the vision to be South AsiaÔÇÖs leading liberal arts university, it emphasizes intellectual growth, interdisciplinary learning, and societal engagement. Its mission focuses on shaping futures by offering rigorous, contextually relevant education to talented students, regardless of financial or social barriers.\r\n\r\nThe universityÔÇÖs curriculum is deeply rooted in its Liberal Core, inspired by global best practices like Stanford University's model but adapted to regional contexts. This core emphasizes critical thinking, creativity, quantitative reasoning, and philosophical thought. Habib offers six undergraduate programs, including BS Computer Science, BS Computer Engineering, BS Electrical Engineering, BSc Social Development and Policy, BA Communication Design, and BA Comparative Humanities. These programs are designed to foster leadership, adaptability, and innovative problem-solving.	NaN	2023-01-31 00:00:00	1121083.33	Habib University, karachi	64	\N	https://www.habib.edu.pk	2023-01-31 00:00:00
43	Hannan	2025-02-23 13:43:39.198966	\N	\N	Hamdard University, established in 1991 by philanthropist Hakim Said, is one of Pakistan's earliest private research institutions. With campuses in Karachi and Islamabad, it offers a diverse range of undergraduate and postgraduate programs across various disciplines. The university is home to the Bait-ul-Hikmah library, one of South Asia's largest research libraries, housing over half a million books, some dating back to the 17th century. Hamdard University comprises eight faculties, nine research institutes, three teaching hospitals, and three affiliated engineering institutes. Its programs are accredited by bodies such as the Higher Education Commission (HEC), Pakistan Engineering Council (PEC), and Pakistan Medical and Dental Council (PMDC).	HEC,PMDC,PEC,PCP,NCEAC,NBEAC,SHEC,	2024-07-13 00:00:00	133537.42	Hamdard University, karachi	66	\N	https://www.hamdard.edu.pk	2024-07-13 00:00:00
46	Hannan	2025-02-23 13:43:39.198966	\N	\N	The Indus Valley School of Art and Architecture (IVS), established in 1989 in Karachi, is a private, non-profit institution dedicated to excellence in Fine Arts, Design, and Architecture. Granted an independent charter in 1994, IVS offers undergraduate programs in Architecture, Interior Design, Fine Arts, Communication Design, Textile Design, and Fashion Design. The school fosters creativity, critical thinking, and interdisciplinary collaboration. Managed by an Executive Committee under a Board of Governors, IVS provides a vibrant learning environment that prepares students for innovative careers in the arts and design industries.	HEC,PCATP	2024-07-31 00:00:00	350000	Indus Valley School Of Art And Architecture, karachi	18	\N	https://www.indusvalley.edu.pk	2024-07-31 00:00:00
47	Hannan	2025-02-23 13:43:39.198966	\N	\N	The Institute of Business Administration (IBA) in Karachi, established in 1955, is Pakistan's oldest business school and was the first outside North America. Initially founded with support from the University of Pennsylvania and the University of Southern California, IBA has evolved into a premier public sector institution offering a range of undergraduate, graduate, and doctoral programs. These include degrees in Business Administration, Accounting and Finance, Computer Science, Economics, and Social Sciences. IBA is accredited by the Higher Education Commission of Pakistan and is a member of the Association of Commonwealth Universities. The institute emphasizes discipline, creativity, tolerance, integrity, and teamwork, aiming to cultivate thought leaders equipped to navigate the complexities of the modern world	HEC,AMBA,NBEAC,SAQS,IACBE	2024-07-12 00:00:00	104120.98	Institute Of Business Administration [khi], karachi	7	\N	https://www.iba.edu.pk	2024-07-12 00:00:00
48	Hannan	2025-02-23 13:43:39.198966	\N	\N	The Institute of Business Management (IoBM), established in 1995 in Karachi, Pakistan, is a private institution that offers a wide range of undergraduate, graduate, and doctoral programs. Initially founded as the College of Business Management, IoBM has expanded into four colleges: the College of Business Management (CBM), the College of Economics and Social Development (CESD), the College of Computer Science and Information Systems (CCSIS), and the College of Engineering Sciences (CES). IoBM is recognized by the Higher Education Commission (HEC) of Pakistan and holds membership in various international and national professional bodies, including the Association of Commonwealth Universities and the International Association of Universities. Committed to innovation, research, and societal development, IoBM strives to be a leading educational institution both in Pakistan and globally.	HEC,BAAC,NBEAC,ACU,IAU	2022-07-28 00:00:00	132347.69	Institute Of Business Management, karachi	10	\N	https://www.iobm.edu.pk	2022-07-28 00:00:00
49	Hannan	2025-02-23 13:43:39.198966	\N	\N	Iqra University, established in 1998, is a private university located in Karachi, Pakistan, with additional campuses in Islamabad and Peshawar. The university offers a wide range of undergraduate, graduate, and doctoral programs in fields such as business administration, engineering, and social sciences. Iqra University is dedicated to fostering technical skills, critical thinking, and a sense of public duty among its students, with the goal of contributing to a progressive society. Its main campus in Karachi is a purpose-built, 13-story educational facility, featuring state-of-the-art classrooms, advanced laboratories, modern libraries, and dedicated study areas, creating an optimal environment for academic excellence. Iqra University has been recognized for its academic achievements and was ranked as the number one business school in Pakistan by the Higher Education Commission in 2016.	HEC,NBEAC,NCEAC,PEC	2023-01-21 00:00:00	98707.58	Iqra University [kch], karachi	12	\N	https://www.iqra.edu.pk	2023-01-21 00:00:00
50	Hannan	2025-02-23 13:43:39.198966	\N	\N	Jinnah Sindh Medical University (JSMU), located in Karachi, Pakistan, was established on June 1, 2012, evolving from the esteemed Sindh Medical College. As the largest medical university in Sindh, JSMU has 11 constituent institutes and around 35 affiliated colleges, catering to over 6,000 students in medical and allied health sciences. The university offers various undergraduate and postgraduate programs through institutions such as Sindh Medical College, APPNA Institute of Public Health, Institute of Pharmaceutical Sciences, and Institute of Nursing & Midwifery, among others. JSMU is committed to modernizing medical education by regularly updating its curriculum and facilities. It provides clinical training through affiliations with leading healthcare institutions, including Jinnah Postgraduate Medical Centre (JPMC), National Institute of Child Health (NICH), and National Institute of Cardiovascular Diseases (NICVD). Notably, JSMU is the first public sector medical university in Pakistan to implement computer-based examinations for all students. The university envisions becoming a socially accountable, nationally benchmarked institution focused on improving healthcare through education, leadership, research, and community service. Recognized by the Higher Education Commission (HEC) of Pakistan, JSMU continues to advance healthcare education and services in the region.	HEC,PMDC,CPSP,APQN	2024-12-12 00:00:00	139688.33	Jinnah Sindh Medical University, karachi	6	\N	https://www.jsmu.edu.pk	2024-12-12 00:00:00
51	Hannan	2025-02-23 13:43:39.198966	\N	\N	Jinnah University for Women (JUW), established in 1998 under the Anjuman-e-Islamia Trust founded by Al-Haj Moulvi Reyazuddin Ahmed (T.I), is Pakistan's first women's university. Located in Karachi, JUW offers a range of undergraduate, graduate, and doctoral programs across various disciplines. The university comprises five faculties: Science, Pharmacy, Social Sciences, Business Administration, Commerce & Economics, and Allied Medical Sciences. JUW is committed to empowering women through quality education, fostering intellectual and personal growth, and preparing students to become transformational citizens with strong ethical, cultural, and religious values. The campus features modern facilities, including a central library with over 60,000 books, specialized laboratories, and dedicated research centers. The university also provides scholarships on a merit-cum-need basis to support deserving students. JUW is recognized by the Higher Education Commission of Pakistan and continues to play a pivotal role in promoting female education in the country.	HEC,NBEAC,ISO	2024-11-15 00:00:00	35408.31	Jinnah University For Women, karachi	13	\N	https://www.juw.edu.pk	2025-11-15 00:00:00
52	Hannan	2025-02-23 13:43:39.198966	\N	\N	Karachi Institute of Economics and Technology (KIET), established in 1997, is a private higher education institution located in Karachi, Pakistan. Recognized by the Higher Education Commission (HEC) of Pakistan, KIET offers a diverse range of undergraduate, graduate, and doctoral programs across various disciplines, including engineering, business administration, computer science, media arts, and humanities. The institute is committed to providing quality education and fostering research and innovation. KIET operates multiple campuses, including the main campus at PAF Base Korangi Creek, a city campus on Shahrah-e-Faisal, and a North Nazimabad campus, all equipped with modern facilities to support academic and extracurricular activities. The institute has been recognized for its contributions to higher education and has established strong industry linkages to enhance learning and career opportunities for its students.	HEC,PEC,NCEAC,NBEAC,NTC,	2024-01-06 00:00:00	81861.22	karachi Institute Of Economics & Technology, karachi	21	\N	https://www.pafkiet.edu.pk	2025-01-06 00:00:00
53	Hannan	2025-02-23 13:43:39.198966	\N	\N	Karachi School of Business & Leadership (KSBL), established in 2010, is an independent graduate business school located in Karachi, Pakistan. Founded through a strategic collaboration between the Karachi Education Initiative (KEI) and the Cambridge Judge Business School, KSBL offers a range of graduate programs, including MBA, Executive MBA, MS in Business Analytics, and various undergraduate programs such as BS in Management & Entrepreneurship, BS in Information Technology Management, BS in Accounting & Finance, and BS in Computer Science. The school operates from a purpose-built campus designed by William McDonough Partners, inaugurated in 2013. In December 2018, KSBL launched the Engro Leadership Academy, aiming to develop the next generation of Pakistani leadership. KSBL is committed to providing future business leaders with the knowledge and skills to compete in a global marketplace, emphasizing ethical leadership, entrepreneurialism, technological proficiency, global awareness, and sustainability	HEC,AMBA,NBEAC	2020-03-26 00:00:00	424500	karachi School Of Business & Leadership, karachi	11	\N	https://www.ksbl.edu.pk	2025-03-26 00:00:00
27	Hannan	2024-12-10 01:00:47.677189	\N	\N	The National University of Modern Languages was established as an institute in 1969 to help people communicate and understand each other in different oriental and occidental languages, to assimilate different cultures and to act as springboard for emerging disciplines. Initially, the institute provided language training facilities to personnel of armed forces and other government services of Pakistan. It was upgraded to University on May 29, 2000. In achieving this benchmark of a fully autonomous University, it has crossed many barriers and achieved a status of a seat of learning contributing new knowledge in local and global perspective and now teaches 27 oriental and occidental languages in addition to a number of emerging disciplines. Now, the University has a vibrant and well-grounded research program, offering MS/MPhil and PhD research degrees in various disciplines.	HEC, NBEAC	2024-12-24 00:00:00	22982.92	National University Of Modern Languages, Islamabad, Islamabad	126	2025-02-03 00:00:00	https://www.numl.edu.pk	2025-02-03 00:00:00
29	Hannan	2024-12-10 01:00:47.677189	\N	\N	National University of Technology (NUTECH) is a federally chartered Higher Education Commission (HEC), Pakistan Engineering Council (PEC), National Technology Council (NTC), National Computing Education Accreditation Council (NCEAC) and National Vocational & Technical Training Commission (NAVTTC) recognized Islamabadbased University, administratively under Ministry of Science & Technology (MoST). NUTECH is envisioned to be an internationally acclaimed technology driven research university destined to produce national and international industry future characterful leaders, professionals and hi-tech skilled workforce. The National University of Technology (NUTECH) is established as a pioneer ÔÇÿUniversity for IndustryÔÇÖ to create, develop, implement and promote existing, emerging and future technologies for the country through world-class education in science, engineering, technology, other technologies, professional certifications, technical & vocational skills and other areas of scholarship. The UniversityÔÇÖs curricula and academic systems are based on the best international practices of worldÔÇÖs leading technology universities of USA and EU. Its learning systems are designed to promote science, engineering and technology based knowledge eco-system to inspire the youth as promising entrepreneurs of tomorrow. The undergraduate programs of NUTECH satisfy Washington accord, ABET and Bologna Process. NUTECH is in the process of planning its main campus to house 20,000 ÔÇô 30,000 students in future.	HEC, PEC, NTC	2025-07-07 00:00:00	94444.44	National University Of Technology, Islamabad	73	2025-09-01 00:00:00	https://www.nutech.edu.pk	2025-09-01 00:00:00
30	Hannan	2024-12-10 01:00:47.677189	\N	\N	Nestled in the serene setting of a beautiful countryside, Pakistan Institute of Engineering and Applied Sciences (PIEAS), Islamabad, is recognized as a preeminent federal public university devoted to higher education in specific disciplines of engineering, natural sciences and formal sciences. Although PIEAS offers BS, MS, MPhil and PhD degree programs, yet the postgraduate degree programs dominate. In addition to the degree programs, PIEAS also offers specialized short courses to engineers, scientists and other professionals for their continuing professional development. PIEAS highly qualified faculty matched with excellent infrastructure are instrumental in its endeavor to offer high quality education in the disciplines of engineering and applied sciences, fulfill national and regional requirements for highly qualified professionals and contribute to the welfare of humanity through education, research and development. The Institute has been ranked No. 1 for Engineering & Technology by the Higher Education Commission (HEC), Pakistan, in all the three rankings (2006, 2012, 2013) conducted so far.	HEC	2024-05-24 00:00:00	140000	Pakistan Institute Of Engineering & Applied Sciences, Islamabad	25	2025-09-09 00:00:00	https://www.pieas.edu.pk	2025-09-09 00:00:00
31	Hannan	2024-12-10 01:00:47.677189	\N	\N	Riphah International University, Islamabadis a private University, chartered by the Federal Government of Pakistan in 2002. The University was established to produce professionals with Islamic moral and ethical values. It is sponsored by a not-for-profit trust; namely, Islamic International Medical College Trust (IIMCT), created in 1995. The first project of the IIMCT was the Islamic International Medical College, Rawalpindi, established in 1996 by its Founding Managing Trustee; Maj. Gen. (Retd.) Muhammad Zulfiqar Ali Khan, TI(M), TBt (Late).\n\nCurrently, the University has 7 faculties various academic departments, and an overseas project.	HEC	2024-07-30 00:00:00	133099.93	Riphah International University, Islamabad	39	\N	https://www.riphah.edu.pk	2024-07-30 00:00:00
32	Hannan	2024-12-10 01:00:47.677189	\N	\N	To accomplish its mission, Shifa Tameer-e-Millat University aims at the following:\n\na. To establish following faculties supported with related academic infrastructure and highly qualified and experienced faculty:\n\n(1) Faculty of Health Sciences.\n\n(2) Faculty of Management Sciences.\n\n(3) Faculty of Arts and Social Sciences.\n\n(4) Faculty of Engineering Sciences.\n\n(5) Faculty of Basic Sciences.\n\nb. To establish academic and research facilities in such areas which correspond to the needs of domestic demands and meet global standards.\n\nc. To train younger generation through exposures to global educational requirements to become future leaders and professionals so as to positively contribute to social and economic uplift of the country.\n\nd. To inculcate in the students such values which are compatible with our religion, culture, history, traditions and social norms.\n\ne. To educate the students to the dictates of the global market demands in various professions.\n\nFaculties which are in the 'Schedule of Faculties' approved in 'First Statutes' of Shifa Tameer-e-Millat University are;\n\n(1) Faculty of Education.\n\n(2) Faculty of Pharmaceutical Sciences.\n\n(3) Faculty of Nursing and Midwifery.	HEC, PM&DC, PNC, PCP	2023-11-22 00:00:00	128384.62	Shifa Tameer-e-millat University, Islamabad	70	\N	https://www.stmu.edu.pk	2023-11-22 00:00:00
33	Hannan	2024-12-10 01:00:47.677189	\N	\N	SS-CASE-IT offers four-year Bachelor degrees in five domains of Computing (Artificial Intelligence, Computer Science, Cyber Security, Data Science, Software Engineering), Electrical and Computer Engineering, Business Administration, Accounting & Finance, Business Analytics, Financial Technology, English, and Mathematics.\n\nIn the field of Health Sciences, CASE offers 4-year Bachelor degrees in Medical Imaging Technology, Medical Lab Technology, Operation Theater Technology, Vision Sciences and Optometry. In addition, CASE also offers a five-year degree in Physical Therapy (DPT).\n\nAt the graduate level we offer Master degrees in Computer Science, Electrical Engineering, Engineering Management, Project Management, and Mathematics. PhD programs are offered in Electrical Engineering and Engineering Management.\n\nDegrees awarded by SS-CASE-IT are fully recognized by the Higher Education Commission (HEC) of Pakistan. Since its inception, SS-CASE-IT, has been dedicated to promoting human resource development in subjects driving todayÔÇÖs technology and health care revolutions. By providing comprehensive education in computing, engineering, management and health sciences which is making todayÔÇÖs information revolution possible, ensuring a balanced emphasis on both the software and hardware aspects of technology and the critical advancements in health sciences.\n\nArtificial Intelligence (AI) is a corner stone of our programs. Our AI Lab is at the forefront of executing cutting edge industrial projects. Together with our industrial arm, CARE (Pvt.) Ltd., we exemplify a successful model of industry-academic collaboration, setting a bench mark for others to follow.\n\nBy providing degree programs in computing, engineering, management, mathematics, and health sciences, SS-CASE-IT is dedicated to prepare human resource to meet todayÔÇÖs requirements and also of the future.	HEC, PEC, NCEAC	2024-08-21 00:00:00	108826.67	Sir Syed Case Institute Of Technology, Islamabad	229	\N	https://www.case.edu.pk	2024-08-21 00:00:00
34	Hannan	2024-12-10 01:00:47.677189	\N	\N	Abasyn University was chartered in 2009 under the act of Legislative Provisional Assembly of KPK in 2009 and is recognized by the Higher Education Commission (HEC), Pakistan. Abasyn University was the only University in KPK which was awarded category ÔÇÿWÔÇÖ at the inception which was the highest category to be awarded to any institution in the old ranking system by HEC. By the grace of Allah and the support of sponsors and staff, HEC has upgraded category ÔÇÿWÔÇÖ to ÔÇÿW3ÔÇÖ in the new ranking system.\n\nThe Abasyn University IslamabadCampus(AUIC) commented its operations in 2012 with the approval of the HEC. The AUIC is committed to providing quality education both at unger-graduate and post-graduate levels. The campus has grown rapidly both in terms of number of students and the number of degree programs offered over the last few years. Due to its reputuation and high standards, it attracts students from all over the country.\n\nThe campus has established state of art facilities in Chak Shahzad Islamabad. Highly qualified teaching and non-teaching staff have been hired. The campus has also established fully equipped labs with state of the art technologies and tools. The campus has also developed a well stocked library which has access to digital research databases, e-journals, e-books and e-reports.\n\nAbasyn University offers degree programs in various disciplines including Engineering, Computing, Business Administration, Social Sciences, Pharmacy, Life Sciences, Rehabilitation & Health Sciences and Technology. The degree programs offered by campus are accrediated by relevent accrediation bodies. BS Computer Science and BS Software Engineering are accrediated by National Computing Education Accreditation Council (NCEAC), BE Civil Engineering and BE Electrical Engineering programs are accrediated by Pakistan Engineering Council (PEC) and the Pharm-D program is accrediated by Pharmacy Council of Pakistan (PCP).	HEC, PEC,	2024-10-31 00:00:00	151200	Abasyn University (sub Campus), Islamabad	68	\N	https://www.abasynisb.edu.pk	2024-10-31 00:00:00
35	Hannan	2024-12-10 01:00:47.677189	\N	\N	Al-Khair University was established in 1994, under an act number XXVIII of the Legislative Assembly of Azad Jammu & Kashmir. The Main objective for the establishment of the University in the Private Sector was to supplement the Public Sector Education, by disseminating professional, scientific and technological education in the Country. With a view, however, to keep pace with changing scenario of education globally, the main focus is in the field of Marketing, Banking & Finance, Information Technology and Computer Oriented courses.\n\nAl- Khair University has progressive and innovative outlook and lays stress on the three functions of higher education namely teaching, Research and Service. Being a manifestation of unique perceptions these institutions envisages excellence in academic, scientific and professional spheres. Al-Khair University makes every possible Endeavour to realize the goal of education being the basic right of an individual.	HEC	\N	100000	Al-khair University [ajk], Islamabad	21	\N	https://www.alkhair.edu.pk	2025-03-05 00:00:00
36	Hannan	2024-12-10 01:00:47.677189	\N	\N	\nVision:\n\nTo be a center of excellence among the national universities known for its quality of teaching, learning, research and ethical values of the society.\n\nMission:\n\nTo produce quality professionals, highly skilled researchers in various fields of human endeavor, creative, enter pruner, dignified individuals, proud of their heritage, ethical values and committed to solving the contemporary issues of humanity.	HEC	\N	18000	Mohiuddin Islamic University[IslamabadCampus], Islamabad	106	\N	https://www.miu.edu.pk	2025-07-15 00:00:00
37	Hannan	2024-12-10 01:00:47.677189	\N	\N	Vision\nAir University aspires to be among the leading national universities, excelling in teaching, learning, research, innovation and public service.\n\nMission\nThe mission of Air University is to achieve excellence in teaching and research for producing graduates with sound professional knowledge, integrity of character, a keen sense of social responsibility and a passion for lifelong learning. The University shall stand committed to creating an environment conducive for attracting the best students, faculty and supporting staff for contributing to the development of a prosperous, peaceful and enlightened society.	HEC, SACSCOC	2024-07-15 00:00:00	77527.5	Air University, Islamabad	57	\N	https://www.au.edu.pk	2024-07-15 00:00:00
38	Hannan	2024-12-10 01:00:47.677189	\N	\N	The Allama Iqbal Open University was established in May, 1974, with the main objectives of providing educational opportunities to masses and to those who cannot leave their homes and jobs. During all these past years, the University has more than fulfilled this promise.It has opened up educational opportunities for the working people and has provided access to the females at their door steps. Allama Iqbal Open University is a pioneer institution which provides Masses access to education remotely. It is now breaking new grounds in the fields of professional, scientific, and technical education. It attempts to reach out to the remotest areas of Pakistan. It also attempts to harness modern information Technology for spreading education in Pakistan.\n\nThe idea of Distance Education was first mooted in UK in late 60s by the British Prime Minister, Mr. Harold Wilson. He was of the view that educational opportunities must be provided to those who might have missed better education due to early employment and wish to upgrade, their knowledge and skills, in their spare times in the evenings at home. The UK Open University was, thus established in 1969. Since then it has become a major institution of learning in UK and has opened up opportunities for millions of working people. The gospel of distance and Open Learning has, since then spread throughout the world. More than 70 Open Universities are operating around the world on the basis of Distance Education. Modern information Technology has made the task of Distance Education much more easier and effective. The AIOU, when established in 1974, was the second Open University in the world and first in Asia and Africa. It, thus, speaks of the foresight of the policy-makers of that time. As these past years of AIOU have proved, Distance Education has opened up new opportunities for millions, particularly women, and supplemented the efforts of the federal and provincial governments in a systematic way and that too without becoming a burden on their resources.\n\nThe idea of Distance Education assumed greater relevance and acceptance in Pakistan due to the factors of poverty and relative deprivation of women. The rate of literacy and excess to higher education is much lower in the poorer classes of Pakistan. The poverty ratio is much higher in the rural areas, where formal education is less focused. The literacy rate and education is lower for females in Pakistan, particularly in the rural areas, due to poverty and conservative traditions. Many conservative parents under the pressure of old age traditions do not allow their daughters to go out to the schools. The AIOU, through its system of Distance Education has, thus, provided educational opportunities to these housebound girls and women. This explains the reasons why the majority of the students enrolled with the University are females.\n\nProfessional and technical education in Pakistan is becoming very costly, especially in recent years, because of high fees of private sector in these fields. The lower middle class and poorer classes are being marginalized and their children have less chance to get higher education in fields like Business Administration, Computer Science, Medicine and Engineering. AIOU attempts to meet this challenge and to keep a window open for these classes by keeping the cost of education at minimum level and by creating a student assistance fund.	HEC	2024-10-15 00:00:00	24313.18	Allama Iqbal Open University, Islamabad	121	\N	https://www.aiou.edu.pk	2024-10-15 00:00:00
39	Hannan	2024-12-10 01:00:47.677189	\N	\N	Lahore City University is the project of Al-Rehman Education System (Pvt) Ltd. which is located in Saggian Road Lahore. Mian Muhammad Mushtaq, Cheif Executive of Al-Rehamn Developers has done wonder for the projects he has developed. His knowledge and expertise has made him who he is today.	HEC,PEC,NTC	\N	110000	Lahore City University, Lahore	70	\N	https://www.lcu.edu.pk	2024-12-08 00:00:00
40	Hannan	2024-12-10 01:00:47.677189	\N	\N	PIMSAT was established with the specific aim of providing students with direct access to the methodologies and skills that employers value most. All its students get a holistic rounded education, targeted specially of enhancing their opportunities for employment and unlocking their personal potential. The courses provide a focus for independent learning and practical knowledge and skills. It is seriously committed to improve the quality of business and technical education in Pakistan. It is managed by group of dedicated professionals and academicians who have committed their lives to the cause of higher education in Pakistan. We believe that human activities contribute to the success of an institution in variety of ways ÔÇÿÔÇÖAssets make things possible. People make things happenÔÇÖÔÇÖ Since its inception, PIMSAT imparted knowledge and skills to numerous individuals through many teaching programs. Competent management and lvy league faculty have played an important role in the professional and personal development of our students. It will continue to fulfill its responsibilities to the society by creating and providing facilities for personal and professional growth of individuals who wish to make a career in the fields of\n\nBusiness, Science and Technology. We understand that our students have chosen us from among the wide range of elite institutions and study options available to them. We provide broad spectrum of programs in the areas of Business Administration, Information, Technology, Applied Technology & Telecommunications. We also offer Bachelor of Technology in six disciplines i.e. Electronics, Electrical, Mechanical, Civil, Petrolium & Chemical. PIMSAT Department of Engineering & Technology offer B.E Electrical & Civil Engineering Programs. The unique feature that sets us aloof from others is our focus on personal and professional development of our students. The key to our success is the individual care and attention We give to each student.	HEC,PEC,QAHE	\N	65000	Pimsat Institute Of Higher Education [lhr], Lahore	169	\N	https://www.pimsat-khi.edu.pk	2024-08-24 00:00:00
41	Hannan	2024-12-10 01:00:47.677189	\N	\N	Welcome to the Shaheed Benazir Bhutto City University and thanks you for your interest in our graduate and postgraduate programs of studies. The decision to study at Shaheed Benazir Bhutto City University as a graduate or postgraduate level is one of the most important choices you will ever make, so it is vital that you consider all the available options carefully. The information on the website as well as in the catalogue you received will answer to some of the most frequently asked questions about graduate and postgraduate studies. It will also introduce you to the Shaheed Benazir Bhutto City University administration follows an open door policy encouraging students to share their problems with the management.\n\nUnder the present day scenario Institutions have to operate through increasingly complex and rapidly changing environment, as such the managers are required to be equally effective in cross national and cross-cultural settings. Our programs are equally sensitive to the changes and have been successful across a wide range of technical and business operations. At the Shaheed Benazir Bhutto City University one may decide to study at graduate or postgraduate level for many good reasons, foremost being the quality: we tent to live up to your expectation. We hope you will find Shaheed Benazir Bhutto City University the right place for you to continue your education. You are assured of a warm welcome and good care at Shaheed Benazir Bhutto City University and we look forward to welcome you aboard.	HEC	\N	263923.08	Shaheed Benazir Bhutto City University, karachi	42	\N	https://www.sbbcu.edu.pk	2024-12-21 00:00:00
54	Hannan	2025-02-23 13:43:39.198966	\N	\N	Islamia College Peshawar, the symbol of academic excellence is rich in history. Its building, which is the best embodiment of Muslim civilization in south Asia and its lush green lawns attract visitors from all over the country and abroad. It is not only the culminating point of the Aligarh Movement, it is in fact the beautiful combination of Aligarh and Deoband Schools of Thought. Being the breeding ground of the Pashtun intelligentsia, this great seat of learning is the place, where diamonds are skimmed since 1913. Moreover, Islamia College Peshawar was destined to become mother institution of the three universities and several colleges on its campus. The credit of this goes to Sir Sahibzada Abdul Qayyum, who is commonly called The Sir Sayyed of the Frontier and his sincere colleagues, who founded Islamia College Peshawar in 1913.	HEC,PBC	2019-03-20 00:00:00	67551.45	Islamia College University, Peshawar	36	\N	https://www.icp.edu.pk	2019-03-20 00:00:00
56	Hannan	2025-02-23 13:43:39.198966	\N	\N	Preston University, Pakistan was established as School of Business and Commerce in 1984 to foster academic excellence. Preston University is seriously committed to improving the quality of higher education in Pakistan. The university is managed by a group of dedicated professionals and academicians who have committed their lives to the cause of higher education in Pakistan. Since its inception in 1984, Preston Network has imparted knowledge and skills to thousands of individuals through many teaching programs.\r\n\r\nThe experience at this University has played an important role in the professional and personal development of our students. Preston University will continue to fulfill its responsibilities to the society by creating and providing facilities for personal and professional growth of individuals who wish to make a career in the fields of business administration, information technology, engineering and technology, natural and applied science, social sciences and education.\r\n\r\nPreston University is the first private university of Pakistan and now has one of the largest networks of campuses in the country. Being pioneer in private-sector higher education in Pakistan, we are proud that Preston University plays an important role as a leader and pace-setter in higher education in Pakistan.	HEC	2016-06-20 00:00:00	64691.67	Preston University [pesh], Peshawar	117	\N	https://www.preston.edu.pk	2016-06-20 00:00:00
57	Hannan	2025-02-23 13:43:39.198966	\N	\N	Sarhad University of Science & Information Technology, Peshawar is an established name in the educational circles of the country and abroad. It was established through an ordinance of the Government of Khyber Pakhtunkhwa and is duly recognized by the Higher Education Commission of Pakistan (HEC). The University has been ranked as category “W-3” which is the highest category awarded in terms of meeting academic, financial & physical infrastructure. The University prepares its students to meet local and global challenges in a highly spirited job market. The courses combine learning and job skills. SUIT is dedicated to impart high quality education with emphasis on demand oriented skill development and training in an enabling and conducive environment. The educational programs are properly designed to:\r\n\r\n Develop skills and competence in their areas of specializations, and acquire sophisticated, cross-functional education with owing emphasis on developing critical, analytical and logical thinking.\r\n\r\n Sarhad University has an exceptional national and international reputation, imparting quality education to a large number of students in various fields of learning, earning HEC highest rating of excellence for Engineering, Pharmacy, Computer, Management, Social and Biological Sciences. The education at Sarhad University is cost-based but affordable. The University is dedicated to students’ welfare and provides all support and guidance in their quest of successful careers and jobs.\r\n\r\n Courses for our academic programs have been designed by experts with a view to prepare a breed of planners, skilled workforce and creators of new products, systems and services. The curricula place special emphasis on novelty, creativity, analysis, problem identification and problem solving attributes.\r\n\r\n The faculty members have parental approach – a distinct feature of our campus culture. The supporting staff is cooperative, courteous and competent. The University is equipped with excellent learning resources and other allied campus facilities.	HEC,NTC	2024-11-01 00:00:00	59173.55	Sarhad University Of Science & Information Technology, Peshawar	76	\N	https://www.suit.edu.pk	2024-11-01 00:00:00
58	Hannan	2025-02-23 13:43:39.198966	\N	\N	Education is Key to Development. A country cannot develop economically unless her literacy rate is accelerated. This is one of the important factors regarding being less developed in the world. Pakistan is one of the countries in the world, which invest a lot in education sector with vast human resources base with abundance of talents. Efforts had been made and are ongoing to boost up literacy rate to capitalize the human resources through the economic tools of efficiency of labour to make breakthrough in the vicious circle of poverty.\r\n\r\n\r\nShaheed Benazir Bhutto Women University Peshawar is the First Public Sector Women University in the province of Khyber Pakhtunkhwa. Shaheed Benazir Bhutto Women University is named in commemoration of the contributions made by the significant ladies of Pakistan who bestow their life for the cause of women emancipation and for the betterment of the country. Mr. Akram Khan Durrani, Chief Minister of Khyber Pakhtunkhwa at that time inaugurated the campus on 1st September, 2004. The first ever female university was established in accordance with the Frontier Women University Act 2004 (N.-W.F.P. ACT NO. VI OF 2005) No. PA/NWFP/Legis: 1/2005/2677— The Frontier Women University Bill, 2004 having been passed by the Provincial Assembly of North-West Frontier Province on the 5th October. 2004 and assented to by the Governor of the North-West Frontier Province on 7th February, 2005 is hereby published as an Act of the Provincial Legislature of the North-West Frontier Province. (First published after having received the assent of the Governor of the North-West Frontier Province in the Gazette of the N. W.F.P. (Extraordinary), dated the 11th February, 2005).	HEC	2024-09-20 00:00:00	27580.36	Shaheed Benazir Bhutto Women University, Peshawar	159	\N	https://www.sbbwu.edu.pk	2024-09-20 00:00:00
59	Hannan	2025-02-23 13:43:39.198966	\N	\N	Since its establishment in 1981, this University has been playing a vital role in imparting Agricultural Education and conducting basic and applied agricultural research throughout the Province, and disseminating the results of agricultural research among the farmers and general public through its outreach/public service activities.\r\n \r\nBeing one of the leading institutions in the country, the University has been enjoying the prestige of providing high quality agricultural education and research to its students. The graduates of this University are serving in public-private sectors organizations on key positions within Pakistan and abroad. They are ambassadors of this University and have been bringing in laurels to the name and prestige of this University.\r\n \r\nDuring the present convocation 750 students are being awarded Bachelor, Master and Ph.D. degrees. Outstanding students will be decorated with Presidential Awards, Gold Medals, Silver Medals and Bronze Medals.\r\n \r\nThe university is a corporate body. It has powers, inter-alia, to provide instructions, trainings, research and outreach; in agriculture, animal husbandry and other such disciplines of learning. The mission of The University of Agriculture, Peshawar is:\r\nTo produce quality graduates in agriculture and related disciplines;\r\nTo conduct problem-solving farmer-oriented research to make the country self sufficient in food commodities\r\nTo provide educational and research linkages to rural communities and the public in order to alleviate poverty in rural areas.	HEC,NAEAC	2024-11-25 00:00:00	42130.34	The University Of Agriculture, Peshawar	60	\N	https://www.aup.edu.pk	2024-11-25 00:00:00
60	Hannan	2025-02-23 13:43:39.198966	\N	\N	Mission :\r\n\r\n"To produce highly qualified, well-rounded professionals through education who play a leading role in the society by powering and driving knowledge-based economy and offer research services and innovation for sustainable development"\r\n\r\nCore Values :\r\n\r\n1.   Integrity\r\n2.   Teamwork\r\n3.   Quality\r\n4.   Tolerance\r\n5.   Gender equality\r\n6.   Social responsibility\r\n7.   Collaboration\r\n8.   Transparency\r\n9.   Professionalism\r\n10.  Sustainability	HEC,PEC	2024-11-05 00:00:00	71866.67	University Of Engineering & Technology, Peshawar, Peshawar	229	\N	https://www.uetpeshawar.edu.pk	2024-11-05 00:00:00
61	Hannan	2025-02-23 13:43:39.198966	\N	\N	The University of Peshawar, as a mother educational institution of Khyber Pakhtunkhwa is an outcome of the dream of the father of the nation and was created as the first ever University after independence. It is vigorously working with its full zeal and spirit, truly serving and sacred cause of education altogether.\r\n\r\nThe University of Peshawar, being a mother Institution of the Khyber Pahtunkhwa is not only catering for the academic needs of Peshawar but also of the whole province and Federally Administered Tribal Areas (FATA). The highly qualified and trained faculty, student friendly and supportive administration, modern curricula, conductive academic environment and excellent infrastructure are the hallmarks of the University. Its role in political, industrial and government leadership is recognized. The University has an over whelming contribution in bringing positive changes in the society.	HEC	2023-10-16 00:00:00	86955.09	University Of Peshawar, Peshawar	19	\N	https://www.uop.edu.pk	2023-10-16 00:00:00
62	Hannan	2025-02-23 13:43:39.198966	\N	\N	Vision\r\nTo produce world-class professionals, who are responsible citizens and good human beings.\r\n\r\nMission\r\nTo identify and attract the most promising students from diverse communities, to shape them into visionary leaders and world-class professionals.\r\nTo impart quality education to students, irrespective of their financial background, ethnicity, gender or religion to create an inclusive society.\r\nTo promote research and scholarly activities to generate knowledge.	HEC, PEC	2024-07-05 00:00:00	132000	National University Of Computer And Emerging Sciences ( Peshawar Campus ), Peshawar	43	\N	https://www.nu.edu.pk	2024-07-05 00:00:00
64	Hannan	2025-02-23 13:43:39.198966	\N	\N	Qurtuba University of Science and Information Technology is one of the pioneer private sector Universities of Khyber PakhtunKhwa Pakistan. The University was established through a charter issued by the Governor (K.P) on 30th August 2001 and is recognized by the Higher Education commission (former UGC), Islamabad. Qurtuba University of Science and Information Technology is one of the pioneer private sector Universities of Khyber PakhtunKhwa Pakistan. The University was established through a charter issued by the Governor (K.P) on 30th August 2001 and is recognized by the Higher Education commission (former UGC), Islamabad. The University has been working sincerely towards the attainment of character-building and cultivate in its students the quest for inquiry so that they may extend the frontiers of knowledge & be able to bring peace & prosperity to the country. Our goal is to revive the memories of the city of Cordova, known as "Madinat-Ul-Ilm". This city was known as the cradle of knowledge and research for centuries. European scholars & students also thronged to this seat of learning & acquired specializations in various fields of knowledge.	HEC, PEC	2024-10-31 00:00:00	72431.37	Qurtuba University Of Science & Information Technology, Peshawar	139	\N	https://www.qurtuba.edu.pk	2024-10-31 00:00:00
65	Hannan	2025-02-23 13:43:39.198966	\N	\N	OUR VISION\r\nBRAINS Institute aspires to be a center of excellence, dedicated to “Opening Minds, Building Futures” by fostering innovation, knowledge, and growth for a brighter future\r\n\r\nOUR MISSION\r\nTo develop graduates with modern education and entrepreneurial skills, ready to tackle regional and global challenges in IT, Management Sciences, Engineering, and Technologies, while upholding cultural and ethical values.	HEC,PEC	2024-08-30 00:00:00	65416	Brains Institute, Peshawar	101	\N	https://www.brains.edu.pk	2024-08-30 00:00:00
66	Hannan	2025-02-23 13:43:39.198966	\N	\N	The Buraq Institute of Higher Studies (BIHS) is a private educational institution located in Peshawar, Khyber Pakhtunkhwa, Pakistan. Established to provide quality education across various disciplines, BIHS offers undergraduate and postgraduate programs in fields such as Business Administration, Computer Science, and Social Sciences. The institute emphasizes a balanced approach to education, integrating theoretical knowledge with practical skills to prepare students for the competitive job market.	HEC	2015-02-28 00:00:00	75000	Buraq Institute Of Higher Studies, Peshawar	250	\N	https://www.bihs.edu.pk	2015-02-28 00:00:00
67	Hannan	2025-02-23 13:43:39.198966	\N	\N	The Farkhanda Institute of Nursing and Public Health (FIN&PH), established in 1998, is a pioneering private nursing institution located in Peshawar, Khyber Pakhtunkhwa, Pakistan. Affiliated with Gandhara University, the institute offers a range of nursing and public health programs for both male and female students, emphasizing quality education and equitable access.	HEC,PNC	2024-09-18 00:00:00	90000	Farkhunda Institute Of Nursing And Public Health, Peshawar	180	\N	https://www.gandhara.edu.pk	2024-09-18 00:00:00
\.


--
-- Data for Name: university_contact; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.university_contact (universitycontact_id, email, phone_number, university_id, "university-id") FROM stdin;
1	info.aiu@alhamd.pk	0333 1535345	7	\N
2	admissions@ncbae.edu.pk	042-36525804	8	\N
3	hr@niu.edu.pk.	0320-4455148	9	\N
4	info@pifd.edu.pk	92 42-99232951-7	10	\N
5	info@ptut.edu.pk	042-9933 2438	11	\N
6	info@qu.edu.pk	0325-4395380\r\n	12	\N
7	info@rlku.edu.pk	042 111 626 262	13	\N
8	helpdeskhr@superior.edu.pk	(042) 111 000 078	14	\N
9	info@uol.edu.pk	(0)42 111865865	15	\N
10	info@ucmd.uol.edu.pk	(042) 111-865-865	16	\N
11	 info@ucp.edu.pk	(92)-42-35880007	17	\N
12	communications@aku.edu	92 21 3493 0051ÔÇïÔÇïÔÇïÔÇïÔÇïÔÇïÔÇïÔÇïÔÇïÔÇï	18	\N
13	info@baqai.edu.pk	(092-21)34410293	19	\N
14	info@bbsul.edu.pk	921-32744017	20	\N
15	%20admission@dadabhoy.edu.pk	 92 21 34389103-06	21	\N
16	registrar@duet.edu.pk	92 21 9923 2645	22	\N
17	saad.asif@dsu.edu.pk	021-35244851-2	23	\N
18	 dir@duhs.edu.pk.	92 21 38771000	24	\N
19	gu@greenwich.edu.pk	92 3062248363	25	\N
20	info@numl.edu.pk	92-51-9265100	27	\N
21	ugadmissions@nust.edu.pk	92-51-111-11-6878	28	\N
22	nfo@nutech.edu.pk	92-51-5476809	29	\N
23	registrar@pieas.edu.pk	92 (51) 1111 74327	30	\N
24	masood.minhas@riphah.edu.pk	923044186120	31	\N
25	online.admissions@stmu.edu.pk	92-51-849-3009	32	\N
26	info@case.edu.pk	92 51 6151 000	33	\N
27	Info@abasynisb.edu.pk	92 51 111 222 796	34	\N
28	info@alkhair.edu.pk	923331161666	35	\N
29	vc@miu.edu.pk	051 4485831	36	\N
30	admissions@au.edu.pk	051 9262557	37	\N
31	support@aiou.edu.pk	051 111 112 468	38	\N
32	info@lcu.edu.pk	92 42 35833813-8	39	\N
33	info@pimsat-khi.edu.pk	92 21 -3278-9888	40	\N
34	registrar@sbbcu.edu.pk	0336 3341537	41	\N
35	info.aiu@alhamd.pk	0333 1535345	7	\N
36	info@nca.edu.pk	92 42 99210544	42	\N
37	admissions@ncbae.edu.pk	042-36525804	8	\N
38	hr@niu.edu.pk.	0320-4455148	9	\N
39	info@pifd.edu.pk	92 42-99232951-7	10	\N
40	info@ptut.edu.pk	042-9933 2438	11	\N
41	info@qu.edu.pk	0325-4395380\r\n	12	\N
42	info@rlku.edu.pk	042 111 626 262	13	\N
43	helpdeskhr@superior.edu.pk	(042) 111 000 078	14	\N
44	info@uol.edu.pk	(0)42 111865865	15	\N
45	info@ucmd.uol.edu.pk	(042) 111-865-865	16	\N
46	 info@ucp.edu.pk	(92)-42-35880007	17	\N
47	communications@aku.edu	92 21 3493 0051​​​​​​​​​​	18	\N
48	info@baqai.edu.pk	(092-21)34410293	19	\N
49	info@bbsul.edu.pk	921-32744017	20	\N
50	%20admission@dadabhoy.edu.pk	 92 21 34389103-06	21	\N
51	registrar@duet.edu.pk	92 21 9923 2645	22	\N
52	saad.asif@dsu.edu.pk	021-35244851-2	23	\N
53	 dir@duhs.edu.pk.	92 21 38771000	24	\N
54	gu@greenwich.edu.pk	92 3062248363	25	\N
55	info@hamdard.edu.pk	92 331 1160109	43	\N
56	qec@ilmauniversity.edu.pk	0213-5120461	44	\N
57	asimurrehman@indus.edu.pk	111 400 300	45	\N
58	info@ivs.edu.pk	021-37130423	46	\N
59	snizamani@iba.edu.pk.	92-(21) 3810-4700	47	\N
60	admissions@iobm.edu.pk	9221 111 002 004	48	\N
61	info@iqra.edu.pk	021 111 264 264	49	\N
62	admissions@jsmu.edu.pk	021-99205185	50	\N
63	 info@juw.edu.pk	3661-9902	51	\N
64	shahbaz@pafkiet.edu.pk	0333-3017490	52	\N
65	admissions@ksbl.edu.pk	92 (21) 38771999	53	\N
66	info@numl.edu.pk	92-51-9265100	27	\N
67	ugadmissions@nust.edu.pk	92-51-111-11-6878	28	\N
68	nfo@nutech.edu.pk	92-51-5476809	29	\N
69	registrar@pieas.edu.pk	92 (51) 1111 74327	30	\N
70	masood.minhas@riphah.edu.pk	923044186120	31	\N
71	online.admissions@stmu.edu.pk	92-51-849-3009	32	\N
72	info@case.edu.pk	92 51 6151 000	33	\N
73	Info@abasynisb.edu.pk	92 51 111 222 796	34	\N
74	info@alkhair.edu.pk	923331161666	35	\N
75	vc@miu.edu.pk	051 4485831	36	\N
76	admissions@au.edu.pk	051 9262557	37	\N
77	support@aiou.edu.pk	051 111 112 468	38	\N
78	info@lcu.edu.pk	92 42 35833813-8	39	\N
79	info@pimsat-khi.edu.pk	92 21 -3278-9888	40	\N
80	registrar@sbbcu.edu.pk	0336 3341537	41	\N
81	registrar@icp.edu.pk	\r\n091-9222227-31	54	\N
82	ipdm@kmu.edu.pk	92 91 9217703	55	\N
83	peshawar@preston.edu.pk	92-91-5845540-2	56	\N
84	admissions@suit.edu.pk	(091) 5230931	57	\N
85	admissions@sbbwu.edu.pk	92-91-9224726	58	\N
86	pio@aup.edu.pk	0300 9001138	59	\N
87	registrar@uetpeshawar.edu.pk	(+92-91) 9222215	60	\N
88	admissions@uop.edu.pk	92919216701	61	\N
89	admissions.pwr@nu.edu.pk\r\n	111-128-128	62	\N
90	info-psh@numl.edu.pk	(091) 9218380	63	\N
91	info@qurtuba.edu.pk	92 91-5825707	64	\N
92	info@brains.edu.pk	92-91-5611637	65	\N
93	info.bihs@gmail.com	92 91 5702582	66	\N
94	info@gandhara.edu.pk	92 91 5844429-32	67	\N
95	info.aiu@alhamd.pk	92 81 2301777	68	\N
96	info@buitms.edu.pk \r\n	92 (81) 111-717-111	69	\N
97	principal@bmc.edu.pk 	92-81-9213070 	70	\N
98	registrar@bumhs.edu.pk	92-81-9213070	71	\N
99	info@sbkwu.edu.pk	92 (81) 9213303-5	72	\N
100	dit@um.uob.edu.pk	92 81-9211008	73	\N
101	info@numl.edu.pk	92-51-9265100	74	\N
102	exam@nbc.nust.edu.pk	081-9085-276 	75	\N
\.


--
-- Data for Name: university_location; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.university_location (universitylocation_id, latitude, longitude, city_id, university_id) FROM stdin;
4	33.75126	73.200676	4	7
5	31.582987	74.50091	5	8
6	31.31636	74.22473	5	9
7	31.466652	74.25627	5	10
8	31.447845	74.29781	5	11
9	31.424536	74.1779	5	12
10	31.27403	74.40531	5	13
11	31.335003	74.23578	5	14
12	31.392931	74.241455	5	15
13	31.392975	74.24042	5	16
14	31.447704	74.268234	5	17
15	24.892906	67.07339	6	18
16	24.988562	67.21499	6	19
17	24.869165	67.005325	6	20
18	24.872488	67.07352	6	21
19	24.878664	67.0477	6	22
20	24.814701	67.07992	6	23
21	24.857779	67.0109	6	24
22	24.787685	67.049706	6	25
23	24.9503	67.053	4	27
24	33.6425	72.993	4	28
25	33.6258	73.0115	4	29
26	33.6558	73.2646	4	30
27	33.6169	72.972	4	31
28	33.6777	73.0661	4	32
29	33.6936	72.824	4	33
30	33.6481	73.1644	4	34
31	32.970493	74.058235	4	35
32	33.5591	73.1951	4	36
33	33.7138	73.0247	4	37
34	33.685	73.0547	4	38
35	31.4999	74.3356	5	39
36	31.4976	74.321	5	40
37	24.985	67.3699	6	41
38	33.75126	73.200676	4	7
39	31.569212	74.30745	5	42
40	31.582987	74.50091	5	8
41	31.31636	74.22473	5	9
42	31.466652	74.25627	5	10
43	31.447845	74.29781	5	11
44	31.424536	74.1779	5	12
45	31.27403	74.40531	5	13
46	31.335003	74.23578	5	14
47	31.392931	74.241455	5	15
48	31.392975	74.24042	5	16
49	31.447704	74.268234	5	17
50	24.892906	67.07339	6	18
51	24.988562	67.21499	6	19
52	24.869165	67.005325	6	20
53	24.872488	67.07352	6	21
54	24.878664	67.0477	6	22
55	24.814701	67.07992	6	23
56	24.857779	67.0109	6	24
57	24.787685	67.049706	6	25
58	25.083685	67.01135	6	43
59	24.80875	67.121086	6	44
60	24.897987	67.079865	6	45
61	24.811749	67.01574	6	46
62	24.942102	67.114334	6	47
63	24.81248	67.1171	6	48
64	24.839819	67.08234	6	49
65	24.851345	67.04506	6	50
66	24.92535	67.029854	6	51
67	24.797697	67.1363	6	52
68	24.89001	67.07009	6	53
69	24.9503	67.053	4	27
70	33.6425	72.993	4	28
71	33.6258	73.0115	4	29
72	33.6558	73.2646	4	30
73	33.6169	72.972	4	31
74	33.6777	73.0661	4	32
75	33.6936	72.824	4	33
76	33.6481	73.1644	4	34
77	32.970493	74.058235	4	35
78	33.5591	73.1951	4	36
79	33.7138	73.0247	4	37
80	33.685	73.0547	4	38
81	31.4999	74.3356	5	39
82	31.4976	74.321	5	40
83	24.985	67.3699	6	41
84	33.9997	71.476	7	54
85	33.9893	71.439	7	55
86	33.9974	71.4965	7	56
87	33.9629	71.5282	7	57
88	34.056	71.5672	7	58
89	34.0206	71.4814	7	59
90	34.0031	71.4856	7	60
91	33.9982	71.4862	7	61
92	33.9803	71.4277	7	62
93	33.9941	71.4958	7	63
94	33.98029	71.44607	7	64
95	33.99745	71.46017	7	65
96	34.0151	71.5249	7	66
97	34.0151	71.5249	7	67
98	30.1798	66.975	8	68
99	30.1798	66.975	8	69
100	30.1798	66.975	8	70
101	30.1798	66.975	8	71
102	30.1129	66.574	8	72
103	30.164	66.9908	8	73
104	30.212	67.005	8	74
105	30.2525	67.0574	8	75
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

COPY public.user_quiz (userquiz_id, date, score, user_id, completed, quizcategory_id) FROM stdin;
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
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.city_city_id_seq', 8, true);


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
-- Name: program_program_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.program_program_id_seq', 1632, true);


--
-- Name: program_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.program_seq', 1, false);


--
-- Name: question_sub_main_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.question_sub_main_seq', 1, false);


--
-- Name: quiz_category_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.quiz_category_seq', 1, false);


--
-- Name: quiz_question_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.quiz_question_seq', 1, false);


--
-- Name: quiz_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.quiz_seq', 1, false);


--
-- Name: quiz_sub_category_main_category_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.quiz_sub_category_main_category_seq', 1, false);


--
-- Name: quiz_sub_category_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.quiz_sub_category_seq', 1, false);


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
-- Name: university_contact_universitycontact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_contact_universitycontact_id_seq', 102, true);


--
-- Name: university_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_id_seq', 75, true);


--
-- Name: university_location_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_location_seq', 1, false);


--
-- Name: university_location_universitylocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_location_universitylocation_id_seq', 105, true);


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
-- Name: question_sub_main question_sub_main_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.question_sub_main
    ADD CONSTRAINT question_sub_main_pkey PRIMARY KEY (question_sub_main_id);


--
-- Name: quiz_category quiz_category_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.quiz_category
    ADD CONSTRAINT quiz_category_pkey PRIMARY KEY (quizcategory_id);


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
-- Name: quiz_sub_category_main_category quiz_sub_category_main_category_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.quiz_sub_category_main_category
    ADD CONSTRAINT quiz_sub_category_main_category_pkey PRIMARY KEY (quiz_sub_category_main_category_id);


--
-- Name: quiz_sub_category quiz_sub_category_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.quiz_sub_category
    ADD CONSTRAINT quiz_sub_category_pkey PRIMARY KEY (quizsubcategory_id);


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
-- Name: app_user uksgg0yjxgl80p392p9ygv0yk4n; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT uksgg0yjxgl80p392p9ygv0yk4n UNIQUE (phone_number);


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
-- Name: user_quiz fklopf7f4u9f2515k33kamjjf1d; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_quiz
    ADD CONSTRAINT fklopf7f4u9f2515k33kamjjf1d FOREIGN KEY (quizcategory_id) REFERENCES public.quiz_category(quizcategory_id);


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
-- Name: question_sub_main fkpfumshd5im8na1il57ok7r6re; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.question_sub_main
    ADD CONSTRAINT fkpfumshd5im8na1il57ok7r6re FOREIGN KEY (quizquestion_id) REFERENCES public.quiz_question(quizquestion_id);


--
-- Name: quiz_sub_category_main_category fkr1mysrxw06yoklra58ypn8a5g; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.quiz_sub_category_main_category
    ADD CONSTRAINT fkr1mysrxw06yoklra58ypn8a5g FOREIGN KEY (quizcategory_id) REFERENCES public.quiz_category(quizcategory_id);


--
-- Name: quiz_sub_category_main_category fks5keg2kwyfexqm3fil4gt2srw; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.quiz_sub_category_main_category
    ADD CONSTRAINT fks5keg2kwyfexqm3fil4gt2srw FOREIGN KEY (quizsubcategory_id) REFERENCES public.quiz_sub_category(quizsubcategory_id);


--
-- Name: question_sub_main fktglcicvof8jglqesyoc4ne1k8; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.question_sub_main
    ADD CONSTRAINT fktglcicvof8jglqesyoc4ne1k8 FOREIGN KEY (quizsubcategorymaincategory_id) REFERENCES public.quiz_sub_category_main_category(quiz_sub_category_main_category_id);


--
-- Name: university_contact university_contact_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_contact
    ADD CONSTRAINT university_contact_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.university(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

