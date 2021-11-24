INSERT INTO users (username, password) VALUES ('admin', 'adminpwd');
INSERT INTO admins (id) VALUES (1);
INSERT INTO users (username, password) VALUES ('professor', '123');
INSERT INTO teachers (id) VALUES (2);
INSERT INTO users (username, password) VALUES ('teacher', '123');
INSERT INTO teachers (id) VALUES (3);
INSERT INTO users (username, password) VALUES ('best_teacher', '123');
INSERT INTO teachers (id) VALUES (4);
INSERT INTO users (username, password) VALUES ('learner', '123');
INSERT INTO learners (id) VALUES (5);
INSERT INTO users (username, password) VALUES ('best_learner', '123');
INSERT INTO learners (id) VALUES (6);

INSERT INTO fields (name) VALUES ('Maths');
INSERT INTO fields (name) VALUES ('Informatics');
INSERT INTO fields (name) VALUES ('Language');

INSERT INTO expertises (teacher_id, field_id) VALUES (2, 2);
INSERT INTO expertises (teacher_id, field_id) VALUES (3, 1);

INSERT INTO posts (title, content, author_id) VALUES ('On Informatics', 'KUInfo is the best in the universe.', 2);
INSERT INTO post_fields (post_id, field_id) VALUES (1, 2);

INSERT INTO posts (title, content, author_id) VALUES ('On Maths', 'Maths is short for mathematics.', 3);
INSERT INTO post_fields (post_id, field_id) VALUES (2, 1);

INSERT INTO posts (title, content, author_id) VALUES (
    'Kurdish languages',
    'The Kurdish languages (Kurmanji Kurdish: Zimanê kurdî, Sorani Kurdish: زمانی کوردی,Southern Kurdish: زوان کوردی) constitute a dialect continuum, belonging to the Iranian language family, spoken by Kurds in the geo-cultural region of Kurdistan and the Kurdish diaspora. The three Kurdish languages are Northern Kurdish (Kurmanji), Central Kurdish (Sorani), and Southern Kurdish (Xwarîn).
The classification of Laki as a dialect of Southern Kurdish or as a fourth language under Kurdish is a matter of debate, but the differences between Laki and other Southern Kurdish dialects are minimal.
The literary output in Kurdish was mostly confined to poetry until the early 20th century, when more general literature became developed. Today, the two principal written Kurdish dialects are Kurmanji and Sorani. Sorani is, along with Arabic, one of the two official languages of Iraq and is in political documents simply referred to as "Kurdish".
Kurdish is divided into three or four groups, where dialects from different groups are not mutually intelligible without acquired bilingualism.
* Northern Kurdish (Kurmanji) is the largest dialect group, spoken by an estimated 15 to 20 million Kurds in Turkey, Syria, northern Iraq, and northwest and northeast Iran.
* Central Kurdish (Sorani) is spoken by an estimated 6 to 7 million Kurds in much of Iraqi Kurdistan and the Iranian Kurdistan Province. Sorani is a written standard of Central Kurdish developed in the 1920s (named after the historical Soran Emirate) and was later adopted as the standard orthography of Kurdish as an official language of Iraq.
* Southern Kurdish (Pehlewani) is spoken in the Kermanshah, Ilam and Lorestan provinces of Iran and in the Khanaqin district of eastern Iraq.
* Kurdali (Palai) is often included in Southern Kurdish, but is quite distinct.'
, 4);
INSERT INTO post_fields (post_id, field_id) VALUES (3, 3);

INSERT INTO posts (title, content, author_id) VALUES (
    'Homeomorphism',
    'In the mathematical field of topology, a homeomorphism, topological isomorphism, or bicontinuous function is a continuous function between topological spaces that has a continuous inverse function. Homeomorphisms are the isomorphisms in the category of topological spaces—that is, they are the mappings that preserve all the topological properties of a given space.'
, 2);
INSERT INTO post_fields (post_id, field_id) VALUES (4, 1);

INSERT INTO posts (title, content, author_id) VALUES (
    'Topological space',
    'In mathematics, a topological space is, roughly speaking, a geometrical space in which closeness is defined but cannot necessarily be measured by a numeric distance. More specifically, a topological space is a set of points, along with a set of neighbourhoods for each point, satisfying a set of axioms relating points and neighbourhoods.'
, 2);
INSERT INTO post_fields (post_id, field_id) VALUES (5, 1);

INSERT INTO post_relations (post_id, related_post_id) VALUES (1, 2);
INSERT INTO post_relations (post_id, related_post_id) VALUES (2, 1);
