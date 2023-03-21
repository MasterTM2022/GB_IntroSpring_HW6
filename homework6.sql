--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-02-25 16:54:15

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
-- TOC entry 215 (class 1259 OID 58327)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id bigint NOT NULL,
    customer_names character varying(255) NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 58326)
-- Name: Customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Customer_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Customer_id_seq" OWNER TO postgres;

--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 214
-- Name: Customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Customer_id_seq" OWNED BY public.customer.id;


--
-- TOC entry 217 (class 1259 OID 58336)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    product_name character varying(255) NOT NULL,
    product_cost numeric(9,2) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 58335)
-- Name: Goods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Goods_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Goods_id_seq" OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 216
-- Name: Goods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Goods_id_seq" OWNED BY public.products.id;


--
-- TOC entry 220 (class 1259 OID 58381)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    order_date timestamp without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 58380)
-- Name: orders_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_customer_id_seq OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_customer_id_seq OWNED BY public.orders.customer_id;


--
-- TOC entry 218 (class 1259 OID 58379)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 224 (class 1259 OID 58391)
-- Name: orders_strings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_strings (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    order_string_price numeric(9,2) NOT NULL
);


ALTER TABLE public.orders_strings OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 58388)
-- Name: orders_strings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_strings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_strings_id_seq OWNER TO postgres;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_strings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_strings_id_seq OWNED BY public.orders_strings.id;


--
-- TOC entry 222 (class 1259 OID 58389)
-- Name: orders_strings_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_strings_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_strings_order_id_seq OWNER TO postgres;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_strings_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_strings_order_id_seq OWNED BY public.orders_strings.order_id;


--
-- TOC entry 223 (class 1259 OID 58390)
-- Name: orders_strings_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_strings_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_strings_product_id_seq OWNER TO postgres;

--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_strings_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_strings_product_id_seq OWNED BY public.orders_strings.product_id;


--
-- TOC entry 3191 (class 2604 OID 58330)
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public."Customer_id_seq"'::regclass);


--
-- TOC entry 3193 (class 2604 OID 58384)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 58394)
-- Name: orders_strings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_strings ALTER COLUMN id SET DEFAULT nextval('public.orders_strings_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 58395)
-- Name: orders_strings order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_strings ALTER COLUMN order_id SET DEFAULT nextval('public.orders_strings_order_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 58396)
-- Name: orders_strings product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_strings ALTER COLUMN product_id SET DEFAULT nextval('public.orders_strings_product_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 58339)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public."Goods_id_seq"'::regclass);


--
-- TOC entry 3351 (class 0 OID 58327)
-- Dependencies: 215
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id, customer_names) FROM stdin;
2	Max
3	Bob
4	Pit
5	Jack
6	John
\.


--
-- TOC entry 3356 (class 0 OID 58381)
-- Dependencies: 220
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, customer_id, order_date) FROM stdin;
1	2	2022-01-01 00:00:00
2	2	2022-06-01 00:00:00
5	3	2022-02-01 00:00:00
6	4	2022-03-01 00:00:00
7	5	2022-04-01 00:00:00
8	6	2022-05-01 00:00:00
9	6	2022-06-01 00:00:00
3	3	2022-03-01 00:00:00
4	4	2022-04-01 00:00:00
\.


--
-- TOC entry 3360 (class 0 OID 58391)
-- Dependencies: 224
-- Data for Name: orders_strings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_strings (id, order_id, product_id, order_string_price) FROM stdin;
104	8	9	22.20
105	9	4	25.30
106	3	2	21.80
107	3	3	22.90
108	1	6	29.60
109	6	10	28.00
110	2	9	22.40
111	9	6	29.70
112	1	9	21.90
113	5	9	26.00
114	9	10	23.30
115	2	4	20.60
116	5	6	20.00
117	9	6	29.70
118	4	4	21.20
119	5	5	23.00
120	9	6	29.70
121	6	10	28.00
122	9	9	23.10
123	2	9	22.40
124	4	3	28.60
125	4	2	28.80
126	8	5	30.00
127	4	9	28.20
128	9	3	28.60
129	8	5	30.00
130	6	2	27.70
131	5	5	23.00
132	2	2	24.50
133	2	9	22.40
134	3	3	22.90
135	1	2	20.70
136	3	4	24.50
137	8	9	22.20
138	8	2	30.00
139	7	6	26.60
140	6	8	25.30
141	4	4	21.20
142	5	4	26.00
143	4	5	20.70
144	5	3	26.80
145	7	10	26.80
146	2	9	22.40
147	4	5	20.70
148	8	6	27.60
149	2	8	24.40
150	7	5	24.40
151	8	1	24.60
152	6	7	28.60
153	1	9	21.90
154	6	2	27.70
155	9	1	20.30
156	5	1	26.40
157	9	7	29.60
158	5	10	20.60
159	2	3	29.40
160	9	9	23.10
161	2	7	27.30
162	5	5	23.00
163	9	7	29.60
164	9	7	29.60
165	2	8	24.40
166	5	10	20.60
167	4	9	28.20
168	3	4	24.50
169	8	8	25.60
170	8	10	28.60
171	9	8	24.70
172	1	9	21.90
173	2	9	22.40
174	4	2	28.80
175	5	2	27.10
176	6	4	28.40
177	6	4	28.40
178	7	4	21.60
179	6	10	28.00
180	3	4	24.50
181	6	2	27.70
182	5	6	20.00
183	1	7	22.80
184	1	6	29.60
185	1	6	29.60
186	5	6	20.00
187	6	7	28.60
188	4	3	28.60
189	1	7	22.80
190	9	1	20.30
191	2	1	22.70
192	8	8	25.60
193	1	8	27.30
194	4	6	24.70
195	5	5	23.00
196	3	3	22.90
197	6	8	25.30
198	9	2	21.00
199	8	8	25.60
200	1	8	27.30
201	5	9	26.00
202	8	8	25.60
203	1	10	26.90
204	4	6	24.70
205	5	2	27.10
206	1	8	27.30
\.


--
-- TOC entry 3353 (class 0 OID 58336)
-- Dependencies: 217
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_name, product_cost) FROM stdin;
1	bread	200.00
2	milk	21.50
3	eggs	22.00
4	cheese	22.50
5	butter	23.00
6	cottage cheese	23.50
7	sunflower oil	24.00
8	flour	24.50
9	salt	25.00
10	sugar	25.50
\.


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 214
-- Name: Customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Customer_id_seq"', 6, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 216
-- Name: Goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Goods_id_seq"', 10, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_customer_id_seq', 1, false);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 10, true);


--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_strings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_strings_id_seq', 206, true);


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 222
-- Name: orders_strings_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_strings_order_id_seq', 1, false);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_strings_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_strings_product_id_seq', 1, false);


--
-- TOC entry 3198 (class 2606 OID 58334)
-- Name: customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 58343)
-- Name: products Goods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "Goods_pkey" PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 58387)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 58398)
-- Name: orders_strings orders_strings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_strings
    ADD CONSTRAINT orders_strings_pkey PRIMARY KEY (id);


--
-- TOC entry 3205 (class 2606 OID 58404)
-- Name: orders Customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "Customer" FOREIGN KEY (customer_id) REFERENCES public.customer(id) NOT VALID;


--
-- TOC entry 3206 (class 2606 OID 58399)
-- Name: orders_strings customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_strings
    ADD CONSTRAINT customer FOREIGN KEY (order_id) REFERENCES public.orders(id) NOT VALID;


--
-- TOC entry 3207 (class 2606 OID 58413)
-- Name: orders_strings product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_strings
    ADD CONSTRAINT product FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


-- Completed on 2023-02-25 16:54:15

--
-- PostgreSQL database dump complete
--

