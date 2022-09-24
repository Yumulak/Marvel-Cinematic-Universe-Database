--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: comic_illustrators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comic_illustrators (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);


ALTER TABLE public.comic_illustrators OWNER TO postgres;

--
-- Name: comic_illustrators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comic_illustrators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comic_illustrators_id_seq OWNER TO postgres;

--
-- Name: comic_illustrators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comic_illustrators_id_seq OWNED BY public.comic_illustrators.id;


--
-- Name: comic_inspirations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comic_inspirations (
    comic_stories_id integer NOT NULL,
    movies_id integer NOT NULL
);


ALTER TABLE public.comic_inspirations OWNER TO postgres;

--
-- Name: comic_stories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comic_stories (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    writer_id integer NOT NULL,
    illustrator_id integer NOT NULL
);


ALTER TABLE public.comic_stories OWNER TO postgres;

--
-- Name: comic_stories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comic_stories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comic_stories_id_seq OWNER TO postgres;

--
-- Name: comic_stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comic_stories_id_seq OWNED BY public.comic_stories.id;


--
-- Name: comic_writers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comic_writers (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);


ALTER TABLE public.comic_writers OWNER TO postgres;

--
-- Name: comic_writers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comic_writers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comic_writers_id_seq OWNER TO postgres;

--
-- Name: comic_writers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comic_writers_id_seq OWNED BY public.comic_writers.id;


--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_id_seq OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    run_time integer DEFAULT 0 NOT NULL,
    release_date date NOT NULL,
    viewer_rating integer,
    critic_rating integer,
    director_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: comic_illustrators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_illustrators ALTER COLUMN id SET DEFAULT nextval('public.comic_illustrators_id_seq'::regclass);


--
-- Name: comic_stories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_stories ALTER COLUMN id SET DEFAULT nextval('public.comic_stories_id_seq'::regclass);


--
-- Name: comic_writers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_writers ALTER COLUMN id SET DEFAULT nextval('public.comic_writers_id_seq'::regclass);


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Data for Name: comic_illustrators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comic_illustrators (id, first_name, last_name) FROM stdin;
\.


--
-- Data for Name: comic_inspirations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comic_inspirations (comic_stories_id, movies_id) FROM stdin;
\.


--
-- Data for Name: comic_stories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comic_stories (id, title, description, writer_id, illustrator_id) FROM stdin;
\.


--
-- Data for Name: comic_writers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comic_writers (id, first_name, last_name) FROM stdin;
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (id, first_name, last_name) FROM stdin;
1	Jon	Favreau
2	Louis	Leterrier
3	Kenneth	Branagh
4	Joe	Johnston
5	Joss	Whedon
6	Shane	Black
7	Alan	Taylor
8	Anthony	Russo
9	Joe	Russo
10	James	Gunn
11	Scott	Derrickson
12	Jon	Watts
13	Taika	Waititi
14	Ryan	Coogler
15	Anna	Boden
16	Ryan	Fleck
17	Chloe	Zhao
18	Cate	Shortland
19	Destin	Cretton
20	Peyton	Reed
21	Russo	Brothers
25	Sam	Raimi
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (id, name, description, run_time, release_date, viewer_rating, critic_rating, director_id) FROM stdin;
88	Iron Man	2008s Iron Man tells the story of Tony Stark, a billionaire industrialist and genius inventor who is kidnapped and forced to build a devastating weapon. Instead, using his intelligence and ingenuity, Tony builds a high-tech suit of armor and escapes captivity. When he uncovers a nefarious plot with global implications, he dons his powerful armor and vows to protect the world as Iron Man.	126	2008-05-02	91	94	1
91	The Incredible Hulk	In this new beginning, scientist Bruce Banner desperately hunts for a cure to the gamma radiation that poisoned his cells and unleashes the unbridled force of rage within him: The Hulk. Living in the shadows--cut off from a life he knew and the woman he loves, Betty Ross--Banner struggles to avoid the obsessive pursuit of his nemesis, General Thunderbolt Ross and the military machinery that seeks to capture him and brutally exploit his power. As all three grapple with the secrets that led to the Hulks creation, they are confronted with a monstrous new adversary known as the Abomination, whose destructive strength exceeds even the Hulks own. One scientist must make an agonizing final choice: accept a peaceful life as Bruce Banner or find heroism in the creature he holds inside--The Incredible Hulk.	112	2008-06-13	70	67	2
92	Iron Man 2	With the world now aware that he is Iron Man, billionaire inventor Tony Stark faces pressure from all sides to share his technology with the military. He is reluctant to divulge the secrets of his armored suit, fearing the information will fall into the wrong hands. With Pepper Potts and Rhodey Rhodes by his side, Tony must forge new alliances and confront a powerful new enemy.	124	2010-05-07	71	72	1
93	Thor	As the son of Odin, king of the Norse gods, Thor will soon inherit the throne of Asgard from his aging father. However, on the day that he is to be crowned, Thor reacts with brutality when the gods enemies, the Frost Giants, enter the palace in violation of their treaty. As punishment, Odin banishes Thor to Earth. While Loki, Thors brother, plots mischief in Asgard, Thor, now stripped of his powers, faces his greatest threat.	115	2011-05-06	76	77	3
94	Captain America: The First Avenger	Marvels Captain America: The First Avenger focuses on the early days of the Marvel Universe when Steve Rogers volunteers to participate in an experimental program that turns him into the Super Soldier known as Captain America.	124	2011-07-22	75	79	4
95	The Avengers	Marvel Studios presents in association with Paramount Pictures Marvels The Avengers--the super hero team up of a lifetime, featuring iconic Marvel super heroes Iron Man, the Incredible Hulk, Thor, Captain America, Hawkeye and Black Widow. When an unexpected enemy emerges that threatens global safety and security, Nick Fury, Director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins.	143	2012-05-04	91	91	5
96	Iron Man 3	Marvels Iron Man 3 pits brash-but-brilliant industrialist Tony Stark/Iron Man against an enemy whose reach knows no bounds. When Stark finds his personal world destroyed at his enemys hands, he embarks on a harrowing quest to find those responsible. This journey, at every turn, will test his mettle. With his back against the wall, Stark is left to survive by his own devices, relying on his ingenuity and instincts to protect those closest to him. As he fights his way back, Stark discovers the answer to the question that has secretly haunted him: does the man make the suit or does the suit make the man	130	2013-05-03	78	79	6
97	Thor: The Dark World	In the aftermath of Marvels Thor and Marvels The Avengers, Thor fights to restore order across the cosmos...but an ancient race led by the vengeful Malekith returns to plunge the universe back into darkness. Faced with an enemy that even Odin and Asgard cannot withstand, Thor must embark on his most perilous and personal journey yet, one that will reunite him with Jane Foster and force him to sacrifice everything to save us all.	112	2013-11-08	75	66	7
98	Captain America: The Winter Soldier	After the cataclysmic events in New York with The Avengers, Marvels Captain America: The Winter Soldier, finds Steve Rogers, aka Captain America, living quietly in Washington, D.C. and trying to adjust to the modern world. But when a S.H.I.E.L.D. colleague comes under attack, Steve becomes embroiled in a web of intrigue that threatens to put the world at risk. Joining forces with the Black Widow, Captain America struggles to expose the ever-widening conspiracy while fighting off professional assassins sent to silence him at every turn. When the full scope of the villainous plot is revealed, Captain America and the Black Widow enlist the help of a new ally, the Falcon. However, they soon find themselves up against an unexpected and formidable enemy--the Winter Soldier.	136	2014-04-04	92	90	21
99	Guardians of the Galaxy	An action-packed, epic space adventure, Marvels Guardians of the Galaxy, expands the Marvel Cinematic Universe into the cosmos, where brash adventurer Peter Quill finds himself the object of an unrelenting bounty hunt after stealing a mysterious orb coveted by Ronan, a powerful villain with ambitions that threaten the entire universe. To evade the ever-persistent Ronan, Quill is forced into an uneasy truce with a quartet of disparate misfits--Rocket, a gun-toting raccoon; Groot, a tree-like humanoid; the deadly and enigmatic Gamora; and the revenge-driven Drax the Destroyer. But when Quill discovers the true power of the orb and the menace it poses to the cosmos, he must do his best to rally his ragtag rivals for a last, desperate stand--with the galaxys fate in the balance.	121	2014-08-01	92	92	10
100	Avengers: Age of Ultron	Marvel Studios presents “Avengers: Age of Ultron,” the epic follow-up to the biggest Super Hero movie of all time. When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and Earths Mightiest Heroes, including Iron Man, Captain America, Thor, The Incredible Hulk, Black Widow and Hawkeye, are put to the ultimate test as the fate of the planet hangs in the balance. As the villainous Ultron emerges, it is up to the Avengers to stop him from enacting his terrible plans, and soon uneasy alliances and unexpected action pave the way for an epic and unique global adventure.	141	2015-05-01	83	76	5
101	Ant-Man	The next evolution of the Marvel Cinematic Universe brings a founding member of The Avengers to the big screen for the first time with Marvel Studios Ant-Man. Armed with the astonishing ability to shrink in scale but increase in strength, master thief Scott Lang must embrace his inner-hero and help his mentor, Doctor Hank Pym, protect the secret behind his spectacular Ant-Man suit from a new generation of towering threats. Against seemingly insurmountable obstacles, Pym and Lang must plan and pull off a heist that will save the world.	117	2015-07-17	85	83	20
102	Captain America: Civil War	Steve Rogers leads the newly formed team of Avengers in their continued efforts to safeguard humanity. But after another incident involving the Avengers results in collateral damage, political pressure mounts to install a system of accountability, headed by a governing body to oversee and direct the team. The new status quo fractures the Avengers, resulting in two camps—one led by Steve Rogers and his desire for the Avengers to remain free to defend humanity without government interference, and the other following Tony Starks surprising decision to support government oversight and accountability.	147	2016-05-06	89	90	21
103	Doctor Strange	From Marvel Studios comes “Doctor Strange,” the story of world-famous neurosurgeon Dr. Stephen Strange whose life changes forever after a horrific car accident robs him of the use of his hands. When traditional medicine fails him, he is forced to look for healing, and hope, in an unlikely place—a mysterious enclave known as Kamar-Taj. Before long Strange—armed with newly acquired magical powers—is forced to choose whether to return to his life of fortune and status or leave it all behind to defend the world as the most powerful sorcerer in existence.	115	2016-11-04	86	89	11
104	Guardians of the Galaxy Vol. 2	Set to the backdrop of Awesome Mixtape #2, Marvels Guardians of the Galaxy Vol. 2 continues the teams adventures as they traverse the outer reaches of the cosmos. The Guardians must fight to keep their newfound family together as they unravel the mysteries of Peter Quills true parentage. Old foes become new allies and fan-favorite characters from the classic comics will come to our heroes aid as the Marvel cinematic universe continues to expand.	136	2017-05-05	87	85	10
105	Spiderman-Man: Homecoming	A young Peter Parker/Spider-Man (Tom Holland), who made his sensational debut in Captain America: Civil War, begins to navigate his newfound identity as the web-slinging super hero in Spider-Man: Homecoming. Thrilled by his experience with the Avengers, Peter returns home, where he lives with his Aunt May (Marisa Tomei), under the watchful eye of his new mentor Tony Stark (Robert Downey, Jr.). Peter tries to fall back into his normal daily routine - distracted by thoughts of proving himself to be more than just your friendly neighborhood Spider-Man - but when the Vulture (Michael Keaton) emerges as a new villain, everything that Peter holds most important will be threatened.	133	2017-07-07	87	92	12
106	Thor: Ragnarok	Thor is imprisoned on the other side of the universe without his mighty hammer and finds himself in a race against time to get back to Asgard to stop Ragnarok—the destruction of his homeworld and the end of Asgardian civilization—at the hands of an all-powerful new threat, the ruthless Hela. But first he must survive a deadly gladiatorial contest that pits him against his former ally and fellow Avenger—the Incredible Hulk!	130	2017-11-03	87	93	13
107	Black Panther	Marvel Studios Black Panther follows TChalla who, after the death of his father, the King of Wakanda, returns home to the isolated, technologically advanced African nation to succeed to the throne and take his rightful place as king. But when a powerful old enemy reappears, TChallas mettle as king—and Black Panther—is tested when he is drawn into a formidable conflict that puts the fate of Wakanda and the entire world at risk. Faced with treachery and danger, the young king must rally his allies and release the full power of Black Panther to defeat his foes and secure the safety of his people and their way of life.	134	2018-02-16	79	96	14
108	Avengers: Infinity War	An unprecedented cinematic journey ten years in the making and spanning the entire Marvel Cinematic Universe, Marvel Studios Avengers: Infinity War brings to the screen the ultimate, deadliest showdown of all time. As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.	149	2018-04-27	91	85	21
109	Ant-Man and The Wasp	From the Marvel Cinematic Universe comes a new chapter featuring heroes with the astonishing ability to shrink: “Ant-Man and The Wasp.” In the aftermath of “Captain America: Civil War,” Scott Lang (Paul Rudd) grapples with the consequences of his choices as both a Super Hero and a father. As he struggles to rebalance his home life with his responsibilities as Ant-Man, he’s confronted by Hope van Dyne (Evangeline Lilly) and Dr. Hank Pym (Michael Douglas) with an urgent new mission. Scott must once again put on the suit and learn to fight alongside The Wasp as the team works together to uncover secrets from their past.	118	2018-07-06	81	87	20
110	Captain Marvel	Set in the 1990s, Marvel Studios Captain Marvel is an all-new adventure from a previously unseen period in the history of the Marvel Cinematic Universe that follows the journey of Carol Danvers as she becomes one of the universes most powerful heroes. While a galactic war between two alien races reaches Earth, Danvers finds herself and a small cadre of allies at the center of the maelstrom.	125	2019-03-08	45	79	15
111	Avengers: Endgame	The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one final stand in Marvel Studios grand conclusion to twenty-two films, Avengers: Endgame.	181	2019-04-26	90	94	21
112	Spider-Man: Far From Home	Following the events of Avengers: Endgame, Spider-Man must step up to take on new threats in a world that has changed forever.	129	2019-07-02	95	90	12
113	Black Widow	In Marvel Studios action-packed spy thriller “Black Widow,” Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.	133	2021-07-09	91	79	18
114	Shang-Chi and The Legend of The Ten Rings	Marvel Studios Shang-Chi and The Legend of The Ten Rings stars Simu Liu as Shang-Chi, who must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization. The film also stars Tony Leung as Wenwu, Awkwafina as Shang-Chis friend Katy and Michelle Yeoh as Jiang Nan, as well as Fala Chen, Menger Zhang, Florian Munteanu and Ronny Chieng.	133	2021-09-03	98	91	19
115	Eternals	Marvel Studios Eternals features an exciting new team of Super Heroes in the Marvel Cinematic Universe, ancient aliens who have been living on Earth in secret for thousands of years. Following the events of Avengers: Endgame, an unexpected tragedy forces them out of the shadows to reunite against mankinds most ancient enemy, the Deviants.	157	2021-11-05	77	47	17
116	Spider-Man: No Way Home	For the first time in the cinematic history of Spider-Man, our friendly neighborhood heros identity is revealed, bringing his Super Hero responsibilities into conflict with his normal life and putting those he cares about most at risk. When he enlists Doctor Stranges help to restore his secret, the spell tears a hole in their world, releasing the most powerful villains whove ever fought a Spider-Man in any universe. Now, Peter will have to overcome his greatest challenge yet, which will not only forever alter his own future but the future of the Multiverse.	148	2021-12-17	98	93	12
117	Doctor Strange in the Multiverse of Madness	Marvel Studios Doctor Strange in the Multiverse of Madness—a thrilling ride through the Multiverse with Doctor Strange, his trusted friend Wong and Wanda Maximoff, aka Scarlet Witch. Doctor Strange in the Multiverse of Madness opens in U.S. theaters on May 6, 2022.	126	2022-05-06	85	74	25
118	Thor: Love and Thunder	Thor: Love and Thunder finds Thor (Chris Hemsworth) on a journey unlike anything hes ever faced -- a quest for inner peace. But his retirement is interrupted by a galactic killer known as Gorr the God Butcher (Christian Bale), who seeks the extinction of the gods. To combat the threat, Thor enlists the help of King Valkyrie (Tessa Thompson), Korg (Taika Waititi) and ex-girlfriend Jane Foster (Natalie Portman), who -- to Thors surprise -- inexplicably wields his magical hammer, Mjolnir, as the Mighty Thor. Together, they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butchers vengeance and stop him before its too late.	125	2022-07-08	77	65	13
\.


--
-- Name: comic_illustrators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comic_illustrators_id_seq', 1, false);


--
-- Name: comic_stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comic_stories_id_seq', 1, false);


--
-- Name: comic_writers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comic_writers_id_seq', 1, false);


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_id_seq', 25, true);


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_id_seq', 118, true);


--
-- Name: comic_illustrators comic_illustrators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_illustrators
    ADD CONSTRAINT comic_illustrators_pkey PRIMARY KEY (id);


--
-- Name: comic_inspirations comic_inspirations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_inspirations
    ADD CONSTRAINT comic_inspirations_pkey PRIMARY KEY (comic_stories_id, movies_id);


--
-- Name: comic_stories comic_stories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_stories
    ADD CONSTRAINT comic_stories_pkey PRIMARY KEY (id);


--
-- Name: comic_writers comic_writers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_writers
    ADD CONSTRAINT comic_writers_pkey PRIMARY KEY (id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: movies movies_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_name_key UNIQUE (name);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: comic_inspirations fk_comic_inspirations_comic_stories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_inspirations
    ADD CONSTRAINT fk_comic_inspirations_comic_stories FOREIGN KEY (comic_stories_id) REFERENCES public.comic_stories(id);


--
-- Name: comic_inspirations fk_comic_inspirations_movies; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_inspirations
    ADD CONSTRAINT fk_comic_inspirations_movies FOREIGN KEY (movies_id) REFERENCES public.movies(id);


--
-- Name: comic_stories fk_comic_stories_comic_illustrators; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_stories
    ADD CONSTRAINT fk_comic_stories_comic_illustrators FOREIGN KEY (illustrator_id) REFERENCES public.comic_illustrators(id);


--
-- Name: comic_stories fk_comic_stories_writers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comic_stories
    ADD CONSTRAINT fk_comic_stories_writers FOREIGN KEY (writer_id) REFERENCES public.comic_writers(id);


--
-- Name: movies fk_movies_directors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT fk_movies_directors FOREIGN KEY (director_id) REFERENCES public.directors(id);


--
-- PostgreSQL database dump complete
--
-- to create database with pg_dump file use command below in bash with server up
-- cat MCUDB.sql | docker exec -i pg_container psql -d MCUDB