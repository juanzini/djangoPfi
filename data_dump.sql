--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

--
-- Data for Name: alumno_departamento; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_departamento VALUES ('Departamento de Informática');


--
-- Data for Name: alumno_carrera; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_carrera VALUES ('Ingeniería en Informática', 'Departamento de Informática');
INSERT INTO alumno_carrera VALUES ('Tecnicatura Universitaria en Redes de Computadoras', 'Departamento de Informática');
INSERT INTO alumno_carrera VALUES ('Tecnicatura Universitaria en Web', 'Departamento de Informática');
INSERT INTO alumno_carrera VALUES ('Ingeniería en Computación', 'Departamento de Informática');
INSERT INTO alumno_carrera VALUES ('Licenciatura en Ciencias de la Computación', 'Departamento de Informática');
INSERT INTO alumno_carrera VALUES ('Profesorado en Ciencias de la Computación', 'Departamento de Informática');


--
-- Data for Name: alumno_user; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_user VALUES (31, 'pbkdf2_sha256$150000$8rYEwujqIdcP$EREteMhs/s3jhLanQnZVMQFAxsHS4RvZe3B0J4DLL0w=', NULL, 0, 'elias-martin-schiel', 'Elias Martin', 'Schiel', 'elias-martin-schiel@asd.com', 0, 1, '2019-08-11 20:40:58.533103-03', 'AL');
INSERT INTO alumno_user VALUES (32, 'pbkdf2_sha256$150000$EqNh406UkXv6$opLGVpiN/3iaOIfgcfuoAjEljPNH0eexgB60/o0m9mw=', NULL, 0, 'maria-silvia-sofia-saieg', 'Maria Silvia Sofia', 'Saieg', 'maria-silvia-sofia-saieg@asd.com', 0, 1, '2019-08-11 20:51:14.022542-03', 'AL');
INSERT INTO alumno_user VALUES (2, 'pbkdf2_sha256$150000$JZdgq6EU97bM$9XYErbNLCEEsK+Th/sTvIwmchy75+ToivymCON4tRJM=', '2019-08-04 18:30:41.039283-03', 0, 'gaston-zini', 'Gaston', 'Zini', 'gustotongas@hotmail.com', 0, 1, '2019-08-04 18:26:17.469323-03', 'AL');
INSERT INTO alumno_user VALUES (3, 'pbkdf2_sha256$150000$TItmkh76fRfC$ZsSv+p02KvcPnZ37x7+x+5KiWgewk2XcAGIpnGW9mFk=', NULL, 0, 'sub-tec-red-com', 'SubComision de Tecnicatura', 'Redes de Computadoras', 'sub1@asd.com', 0, 1, '2019-08-04 18:41:08.393093-03', 'CC');
INSERT INTO alumno_user VALUES (4, 'pbkdf2_sha256$150000$DVYUbWQPXO7v$zPVshYqDUd9jCymLvAQONCmYTDzlCYO3jeEwWhHeN6g=', NULL, 0, 'com-pas', 'Comisión de Pasantías del', 'Departamento de Informática', 'com@asd.com', 0, 1, '2019-08-04 18:44:31.409063-03', 'CP');
INSERT INTO alumno_user VALUES (5, 'pbkdf2_sha256$150000$RQthrJ8fA0hZ$16RqJXpLvrdP0RbiMB8kbAP5kSKz1SsSEI67EGQak1Y=', NULL, 0, 'mercado-libre', 'Mercadolibre', 'S.R.L', 'empresa1@asd.com', 0, 1, '2019-08-04 18:47:59.262606-03', 'EM');
INSERT INTO alumno_user VALUES (33, 'pbkdf2_sha256$150000$FyUuDWrhxBcw$JI9eUGcqgb5Q+F41Ofc3vUYLWHNeJ8PPqQZ6v3nNCcg=', NULL, 0, 'carlos-dante-scala-necco', 'Carlos Dante', 'Scala Necco', 'carlos-dante-scala-necco@asd.com', 0, 1, '2019-08-11 20:54:45.672803-03', 'AL');
INSERT INTO alumno_user VALUES (34, 'pbkdf2_sha256$150000$lySzSiquVctf$HaI+ZQKOGGGUFNCNxTPBQUhwEio37nARzGfuHQncwUo=', NULL, 0, 'leandro-troncoso', 'Leandro', 'Troncoso', 'leandro-troncoso@asd.com', 0, 1, '2019-08-11 20:55:55.371717-03', 'AL');
INSERT INTO alumno_user VALUES (6, 'pbkdf2_sha256$150000$oeWm3FiiXnec$tM6NIRjwm0P2JTYQEm8X/PNTehoAvONICXafa1cfQ3w=', NULL, 0, 'pablo-martin-abaca', 'Pablo Martin', 'Abaca', 'pablomartinabaca@asd.com', 0, 1, '2019-08-10 22:47:35.073564-03', 'AL');
INSERT INTO alumno_user VALUES (35, 'pbkdf2_sha256$150000$brE5pRRAVL2C$QAmqaj63kpvL2Thy7/Dq0BQyNHWJO7N2f7qPVvOhS5s=', NULL, 0, 'raona-srl', 'Raona', 'S.R.L.', 'empresa1@asd.com', 0, 1, '2019-08-13 19:30:35.568128-03', 'EM');
INSERT INTO alumno_user VALUES (7, 'pbkdf2_sha256$150000$0a5WWWe4PUrR$rPbdoY2097Sj5X5anKnvmV8A9GXlFYFCp167lthI7Eo=', NULL, 0, 'gabriel-hernan-aballay', 'Gabriel Hernan', 'Aballay', 'gabriel-hernan-aballay@asd.com', 0, 1, '2019-08-11 18:44:56.620628-03', 'AL');
INSERT INTO alumno_user VALUES (8, 'pbkdf2_sha256$150000$pTh4DxbRbpYx$c9PZOgUm3M+YCQYbw5BiZZea2KabwLa3wOx+HrcdJ3g=', NULL, 0, 'nicolas-abatedaga-biole', 'Nicolas', 'Abatedaga Biole', 'nicolas-abatedaga-biole@asd.com', 0, 1, '2019-08-11 18:54:47.053658-03', 'AL');
INSERT INTO alumno_user VALUES (9, 'pbkdf2_sha256$150000$iur59Suy7JJn$UUYObMK1epKJz5ns8+XPhmK6QKIx8H6wCprSKOXJHBw=', NULL, 0, 'tomas-abatedaga-biole', 'Tomas', 'Abatedaga Biole', 'tomas-abatedaga-biole@asd.com', 0, 1, '2019-08-11 18:56:49.437323-03', 'AL');
INSERT INTO alumno_user VALUES (10, 'pbkdf2_sha256$150000$anBzNPfrm9Z2$yIeO7HccQF0pot1KozxgG+n7cJO9dy/GGO4NL9Z1pkw=', NULL, 0, 'maria-aylen-abraham', 'Maria Aylen', 'Abraham', 'maria-aylen-abraham@asd.com', 0, 1, '2019-08-11 19:00:49.136095-03', 'AL');
INSERT INTO alumno_user VALUES (11, 'pbkdf2_sha256$150000$qJKbwCel6784$V5SJN/iOLwT7YpjHcx+qe1PMlocmg0FTWCntdD7D3qw=', NULL, 0, 'ezequiel-alessandro-acevedo', 'Ezequiel Alessandro', 'Acevedo', 'ezequiel-alessandro-acevedo@asd.com', 0, 1, '2019-08-11 19:06:14.026965-03', 'AL');
INSERT INTO alumno_user VALUES (12, 'pbkdf2_sha256$150000$n9fmFW2Gbhax$Zudj5ZJRliA0pjB+8suP+ZASVneQDFFBJlNLZbfGXWw=', NULL, 0, 'fernando-adaro', 'Fernando', 'Adaro', 'fernando-adaro@asd.com', 0, 1, '2019-08-11 19:08:56.206969-03', 'AL');
INSERT INTO alumno_user VALUES (13, 'pbkdf2_sha256$150000$pzKoXpyYFttR$pCf4kiIlGpUg5PmUDiNmyuCuDiJy1OjksPv+CNrN8co=', NULL, 0, 'gisella-daiana-alaniz', 'Gisella Daiana', 'Alaniz', 'gisella-daiana-alaniz@asd.com', 0, 1, '2019-08-11 19:12:02.237067-03', 'AL');
INSERT INTO alumno_user VALUES (14, 'pbkdf2_sha256$150000$xcWTzHlxP9Hw$1alfXmBajqFLTQFm2RZSO5b4xuDY7lBT0tccFV0ahWc=', NULL, 0, 'valentina-baglioni', 'Valentina', 'Baglioni', 'valentina-baglioni@asd.com', 0, 1, '2019-08-11 19:18:47.563811-03', 'AL');
INSERT INTO alumno_user VALUES (15, 'pbkdf2_sha256$150000$4XDpB1KWguz4$MRhhMiPpeOirBA+wIPTs9wPjv/zZESaY6NSS48vmXj8=', NULL, 0, 'johanna-celeste-bello', 'Johanna Celeste', 'Bello', 'johanna-celeste-bello@asd.com', 0, 1, '2019-08-11 19:22:45.73023-03', 'AL');
INSERT INTO alumno_user VALUES (16, 'pbkdf2_sha256$150000$xFP2eTFiRmmM$j4hvgSGH+VFo6O7+EddK/x1VVkSa/0ffL3d1crlThsU=', NULL, 0, 'tobias-facundo-burger', 'Tobias Facundo', 'Burger', 'tobias-facundo-burger@asd.com', 0, 1, '2019-08-11 19:25:00.278586-03', 'AL');
INSERT INTO alumno_user VALUES (17, 'pbkdf2_sha256$150000$S3L7DvIQvU2P$eRnbi74LCace6VneGHlpONOlLLplKRUpQL5+Ui41PE4=', NULL, 0, 'gianfranco-capodici', 'Gianfranco', 'Capodici', 'gianfranco-capodici@asd.com', 0, 1, '2019-08-11 19:27:02.37535-03', 'AL');
INSERT INTO alumno_user VALUES (18, 'pbkdf2_sha256$150000$uQhe3NUJZyes$qPl+Cc5Id7SNaNqtZBnEMqqYIUsKa9UKZQggfvSTX0s=', NULL, 0, 'ema-noemi-ciavarelli', 'Ema Noemi', 'Ciavarelli', 'ema-noemi-ciavarelli@asd.com', 0, 1, '2019-08-11 19:32:40.301188-03', 'AL');
INSERT INTO alumno_user VALUES (19, 'pbkdf2_sha256$150000$RfsWoSVeH7wM$sT5TIDop0XtIh80JxBOmPsfMFqDkyGXXmzOzastrXUk=', NULL, 0, 'ezequiel-oscar-gaggioli', 'Ezequiel Oscar', 'Gaggioli', 'ezequiel-oscar-gaggioli@asd.com', 0, 1, '2019-08-11 19:37:50.670719-03', 'AL');
INSERT INTO alumno_user VALUES (20, 'pbkdf2_sha256$150000$IZlkyRVV1uG0$/ypyAFqx7MmiL7CTjeaJApY8idb6GjSs0sjOwRJrT3I=', NULL, 0, 'atilio-raul-guzman', 'Atilio Raul', 'Guzman', 'atilio-raul-guzman@asd.com', 0, 1, '2019-08-11 19:41:22.180367-03', 'AL');
INSERT INTO alumno_user VALUES (21, 'pbkdf2_sha256$150000$oggIhcsTkvRd$4VqNKHrV5Amjl/nOc5TAlGBl3EqOpNRUbyS44CCf3zk=', NULL, 0, 'facundo-agustin-homola', 'Facundo Agustin', 'Hómola', 'facundo-agustin-homola@asd.com', 0, 1, '2019-08-11 19:45:15.019132-03', 'AL');
INSERT INTO alumno_user VALUES (22, 'pbkdf2_sha256$150000$TqEgcFax4eQx$6T2J3QBA6ViGna1HLlvUxAxWQO5mJjNhBYkUQcAeUOo=', NULL, 0, 'daniel-eliezer-kwist', 'Daniel Eliezer', 'Kwist', 'daniel-eliezer-kwist@asd.com', 0, 1, '2019-08-11 19:50:01.547698-03', 'AL');
INSERT INTO alumno_user VALUES (23, 'pbkdf2_sha256$150000$dg5jEvoUw0vm$Ds1e3LxBQZpFVK5aaYbN+dvHKNt22DXqpLPWgEi90GM=', NULL, 0, 'alexey-kutalo', 'Alexey', 'Kutalo', 'alexey-kutalo@asd.com', 0, 1, '2019-08-11 19:58:23.890976-03', 'AL');
INSERT INTO alumno_user VALUES (24, 'pbkdf2_sha256$150000$QWrbQ6VIIwJN$VAb1EJyyufTvFL8Lg+2ICjSPSO6Czt6tNyQYOZqzWDY=', NULL, 0, 'gianni-roman-lupi-casale', 'Gianni Roman', 'Lupi Casale', 'gianni-roman-lupi-casale@asd.com', 0, 1, '2019-08-11 19:59:59.35536-03', 'AL');
INSERT INTO alumno_user VALUES (25, 'pbkdf2_sha256$150000$S4AjCqs4p7IO$8r1Q6bhMjviZnFkgYCni05gwxTpzbLZ/gh/IqhklQeQ=', NULL, 0, 'tomas-bautista-maldocena', 'Tomas Bautista', 'Maldocena', 'tomas-bautista-maldocena@asd.com', 0, 1, '2019-08-11 20:02:08.814254-03', 'AL');
INSERT INTO alumno_user VALUES (26, 'pbkdf2_sha256$150000$MzQ8TgNHqc5V$x+ZbS+pGZn+1UmVLGcTy2zNLlIEkiRPedi9D/nzRfBY=', NULL, 0, 'pedro-arturo-mas-bustos', 'Pedro Arturo', 'Mas Bustos', 'pedro-arturo-mas-bustos@asd.com', 0, 1, '2019-08-11 20:04:28.394759-03', 'AL');
INSERT INTO alumno_user VALUES (27, 'pbkdf2_sha256$150000$RwpcS9djzZ6Z$lEKFHhUCksnCMazNvUS8ihboQNKNcL9RWJbm3qnqprg=', NULL, 0, 'leonela-sofia-oyarzun', 'Leonela Sofia', 'Oyarzún', 'leonela-sofia-oyarzun@asd.com', 0, 1, '2019-08-11 20:07:55.447281-03', 'AL');
INSERT INTO alumno_user VALUES (28, 'pbkdf2_sha256$150000$PkgEmDtZAfPA$q1bDZOi/ZS28mooQccfdI++1kWQAfVyQV7j0hBocfv4=', NULL, 0, 'juan-alejandro-palma', 'Juan Alejandro', 'Palma', 'juan-alejandro-palma@asd.com', 0, 1, '2019-08-11 20:21:53.770932-03', 'AL');
INSERT INTO alumno_user VALUES (29, 'pbkdf2_sha256$150000$idQQlYYm1u8V$y79UyX92bUCunvtDL+bRRQA57CWGM2FCJAtS0A00rGs=', NULL, 0, 'florencia-azul-parnisari', 'Florencia Azul', 'Parnisari', 'florencia-azul-parnisari@asd.com', 0, 1, '2019-08-11 20:31:26.901218-03', 'AL');
INSERT INTO alumno_user VALUES (30, 'pbkdf2_sha256$150000$Fmiuy83U7yGU$ZMiD5eaB22rKJPJNEGbUFCEsQ0RjS/dcNWqY8DenT1w=', NULL, 0, 'federico-gabriel-reylova', 'Federico Gabriel', 'Reylova', 'federico-gabriel-reylova@asd.com', 0, 1, '2019-08-11 20:39:09.277771-03', 'AL');
INSERT INTO alumno_user VALUES (36, 'pbkdf2_sha256$150000$63WqQozPQ5J9$luxpWGM2F4IS4rZFOV7+paeTznofNQtT1PQ8etCQSOM=', NULL, 0, 'be-clever', 'be', 'clever', 'empresa2@asd.com', 0, 1, '2019-08-13 19:31:35.973634-03', 'EM');
INSERT INTO alumno_user VALUES (37, 'pbkdf2_sha256$150000$2o5DqunZ7CSu$bqHlBQ3EKjaF23DaEPndQPfTExStq9nWkthyRIJum5c=', NULL, 0, 'gpf-soluciones', 'GPF', 'Soluciones', 'empresa3@asd.com', 0, 1, '2019-08-13 19:32:38.438643-03', 'EM');
INSERT INTO alumno_user VALUES (38, 'pbkdf2_sha256$150000$Vgp3sIehzYXr$08VpKg2v3LfgGu6rJ4oM5Z5lg94CVHMtHADdww6K1Uk=', NULL, 0, 'runa-id', 'Runa', 'ID', 'empresa4@asd.com', 0, 1, '2019-08-13 19:33:31.795288-03', 'EM');
INSERT INTO alumno_user VALUES (39, 'pbkdf2_sha256$150000$Kd2jPA9dVi1c$8c8vLjH5A9qjMDWFK/kz5Y8Y9lLi42ezIAl/cjrbjsA=', NULL, 0, 'cat-technologies', 'CAT', 'Technologies', 'empresa5@asd.com', 0, 1, '2019-08-13 19:34:32.241691-03', 'EM');
INSERT INTO alumno_user VALUES (40, 'pbkdf2_sha256$150000$4V3WaXofy8xP$HBazof2PNOwCPj4PO6RI2gA2RdG69H8SBPMatDigtvA=', NULL, 0, 'coradir-sa', 'Coradir', 'S.A.', 'empresa6@asd.com', 0, 1, '2019-08-13 19:35:33.838642-03', 'EM');
INSERT INTO alumno_user VALUES (41, 'pbkdf2_sha256$150000$VrQ9mVeNaO1q$KfmpvwuBmB7Ar3xIdpAV9OG4B2+EVHaHlmIfpI+qW7E=', NULL, 0, 'unitech-sa', 'Unitech', 'S.A.', 'empresa7@asd.com', 0, 1, '2019-08-13 19:37:08.031886-03', 'EM');
INSERT INTO alumno_user VALUES (42, 'pbkdf2_sha256$150000$FvOvrdMKSCYY$oFfXL73jpMaehmvZluYBoTKVqza+3QYRKS1llqbxNIc=', NULL, 0, 'alas-it', 'Alas', 'IT', 'empresa8@asd.com', 0, 1, '2019-08-13 19:38:04.637562-03', 'EM');
INSERT INTO alumno_user VALUES (43, 'pbkdf2_sha256$150000$JcjumMMTecAx$kqKtH/qrRMCbEN/Fhh3/slhXSAJ50KbvJKektp1edDU=', NULL, 0, 'inworx-sa', 'Inworx', 'S.A.', 'empresa9@asd.com', 0, 1, '2019-08-13 19:40:15.082797-03', 'EM');
INSERT INTO alumno_user VALUES (44, 'pbkdf2_sha256$150000$JotXNTF0Pixc$8waQs+x8/I+jcyrNtNVV1JX/lXcLoHGTbu65CaOr+rA=', NULL, 0, 'arido-software', 'Árido', 'Software', 'empresa10@asd.com', 0, 1, '2019-08-13 19:41:28.215935-03', 'EM');
INSERT INTO alumno_user VALUES (45, 'pbkdf2_sha256$150000$Rw3NtuMwjyVA$3julPEgCvfKITNU7+7vSu8X0vXdiVB8cYMDyQBMKh+A=', NULL, 0, 'grupo-slots', 'Grupo', 'Slots', 'empresa11@asd.com', 0, 1, '2019-08-13 19:42:54.516665-03', 'EM');
INSERT INTO alumno_user VALUES (46, 'pbkdf2_sha256$150000$oR3BwkyafN6j$0JapXLDreaoxmYuHw9BNu87jSG0fgLXcad+fBtmjBNg=', NULL, 0, 'edesal-sa', 'Edesal', 'S.A.', 'empresa12@asd.com', 0, 1, '2019-08-13 19:43:42.213732-03', 'EM');
INSERT INTO alumno_user VALUES (47, 'pbkdf2_sha256$150000$yrdH2nvj1Rxi$OBvwj3yQyv3vJ18GSoJdaYdSPrPb34+pciVcW2UjiDM=', NULL, 0, 'transpuntano-sa', 'Transpuntano', 'S.A.', 'empresa13@asd.com', 0, 1, '2019-08-13 19:45:05.861954-03', 'EM');
INSERT INTO alumno_user VALUES (1, 'pbkdf2_sha256$150000$HA1Sudv6FWhC$tNQVnLre8O/Tyn01hPJvdvWmlGiwQpTfBUaO3aLX7RU=', '2019-08-18 17:55:59.161399-03', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2019-08-04 18:06:15.266537-03', 'AL');


--
-- Data for Name: alumno_alumno; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_alumno VALUES (1, 3024212, 'curriculums/curriculum-gaston-zini-Becas_Onix_UNViMe.pdf', 'planes_de_estudio/plan-gaston-zini-Becas_Onix_UNViMe.pdf', 'historias_academicas/historia-gaston-zini-Becas_Onix_UNViMe.pdf', '', '', '2019-08-04', NULL, NULL, '', '', 0, '', '', 0, 'Ingeniería en Informática', 2);
INSERT INTO alumno_alumno VALUES (2, 3025017, 'curriculums/curriculum-gabriel-hernan-aballay-curriculum.pdf', 'planes_de_estudio/plan-gabriel-hernan-aballay-plan_de_estudio.pdf', 'historias_academicas/historia-gabriel-hernan-aballay-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', '', 0, '', 'perfiles/perfil-gabriel-hernan-aballay-perfil.jpeg', 0, 'Tecnicatura Universitaria en Redes de Computadoras', 7);
INSERT INTO alumno_alumno VALUES (3, 3003212, 'curriculums/curriculum-nicolas-abatedaga-biole-curriculum.pdf', 'planes_de_estudio/plan-nicolas-abatedaga-biole-plan_de_estudio.pdf', 'historias_academicas/historia-nicolas-abatedaga-biole-historia_academica.pdf', 'Interesado en lenguaje html', 'Manejo fluido de lenguajes de programación básica', '2019-08-11', NULL, NULL, '', '', 0, '', 'perfiles/perfil-nicolas-abatedaga-biole-perfil.jpeg', 0, 'Tecnicatura Universitaria en Web', 8);
INSERT INTO alumno_alumno VALUES (4, 3008617, 'curriculums/curriculum-tomas-abatedaga-biole-curriculum.pdf', 'planes_de_estudio/plan-tomas-abatedaga-biole-plan_de_estudio.pdf', 'historias_academicas/historia-tomas-abatedaga-biole-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', '', 0, '', '', 0, 'Ingeniería en Computación', 9);
INSERT INTO alumno_alumno VALUES (5, 3008610, 'curriculums/curriculum-maria-aylen-abraham-curriculum.pdf', 'planes_de_estudio/plan-maria-aylen-abraham-plan_de_estudio.pdf', 'historias_academicas/historia-maria-aylen-abraham-historia_academica.pdf', '', '', '2016-08-11', NULL, NULL, '', '', 0, '', '', 0, 'Licenciatura en Ciencias de la Computación', 10);
INSERT INTO alumno_alumno VALUES (6, 3055517, 'curriculums/curriculum-ezequiel-alessandro-acevedo-curriculum.pdf', 'planes_de_estudio/plan-ezequiel-alessandro-acevedo-plan_de_estudio.pdf', 'historias_academicas/historia-ezequiel-alessandro-acevedo-historia_academica.pdf', 'Interesado en las diversas ciencias de la computación', 'Enseñanza fluida y dinámica.', '2019-08-11', NULL, NULL, '', 'El alumno posee los dotes necesarios para abocar su rubro a la investigación y enseñanza de las diversas ciencias de la computación.', 1, '', '', 0, 'Profesorado en Ciencias de la Computación', 11);
INSERT INTO alumno_alumno VALUES (7, 3042601, 'curriculums/curriculum-fernando-adaro-curriculum.pdf', 'planes_de_estudio/plan-fernando-adaro-plan_de_estudio.pdf', 'historias_academicas/historia-fernando-adaro-historia_academica.pdf', '', '', '2019-08-11', NULL, 0, 'El alumno no llega al porcentaje de materias aprobadas', '', 0, '', '', 0, 'Ingeniería en Informática', 12);
INSERT INTO alumno_alumno VALUES (8, 3017616, 'curriculums/curriculum-gisella-daiana-alaniz-curriculum.pdf', 'planes_de_estudio/plan-gisella-daiana-alaniz-plan_de_estudio.pdf', 'historias_academicas/historia-gisella-daiana-alaniz-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', '', 0, '', 'perfiles/perfil-gisella-daiana-alaniz-perfil.jpeg', 0, 'Ingeniería en Informática', 13);
INSERT INTO alumno_alumno VALUES (9, 3032516, 'curriculums/curriculum-valentina-baglioni-curriculum.pdf', 'planes_de_estudio/plan-valentina-baglioni-plan_de_estudio.pdf', 'historias_academicas/historia-valentina-baglioni-historia_academica.pdf', '', '', '2014-08-11', NULL, 1, '', '', 0, '', '', 0, 'Tecnicatura Universitaria en Web', 14);
INSERT INTO alumno_alumno VALUES (10, 3007817, 'curriculums/curriculum-johanna-celeste-bello-curriculum.pdf', 'planes_de_estudio/plan-johanna-celeste-bello-plan_de_estudio.pdf', 'historias_academicas/historia-johanna-celeste-bello-historia_academica.pdf', 'Aprender y perfeccionarme en desarrollo de software', 'resumir 50 hojas en 3.', '2019-08-11', NULL, NULL, '', '', 0, '', '', 0, 'Licenciatura en Ciencias de la Computación', 15);
INSERT INTO alumno_alumno VALUES (11, 3004417, 'curriculums/curriculum-tobias-facundo-burger-curriculum.pdf', 'planes_de_estudio/plan-tobias-facundo-burger-plan_de_estudio.pdf', 'historias_academicas/historia-tobias-facundo-burger-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', '', 0, '', 'perfiles/perfil-tobias-facundo-burger-perfil.jpeg', 0, 'Tecnicatura Universitaria en Redes de Computadoras', 16);
INSERT INTO alumno_alumno VALUES (12, 3011215, 'curriculums/curriculum-gianfranco-capodici-curriculum.pdf', 'planes_de_estudio/plan-gianfranco-capodici-plan_de_estudio.pdf', 'historias_academicas/historia-gianfranco-capodici-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', '', 0, '', '', 0, 'Ingeniería en Computación', 17);
INSERT INTO alumno_alumno VALUES (13, 3073604, 'curriculums/curriculum-ema-noemi-ciavarelli-curriculum.pdf', 'planes_de_estudio/plan-ema-noemi-ciavarelli-plan_de_estudio.pdf', 'historias_academicas/historia-ema-noemi-ciavarelli-historia_academica.pdf', '', '', '2019-08-11', NULL, 0, 'La alumna no posee el porcentaje de materias requerido.', '', 0, '', 'perfiles/perfil-ema-noemi-ciavarelli-perfil.jpeg', 0, 'Tecnicatura Universitaria en Redes de Computadoras', 18);
INSERT INTO alumno_alumno VALUES (14, 3064504, 'curriculums/curriculum-ezequiel-oscar-gaggioli-curriculum.pdf', 'planes_de_estudio/plan-ezequiel-oscar-gaggioli-plan_de_estudio.pdf', 'historias_academicas/historia-ezequiel-oscar-gaggioli-historia_academica.pdf', 'Aprender programación front end', 'no tengo ninguna', '2019-08-11', NULL, NULL, '', '', 0, '', '', 0, 'Tecnicatura Universitaria en Web', 19);
INSERT INTO alumno_alumno VALUES (15, 3034914, 'curriculums/curriculum-atilio-raul-guzman-curriculum.pdf', 'planes_de_estudio/plan-atilio-raul-guzman-plan_de_estudio.pdf', 'historias_academicas/historia-atilio-raul-guzman-historia_academica.pdf', '', '', '2001-08-11', NULL, 1, '', 'Alumno con gran desempeño académico.', 1, '', '', 0, 'Ingeniería en Computación', 20);
INSERT INTO alumno_alumno VALUES (16, 3008317, 'curriculums/curriculum-facundo-agustin-homola-curriculum.pdf', 'planes_de_estudio/plan-facundo-agustin-homola-plan_de_estudio.pdf', 'historias_academicas/historia-facundo-agustin-homola-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', '', 0, '', 'perfiles/perfil-facundo-agustin-homola-perfil.jpeg', 0, 'Licenciatura en Ciencias de la Computación', 21);
INSERT INTO alumno_alumno VALUES (17, 3023717, 'curriculums/curriculum-daniel-eliezer-kwist-curriculum.pdf', 'planes_de_estudio/plan-daniel-eliezer-kwist-plan_de_estudio.pdf', 'historias_academicas/historia-daniel-eliezer-kwist-historia_academica.pdf', 'crear una red de hackers por medio de mi enseñanza', 'Hackeo la computadora del delivery', '2017-08-11', NULL, 1, '', 'Alumno con gran capacidad para organizar y dirigir proyectos.', 1, '', 'perfiles/perfil-daniel-eliezer-kwist-perfil.jpeg', 0, 'Profesorado en Ciencias de la Computación', 22);
INSERT INTO alumno_alumno VALUES (18, 3015815, 'curriculums/curriculum-alexey-kutalo-curriculum.pdf', 'planes_de_estudio/plan-alexey-kutalo-plan_de_estudio.pdf', 'historias_academicas/historia-alexey-kutalo-historia_academica.pdf', 'Aprender pyton', 'Planificador de proyectos extensos.', '2019-08-11', NULL, 0, 'El alumno no posee el porcentaje de materias requerido.', '', 0, '', '', 0, 'Ingeniería en Informática', 23);
INSERT INTO alumno_alumno VALUES (19, 3011414, 'curriculums/curriculum-gianni-roman-lupi-casale-curriculum.pdf', 'planes_de_estudio/plan-gianni-roman-lupi-casale-plan_de_estudio.pdf', 'historias_academicas/historia-gianni-roman-lupi-casale-historia_academica.pdf', '', '', '2011-08-11', NULL, NULL, '', '', 0, '', 'perfiles/perfil-gianni-roman-lupi-casale-perfil.jpeg', 0, 'Tecnicatura Universitaria en Redes de Computadoras', 24);
INSERT INTO alumno_alumno VALUES (20, 3021917, 'curriculums/curriculum-tomas-bautista-maldocena-curriculum.pdf', 'planes_de_estudio/plan-tomas-bautista-maldocena-plan_de_estudio.pdf', 'historias_academicas/historia-tomas-bautista-maldocena-historia_academica.pdf', 'interesado en programación front end', 'no tengo ninguna', '2019-08-11', NULL, NULL, '', '', 0, '', '', 0, 'Tecnicatura Universitaria en Web', 25);
INSERT INTO alumno_alumno VALUES (21, 3017708, 'curriculums/curriculum-pedro-arturo-mas-bustos-curriculum.pdf', 'planes_de_estudio/plan-pedro-arturo-mas-bustos-plan_de_estudio.pdf', 'historias_academicas/historia-pedro-arturo-mas-bustos-historia_academica.pdf', '', '', '2015-08-11', NULL, 1, '', '', 0, '', 'perfiles/perfil-pedro-arturo-mas-bustos-perfil.jpeg', 0, 'Ingeniería en Computación', 26);
INSERT INTO alumno_alumno VALUES (22, 3028517, 'curriculums/curriculum-leonela-sofia-oyarzun-curriculum.pdf', 'planes_de_estudio/plan-leonela-sofia-oyarzun-plan_de_estudio.pdf', 'historias_academicas/historia-leonela-sofia-oyarzun-historia_academica.pdf', 'Interesada en lenguaje C++', 'nivel de programación C avanzado.', '2019-08-11', NULL, 0, 'La alumna no posee el porcentaje de materias requerido', '', 0, '', 'perfiles/perfil-leonela-sofia-oyarzun-perfil.jpeg', 0, 'Licenciatura en Ciencias de la Computación', 27);
INSERT INTO alumno_alumno VALUES (23, 3016209, 'curriculums/curriculum-juan-alejandro-palma-curriculum.pdf', 'planes_de_estudio/plan-juan-alejandro-palma-plan_de_estudio.pdf', 'historias_academicas/historia-juan-alejandro-palma-historia_academica.pdf', 'Enseñanza didáctica de ciencias modernas', 'Aprendo rápido', '2015-08-11', NULL, 1, '', '', 0, '', 'perfiles/perfil-juan-alejandro-palma-perfil.jpeg', 0, 'Profesorado en Ciencias de la Computación', 28);
INSERT INTO alumno_alumno VALUES (24, 3032416, 'curriculums/curriculum-florencia-azul-parnisari-curriculum.pdf', 'planes_de_estudio/plan-florencia-azul-parnisari-plan_de_estudio.pdf', 'historias_academicas/historia-florencia-azul-parnisari-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', 'Alumno persistente y responsable.', 1, '', 'perfiles/perfil-florencia-azul-parnisari-perfil.jpeg', 0, 'Tecnicatura Universitaria en Redes de Computadoras', 29);
INSERT INTO alumno_alumno VALUES (25, 3027817, 'curriculums/curriculum-federico-gabriel-reylova-curriculum.pdf', 'planes_de_estudio/plan-federico-gabriel-reylova-plan_de_estudio.pdf', 'historias_academicas/historia-federico-gabriel-reylova-historia_academica.pdf', 'Desarrollo de videojuegos', 'Escribo 50 palabras por minuto.', '2019-08-11', NULL, NULL, '', 'Alumno con alto rendimiento en el desarrollo de videojuegos.', 1, '', 'perfiles/perfil-federico-gabriel-reylova-perfil.jpeg', 0, 'Ingeniería en Computación', 30);
INSERT INTO alumno_alumno VALUES (26, 3028616, 'curriculums/curriculum-elias-martin-schiel-curriculum.pdf', 'planes_de_estudio/plan-elias-martin-schiel-plan_de_estudio.pdf', 'historias_academicas/historia-elias-martin-schiel-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', '', 0, '', 'perfiles/perfil-elias-martin-schiel-perfil.jpeg', 0, 'Profesorado en Ciencias de la Computación', 31);
INSERT INTO alumno_alumno VALUES (27, 3037110, 'curriculums/curriculum-maria-silvia-sofia-saieg-curriculum.pdf', 'planes_de_estudio/plan-maria-silvia-sofia-saieg-plan_de_estudio.pdf', 'historias_academicas/historia-maria-silvia-sofia-saieg-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', '', 0, '', '', 0, 'Profesorado en Ciencias de la Computación', 32);
INSERT INTO alumno_alumno VALUES (28, 3027912, 'curriculums/curriculum-carlos-dante-scala-necco-curriculum.pdf', 'planes_de_estudio/plan-carlos-dante-scala-necco-plan_de_estudio.pdf', 'historias_academicas/historia-carlos-dante-scala-necco-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', '', 0, '', 'perfiles/perfil-carlos-dante-scala-necco-perfil.jpeg', 0, 'Ingeniería en Informática', 33);
INSERT INTO alumno_alumno VALUES (29, 3019916, 'curriculums/curriculum-leandro-troncoso-curriculum.pdf', 'planes_de_estudio/plan-leandro-troncoso-plan_de_estudio.pdf', 'historias_academicas/historia-leandro-troncoso-historia_academica.pdf', '', '', '2019-08-11', NULL, NULL, '', '', 0, '', '', 0, 'Tecnicatura Universitaria en Redes de Computadoras', 34);


--
-- Data for Name: alumno_docente; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_docente VALUES ('Rubén Gerardo', 'APOLLONI', 'docente1@asd.com', '1', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Berta Elena', 'GARCÍA', 'docente2@asd.com', '2', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Jesús Francisco', 'AGUIRRE', 'docente3@asd.com', '5', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Natalia Carolina', 'MIRANDA', 'docente4@asd.com', '4', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('María Fabiana', 'PICCOLI', 'docente5@asd.com', '3', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Jaqueline Myriam', 'FERNÁNDEZ', 'docente6@asd.com', '1', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Mónica Graciela', 'FUENTES', 'docente7@asd.com', '1', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Carlos Humberto', 'SALGADO', 'docente8@asd.com', '2', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Norma Beatriz', 'PEREZ', 'docente9@asd.com', '2', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Germán Antonio', 'MONTEJANO', 'docente10@asd.com', '1', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('María Verónica', 'ROSAS', 'docente11@asd.com', '2', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Susana Cecilia', 'ESQUIVEL', 'docente13@asd.com', '1', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Roberto Ariel', 'GUERRERO', 'docente14@asd.com', '1', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Daniel Edgardo', 'RIESCO', 'docente15@asd.com', '3', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('María Teresa', 'TARANILLA', 'docente16@asd.com', '3', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Alejandro Leonardo', 'GROSSO', 'docente17@asd.com', '1', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Nora Susana', 'REYES', 'docente18@asd.om', '2', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Alejandro', 'SÁNCHEZ', 'docente19@asd.com', '1', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Ana Gabriela', 'GARIS', 'docente20@asd.com', '4', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Mario Gabriel', 'PERALTA', 'docente21@asd.com', '3', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Patricia Beatriz', 'ROGGERO', 'docente22@asd.com', '5', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Javier Mariano', 'APOLONI', 'docente24@asd.com', '3', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Edilma Olinda', 'GAGLIARDI', 'docente25@asd.com', '2', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Pablo Cristian', 'TISSERA', 'docente26@asd.com', '4', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Marcelo Luis', 'ERRECALDE', 'docente27@asd.com', '4', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Norma Edith', 'HERRERA', 'docente28@asd.com', '4', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Edgardo', 'FERRETI', 'docente29@asd.com', '4', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Marcela Cristina', 'CHIARANI', 'docente30@asd.com', '3', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Guillermo Carlos', 'AGUIRRE', 'docente31@asd.com', '1', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Mercedes María', 'TAPIA', 'docnete32@asd.com', '3', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Irma Guadalupe', 'PIANUCCI', 'docente33@asd.com', '3', 'Departamento de Informática');
INSERT INTO alumno_docente VALUES ('Mercedes Deolinda', 'BARRIONUEVO', 'docente34@asd.com', '4', 'Departamento de Informática');


--
-- Data for Name: alumno_directordepartamento; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: alumno_empresa; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_empresa VALUES (1, 'Mercadolibre es una e-commerce', 'https://jobs.mercadolibre.com/?locale=es_ES', 'logos/logo-mercado-libre-ml.jpg', 'Mercadolibre S.R.L.', 'Departamento de Informática', 5);
INSERT INTO alumno_empresa VALUES (2, 'Descripción de la Empresa', 'https://www.raona.com/', 'logos/logo-raona-srl-Raona.jpg', 'Raona', 'Departamento de Informática', 35);
INSERT INTO alumno_empresa VALUES (3, 'Descripcion de la empresa', 'http://www.beclever.com.ar/', 'logos/logo-be-clever-BeCleaver.jpg', 'Be Clever', 'Departamento de Informática', 36);
INSERT INTO alumno_empresa VALUES (4, 'descripcion de la empresa', 'http://gpf-soluciones.com.ar/', 'logos/logo-gpf-soluciones-GPFSoluciones.jpg', 'GPF Soluciones', 'Departamento de Informática', 37);
INSERT INTO alumno_empresa VALUES (5, 'descripcion de la empresa', 'http://www.runaid.com.ar/index_es.html', 'logos/logo-runa-id-RunaID.jpg', 'Runa ID', 'Departamento de Informática', 38);
INSERT INTO alumno_empresa VALUES (6, 'descripcion de la empresa', 'https://cat-technologies.com/', 'logos/logo-cat-technologies-Cat.jpg', 'Cat Technologies', 'Departamento de Informática', 39);
INSERT INTO alumno_empresa VALUES (7, 'descripcion de la empresa', 'http://coradir.com.ar/', 'logos/logo-coradir-sa-Coradir.jpg', 'Coradir S.A.', 'Departamento de Informática', 40);
INSERT INTO alumno_empresa VALUES (8, 'descripcion de la empresa', 'https://www.unitech-corp.com/', 'logos/logo-unitech-sa-Unitech.jpg', 'Unitech', 'Departamento de Informática', 41);
INSERT INTO alumno_empresa VALUES (9, 'descripcion de la empresa', 'http://www.alasit.com/', 'logos/logo-alas-it-AlasIT.jpg', 'Alas IT', 'Departamento de Informática', 42);
INSERT INTO alumno_empresa VALUES (10, 'descripcion de la empresa', 'https://latam.ctinsuretech.com/es/', '', 'Inworx', 'Departamento de Informática', 43);
INSERT INTO alumno_empresa VALUES (11, 'descripcion de la empresa', 'http://www.aridosoftware.com/', 'logos/logo-arido-software-Arido.jpg', 'Árido Software', 'Departamento de Informática', 44);
INSERT INTO alumno_empresa VALUES (12, 'descripcion de la empresa', 'http://www.gruposlots.com.ar', '', 'Grupo Slots', 'Departamento de Informática', 45);
INSERT INTO alumno_empresa VALUES (13, 'descripcion de la empresa', 'http://www.edesalenergia.com.ar/', '', 'Edesal S.A.', 'Departamento de Informática', 46);
INSERT INTO alumno_empresa VALUES (14, 'descripcion de la empresa', 'http://transpuntanosl.com.ar/', '', 'Transpuntano', 'Departamento de Informática', 47);


--
-- Data for Name: alumno_entrevista; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: alumno_tutorempresa; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: alumno_pasantia; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: alumno_puesto; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_puesto VALUES (1, 'BE', 'programará todo el día', 'sql
java
go', 'lunes a viernes de 8 a 17hs', 1, 1, 1);


--
-- Data for Name: alumno_postulacion; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: alumno_subcomisioncarrera; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_subcomisioncarrera VALUES (1, 'Tecnicatura Universitaria en Redes de Computadoras', 3);


--
-- Data for Name: alumno_subcomisioncarrera_docentes; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_subcomisioncarrera_docentes VALUES (1, 1, 'docente1@asd.com');
INSERT INTO alumno_subcomisioncarrera_docentes VALUES (3, 1, 'docente2@asd.com');


--
-- Data for Name: alumno_subcomisionpasantiaspps; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_subcomisionpasantiaspps VALUES (1, 'Departamento de Informática', 4);


--
-- Data for Name: alumno_subcomisionpasantiaspps_docentes; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO alumno_subcomisionpasantiaspps_docentes VALUES (1, 1, 'docente1@asd.com');


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: alumno_user_groups; Type: TABLE DATA; Schema:  Owner: postgres
--

--
-- Data for Name: alumno_user_user_permissions; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema:  Owner: postgres
--

INSERT INTO django_admin_log VALUES (1, '2019-08-04 18:06:49.551307-03', 'Departamento de Informática', 'Departamento de Informática', 1, '[{"added": {}}]', 4, 1);
INSERT INTO django_admin_log VALUES (2, '2019-08-04 18:06:59.388294-03', 'juanzini@gmail.com', 'Juan Antonio Zini', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (3, '2019-08-04 18:07:14.877377-03', 'juanzini@gmail.com', 'Juan Antonio Zini', 3, '', 5, 1);
INSERT INTO django_admin_log VALUES (4, '2019-08-04 18:22:41.570978-03', 'Ingeniería en Informática', 'Ingeniería en Informática', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log VALUES (5, '2019-08-04 18:26:17.62566-03', '2', 'gaston-zini', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (6, '2019-08-04 18:27:41.164799-03', '1', 'gaston-zini', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (7, '2019-08-04 18:37:28.791632-03', 'Tecnicatura Universitaria en Redes de Computadoras', 'Tecnicatura Universitaria en Redes de Computadoras', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log VALUES (8, '2019-08-04 18:39:22.405283-03', 'docente1@asd.com', 'Rubén Gerardo APOLLONI', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (9, '2019-08-04 18:41:08.553224-03', '3', 'sub-tec-red-com', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (10, '2019-08-04 18:41:53.544345-03', 'docente2@asd.com', 'Berta Elena GARCÍA', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (11, '2019-08-04 18:41:56.711938-03', '1', 'SubcomisionCarrera Tecnicatura Universitaria en Redes de Computadoras', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (12, '2019-08-04 18:42:30.508879-03', '1', 'SubcomisionCarrera Tecnicatura Universitaria en Redes de Computadoras', 2, '[{"changed": {"fields": ["docentes"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (13, '2019-08-04 18:42:42.650611-03', '1', 'SubcomisionCarrera Tecnicatura Universitaria en Redes de Computadoras', 2, '[{"changed": {"fields": ["docentes"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (14, '2019-08-04 18:44:31.569446-03', '4', 'com-pas', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (15, '2019-08-04 18:44:36.849684-03', '1', 'SubcomisionPasantias Departamento de Informática', 1, '[{"added": {}}]', 9, 1);
INSERT INTO django_admin_log VALUES (16, '2019-08-04 18:47:59.415064-03', '5', 'mercado-libre', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (17, '2019-08-04 18:52:00.091186-03', '1', 'mercado-libre', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (18, '2019-08-04 18:54:37.277634-03', '1', 'mercado-libre BE', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (19, '2019-08-10 21:41:58.812529-03', 'Tecnicatura Universitaria en Web', 'Tecnicatura Universitaria en Web', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log VALUES (20, '2019-08-10 21:42:26.836979-03', 'Ingeniería en Computación', 'Ingeniería en Computación', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log VALUES (21, '2019-08-10 21:42:37.094397-03', 'Licenciatura en Ciencias de la Computación', 'Licenciatura en Ciencias de la Computación', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log VALUES (22, '2019-08-10 21:42:46.671514-03', 'Profesorado en Ciencias de la Computación', 'Profesorado en Ciencias de la Computación', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log VALUES (23, '2019-08-10 22:47:35.225992-03', '6', 'pablo-martin-abaca', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (24, '2019-08-11 18:44:56.832078-03', '7', 'gabriel-hernan-aballay', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (25, '2019-08-11 18:45:03.623011-03', '2', 'gabriel-hernan-aballay', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (26, '2019-08-11 18:54:47.248164-03', '8', 'nicolas-abatedaga-biole', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (27, '2019-08-11 18:54:57.63155-03', '3', 'nicolas-abatedaga-biole', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (28, '2019-08-11 18:56:49.62945-03', '9', 'tomas-abatedaga-biole', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (29, '2019-08-11 18:57:56.77991-03', '4', 'tomas-abatedaga-biole', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (30, '2019-08-11 19:00:49.337695-03', '10', 'maria-aylen-abraham', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (31, '2019-08-11 19:01:41.447264-03', '5', 'maria-aylen-abraham', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (32, '2019-08-11 19:06:14.225512-03', '11', 'ezequiel-alessandro-acevedo', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (33, '2019-08-11 19:06:27.121865-03', '6', 'ezequiel-alessandro-acevedo', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (34, '2019-08-11 19:08:56.412756-03', '12', 'fernando-adaro', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (35, '2019-08-11 19:09:06.127943-03', '7', 'fernando-adaro', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (36, '2019-08-11 19:12:02.431111-03', '13', 'gisella-daiana-alaniz', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (37, '2019-08-11 19:12:10.039439-03', '8', 'gisella-daiana-alaniz', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (38, '2019-08-11 19:18:47.766174-03', '14', 'valentina-baglioni', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (39, '2019-08-11 19:18:54.6584-03', '9', 'valentina-baglioni', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (40, '2019-08-11 19:22:46.04319-03', '15', 'johanna-celeste-bello', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (41, '2019-08-11 19:22:52.319852-03', '10', 'johanna-celeste-bello', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (42, '2019-08-11 19:25:00.444088-03', '16', 'tobias-facundo-burger', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (43, '2019-08-11 19:25:07.003094-03', '11', 'tobias-facundo-burger', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (44, '2019-08-11 19:27:02.527545-03', '17', 'gianfranco-capodici', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (45, '2019-08-11 19:27:09.006089-03', '12', 'gianfranco-capodici', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (46, '2019-08-11 19:32:40.490419-03', '18', 'ema-noemi-ciavarelli', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (47, '2019-08-11 19:32:47.797311-03', '13', 'ema-noemi-ciavarelli', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (48, '2019-08-11 19:37:50.819034-03', '19', 'ezequiel-oscar-gaggioli', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (49, '2019-08-11 19:37:57.015004-03', '14', 'ezequiel-oscar-gaggioli', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (50, '2019-08-11 19:41:22.382316-03', '20', 'atilio-raul-guzman', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (51, '2019-08-11 19:42:31.417412-03', '15', 'atilio-raul-guzman', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (52, '2019-08-11 19:45:15.16712-03', '21', 'facundo-agustin-homola', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (53, '2019-08-11 19:45:19.937671-03', '16', 'facundo-agustin-homola', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (54, '2019-08-11 19:50:01.700914-03', '22', 'daniel-eliezer-kwist', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (55, '2019-08-11 19:50:40.97509-03', '17', 'daniel-eliezer-kwist', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (56, '2019-08-11 19:58:24.044265-03', '23', 'alexey-kutalo', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (57, '2019-08-11 19:58:33.570237-03', '18', 'alexey-kutalo', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (58, '2019-08-11 19:59:59.514191-03', '24', 'gianni-roman-lupi-casale', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (59, '2019-08-11 20:00:05.114465-03', '19', 'gianni-roman-lupi-casale', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (60, '2019-08-11 20:02:08.995759-03', '25', 'tomas-bautista-maldocena', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (61, '2019-08-11 20:02:13.848463-03', '20', 'tomas-bautista-maldocena', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (62, '2019-08-11 20:04:28.557971-03', '26', 'pedro-arturo-mas-bustos', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (63, '2019-08-11 20:04:40.941143-03', '21', 'pedro-arturo-mas-bustos', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (64, '2019-08-11 20:07:55.614411-03', '27', 'leonela-sofia-oyarzun', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (65, '2019-08-11 20:08:08.897969-03', '22', 'leonela-sofia-oyarzun', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (66, '2019-08-11 20:21:53.960687-03', '28', 'juan-alejandro-palma', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (67, '2019-08-11 20:22:00.043388-03', '23', 'juan-alejandro-palma', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (68, '2019-08-11 20:31:27.131803-03', '29', 'florencia-azul-parnisari', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (69, '2019-08-11 20:31:46.296795-03', '24', 'florencia-azul-parnisari', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (70, '2019-08-11 20:39:09.485827-03', '30', 'federico-gabriel-reylova', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (71, '2019-08-11 20:39:16.760204-03', '25', 'federico-gabriel-reylova', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (72, '2019-08-11 20:40:58.697258-03', '31', 'elias-martin-schiel', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (73, '2019-08-11 20:41:04.033431-03', '26', 'elias-martin-schiel', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (74, '2019-08-11 20:51:14.19602-03', '32', 'maria-silvia-sofia-saieg', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (75, '2019-08-11 20:51:18.532884-03', '27', 'maria-silvia-sofia-saieg', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (76, '2019-08-11 20:54:45.89457-03', '33', 'carlos-dante-scala-necco', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (77, '2019-08-11 20:54:51.084104-03', '28', 'carlos-dante-scala-necco', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (78, '2019-08-11 20:55:55.585323-03', '34', 'leandro-troncoso', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (79, '2019-08-11 20:56:03.482633-03', '29', 'leandro-troncoso', 1, '[{"added": {}}]', 2, 1);
INSERT INTO django_admin_log VALUES (80, '2019-08-13 19:30:35.930797-03', '35', 'raona-srl', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (81, '2019-08-13 19:30:42.970759-03', '2', 'raona-srl', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (82, '2019-08-13 19:31:36.299802-03', '36', 'be-clever', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (83, '2019-08-13 19:31:42.816644-03', '3', 'be-clever', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (84, '2019-08-13 19:32:38.651769-03', '37', 'gpf-soluciones', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (85, '2019-08-13 19:32:42.336382-03', '4', 'gpf-soluciones', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (86, '2019-08-13 19:33:31.994095-03', '38', 'runa-id', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (87, '2019-08-13 19:33:35.341316-03', '5', 'runa-id', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (88, '2019-08-13 19:34:32.457323-03', '39', 'cat-technologies', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (89, '2019-08-13 19:34:37.772558-03', '6', 'cat-technologies', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (90, '2019-08-13 19:35:34.104709-03', '40', 'coradir-sa', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (91, '2019-08-13 19:35:38.383015-03', '7', 'coradir-sa', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (92, '2019-08-13 19:37:08.242631-03', '41', 'unitech-sa', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (93, '2019-08-13 19:37:12.965286-03', '8', 'unitech-sa', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (94, '2019-08-13 19:38:04.877612-03', '42', 'alas-it', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (95, '2019-08-13 19:38:08.424894-03', '9', 'alas-it', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (96, '2019-08-13 19:40:15.312385-03', '43', 'inworx-sa', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (97, '2019-08-13 19:40:20.106556-03', '10', 'inworx-sa', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (98, '2019-08-13 19:41:28.440655-03', '44', 'arido-software', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (99, '2019-08-13 19:41:33.704193-03', '11', 'arido-software', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (100, '2019-08-13 19:42:54.683309-03', '45', 'grupo-slots', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (101, '2019-08-13 19:42:59.433623-03', '12', 'grupo-slots', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (102, '2019-08-13 19:43:42.426125-03', '46', 'edesal-sa', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (103, '2019-08-13 19:43:46.170691-03', '13', 'edesal-sa', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (104, '2019-08-13 19:45:06.104188-03', '47', 'transpuntano-sa', 1, '[{"added": {}}]', 1, 1);
INSERT INTO django_admin_log VALUES (105, '2019-08-13 19:45:10.042596-03', '14', 'transpuntano-sa', 1, '[{"added": {}}]', 6, 1);
INSERT INTO django_admin_log VALUES (106, '2019-08-18 17:57:33.172799-03', 'docente2@asd.com', 'Berta Elena GARCÍA', 2, '[]', 5, 1);
INSERT INTO django_admin_log VALUES (107, '2019-08-18 17:57:56.772526-03', 'docente3@asd.com', 'Jesús Francisco AGUIRRE', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (108, '2019-08-18 17:58:13.751403-03', 'docente4@asd.com', 'Natalia Carolina MIRANDA', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (109, '2019-08-18 17:58:35.045421-03', 'docente5@asd.com', 'María Fabiana PICCOLI', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (110, '2019-08-18 17:59:02.208089-03', 'docente6@asd.com', 'Jaqueline Myriam FERNÁNDEZ', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (111, '2019-08-18 18:28:28.482491-03', 'docente7@asd.com', 'Mónica Graciela FUENTES', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (112, '2019-08-18 18:28:58.921947-03', 'docente8@asd.com', 'Carlos Humberto SALGADO', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (113, '2019-08-18 18:29:22.588923-03', 'docente9@asd.com', 'Norma Beatriz PEREZ', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (114, '2019-08-18 18:29:43.279886-03', 'docente10@asd.com', 'Germán Antonio MONTEJANO', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (115, '2019-08-18 18:30:02.79617-03', 'docente11@asd.com', 'María Verónica ROSAS', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (116, '2019-08-18 18:30:29.806342-03', 'docente13@asd.com', 'Susana Cecilia ESQUIVEL', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (117, '2019-08-18 18:30:52.827356-03', 'docente14@asd.com', 'Roberto Ariel GUERRERO', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (118, '2019-08-18 18:31:13.934353-03', 'docente15@asd.com', 'Daniel Edgardo RIESCO', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (119, '2019-08-18 18:31:35.752387-03', 'docente16@asd.com', 'María Teresa TARANILLA', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (120, '2019-08-18 18:32:03.462792-03', 'docente17@asd.com', 'Alejandro Leonardo GROSSO', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (121, '2019-08-18 18:32:18.850558-03', 'docente18@asd.om', 'Nora Susana REYES', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (122, '2019-08-18 18:32:40.300631-03', 'docente19@asd.com', 'Alejandro SÁNCHEZ', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (123, '2019-08-18 18:33:08.215582-03', 'docente20@asd.com', 'Ana Gabriela GARIS', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (124, '2019-08-18 18:33:26.312197-03', 'docente21@asd.com', 'Mario Gabriel PERALTA', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (125, '2019-08-18 18:33:46.531568-03', 'docente22@asd.com', 'Patricia Beatriz ROGGERO', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (126, '2019-08-18 18:34:05.273021-03', 'docente24@asd.com', 'Javier Mariano APOLONI', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (127, '2019-08-18 18:34:32.973463-03', 'docente25@asd.com', 'Edilma Olinda GAGLIARDI', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (128, '2019-08-18 18:34:53.123351-03', 'docente26@asd.com', 'Pablo Cristian TISSERA', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (129, '2019-08-18 18:35:10.200574-03', 'docente27@asd.com', 'Marcelo Luis ERRECALDE', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (130, '2019-08-18 18:35:52.523864-03', 'docente28@asd.com', 'Norma Edith HERRERA', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (131, '2019-08-18 18:36:09.66004-03', 'docente29@asd.com', 'Edgardo FERRETI', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (132, '2019-08-18 18:36:52.806838-03', 'docente30@asd.com', 'Marcela Cristina CHIARANI', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (133, '2019-08-18 18:37:07.317418-03', 'docente31@asd.com', 'Guillermo Carlos AGUIRRE', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (134, '2019-08-18 18:37:26.960163-03', 'docnete32@asd.com', 'Mercedes María TAPIA', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (135, '2019-08-18 18:37:45.682565-03', 'docente33@asd.com', 'Irma Guadalupe PIANUCCI', 1, '[{"added": {}}]', 5, 1);
INSERT INTO django_admin_log VALUES (136, '2019-08-18 18:38:19.874138-03', 'docente34@asd.com', 'Mercedes Deolinda BARRIONUEVO', 1, '[{"added": {}}]', 5, 1);


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema:  Owner: postgres
--



--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema:  Owner: postgres
--