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
    about character varying(5000),
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
    university_id bigint
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
4	Islamabad	Islamabad Capital Territory
5	lahore	Punjab
6	karachi	Sindh
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
7	Hannan	2024-12-10 01:00:47.677189	\N	\N	Alhamd Islamic University, established by the Alhamd Educational System (AES) in 1995, was founded with the vision of promoting education across various sectors. AES operates several educational institutions, including Balochistan Institute of Technology, BIT Girls College, Dar-e-Arqam School of Islam and Modern Sciences, Dar-e-Arqam Girls College, and Quran Research Academy. The university was formally chartered by the Government of Balochistan under Act II of 2005, granting it degree-awarding authority in multiple fields, including Islam, Science, Technology, Education, Law, Arts, and Engineering. Alhamd Islamic University aims to provide quality education while integrating Islamic values with modern learning. It is known for its commitment to academic excellence, research, and community service, serving as a key educational institution in the region.	HEC	2023-02-28 00:00:00	57000	Alhamd Islamic University [ibd], Islamabad	75	2025-04-15 00:00:00	https://www.aiu.edu.pk
8	Hannan	2024-12-10 01:00:47.677189	\N	\N	National College of Business Administration and Economics (NCBA&E) was established in 1994 as a private institution with a focus on delivering excellence in teaching and fostering strong partnerships with industry. The college quickly earned recognition in management studies and expanded its academic offerings with the introduction of Computer Science in 1997. In 2002, NCBA&E received its charter from the Government of Punjab, further solidifying its status as a leader in higher education. \r\n\r\nLocated in Lahore, Pakistan's second-largest city and an educational hub, NCBA&E plays a vital role in the local and national education landscape. It offers a wide range of programs, including professional certifications, and undergraduate, graduate, and postgraduate degrees, catering to the diverse needs of students. The collegeÔÇÖs commitment to providing world-class education is evident in its advanced facilities, investment in technology, and robust research culture. This dedication not only prepares students for successful careers but also contributes to the broader economic and social development of the region and the country.\r\n\r\nThe institution emphasizes intellectual curiosity, innovation, and integrity, aiming to equip students with the knowledge and skills required to make meaningful contributions to society. NCBA&E's mission is to promote lifelong learning and personal growth, preparing its students for productive careers through a blend of scholarly and professional pursuits. With a focus on research and development, NCBA&E continues to be a center of excellence in education, guiding its students toward a brighter future.	HEC,NBEAC,NCEAC	2024-12-15 00:00:00	99579.55	National College Of Business Administration And Economics, Lahore, Lahore	122	2025-02-17 00:00:00	https://www.ncbae.edu.pk
9	Hannan	2024-12-10 01:00:47.677189	\N	\N	NUR International University (NIU), located in Lahore, Pakistan, offers an innovative and globally-oriented education with a strong emphasis on research and academic excellence. The university integrates Eastern and Western educational principles to develop well-rounded professionals equipped to lead in various sectors. NIU is committed to preparing students for successful careers by providing them with a broad knowledge base, critical thinking skills, and hands-on learning experiences. With a state-of-the-art campus and a focus on integrity and innovation, NIU aims to make a positive impact on society through education	HEC,PNC	2024-09-30 00:00:00	167257.5	Nur International University, Lahore	177	2024-10-17 00:00:00	https://www.niu.edu.pk
10	Hannan	2024-12-10 01:00:47.677189	\N	\N	The Pakistan Institute of Fashion and Design (PIFD) in Lahore is a public sector university, chartered by the Government of Pakistan, dedicated to fostering excellence in fashion, design, and allied disciplines. Located in Johar Town, Lahore, PIFD is a prominent institution specializing in design education, offering both undergraduate and postgraduate programs across various creative fields. These programs include Fashion Design, Textile Design, Leather Accessories and Footwear, Furniture Design, and Jewellery Design, along with an MPhil in Art and Design.\n\nThe university aims to bridge the gap between academia and industry by producing skilled graduates prepared to meet the evolving demands of the creative sector. PIFD prides itself on its state-of-the-art facilities and a campus environment that encourages innovation and critical thinking. The institute also emphasizes affordability while maintaining high-quality education, making it accessible to a broad range of students.\n\n	HEC	2024-07-30 00:00:00	158636.36	Pakistan Institute Of Fashion Design, Lahore	140	2024-09-09 00:00:00	https://www.pifd.edu.pk
11	Hannan	2024-12-10 01:00:47.677189	\N	\N	Punjab Tianjin University of Technology (PTUT) in Lahore stands as Pakistan's first public sector technological university dedicated to bridging the gap between academic learning and industry needs. Established in collaboration with the Government of Punjab and three prestigious Tianjin universities in China, PTUT aims to revolutionize technical education. The university provides advanced programs in engineering technology, emphasizing applied knowledge and practical skills tailored for industry employment. Its focus on hands-on training makes it a pioneering institution for producing skilled technologists in fields like mechanical, civil, electrical, and automotive engineering, as well as fashion and textile designÔÇï	HEC,TEVTA	2024-07-25 00:00:00	25500	Punjab Tianjin University Of Technology, Lahore	185	\N	https://www.ptut.edu.pk
12	Hannan	2024-12-10 01:00:47.677189	\N	\N	Established in March 2011, Qarshi University has swiftly established itself as a progressive institution focused on delivering quality education. Obtaining its charter the same year, the university embarked on a journey of rapid expansion and development, aiming to become a leading center of higher education. Backed by Qarshi Industries, the university benefits from a solid foundation that supports its sustainable growth and achievement of strategic goals.\r\n\r\nQarshi University offers a broad array of programs through its four faculties: Eastern Medicine & Allied Health Sciences, Management and Social Sciences, Computer Science, and Sciences. This diverse selection ensures that the university is able to meet the needs of the dynamic and ever-evolving business and healthcare sectors. The institution is committed to nurturing both academic excellence and personal growth, offering a nurturing environment for intellectual and professional development.\r\n\r\nThe university prides itself on its competent faculty, high levels of student satisfaction, and strong graduate employability. Students benefit from a comprehensive range of support services, including on-campus counseling aimed at mental health and personal development. This holistic approach ensures that students are well-equipped for both their professional careers and personal lives. Situated on Canal Road in a prime location, Qarshi University is easily accessible from surrounding residential areas, providing a conducive setting for both academic and extracurricular activities. The universityÔÇÖs vibrant campus life is enriched with a wide variety of clubs, sports, and cultural events, creating a well-rounded educational experience for its students.\r\n\r\nQarshi University is committed to offering programs that are aligned with international standards, making it a preferred choice for students who seek a comprehensive educational journey. With the backing of Qarshi Foundation and a distinguished Board of Trustees, the university is on a path to excellence in both education and research.	HEC,NCEAC	2024-01-24 00:00:00	142900	Qarshi University (lhr), Lahore	194	2025-02-25 00:00:00	https://www.qu.edu.pk
13	Hannan	2024-12-10 01:00:47.677189	\N	\N	Rashid Latif Khan University (RLKU), located in Lahore, Pakistan, is a private institution founded with a mission to deliver quality education across multiple disciplines. The university offers programs in various fields such as medical sciences, allied health, business administration, law, computer science, and social sciences. It is known for its commitment to academic excellence, robust faculty, and extensive infrastructure that supports both academic and extracurricular activities. RLKU aims to provide a student-centered learning environment with modern facilities, including a hospital, library, and wellness center. Additionally, students have opportunities to engage in various student societies and clubs that foster personal and professional development.\r\n\r\nThe university provides a range of undergraduate and graduate programs, focusing on both academic rigor and practical application. It emphasizes preparing students for the workforce by offering programs that meet the needs of modern industries. \r\n\r\nRLKU is dedicated to maintaining high standards of teaching, research, and student welfare, aiming to become a recognized leader in higher education in Pakistan. It is fully equipped to support the diverse educational needs of students, blending technology with traditional methods to foster an effective learning environment.	HEC	2024-10-18 00:00:00	150000	Rashid Latif Khan University, Lahore	217	\N	https://www.rlku.edu.pk
14	Hannan	2024-12-10 01:00:47.677189	\N	\N	Superior University Lahore, established in 2003, has emerged as a prominent educational institution dedicated to fostering innovation in higher education. The universityÔÇÖs commitment to providing quality education is evident in its diverse range of academic offerings, which include undergraduate, postgraduate, and professional degree programs across multiple disciplines. Its academic faculties encompass business, economics, computer science, engineering, allied health sciences, art and design, and more.\n\nSuperior University aims to equip students with the skills necessary to thrive in the competitive global market. The universityÔÇÖs emphasis on research, innovation, and real-world application helps students gain valuable industry experience. Furthermore, Superior is committed to creating a supportive environment that promotes not only academic excellence but also personal and professional growth.\n\nStudents benefit from state-of-the-art facilities, including modern libraries, advanced research labs, and a wide range of extracurricular activities. The university is also focused on global connections, offering international programs and partnerships to help students broaden their perspectives.	HEC,NBEAC,PEC,	2024-09-28 00:00:00	187202.41	The Superior University, Lahore	37	2025-03-03 00:00:00	https://www.superior.edu.pk
15	Hannan	2024-12-10 01:00:47.677189	\N	\N	The University of Lahore (UOL) is a leading private institution established in 1999. It has grown significantly, with campuses in multiple locations across Pakistan, including Lahore, Islamabad, Sargodha, and Gujrat, and even extending internationally to Uganda. UOL offers a wide range of undergraduate, graduate, and doctoral programs across its faculties, which include engineering, management sciences, law, arts and social sciences, and health sciences.\r\n\r\nThe university is dedicated to high-quality research and provides various research centers, such as the Center for Research in Molecular Medicine and the Lahore Incubation Center. UOL maintains an international presence, with students from various countries, and offers exchange programs and collaborations with global academic institutions.\r\n\r\nIn terms of student support, UOL provides a rich campus life with extracurricular activities, clubs, and sports facilities. The university also places a strong emphasis on student welfare, offering career counseling, mental health services, and academic advising.\r\n\r\nUOL has also been recognized internationally, featuring in global rankings like QS and Times Higher Education, with a focus on sustainable practices, including green energy projects.\r\n\r\nFor more details about programs and offerings, the universityÔÇÖs comprehensive infrastructure, and its impact on education, visit their official site.	HEC,NBEAC,NCEAC,NTC,PBC,PCATP,PEC,NAEAC,PNC,PMC,PCP	2024-09-14 00:00:00	178108.79	The University Of Lahore ( Main Campus ), Lahore	16	\N	https://www.uol.edu.pk
16	Hannan	2024-12-10 01:00:47.677189	\N	\N	University College of Medicine & Dentistry offers one of the most forward-looking educational environments in Medicine & Dentistry in the country.\r\n\r\nSince its founding, UCMD has been committed to excellence in education, research, patient care and community service. The educational system of UCMD is at par with the international education standards. UCMD prides itself as a place where facilities for students and patients are at their best: students are being taught and patients are managed by highly qualified academicians and clinicians. Teaching facilities, laboratories, pre-clinical & clinical area, library, and IT Centre have been designed in a way that students are milled to be at their best.\r\n\r\nSo far 17 batches of doctors and 18 batches of dentists have passed out and are working in various public and private institutions in and outside Pakistan. There is a shift of paradigm from conventional teaching to problem-oriented learning in this College that has lead students to grow in excellence in patient management.\r\n\r\nThe College of Medicine & Dentistry has its own ÔÇ£University of Lahore Teaching HospitalÔÇØ at Defence Road Campus, University Dental Hospital at Raiwind Road Campus while ÔÇ£Social Security Teaching HospitalÔÇØ, Multan Road, ÔÇ£Social Security Teaching HospitalÔÇØ, Kot Lakhpat and ÔÇ£Al-Khidmat Teaching HospitalÔÇØ, Mansoorah are attached to the University for the training of students in various clinical specialties.	PMDC,HEC,CPS,PHC,PPC,PNC	2024-12-19 00:00:00	1640000	University College Of Medicine And Dentistry, Lahore	16	\N	https://www.ucmd.uol.edu.pk
17	Hannan	2024-12-10 01:00:47.677189	\N	\N	The University of Central Punjab (UCP) is a private institution in Lahore, Pakistan, chartered in 2002 by the Government of Punjab. It was initially formed through the merger of institutions under the Punjab Group of Colleges, including the Punjab College of Business Administration (PCBA), Punjab Institute of Computer Sciences (PICS), and others.\n\nUCP offers a broad range of academic programs across various disciplines. These programs are distributed across nine faculties: Engineering, Humanities and Social Sciences, Pharmaceutical Sciences, Law, Media and Communication Studies, Life Sciences, Information Technology and Computer Science, Language and Literature, and Science & Technology. The university provides both undergraduate and graduate programs, along with an emphasis on research and employability.\n\nIn terms of facilities, UCP boasts a modern campus equipped with state-of-the-art classrooms, laboratories, and a large auditorium. It also prioritizes sustainability, having installed solar panels to reduce its environmental footprint. The university is committed to fostering creativity, entrepreneurship, and critical thinking through its diverse student activities and its focus on research.\n\nUCP is accredited by several national bodies, including the Higher Education Commission (HEC) of Pakistan, the Pakistan Engineering Council (PEC) for its engineering programs, and the Pharmacy Council of Pakistan for its Pharm-D program	PEC,Washington Accord,NBEAC,PBC,NCEAC,PCP,NAEAC	2022-11-19 00:00:00	216817.72	University Of Central Punjab, Lahore	8	\N	https://www.ucp.edu.pk
18	Hannan	2024-12-10 01:00:47.677189	\N	\N	Aga Khan University (AKU) is a prestigious institution dedicated to improving quality of life globally, with a focus on health, education, and community development. Founded in 1983 as Pakistan's first private university, AKU is a not-for-profit institution and part of the Aga Khan Development Network. The University aims to address local and global challenges through world-class education, innovative research, and exceptional healthcare delivery. AKUÔÇÖs mission emphasizes empowering women, supporting the disadvantaged, promoting pluralism, and working with global and local partners to achieve shared goals.\r\n\r\nInitially established as a health sciences university, AKU has grown to become one of the largest private healthcare providers in Pakistan and East Africa, with hospitals accredited by the Joint Commission International. Its influence extends beyond healthcare, with research and graduates contributing to health policy and practice both locally and internationally. In recent years, AKU has expanded its academic offerings, launching programs in teacher education, journalism, public policy, early childhood development, and Muslim civilizations. In 2023, the university launched a Faculty of Arts and Sciences, marking a new phase of growth with programs designed to develop future leaders in various fields.\r\n\r\nAs a leader in education and research, AKU continues to strive to be at the forefront of scientific and humanistic knowledge, contributing to the development of progressive economies, legal systems, and healthcare practices across the globe.	HEC,PMDC,CPSP,JCI,ACPE,RCSI,	2024-09-30 00:00:00	525630.36	Aga Khan University, karachi	1	\N	https://www.aku.edu
19	Hannan	2024-12-10 01:00:47.677189	\N	\N	Baqai Medical University (BMU) is a prominent private institution established in 1996 under a bill passed by the Sindh Assembly, subsequently notified by the Governor of Sindh. Located in the rural setting of Gadap, karachi, the university spans a campus of 72 acres and includes seven blocks with a built-up area of 727,374 square feet. It houses 13 institutions, educates approximately 1,800 students, and offers 19 degrees and diplomas across various specialties. BMU employs over 1,000 individuals in diverse capacities, embodying its mission of community-based and community-oriented medical education.\r\n\r\nBMU stands out as PakistanÔÇÖs only university designed around the theme of Community-Based and Community-Oriented Medical Education. It integrates its academic objectives with social welfare, hosting projects such as free medical facilities and education initiatives for underserved communities. Its facilities include the Social Obstetric Unit in Gadap and Baqai Medical Complex in Surjani Town, which offer free outpatient services and support for rural communities. Furthermore, the university also emphasizes education without cost, providing resources like textbooks, uniforms, and meals at its affiliated schools.\r\n\r\nThe institution maintains a futuristic approach, continually refining its educational paradigms to meet international standards and produce skilled medical professionals who contribute significantly to societyÔÇï	HEC,PMDC,PCP,PNC,CPSP	2024-10-12 00:00:00	175602.33	Baqai Medical University, karachi	116	\N	https://www.baqai.edu.pk
20	Hannan	2024-12-10 01:00:47.677189	\N	\N	Benazir Bhutto Shaheed University Lyari (BBSUL), located in karachi, Sindh, Pakistan, was established in 2010 to provide higher education opportunities, especially for the youth in underprivileged areas. The university's mission focuses on fostering education and development in various disciplines while promoting socioeconomic advancement. It emphasizes accessibility, offering stipends and scholarships to support students, particularly female learners, from low-income backgrounds.\r\n\r\nBBSUL offers undergraduate, graduate, and postgraduate programs in diverse fields, including business administration, computer science, pharmacy, education, and arts. It features facilities such as computer labs, libraries, and a sports complex to support holistic student development. The university prioritizes maintaining academic standards through its Quality Enhancement Cell (QEC), established under the Higher Education Commission (HEC).	HEC	2024-12-10 00:00:00	31066.5	Benazir Bhutto Shaheed University, Lyari, karachi	189	2025-01-20 00:00:00	https://www.bbsul.edu.pk
21	Hannan	2024-12-10 01:00:47.677189	\N	\N	The Dadabhoy Institute of Higher Education (DIHE) was established in 2003, and received its charter as a degree awarding institute from the Government of Sindh, Pakistan through an act of Sindh Assembly. On the basis of its well designed academic programs, well qualified teaching faculty and state-of-art facilities; in 2005, DIHE was placed in the W ÔÇÿAÔÇÖ category by the Higher Education Commission. DIHE aspires to integrate academic excellence in different areas of studies to ensure unique educational experience. It incorporates the value based education system and best academic practices along with various technical as well as cultural initiatives in all the programs being offerd.\r\n\r\nOur academic programs are designed to provide students with the skills which helps them to prosper in the future workplace and beyond. This is achieved by imparting experiential knowledge in selected areas of study along with hands-on learning experiences through practicals, tutorials delivered faculty members. To summarize ÔÇô DIHE aims to provide its students an opportunity for personal and professional development for their future.\r\n\r\nDIHE offers following academic programs at its two campuses in karachi:\r\nFaculty of Business Administration\r\nFaculty of Computer Science\r\nFaculty of Law\r\nFaculty of Science\r\nFaculty of Social Sciences\r\n\r\nAll together there are 17 undergraduate, 7 graduate & 9 post graduate programs being run at Dadabhoy Institute of\r\nHigher Education.	HEC,PBC,AHPC	2021-03-31 00:00:00	91339.88	Dadabhoy Institute Of Higher Education, karachi	143	\N	https://www.dadabhoy.edu.pk
22	Hannan	2024-12-10 01:00:47.677189	\N	\N	Dawood University of Engineering and Technology (DUET) in karachi, Pakistan, is a prominent institution that specializes in engineering, technology, and applied sciences. Established in 1962, it initially began as Dawood College of Engineering and Technology, envisioned by its founder, Mr. Ahmed Dawood, to support PakistanÔÇÖs industrial development. It became a university in 2013 through an Act of the Sindh Provincial Assembly.\r\n\r\nDUET offers a wide range of undergraduate and postgraduate programs across multiple faculties, including Civil Engineering, Electrical Engineering, Information and Computing Sciences, and more. Its programs are accredited by the Pakistan Engineering Council (PEC) and the Pakistan Council of Architects and Town Planners (PCATP). The university emphasizes practical, research-oriented learning and aligns its education with global standards like the Washington Accord.\r\n\r\nThe university actively fosters interdisciplinary research, entrepreneurship, and innovation. Its initiatives include the Center for Entrepreneurship Management and Emerging Technologies (CEMET) and sustainability-focused research aligned with the United NationsÔÇÖ Sustainable Development Goals (SDGs). DUET has also made significant strides in digital transformation and infrastructure development, supported by modern laboratories and state-of-the-art facilities.	PEC,PCATP,	2024-07-31 00:00:00	65285.71	Dawood University Of Engineering And Technology, karachi	136	\N	https://www.duet.edu.pk
23	Hannan	2024-12-10 01:00:47.677189	\N	\N	DHA Suffa University (DSU), established in the year 2012, has systematically taken giant strides to become the institution of choice in Pakistan. The university offers undergraduate, graduate and doctoral programs in Engineering, Computer Science, Management Sciences, Humanities and Social Sciences and newly launched programs BS Business Analytics & Programming, BS Computational & Industrial Mathematics, BS Accounting & Finance, BS Software Engineering, BS Data Sciences, BE Civil Engineering, BS International Relations, BS English and BS Psychology. At DSU, students receive quality education and become part of an academic community sharing diverse interests. DSU not only helps to expand the mental faculties of individuals but also transforms them into more open-minded, accepting and involved citizens. With a vision to move forward, DSU intends on becoming a globally recognized institution of higher education and research by extending the frontiers of knowledge and contributing towards grooming the scholars of tomorrow. From the expansion of infrastructure to the development of technology, revamping of curricula to the formation of pedagogy, addition of foreign qualified faculty to the international collaborations multi face, DSU has been committed to provide well-equipped engineers, computer scientists, entrepreneurs and corporate leaders.	PEC,NCEAC,NBEAC,CIEC	2024-07-21 00:00:00	144028.57	Dha Suffa University(main Campus), karachi	77	\N	https://www.dsu.edu.pk
24	Hannan	2024-12-10 01:00:47.677189	\N	\N	The Dow University of Health Sciences (DUHS), located in karachi, Pakistan, is one of the country's premier medical institutions. Established initially as Dow Medical College in 1945, it was restructured into DUHS in 2003. The university focuses on producing highly qualified medical and health professionals and is recognized for its emphasis on integrating research and community service within its academic framework.\r\n\r\nDUHS offers a broad spectrum of undergraduate, postgraduate, and doctoral programs in various health science fields, aiming to cater to the diverse healthcare needs of the community. Its state-of-the-art facilities include advanced laboratories, IT resources, and simulation centers for medical training. Additionally, DUHS is deeply committed to community outreach, providing diagnostic, preventive, and rehabilitative services, especially for underprivileged populations.\r\n\r\nThe university has consistently been ranked among Pakistan's top medical institutions and features prominently in international rankings, showcasing its impact on education, healthcare, and sustainable development goals.	HEC,PMDC,PCP,CPSP,FAIMER,PNAC,DRAP	2024-12-16 00:00:00	99847.45	Dow University Of Health Sciences, karachi	26	\N	https://www.duhs.edu.pk
25	Hannan	2024-12-10 01:00:47.677189	\N	\N	Greenwich University, established in 1987, is a private educational institution located in karachi, Pakistan. Initially focused on management sciences, the university expanded over time to include faculties like Social Sciences, Humanities, Media Studies, and Fashion. In 1998, it became an autonomous degree-awarding institution under the Act of the Sindh Government.\r\n\r\nGreenwich is recognized for its modern, purpose-built campus in karachi, featuring air-conditioned facilities, advanced computer labs, a well-stocked library, and a vibrant academic environment. Its teaching philosophy emphasizes a student-centered approach and fosters well-rounded personality development. The university also incorporates Islamic values while promoting a global outlook in its education system.\r\n\r\nWith a history of achievements, Greenwich has expanded its international presence with a branch campus in Mauritius and developed robust research capabilities through initiatives like the Greenwich Research & Development Department (GRDC). It holds memberships with global organizations such as NAFSA, AACSB, and INQAAHE, underscoring its academic reputation and international reachÔÇï	HEC,TEC,AACSB,INQAAHHE	2024-07-14 00:00:00	97638.95	Greenwich University, karachi	124	\N	https://www.greenwich.edu.pk
26	Hannan	2024-12-10 01:00:47.677189	\N	\N	Habib University in karachi is a premier institution dedicated to providing a world-class undergraduate education in liberal arts and sciences. Established with the vision to be South AsiaÔÇÖs leading liberal arts university, it emphasizes intellectual growth, interdisciplinary learning, and societal engagement. Its mission focuses on shaping futures by offering rigorous, contextually relevant education to talented students, regardless of financial or social barriers.\r\n\r\nThe universityÔÇÖs curriculum is deeply rooted in its Liberal Core, inspired by global best practices like Stanford University's model but adapted to regional contexts. This core emphasizes critical thinking, creativity, quantitative reasoning, and philosophical thought. Habib offers six undergraduate programs, including BS Computer Science, BS Computer Engineering, BS Electrical Engineering, BSc Social Development and Policy, BA Communication Design, and BA Comparative Humanities. These programs are designed to foster leadership, adaptability, and innovative problem-solving.	NaN	2023-01-31 00:00:00	1121083.33	Habib University, karachi	64	\N	https://www.habib.edu.pk
27	Hannan	2024-12-10 01:00:47.677189	\N	\N	The National University of Modern Languages was established as an institute in 1969 to help people communicate and understand each other in different oriental and occidental languages, to assimilate different cultures and to act as springboard for emerging disciplines. Initially, the institute provided language training facilities to personnel of armed forces and other government services of Pakistan. It was upgraded to University on May 29, 2000. In achieving this benchmark of a fully autonomous University, it has crossed many barriers and achieved a status of a seat of learning contributing new knowledge in local and global perspective and now teaches 27 oriental and occidental languages in addition to a number of emerging disciplines. Now, the University has a vibrant and well-grounded research program, offering MS/MPhil and PhD research degrees in various disciplines.	HEC, NBEAC	2024-12-24 00:00:00	22982.92	National University Of Modern Languages, Islamabad, Islamabad	126	2025-02-03 00:00:00	https://www.numl.edu.pk
28	Hannan	2024-12-10 01:00:47.677189	\N	\N	National University of Sciences and Technology (NUST) is a premier national university with global standing. Since its inception in 1991, it has developed into a comprehensive university with a focus on science and technology. Today, it is ranked among the top 100 world universities aged under 50 and No 1 engineering and technology university of Pakistan. Moreover, it is among the elite league of world universities in the disciplines of Electrical and Electronic Engineering and Computer Science and Information Systems, besides its recognition among the top universities from emerging economies, which speaks of the hard work of its leadership, faculty, researchers and students.\nNUST has earned a premier position because of its stringent quality assurance regime and robust research ecosystem. It has won "International Quality Award" at Asia Pacific Quality Network (APQN) Conference and Annual General Meeting held at Vietnam in 2014 and "Turnitin Academic Integrity Award" in 2015.\nAs many as 18 constituent institutions, functioning under the umbrella of NUST, are imparting high-quality education at both undergraduate and postgraduate levels with the central campus located in Islamabad. The University offers 164 academic programs, including 46 multidisciplinary programs, in the fields of Engineering, Information Technology, Natural Sciences, Management Sciences, Social Sciences and Humanities, and Art and Architecture. NUST simultaneously pursues a wide range of research areas. As many as 100 patents have been filed by the University till date, out of which 27 have already been awarded.\nThe role of faculty in the University's development is of paramount importance. Most of them hold PhD degrees from renowned universities of the world. Another important facet of its growth is the development of international academic linkages. Currently, it has active collaboration with 125 institutions and research organizations from across 32 different countries.\nNUST programs and activities are aligned with the United Nation's Sustainable Development Goals (SDGs), Pakistan Government's Vision 2015, especially in the field of development of sustainable technologies, Medium Term Development Framework (MTDF) of HEC and Science, Technology and Innovation Policy of Ministry of Science and Technology.\nWith its strong emphasis on community-focused learning, NUST shapes morally conscientious, socially responsible and ethically sensitive citizens. Community Service Course is mandatory for all undergraduate students. Student-run Community Service Club, with more than 3,000 members, is active in different areas. The University also houses the secretariat of Pakistan Chapter of The Talloires Network, with as many as 67 national universities on board. In recognition of civic engagement activities in the area of education for empowerment, NUST was awarded first place in "MacJannet Prize for Global Citizenship" in 2015.	HEC,INQAAHE, APQN	2024-11-27 00:00:00	108608.69	National University Of Science & Technology, Islamabad	4	2025-02-01 00:00:00	https://www.nust.edu.pk
29	Hannan	2024-12-10 01:00:47.677189	\N	\N	National University of Technology (NUTECH) is a federally chartered Higher Education Commission (HEC), Pakistan Engineering Council (PEC), National Technology Council (NTC), National Computing Education Accreditation Council (NCEAC) and National Vocational & Technical Training Commission (NAVTTC) recognized Islamabadbased University, administratively under Ministry of Science & Technology (MoST). NUTECH is envisioned to be an internationally acclaimed technology driven research university destined to produce national and international industry future characterful leaders, professionals and hi-tech skilled workforce. The National University of Technology (NUTECH) is established as a pioneer ÔÇÿUniversity for IndustryÔÇÖ to create, develop, implement and promote existing, emerging and future technologies for the country through world-class education in science, engineering, technology, other technologies, professional certifications, technical & vocational skills and other areas of scholarship. The UniversityÔÇÖs curricula and academic systems are based on the best international practices of worldÔÇÖs leading technology universities of USA and EU. Its learning systems are designed to promote science, engineering and technology based knowledge eco-system to inspire the youth as promising entrepreneurs of tomorrow. The undergraduate programs of NUTECH satisfy Washington accord, ABET and Bologna Process. NUTECH is in the process of planning its main campus to house 20,000 ÔÇô 30,000 students in future.	HEC, PEC, NTC	2025-07-07 00:00:00	94444.44	National University Of Technology, Islamabad	73	2025-09-01 00:00:00	https://www.nutech.edu.pk
30	Hannan	2024-12-10 01:00:47.677189	\N	\N	Nestled in the serene setting of a beautiful countryside, Pakistan Institute of Engineering and Applied Sciences (PIEAS), Islamabad, is recognized as a preeminent federal public university devoted to higher education in specific disciplines of engineering, natural sciences and formal sciences. Although PIEAS offers BS, MS, MPhil and PhD degree programs, yet the postgraduate degree programs dominate. In addition to the degree programs, PIEAS also offers specialized short courses to engineers, scientists and other professionals for their continuing professional development. PIEAS highly qualified faculty matched with excellent infrastructure are instrumental in its endeavor to offer high quality education in the disciplines of engineering and applied sciences, fulfill national and regional requirements for highly qualified professionals and contribute to the welfare of humanity through education, research and development. The Institute has been ranked No. 1 for Engineering & Technology by the Higher Education Commission (HEC), Pakistan, in all the three rankings (2006, 2012, 2013) conducted so far.	HEC	2024-05-24 00:00:00	140000	Pakistan Institute Of Engineering & Applied Sciences, Islamabad	25	2025-09-09 00:00:00	https://www.pieas.edu.pk
31	Hannan	2024-12-10 01:00:47.677189	\N	\N	Riphah International University, Islamabadis a private University, chartered by the Federal Government of Pakistan in 2002. The University was established to produce professionals with Islamic moral and ethical values. It is sponsored by a not-for-profit trust; namely, Islamic International Medical College Trust (IIMCT), created in 1995. The first project of the IIMCT was the Islamic International Medical College, Rawalpindi, established in 1996 by its Founding Managing Trustee; Maj. Gen. (Retd.) Muhammad Zulfiqar Ali Khan, TI(M), TBt (Late).\n\nCurrently, the University has 7 faculties various academic departments, and an overseas project.	HEC	2024-07-30 00:00:00	133099.93	Riphah International University, Islamabad	39	\N	https://www.riphah.edu.pk
32	Hannan	2024-12-10 01:00:47.677189	\N	\N	To accomplish its mission, Shifa Tameer-e-Millat University aims at the following:\n\na. To establish following faculties supported with related academic infrastructure and highly qualified and experienced faculty:\n\n(1) Faculty of Health Sciences.\n\n(2) Faculty of Management Sciences.\n\n(3) Faculty of Arts and Social Sciences.\n\n(4) Faculty of Engineering Sciences.\n\n(5) Faculty of Basic Sciences.\n\nb. To establish academic and research facilities in such areas which correspond to the needs of domestic demands and meet global standards.\n\nc. To train younger generation through exposures to global educational requirements to become future leaders and professionals so as to positively contribute to social and economic uplift of the country.\n\nd. To inculcate in the students such values which are compatible with our religion, culture, history, traditions and social norms.\n\ne. To educate the students to the dictates of the global market demands in various professions.\n\nFaculties which are in the 'Schedule of Faculties' approved in 'First Statutes' of Shifa Tameer-e-Millat University are;\n\n(1) Faculty of Education.\n\n(2) Faculty of Pharmaceutical Sciences.\n\n(3) Faculty of Nursing and Midwifery.	HEC, PM&DC, PNC, PCP	2023-11-22 00:00:00	128384.62	Shifa Tameer-e-millat University, Islamabad	70	\N	https://www.stmu.edu.pk
33	Hannan	2024-12-10 01:00:47.677189	\N	\N	SS-CASE-IT offers four-year Bachelor degrees in five domains of Computing (Artificial Intelligence, Computer Science, Cyber Security, Data Science, Software Engineering), Electrical and Computer Engineering, Business Administration, Accounting & Finance, Business Analytics, Financial Technology, English, and Mathematics.\n\nIn the field of Health Sciences, CASE offers 4-year Bachelor degrees in Medical Imaging Technology, Medical Lab Technology, Operation Theater Technology, Vision Sciences and Optometry. In addition, CASE also offers a five-year degree in Physical Therapy (DPT).\n\nAt the graduate level we offer Master degrees in Computer Science, Electrical Engineering, Engineering Management, Project Management, and Mathematics. PhD programs are offered in Electrical Engineering and Engineering Management.\n\nDegrees awarded by SS-CASE-IT are fully recognized by the Higher Education Commission (HEC) of Pakistan. Since its inception, SS-CASE-IT, has been dedicated to promoting human resource development in subjects driving todayÔÇÖs technology and health care revolutions. By providing comprehensive education in computing, engineering, management and health sciences which is making todayÔÇÖs information revolution possible, ensuring a balanced emphasis on both the software and hardware aspects of technology and the critical advancements in health sciences.\n\nArtificial Intelligence (AI) is a corner stone of our programs. Our AI Lab is at the forefront of executing cutting edge industrial projects. Together with our industrial arm, CARE (Pvt.) Ltd., we exemplify a successful model of industry-academic collaboration, setting a bench mark for others to follow.\n\nBy providing degree programs in computing, engineering, management, mathematics, and health sciences, SS-CASE-IT is dedicated to prepare human resource to meet todayÔÇÖs requirements and also of the future.	HEC, PEC, NCEAC	2024-08-21 00:00:00	108826.67	Sir Syed Case Institute Of Technology, Islamabad	229	\N	https://www.case.edu.pk
34	Hannan	2024-12-10 01:00:47.677189	\N	\N	Abasyn University was chartered in 2009 under the act of Legislative Provisional Assembly of KPK in 2009 and is recognized by the Higher Education Commission (HEC), Pakistan. Abasyn University was the only University in KPK which was awarded category ÔÇÿWÔÇÖ at the inception which was the highest category to be awarded to any institution in the old ranking system by HEC. By the grace of Allah and the support of sponsors and staff, HEC has upgraded category ÔÇÿWÔÇÖ to ÔÇÿW3ÔÇÖ in the new ranking system.\n\nThe Abasyn University IslamabadCampus(AUIC) commented its operations in 2012 with the approval of the HEC. The AUIC is committed to providing quality education both at unger-graduate and post-graduate levels. The campus has grown rapidly both in terms of number of students and the number of degree programs offered over the last few years. Due to its reputuation and high standards, it attracts students from all over the country.\n\nThe campus has established state of art facilities in Chak Shahzad Islamabad. Highly qualified teaching and non-teaching staff have been hired. The campus has also established fully equipped labs with state of the art technologies and tools. The campus has also developed a well stocked library which has access to digital research databases, e-journals, e-books and e-reports.\n\nAbasyn University offers degree programs in various disciplines including Engineering, Computing, Business Administration, Social Sciences, Pharmacy, Life Sciences, Rehabilitation & Health Sciences and Technology. The degree programs offered by campus are accrediated by relevent accrediation bodies. BS Computer Science and BS Software Engineering are accrediated by National Computing Education Accreditation Council (NCEAC), BE Civil Engineering and BE Electrical Engineering programs are accrediated by Pakistan Engineering Council (PEC) and the Pharm-D program is accrediated by Pharmacy Council of Pakistan (PCP).	HEC, PEC,	2024-10-31 00:00:00	151200	Abasyn University (sub Campus), Islamabad	68	\N	https://www.abasynisb.edu.pk
35	Hannan	2024-12-10 01:00:47.677189	\N	\N	Al-Khair University was established in 1994, under an act number XXVIII of the Legislative Assembly of Azad Jammu & Kashmir. The Main objective for the establishment of the University in the Private Sector was to supplement the Public Sector Education, by disseminating professional, scientific and technological education in the Country. With a view, however, to keep pace with changing scenario of education globally, the main focus is in the field of Marketing, Banking & Finance, Information Technology and Computer Oriented courses.\n\nAl- Khair University has progressive and innovative outlook and lays stress on the three functions of higher education namely teaching, Research and Service. Being a manifestation of unique perceptions these institutions envisages excellence in academic, scientific and professional spheres. Al-Khair University makes every possible Endeavour to realize the goal of education being the basic right of an individual.	HEC	\N	100000	Al-khair University [ajk], Islamabad	21	\N	https://www.alkhair.edu.pk
36	Hannan	2024-12-10 01:00:47.677189	\N	\N	\nVision:\n\nTo be a center of excellence among the national universities known for its quality of teaching, learning, research and ethical values of the society.\n\nMission:\n\nTo produce quality professionals, highly skilled researchers in various fields of human endeavor, creative, enter pruner, dignified individuals, proud of their heritage, ethical values and committed to solving the contemporary issues of humanity.	HEC	\N	18000	Mohiuddin Islamic University[IslamabadCampus], Islamabad	106	\N	https://www.miu.edu.pk
37	Hannan	2024-12-10 01:00:47.677189	\N	\N	Vision\nAir University aspires to be among the leading national universities, excelling in teaching, learning, research, innovation and public service.\n\nMission\nThe mission of Air University is to achieve excellence in teaching and research for producing graduates with sound professional knowledge, integrity of character, a keen sense of social responsibility and a passion for lifelong learning. The University shall stand committed to creating an environment conducive for attracting the best students, faculty and supporting staff for contributing to the development of a prosperous, peaceful and enlightened society.	HEC, SACSCOC	2024-07-15 00:00:00	77527.5	Air University, Islamabad	57	\N	https://www.au.edu.pk
38	Hannan	2024-12-10 01:00:47.677189	\N	\N	The Allama Iqbal Open University was established in May, 1974, with the main objectives of providing educational opportunities to masses and to those who cannot leave their homes and jobs. During all these past years, the University has more than fulfilled this promise.It has opened up educational opportunities for the working people and has provided access to the females at their door steps. Allama Iqbal Open University is a pioneer institution which provides Masses access to education remotely. It is now breaking new grounds in the fields of professional, scientific, and technical education. It attempts to reach out to the remotest areas of Pakistan. It also attempts to harness modern information Technology for spreading education in Pakistan.\n\nThe idea of Distance Education was first mooted in UK in late 60s by the British Prime Minister, Mr. Harold Wilson. He was of the view that educational opportunities must be provided to those who might have missed better education due to early employment and wish to upgrade, their knowledge and skills, in their spare times in the evenings at home. The UK Open University was, thus established in 1969. Since then it has become a major institution of learning in UK and has opened up opportunities for millions of working people. The gospel of distance and Open Learning has, since then spread throughout the world. More than 70 Open Universities are operating around the world on the basis of Distance Education. Modern information Technology has made the task of Distance Education much more easier and effective. The AIOU, when established in 1974, was the second Open University in the world and first in Asia and Africa. It, thus, speaks of the foresight of the policy-makers of that time. As these past years of AIOU have proved, Distance Education has opened up new opportunities for millions, particularly women, and supplemented the efforts of the federal and provincial governments in a systematic way and that too without becoming a burden on their resources.\n\nThe idea of Distance Education assumed greater relevance and acceptance in Pakistan due to the factors of poverty and relative deprivation of women. The rate of literacy and excess to higher education is much lower in the poorer classes of Pakistan. The poverty ratio is much higher in the rural areas, where formal education is less focused. The literacy rate and education is lower for females in Pakistan, particularly in the rural areas, due to poverty and conservative traditions. Many conservative parents under the pressure of old age traditions do not allow their daughters to go out to the schools. The AIOU, through its system of Distance Education has, thus, provided educational opportunities to these housebound girls and women. This explains the reasons why the majority of the students enrolled with the University are females.\n\nProfessional and technical education in Pakistan is becoming very costly, especially in recent years, because of high fees of private sector in these fields. The lower middle class and poorer classes are being marginalized and their children have less chance to get higher education in fields like Business Administration, Computer Science, Medicine and Engineering. AIOU attempts to meet this challenge and to keep a window open for these classes by keeping the cost of education at minimum level and by creating a student assistance fund.	HEC	2024-10-15 00:00:00	24313.18	Allama Iqbal Open University, Islamabad	121	\N	https://www.aiou.edu.pk
39	Hannan	2024-12-10 01:00:47.677189	\N	\N	Lahore City University is the project of Al-Rehman Education System (Pvt) Ltd. which is located in Saggian Road Lahore. Mian Muhammad Mushtaq, Cheif Executive of Al-Rehamn Developers has done wonder for the projects he has developed. His knowledge and expertise has made him who he is today.	HEC,PEC,NTC	\N	110000	Lahore City University, Lahore	70	\N	https://www.lcu.edu.pk
40	Hannan	2024-12-10 01:00:47.677189	\N	\N	PIMSAT was established with the specific aim of providing students with direct access to the methodologies and skills that employers value most. All its students get a holistic rounded education, targeted specially of enhancing their opportunities for employment and unlocking their personal potential. The courses provide a focus for independent learning and practical knowledge and skills. It is seriously committed to improve the quality of business and technical education in Pakistan. It is managed by group of dedicated professionals and academicians who have committed their lives to the cause of higher education in Pakistan. We believe that human activities contribute to the success of an institution in variety of ways ÔÇÿÔÇÖAssets make things possible. People make things happenÔÇÖÔÇÖ Since its inception, PIMSAT imparted knowledge and skills to numerous individuals through many teaching programs. Competent management and lvy league faculty have played an important role in the professional and personal development of our students. It will continue to fulfill its responsibilities to the society by creating and providing facilities for personal and professional growth of individuals who wish to make a career in the fields of\n\nBusiness, Science and Technology. We understand that our students have chosen us from among the wide range of elite institutions and study options available to them. We provide broad spectrum of programs in the areas of Business Administration, Information, Technology, Applied Technology & Telecommunications. We also offer Bachelor of Technology in six disciplines i.e. Electronics, Electrical, Mechanical, Civil, Petrolium & Chemical. PIMSAT Department of Engineering & Technology offer B.E Electrical & Civil Engineering Programs. The unique feature that sets us aloof from others is our focus on personal and professional development of our students. The key to our success is the individual care and attention We give to each student.	HEC,PEC,QAHE	\N	65000	Pimsat Institute Of Higher Education [lhr], Lahore	169	\N	https://www.pimsat-khi.edu.pk
41	Hannan	2024-12-10 01:00:47.677189	\N	\N	Welcome to the Shaheed Benazir Bhutto City University and thanks you for your interest in our graduate and postgraduate programs of studies. The decision to study at Shaheed Benazir Bhutto City University as a graduate or postgraduate level is one of the most important choices you will ever make, so it is vital that you consider all the available options carefully. The information on the website as well as in the catalogue you received will answer to some of the most frequently asked questions about graduate and postgraduate studies. It will also introduce you to the Shaheed Benazir Bhutto City University administration follows an open door policy encouraging students to share their problems with the management.\n\nUnder the present day scenario Institutions have to operate through increasingly complex and rapidly changing environment, as such the managers are required to be equally effective in cross national and cross-cultural settings. Our programs are equally sensitive to the changes and have been successful across a wide range of technical and business operations. At the Shaheed Benazir Bhutto City University one may decide to study at graduate or postgraduate level for many good reasons, foremost being the quality: we tent to live up to your expectation. We hope you will find Shaheed Benazir Bhutto City University the right place for you to continue your education. You are assured of a warm welcome and good care at Shaheed Benazir Bhutto City University and we look forward to welcome you aboard.	HEC	\N	263923.08	Shaheed Benazir Bhutto City University, karachi	42	\N	https://www.sbbcu.edu.pk
\.


--
-- Data for Name: university_contact; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.university_contact (universitycontact_id, email, phone_number, university_id) FROM stdin;
1	info.aiu@alhamd.pk	0333 1535345	7
2	admissions@ncbae.edu.pk	042-36525804	8
3	hr@niu.edu.pk.	0320-4455148	9
4	info@pifd.edu.pk	92 42-99232951-7	10
5	info@ptut.edu.pk	042-9933 2438	11
6	info@qu.edu.pk	0325-4395380\r\n	12
7	info@rlku.edu.pk	042 111 626 262	13
8	helpdeskhr@superior.edu.pk	(042) 111 000 078	14
9	info@uol.edu.pk	(0)42 111865865	15
10	info@ucmd.uol.edu.pk	(042) 111-865-865	16
11	 info@ucp.edu.pk	(92)-42-35880007	17
12	communications@aku.edu	92 21 3493 0051ÔÇïÔÇïÔÇïÔÇïÔÇïÔÇïÔÇïÔÇïÔÇïÔÇï	18
13	info@baqai.edu.pk	(092-21)34410293	19
14	info@bbsul.edu.pk	921-32744017	20
15	%20admission@dadabhoy.edu.pk	 92 21 34389103-06	21
16	registrar@duet.edu.pk	92 21 9923 2645	22
17	saad.asif@dsu.edu.pk	021-35244851-2	23
18	 dir@duhs.edu.pk.	92 21 38771000	24
19	gu@greenwich.edu.pk	92 3062248363	25
20	info@numl.edu.pk	92-51-9265100	27
21	ugadmissions@nust.edu.pk	92-51-111-11-6878	28
22	nfo@nutech.edu.pk	92-51-5476809	29
23	registrar@pieas.edu.pk	92 (51) 1111 74327	30
24	masood.minhas@riphah.edu.pk	923044186120	31
25	online.admissions@stmu.edu.pk	92-51-849-3009	32
26	info@case.edu.pk	92 51 6151 000	33
27	Info@abasynisb.edu.pk	92 51 111 222 796	34
28	info@alkhair.edu.pk	923331161666	35
29	vc@miu.edu.pk	051 4485831	36
30	admissions@au.edu.pk	051 9262557	37
31	support@aiou.edu.pk	051 111 112 468	38
32	info@lcu.edu.pk	92 42 35833813-8	39
33	info@pimsat-khi.edu.pk	92 21 -3278-9888	40
34	registrar@sbbcu.edu.pk	0336 3341537	41
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
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.city_city_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.program_program_id_seq', 553, true);


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
-- Name: university_contact_universitycontact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_contact_universitycontact_id_seq', 34, true);


--
-- Name: university_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_id_seq', 41, true);


--
-- Name: university_location_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_location_seq', 1, false);


--
-- Name: university_location_universitylocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.university_location_universitylocation_id_seq', 37, true);


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
-- Name: user_favorites fko3noc049cidpnky8k7638agel; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT fko3noc049cidpnky8k7638agel FOREIGN KEY (user_id) REFERENCES public.app_user(user_id);


--
-- Name: university_contact university_contact_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.university_contact
    ADD CONSTRAINT university_contact_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.university(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

