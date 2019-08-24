BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "alumno_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL UNIQUE,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"tipo"	varchar(2) NOT NULL
);
CREATE TABLE IF NOT EXISTS "alumno_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "alumno_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "alumno_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_departamento" (
	"nombre"	varchar(50) NOT NULL,
	PRIMARY KEY("nombre")
);
CREATE TABLE IF NOT EXISTS "alumno_docente" (
	"nombre"	varchar(30) NOT NULL,
	"apellido"	varchar(20) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"box_oficina"	varchar(30) NOT NULL,
	"departamento_id"	varchar(50),
	PRIMARY KEY("email"),
	FOREIGN KEY("departamento_id") REFERENCES "alumno_departamento"("nombre") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_empresa" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"descripcion"	text,
	"url"	varchar(200),
	"logo"	varchar(100),
	"nombre_fantasia"	varchar(200) NOT NULL,
	"departamento_id"	varchar(50) NOT NULL,
	"user_id"	integer NOT NULL UNIQUE,
	FOREIGN KEY("departamento_id") REFERENCES "alumno_departamento"("nombre") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "alumno_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_entrevista" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"fecha"	datetime NOT NULL,
	"lugar"	varchar(200) NOT NULL,
	"resultado"	text,
	"pasantia_aceptada"	bool,
	"comentarios_empresa"	text,
	"comentarios_comision_pps"	text,
	"status"	varchar(3) NOT NULL,
	"alumno_id"	integer NOT NULL,
	"empresa_id"	integer NOT NULL,
	FOREIGN KEY("alumno_id") REFERENCES "alumno_alumno"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("empresa_id") REFERENCES "alumno_empresa"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_tutorempresa" (
	"nombre"	varchar(30) NOT NULL,
	"apellido"	varchar(20) NOT NULL,
	"cargo"	varchar(30) NOT NULL,
	"mail"	varchar(254) NOT NULL,
	"empresa_id"	integer NOT NULL,
	PRIMARY KEY("mail"),
	FOREIGN KEY("empresa_id") REFERENCES "alumno_empresa"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_subcomisionpasantiaspps" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"departamento_id"	varchar(50) NOT NULL UNIQUE,
	"user_id"	integer NOT NULL UNIQUE,
	FOREIGN KEY("departamento_id") REFERENCES "alumno_departamento"("nombre") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "alumno_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_subcomisionpasantiaspps_docentes" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"subcomisionpasantiaspps_id"	integer NOT NULL,
	"docente_id"	varchar(254) NOT NULL,
	FOREIGN KEY("subcomisionpasantiaspps_id") REFERENCES "alumno_subcomisionpasantiaspps"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("docente_id") REFERENCES "alumno_docente"("email") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_subcomisioncarrera" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"carrera_id"	varchar(100) NOT NULL UNIQUE,
	"user_id"	integer NOT NULL UNIQUE,
	FOREIGN KEY("carrera_id") REFERENCES "alumno_carrera"("nombre") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "alumno_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_subcomisioncarrera_docentes" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"subcomisioncarrera_id"	integer NOT NULL,
	"docente_id"	varchar(254) NOT NULL,
	FOREIGN KEY("subcomisioncarrera_id") REFERENCES "alumno_subcomisioncarrera"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("docente_id") REFERENCES "alumno_docente"("email") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_puesto" (
	"puesto_id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"nombre"	varchar(3) NOT NULL,
	"descripcion_actividades"	text NOT NULL,
	"conocimientos_requeridos"	text NOT NULL,
	"horario"	varchar(100) NOT NULL,
	"rentado"	bool NOT NULL,
	"activo"	bool NOT NULL,
	"empresa_id"	integer NOT NULL,
	FOREIGN KEY("empresa_id") REFERENCES "alumno_empresa"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_pasantia" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"fecha_inicio"	date NOT NULL,
	"fecha_fin"	date NOT NULL,
	"informe"	varchar(100),
	"numero_legajo"	integer unsigned CHECK("numero_legajo">=0) UNIQUE,
	"comentarios_empresa"	text,
	"comentarios_comision_pps"	text,
	"numero_de_expediente"	integer unsigned CHECK("numero_de_expediente">=0) UNIQUE,
	"entrevista_id"	integer NOT NULL,
	"tutor_docente_id"	varchar(254),
	"tutor_empresa_id"	varchar(254),
	FOREIGN KEY("entrevista_id") REFERENCES "alumno_entrevista"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("tutor_docente_id") REFERENCES "alumno_docente"("email") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("tutor_empresa_id") REFERENCES "alumno_tutorempresa"("mail") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_carrera" (
	"nombre"	varchar(100) NOT NULL,
	"departamento_id"	varchar(50) NOT NULL,
	"subcomision_carrera_id"	integer UNIQUE,
	FOREIGN KEY("departamento_id") REFERENCES "alumno_departamento"("nombre") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("subcomision_carrera_id") REFERENCES "alumno_subcomisioncarrera"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("nombre")
);
CREATE TABLE IF NOT EXISTS "alumno_alumno" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"numero_registro"	integer unsigned NOT NULL CHECK("numero_registro">=0) UNIQUE,
	"curriculum"	varchar(100) NOT NULL,
	"plan_de_estudio"	varchar(100) NOT NULL,
	"historia_academica"	varchar(100) NOT NULL,
	"descripcion_intereses"	text,
	"descripcion_habilidades"	text,
	"ultima_actualizacion_perfil"	date NOT NULL,
	"ultima_postulacion"	date,
	"condicion_acreditacion"	bool,
	"expedicion_acreditacion"	text,
	"comentarios_comision_carrera"	text,
	"comentarios_carrera_visibles"	bool NOT NULL,
	"comentarios_comision_pps"	text,
	"perfil"	varchar(100),
	"progreso"	smallint NOT NULL,
	"carrera_id"	varchar(100) NOT NULL,
	"user_id"	integer NOT NULL UNIQUE,
	FOREIGN KEY("carrera_id") REFERENCES "alumno_carrera"("nombre") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "alumno_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_postulacion" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"fecha"	date NOT NULL,
	"fecha_desestimacion"	date,
	"activa"	bool NOT NULL,
	"alumno_id"	integer NOT NULL,
	"entrevista_id"	integer UNIQUE,
	"puesto_id"	integer NOT NULL,
	FOREIGN KEY("alumno_id") REFERENCES "alumno_alumno"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("entrevista_id") REFERENCES "alumno_entrevista"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("puesto_id") REFERENCES "alumno_puesto"("puesto_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "alumno_directordepartamento" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"departamento_id"	varchar(50) NOT NULL UNIQUE,
	"docente_id"	varchar(254) NOT NULL UNIQUE,
	FOREIGN KEY("departamento_id") REFERENCES "alumno_departamento"("nombre") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("docente_id") REFERENCES "alumno_docente"("email") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "alumno_user" VALUES (1,'pbkdf2_sha256$150000$HA1Sudv6FWhC$tNQVnLre8O/Tyn01hPJvdvWmlGiwQpTfBUaO3aLX7RU=','2019-08-23 21:21:36.532170',1,'admin','','','admin@admin.com',1,1,'2019-08-04 18:06:15.266537-03','AL');
INSERT INTO "alumno_user" VALUES (2,'pbkdf2_sha256$150000$JZdgq6EU97bM$9XYErbNLCEEsK+Th/sTvIwmchy75+ToivymCON4tRJM=','2019-08-04 18:30:41.039283-03',0,'gaston-zini','Gaston','Zini','gustotongas@hotmail.com',0,1,'2019-08-04 18:26:17.469323-03','AL');
INSERT INTO "alumno_user" VALUES (3,'pbkdf2_sha256$150000$TItmkh76fRfC$ZsSv+p02KvcPnZ37x7+x+5KiWgewk2XcAGIpnGW9mFk=',NULL,0,'sub-tec-red-com','SubComision de Tecnicatura','Redes de Computadoras','sub1@asd.com',0,1,'2019-08-04 18:41:08.393093-03','CC');
INSERT INTO "alumno_user" VALUES (4,'pbkdf2_sha256$150000$DVYUbWQPXO7v$zPVshYqDUd9jCymLvAQONCmYTDzlCYO3jeEwWhHeN6g=','2019-08-23 19:34:01.088169',0,'com-pas','Comisión de Pasantías del','1','com@asd.com',0,1,'2019-08-04 21:44:31.409063','CP');
INSERT INTO "alumno_user" VALUES (5,'pbkdf2_sha256$150000$RQthrJ8fA0hZ$16RqJXpLvrdP0RbiMB8kbAP5kSKz1SsSEI67EGQak1Y=',NULL,0,'mercado-libre','Mercadolibre','S.R.L','empresa14@asd.com',0,1,'2019-08-04 18:47:59.262606-03','EM');
INSERT INTO "alumno_user" VALUES (6,'pbkdf2_sha256$150000$oeWm3FiiXnec$tM6NIRjwm0P2JTYQEm8X/PNTehoAvONICXafa1cfQ3w=',NULL,0,'pablo-martin-abaca','Pablo Martin','Abaca','pablomartinabaca@asd.com',0,1,'2019-08-10 22:47:35.073564-03','AL');
INSERT INTO "alumno_user" VALUES (7,'pbkdf2_sha256$150000$0a5WWWe4PUrR$rPbdoY2097Sj5X5anKnvmV8A9GXlFYFCp167lthI7Eo=',NULL,0,'gabriel-hernan-aballay','Gabriel Hernan','Aballay','gabriel-hernan-aballay@asd.com',0,1,'2019-08-11 18:44:56.620628-03','AL');
INSERT INTO "alumno_user" VALUES (8,'pbkdf2_sha256$150000$pTh4DxbRbpYx$c9PZOgUm3M+YCQYbw5BiZZea2KabwLa3wOx+HrcdJ3g=',NULL,0,'nicolas-abatedaga-biole','Nicolas','Abatedaga Biole','nicolas-abatedaga-biole@asd.com',0,1,'2019-08-11 18:54:47.053658-03','AL');
INSERT INTO "alumno_user" VALUES (9,'pbkdf2_sha256$150000$iur59Suy7JJn$UUYObMK1epKJz5ns8+XPhmK6QKIx8H6wCprSKOXJHBw=',NULL,0,'tomas-abatedaga-biole','Tomas','Abatedaga Biole','tomas-abatedaga-biole@asd.com',0,1,'2019-08-11 18:56:49.437323-03','AL');
INSERT INTO "alumno_user" VALUES (10,'pbkdf2_sha256$150000$anBzNPfrm9Z2$yIeO7HccQF0pot1KozxgG+n7cJO9dy/GGO4NL9Z1pkw=',NULL,0,'maria-aylen-abraham','Maria Aylen','Abraham','maria-aylen-abraham@asd.com',0,1,'2019-08-11 19:00:49.136095-03','AL');
INSERT INTO "alumno_user" VALUES (11,'pbkdf2_sha256$150000$qJKbwCel6784$V5SJN/iOLwT7YpjHcx+qe1PMlocmg0FTWCntdD7D3qw=',NULL,0,'ezequiel-alessandro-acevedo','Ezequiel Alessandro','Acevedo','ezequiel-alessandro-acevedo@asd.com',0,1,'2019-08-11 19:06:14.026965-03','AL');
INSERT INTO "alumno_user" VALUES (12,'pbkdf2_sha256$150000$n9fmFW2Gbhax$Zudj5ZJRliA0pjB+8suP+ZASVneQDFFBJlNLZbfGXWw=',NULL,0,'fernando-adaro','Fernando','Adaro','fernando-adaro@asd.com',0,1,'2019-08-11 19:08:56.206969-03','AL');
INSERT INTO "alumno_user" VALUES (13,'pbkdf2_sha256$150000$pzKoXpyYFttR$pCf4kiIlGpUg5PmUDiNmyuCuDiJy1OjksPv+CNrN8co=',NULL,0,'gisella-daiana-alaniz','Gisella Daiana','Alaniz','gisella-daiana-alaniz@asd.com',0,1,'2019-08-11 19:12:02.237067-03','AL');
INSERT INTO "alumno_user" VALUES (14,'pbkdf2_sha256$150000$xcWTzHlxP9Hw$1alfXmBajqFLTQFm2RZSO5b4xuDY7lBT0tccFV0ahWc=',NULL,0,'valentina-baglioni','Valentina','Baglioni','valentina-baglioni@asd.com',0,1,'2019-08-11 19:18:47.563811-03','AL');
INSERT INTO "alumno_user" VALUES (15,'pbkdf2_sha256$150000$4XDpB1KWguz4$MRhhMiPpeOirBA+wIPTs9wPjv/zZESaY6NSS48vmXj8=',NULL,0,'johanna-celeste-bello','Johanna Celeste','Bello','johanna-celeste-bello@asd.com',0,1,'2019-08-11 19:22:45.73023-03','AL');
INSERT INTO "alumno_user" VALUES (16,'pbkdf2_sha256$150000$xFP2eTFiRmmM$j4hvgSGH+VFo6O7+EddK/x1VVkSa/0ffL3d1crlThsU=',NULL,0,'tobias-facundo-burger','Tobias Facundo','Burger','tobias-facundo-burger@asd.com',0,1,'2019-08-11 19:25:00.278586-03','AL');
INSERT INTO "alumno_user" VALUES (17,'pbkdf2_sha256$150000$S3L7DvIQvU2P$eRnbi74LCace6VneGHlpONOlLLplKRUpQL5+Ui41PE4=',NULL,0,'gianfranco-capodici','Gianfranco','Capodici','gianfranco-capodici@asd.com',0,1,'2019-08-11 19:27:02.37535-03','AL');
INSERT INTO "alumno_user" VALUES (18,'pbkdf2_sha256$150000$uQhe3NUJZyes$qPl+Cc5Id7SNaNqtZBnEMqqYIUsKa9UKZQggfvSTX0s=',NULL,0,'ema-noemi-ciavarelli','Ema Noemi','Ciavarelli','ema-noemi-ciavarelli@asd.com',0,1,'2019-08-11 19:32:40.301188-03','AL');
INSERT INTO "alumno_user" VALUES (19,'pbkdf2_sha256$150000$RfsWoSVeH7wM$sT5TIDop0XtIh80JxBOmPsfMFqDkyGXXmzOzastrXUk=',NULL,0,'ezequiel-oscar-gaggioli','Ezequiel Oscar','Gaggioli','ezequiel-oscar-gaggioli@asd.com',0,1,'2019-08-11 19:37:50.670719-03','AL');
INSERT INTO "alumno_user" VALUES (20,'pbkdf2_sha256$150000$IZlkyRVV1uG0$/ypyAFqx7MmiL7CTjeaJApY8idb6GjSs0sjOwRJrT3I=',NULL,0,'atilio-raul-guzman','Atilio Raul','Guzman','atilio-raul-guzman@asd.com',0,1,'2019-08-11 19:41:22.180367-03','AL');
INSERT INTO "alumno_user" VALUES (21,'pbkdf2_sha256$150000$oggIhcsTkvRd$4VqNKHrV5Amjl/nOc5TAlGBl3EqOpNRUbyS44CCf3zk=',NULL,0,'facundo-agustin-homola','Facundo Agustin','Hómola','facundo-agustin-homola@asd.com',0,1,'2019-08-11 19:45:15.019132-03','AL');
INSERT INTO "alumno_user" VALUES (22,'pbkdf2_sha256$150000$TqEgcFax4eQx$6T2J3QBA6ViGna1HLlvUxAxWQO5mJjNhBYkUQcAeUOo=',NULL,0,'daniel-eliezer-kwist','Daniel Eliezer','Kwist','daniel-eliezer-kwist@asd.com',0,1,'2019-08-11 19:50:01.547698-03','AL');
INSERT INTO "alumno_user" VALUES (23,'pbkdf2_sha256$150000$dg5jEvoUw0vm$Ds1e3LxBQZpFVK5aaYbN+dvHKNt22DXqpLPWgEi90GM=',NULL,0,'alexey-kutalo','Alexey','Kutalo','alexey-kutalo@asd.com',0,1,'2019-08-11 19:58:23.890976-03','AL');
INSERT INTO "alumno_user" VALUES (24,'pbkdf2_sha256$150000$QWrbQ6VIIwJN$VAb1EJyyufTvFL8Lg+2ICjSPSO6Czt6tNyQYOZqzWDY=',NULL,0,'gianni-roman-lupi-casale','Gianni Roman','Lupi Casale','gianni-roman-lupi-casale@asd.com',0,1,'2019-08-11 19:59:59.35536-03','AL');
INSERT INTO "alumno_user" VALUES (25,'pbkdf2_sha256$150000$S4AjCqs4p7IO$8r1Q6bhMjviZnFkgYCni05gwxTpzbLZ/gh/IqhklQeQ=',NULL,0,'tomas-bautista-maldocena','Tomas Bautista','Maldocena','tomas-bautista-maldocena@asd.com',0,1,'2019-08-11 20:02:08.814254-03','AL');
INSERT INTO "alumno_user" VALUES (26,'pbkdf2_sha256$150000$MzQ8TgNHqc5V$x+ZbS+pGZn+1UmVLGcTy2zNLlIEkiRPedi9D/nzRfBY=',NULL,0,'pedro-arturo-mas-bustos','Pedro Arturo','Mas Bustos','pedro-arturo-mas-bustos@asd.com',0,1,'2019-08-11 20:04:28.394759-03','AL');
INSERT INTO "alumno_user" VALUES (27,'pbkdf2_sha256$150000$RwpcS9djzZ6Z$lEKFHhUCksnCMazNvUS8ihboQNKNcL9RWJbm3qnqprg=',NULL,0,'leonela-sofia-oyarzun','Leonela Sofia','Oyarzún','leonela-sofia-oyarzun@asd.com',0,1,'2019-08-11 20:07:55.447281-03','AL');
INSERT INTO "alumno_user" VALUES (28,'pbkdf2_sha256$150000$PkgEmDtZAfPA$q1bDZOi/ZS28mooQccfdI++1kWQAfVyQV7j0hBocfv4=',NULL,0,'juan-alejandro-palma','Juan Alejandro','Palma','juan-alejandro-palma@asd.com',0,1,'2019-08-11 20:21:53.770932-03','AL');
INSERT INTO "alumno_user" VALUES (29,'pbkdf2_sha256$150000$idQQlYYm1u8V$y79UyX92bUCunvtDL+bRRQA57CWGM2FCJAtS0A00rGs=',NULL,0,'florencia-azul-parnisari','Florencia Azul','Parnisari','florencia-azul-parnisari@asd.com',0,1,'2019-08-11 20:31:26.901218-03','AL');
INSERT INTO "alumno_user" VALUES (30,'pbkdf2_sha256$150000$Fmiuy83U7yGU$ZMiD5eaB22rKJPJNEGbUFCEsQ0RjS/dcNWqY8DenT1w=',NULL,0,'federico-gabriel-reylova','Federico Gabriel','Reylova','federico-gabriel-reylova@asd.com',0,1,'2019-08-11 20:39:09.277771-03','AL');
INSERT INTO "alumno_user" VALUES (31,'pbkdf2_sha256$150000$8rYEwujqIdcP$EREteMhs/s3jhLanQnZVMQFAxsHS4RvZe3B0J4DLL0w=',NULL,0,'elias-martin-schiel','Elias Martin','Schiel','elias-martin-schiel@asd.com',0,1,'2019-08-11 20:40:58.533103-03','AL');
INSERT INTO "alumno_user" VALUES (32,'pbkdf2_sha256$150000$EqNh406UkXv6$opLGVpiN/3iaOIfgcfuoAjEljPNH0eexgB60/o0m9mw=',NULL,0,'maria-silvia-sofia-saieg','Maria Silvia Sofia','Saieg','maria-silvia-sofia-saieg@asd.com',0,1,'2019-08-11 20:51:14.022542-03','AL');
INSERT INTO "alumno_user" VALUES (33,'pbkdf2_sha256$150000$FyUuDWrhxBcw$JI9eUGcqgb5Q+F41Ofc3vUYLWHNeJ8PPqQZ6v3nNCcg=',NULL,0,'carlos-dante-scala-necco','Carlos Dante','Scala Necco','carlos-dante-scala-necco@asd.com',0,1,'2019-08-11 20:54:45.672803-03','AL');
INSERT INTO "alumno_user" VALUES (34,'pbkdf2_sha256$150000$lySzSiquVctf$HaI+ZQKOGGGUFNCNxTPBQUhwEio37nARzGfuHQncwUo=',NULL,0,'leandro-troncoso','Leandro','Troncoso','leandro-troncoso@asd.com',0,1,'2019-08-11 20:55:55.371717-03','AL');
INSERT INTO "alumno_user" VALUES (35,'pbkdf2_sha256$150000$brE5pRRAVL2C$QAmqaj63kpvL2Thy7/Dq0BQyNHWJO7N2f7qPVvOhS5s=',NULL,0,'raona-srl','Raona','S.R.L.','empresa1@asd.com',0,1,'2019-08-13 19:30:35.568128-03','EM');
INSERT INTO "alumno_user" VALUES (36,'pbkdf2_sha256$150000$63WqQozPQ5J9$luxpWGM2F4IS4rZFOV7+paeTznofNQtT1PQ8etCQSOM=',NULL,0,'be-clever','be','clever','empresa2@asd.com',0,1,'2019-08-13 19:31:35.973634-03','EM');
INSERT INTO "alumno_user" VALUES (37,'pbkdf2_sha256$150000$2o5DqunZ7CSu$bqHlBQ3EKjaF23DaEPndQPfTExStq9nWkthyRIJum5c=',NULL,0,'gpf-soluciones','GPF','Soluciones','empresa3@asd.com',0,1,'2019-08-13 19:32:38.438643-03','EM');
INSERT INTO "alumno_user" VALUES (38,'pbkdf2_sha256$150000$Vgp3sIehzYXr$08VpKg2v3LfgGu6rJ4oM5Z5lg94CVHMtHADdww6K1Uk=',NULL,0,'runa-id','Runa','ID','empresa4@asd.com',0,1,'2019-08-13 19:33:31.795288-03','EM');
INSERT INTO "alumno_user" VALUES (39,'pbkdf2_sha256$150000$Kd2jPA9dVi1c$8c8vLjH5A9qjMDWFK/kz5Y8Y9lLi42ezIAl/cjrbjsA=',NULL,0,'cat-technologies','CAT','Technologies','empresa5@asd.com',0,1,'2019-08-13 19:34:32.241691-03','EM');
INSERT INTO "alumno_user" VALUES (40,'pbkdf2_sha256$150000$4V3WaXofy8xP$HBazof2PNOwCPj4PO6RI2gA2RdG69H8SBPMatDigtvA=',NULL,0,'coradir-sa','Coradir','S.A.','empresa6@asd.com',0,1,'2019-08-13 19:35:33.838642-03','EM');
INSERT INTO "alumno_user" VALUES (41,'pbkdf2_sha256$150000$VrQ9mVeNaO1q$KfmpvwuBmB7Ar3xIdpAV9OG4B2+EVHaHlmIfpI+qW7E=',NULL,0,'unitech-sa','Unitech','S.A.','empresa7@asd.com',0,1,'2019-08-13 19:37:08.031886-03','EM');
INSERT INTO "alumno_user" VALUES (42,'pbkdf2_sha256$150000$FvOvrdMKSCYY$oFfXL73jpMaehmvZluYBoTKVqza+3QYRKS1llqbxNIc=',NULL,0,'alas-it','Alas','IT','empresa8@asd.com',0,1,'2019-08-13 19:38:04.637562-03','EM');
INSERT INTO "alumno_user" VALUES (43,'pbkdf2_sha256$150000$JcjumMMTecAx$kqKtH/qrRMCbEN/Fhh3/slhXSAJ50KbvJKektp1edDU=',NULL,0,'inworx-sa','Inworx','S.A.','empresa9@asd.com',0,1,'2019-08-13 19:40:15.082797-03','EM');
INSERT INTO "alumno_user" VALUES (44,'pbkdf2_sha256$150000$JotXNTF0Pixc$8waQs+x8/I+jcyrNtNVV1JX/lXcLoHGTbu65CaOr+rA=',NULL,0,'arido-software','Árido','Software','empresa10@asd.com',0,1,'2019-08-13 19:41:28.215935-03','EM');
INSERT INTO "alumno_user" VALUES (45,'pbkdf2_sha256$150000$Rw3NtuMwjyVA$3julPEgCvfKITNU7+7vSu8X0vXdiVB8cYMDyQBMKh+A=',NULL,0,'grupo-slots','Grupo','Slots','empresa11@asd.com',0,1,'2019-08-13 19:42:54.516665-03','EM');
INSERT INTO "alumno_user" VALUES (46,'pbkdf2_sha256$150000$oR3BwkyafN6j$0JapXLDreaoxmYuHw9BNu87jSG0fgLXcad+fBtmjBNg=',NULL,0,'edesal-sa','Edesal','S.A.','empresa12@asd.com',0,1,'2019-08-13 19:43:42.213732-03','EM');
INSERT INTO "alumno_user" VALUES (47,'pbkdf2_sha256$150000$yrdH2nvj1Rxi$OBvwj3yQyv3vJ18GSoJdaYdSPrPb34+pciVcW2UjiDM=',NULL,0,'transpuntano-sa','Transpuntano','S.A.','empresa13@asd.com',0,1,'2019-08-13 19:45:05.861954-03','EM');
INSERT INTO "alumno_user" VALUES (48,'pbkdf2_sha256$150000$cshkl7ZnBXGh$W9D72jUxy68Dz4/7ypa2pUa8HMjxDaz3JVUmbYWEiwQ=',NULL,0,'sub-car-ing-inf','sub-car','ing-inf','subinf@asd.com',0,1,'2019-08-21 02:39:54.999324','CC');
INSERT INTO "alumno_user" VALUES (49,'pbkdf2_sha256$150000$2NE9Hh5cmx54$TEFGtXpNKuwIbU/WXI3dmrJIFnkEMIqhMBTrUo7OIYE=',NULL,0,'sub-car-tec-red','sub-car','tec-red','subred@asd.com',0,1,'2019-08-21 02:41:23.417946','CC');
INSERT INTO "alumno_user" VALUES (50,'pbkdf2_sha256$150000$0Sv9wBS2gy3i$s/X6x4qZZ4Eee8Vj7vYHfde8ytCB5MY1jlg628nIoyY=',NULL,0,'sub-car-ing-com','sub-car','ing-com','subcom@asd.com',0,1,'2019-08-21 02:42:10.761855','CC');
INSERT INTO "alumno_user" VALUES (51,'pbkdf2_sha256$150000$iZ3Lv8Q4Kp3z$5WiuP1EF11Gtp+IWm3rrO2hRsboNPWS9GEGZF/wbey8=',NULL,0,'sub-car-lic-com','sub-car','lic-com','subliccom@asd.com',0,1,'2019-08-21 02:42:57.380582','CC');
INSERT INTO "alumno_user" VALUES (52,'pbkdf2_sha256$150000$AOyaMvAghxTR$VAJjMklw0SsOZp+LK+UdsIrLGVkLLPmJ9KHQuNPJSP8=',NULL,0,'sub-car-pro-com','sub-car','pro-com','subprocom@asd.com',0,1,'2019-08-21 02:43:44.250610','CC');
INSERT INTO "alumno_departamento" VALUES (1,'Departamento de Informática');
INSERT INTO "alumno_docente" VALUES ('Rubén Gerardo','APOLLONI','docente1@asd.com','1','1');
INSERT INTO "alumno_docente" VALUES ('Berta Elena','GARCÍA','docente2@asd.com','2','1');
INSERT INTO "alumno_docente" VALUES ('Jesús Francisco','AGUIRRE','docente3@asd.com','5','1');
INSERT INTO "alumno_docente" VALUES ('Natalia Carolina','MIRANDA','docente4@asd.com','4','1');
INSERT INTO "alumno_docente" VALUES ('María Fabiana','PICCOLI','docente5@asd.com','3','1');
INSERT INTO "alumno_docente" VALUES ('Jaqueline Myriam','FERNÁNDEZ','docente6@asd.com','1','1');
INSERT INTO "alumno_docente" VALUES ('Mónica Graciela','FUENTES','docente7@asd.com','1','1');
INSERT INTO "alumno_docente" VALUES ('Carlos Humberto','SALGADO','docente8@asd.com','2','1');
INSERT INTO "alumno_docente" VALUES ('Norma Beatriz','PEREZ','docente9@asd.com','2','1');
INSERT INTO "alumno_docente" VALUES ('Germán Antonio','MONTEJANO','docente10@asd.com','1','1');
INSERT INTO "alumno_docente" VALUES ('María Verónica','ROSAS','docente11@asd.com','2','1');
INSERT INTO "alumno_docente" VALUES ('Susana Cecilia','ESQUIVEL','docente13@asd.com','1','1');
INSERT INTO "alumno_docente" VALUES ('Roberto Ariel','GUERRERO','docente14@asd.com','1','1');
INSERT INTO "alumno_docente" VALUES ('Daniel Edgardo','RIESCO','docente15@asd.com','3','1');
INSERT INTO "alumno_docente" VALUES ('María Teresa','TARANILLA','docente16@asd.com','3','1');
INSERT INTO "alumno_docente" VALUES ('Alejandro Leonardo','GROSSO','docente17@asd.com','1','1');
INSERT INTO "alumno_docente" VALUES ('Nora Susana','REYES','docente18@asd.om','2','1');
INSERT INTO "alumno_docente" VALUES ('Alejandro','SÁNCHEZ','docente19@asd.com','1','1');
INSERT INTO "alumno_docente" VALUES ('Ana Gabriela','GARIS','docente20@asd.com','4','1');
INSERT INTO "alumno_docente" VALUES ('Mario Gabriel','PERALTA','docente21@asd.com','3','1');
INSERT INTO "alumno_docente" VALUES ('Patricia Beatriz','ROGGERO','docente22@asd.com','5','1');
INSERT INTO "alumno_docente" VALUES ('Javier Mariano','APOLONI','docente24@asd.com','3','1');
INSERT INTO "alumno_docente" VALUES ('Edilma Olinda','GAGLIARDI','docente25@asd.com','2','1');
INSERT INTO "alumno_docente" VALUES ('Pablo Cristian','TISSERA','docente26@asd.com','4','1');
INSERT INTO "alumno_docente" VALUES ('Marcelo Luis','ERRECALDE','docente27@asd.com','4','1');
INSERT INTO "alumno_docente" VALUES ('Norma Edith','HERRERA','docente28@asd.com','4','1');
INSERT INTO "alumno_docente" VALUES ('Edgardo','FERRETI','docente29@asd.com','4','1');
INSERT INTO "alumno_docente" VALUES ('Marcela Cristina','CHIARANI','docente30@asd.com','3','1');
INSERT INTO "alumno_docente" VALUES ('Guillermo Carlos','AGUIRRE','docente31@asd.com','1','1');
INSERT INTO "alumno_docente" VALUES ('Mercedes María','TAPIA','docnete32@asd.com','3','1');
INSERT INTO "alumno_docente" VALUES ('Irma Guadalupe','PIANUCCI','docente33@asd.com','3','1');
INSERT INTO "alumno_docente" VALUES ('Mercedes Deolinda','BARRIONUEVO','docente34@asd.com','4','1');
INSERT INTO "alumno_empresa" VALUES (1,'Mercadolibre es una e-commerce','https://jobs.mercadolibre.com/?locale=es_ES','logos/logo-mercado-libre-ml.jpg','Mercadolibre S.R.L.','1',5);
INSERT INTO "alumno_empresa" VALUES (2,'Descripción de la Empresa','https://www.raona.com/','logos/logo-raona-srl-Raona.jpg','Raona','1',35);
INSERT INTO "alumno_empresa" VALUES (3,'Descripcion de la empresa','http://www.beclever.com.ar/','logos/logo-be-clever-BeCleaver.jpg','Be Clever','1',36);
INSERT INTO "alumno_empresa" VALUES (4,'descripcion de la empresa','http://gpf-soluciones.com.ar/','logos/logo-gpf-soluciones-GPFSoluciones.jpg','GPF Soluciones','1',37);
INSERT INTO "alumno_empresa" VALUES (5,'descripcion de la empresa','http://www.runaid.com.ar/index_es.html','logos/logo-runa-id-RunaID.jpg','Runa ID','1',38);
INSERT INTO "alumno_empresa" VALUES (6,'descripcion de la empresa','https://cat-technologies.com/','logos/logo-cat-technologies-Cat.jpg','Cat Technologies','1',39);
INSERT INTO "alumno_empresa" VALUES (7,'descripcion de la empresa','http://coradir.com.ar/','logos/logo-coradir-sa-Coradir.jpg','Coradir S.A.','1',40);
INSERT INTO "alumno_empresa" VALUES (8,'descripcion de la empresa','https://www.unitech-corp.com/','logos/logo-unitech-sa-Unitech.jpg','Unitech','1',41);
INSERT INTO "alumno_empresa" VALUES (9,'descripcion de la empresa','http://www.alasit.com/','logos/logo-alas-it-AlasIT.jpg','Alas IT','1',42);
INSERT INTO "alumno_empresa" VALUES (10,'descripcion de la empresa','https://latam.ctinsuretech.com/es/','','Inworx','1',43);
INSERT INTO "alumno_empresa" VALUES (11,'descripcion de la empresa','http://www.aridosoftware.com/','logos/logo-arido-software-Arido.jpg','Árido Software','1',44);
INSERT INTO "alumno_empresa" VALUES (12,'descripcion de la empresa','http://www.gruposlots.com.ar','','Grupo Slots','1',45);
INSERT INTO "alumno_empresa" VALUES (13,'descripcion de la empresa','http://www.edesalenergia.com.ar/','','Edesal S.A.','1',46);
INSERT INTO "alumno_empresa" VALUES (14,'descripcion de la empresa','http://transpuntanosl.com.ar/','','Transpuntano','1',47);
INSERT INTO "alumno_entrevista" VALUES (1,'2019-08-22 00:55:18','aca','',NULL,'','','CAA',1,1);
INSERT INTO "alumno_entrevista" VALUES (2,'2019-08-23 02:55:50','alla','',NULL,'','','CAA',1,2);
INSERT INTO "alumno_entrevista" VALUES (3,'2019-08-21 02:56:14','ada','',NULL,'','','REA',1,5);
INSERT INTO "alumno_tutorempresa" VALUES ('Tutor','Uno','Alguno','tutoruno@asd.com',5);
INSERT INTO "alumno_tutorempresa" VALUES ('Tutor','Dos','DOs','tutordos@asd.com',5);
INSERT INTO "alumno_subcomisionpasantiaspps" VALUES (1,'1',4);
INSERT INTO "alumno_subcomisionpasantiaspps_docentes" VALUES (1,1,'docente1@asd.com');
INSERT INTO "alumno_subcomisionpasantiaspps_docentes" VALUES (2,1,'docente24@asd.com');
INSERT INTO "alumno_subcomisioncarrera" VALUES (1,'1',3);
INSERT INTO "alumno_subcomisioncarrera" VALUES (2,'2',48);
INSERT INTO "alumno_subcomisioncarrera" VALUES (3,'3',49);
INSERT INTO "alumno_subcomisioncarrera" VALUES (4,'4',50);
INSERT INTO "alumno_subcomisioncarrera" VALUES (5,'5',51);
INSERT INTO "alumno_subcomisioncarrera" VALUES (6,'6',52);
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (1,1,'docente1@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (3,1,'docente2@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (4,2,'docente21@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (5,2,'docente20@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (6,3,'docente3@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (7,3,'docente4@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (8,4,'docente6@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (9,4,'docente5@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (10,5,'docente9@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (11,5,'docente10@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (12,6,'docente26@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (13,6,'docente27@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (14,5,'docente13@asd.com');
INSERT INTO "alumno_subcomisioncarrera_docentes" VALUES (15,5,'docente8@asd.com');
INSERT INTO "alumno_puesto" VALUES (1,'BE','programará todo el día','sql
java
go','lunes a viernes de 8 a 17hs',1,1,1);
INSERT INTO "alumno_puesto" VALUES (2,'FE','nada','nada','lunes',1,1,2);
INSERT INTO "alumno_puesto" VALUES (3,'QA','nada','adan','viernes',1,1,5);
INSERT INTO "alumno_pasantia" VALUES (19,'2019-08-20','2019-08-24','',NULL,NULL,'',NULL,3,'docente5@asd.com','tutordos@asd.com');
INSERT INTO "alumno_carrera" VALUES (2,'Ingeniería en Informática','1');
INSERT INTO "alumno_carrera" VALUES (1,'Tecnicatura Universitaria en Redes de Computadoras','1');
INSERT INTO "alumno_carrera" VALUES (3,'Tecnicatura Universitaria en Web','1');
INSERT INTO "alumno_carrera" VALUES (4,'Ingeniería en Computación','1');
INSERT INTO "alumno_carrera" VALUES (5,'Licenciatura en Ciencias de la Computación','1');
INSERT INTO "alumno_carrera" VALUES (6,'Profesorado en Ciencias de la Computación','1');
INSERT INTO "alumno_alumno" VALUES (1,3024212,'curriculums/curriculum-gaston-zini-Becas_Onix_UNViMe.pdf','planes_de_estudio/plan-gaston-zini-Becas_Onix_UNViMe.pdf','historias_academicas/historia-gaston-zini-Becas_Onix_UNViMe.pdf','','','2019-08-04',NULL,NULL,'','',0,'','',0,'2',2);
INSERT INTO "alumno_alumno" VALUES (2,3025017,'curriculums/curriculum-gabriel-hernan-aballay-curriculum.pdf','planes_de_estudio/plan-gabriel-hernan-aballay-plan_de_estudio.pdf','historias_academicas/historia-gabriel-hernan-aballay-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','',0,'','perfiles/perfil-gabriel-hernan-aballay-perfil.jpeg',0,'1',7);
INSERT INTO "alumno_alumno" VALUES (3,3003212,'curriculums/curriculum-nicolas-abatedaga-biole-curriculum.pdf','planes_de_estudio/plan-nicolas-abatedaga-biole-plan_de_estudio.pdf','historias_academicas/historia-nicolas-abatedaga-biole-historia_academica.pdf','Interesado en lenguaje html','Manejo fluido de lenguajes de programación básica','2019-08-11',NULL,NULL,'','',0,'','perfiles/perfil-nicolas-abatedaga-biole-perfil.jpeg',0,'3',8);
INSERT INTO "alumno_alumno" VALUES (4,3008617,'curriculums/curriculum-tomas-abatedaga-biole-curriculum.pdf','planes_de_estudio/plan-tomas-abatedaga-biole-plan_de_estudio.pdf','historias_academicas/historia-tomas-abatedaga-biole-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','',0,'','',0,'4',9);
INSERT INTO "alumno_alumno" VALUES (5,3008610,'curriculums/curriculum-maria-aylen-abraham-curriculum.pdf','planes_de_estudio/plan-maria-aylen-abraham-plan_de_estudio.pdf','historias_academicas/historia-maria-aylen-abraham-historia_academica.pdf','','','2016-08-11',NULL,NULL,'','',0,'','',0,'5',10);
INSERT INTO "alumno_alumno" VALUES (6,3055517,'curriculums/curriculum-ezequiel-alessandro-acevedo-curriculum.pdf','planes_de_estudio/plan-ezequiel-alessandro-acevedo-plan_de_estudio.pdf','historias_academicas/historia-ezequiel-alessandro-acevedo-historia_academica.pdf','Interesado en las diversas ciencias de la computación','Enseñanza fluida y dinámica.','2019-08-11',NULL,NULL,'','El alumno posee los dotes necesarios para abocar su rubro a la investigación y enseñanza de las diversas ciencias de la computación.',1,'','',0,'6',11);
INSERT INTO "alumno_alumno" VALUES (7,3042601,'curriculums/curriculum-fernando-adaro-curriculum.pdf','planes_de_estudio/plan-fernando-adaro-plan_de_estudio.pdf','historias_academicas/historia-fernando-adaro-historia_academica.pdf','','','2019-08-11',NULL,0,'El alumno no llega al porcentaje de materias aprobadas','',0,'','',0,'2',12);
INSERT INTO "alumno_alumno" VALUES (8,3017616,'curriculums/curriculum-gisella-daiana-alaniz-curriculum.pdf','planes_de_estudio/plan-gisella-daiana-alaniz-plan_de_estudio.pdf','historias_academicas/historia-gisella-daiana-alaniz-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','',0,'','perfiles/perfil-gisella-daiana-alaniz-perfil.jpeg',0,'2',13);
INSERT INTO "alumno_alumno" VALUES (9,3032516,'curriculums/curriculum-valentina-baglioni-curriculum.pdf','planes_de_estudio/plan-valentina-baglioni-plan_de_estudio.pdf','historias_academicas/historia-valentina-baglioni-historia_academica.pdf','','','2014-08-11',NULL,1,'','',0,'','',0,'3',14);
INSERT INTO "alumno_alumno" VALUES (10,3007817,'curriculums/curriculum-johanna-celeste-bello-curriculum.pdf','planes_de_estudio/plan-johanna-celeste-bello-plan_de_estudio.pdf','historias_academicas/historia-johanna-celeste-bello-historia_academica.pdf','Aprender y perfeccionarme en desarrollo de software','resumir 50 hojas en 3.','2019-08-11',NULL,NULL,'','',0,'','',0,'5',15);
INSERT INTO "alumno_alumno" VALUES (11,3004417,'curriculums/curriculum-tobias-facundo-burger-curriculum.pdf','planes_de_estudio/plan-tobias-facundo-burger-plan_de_estudio.pdf','historias_academicas/historia-tobias-facundo-burger-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','',0,'','perfiles/perfil-tobias-facundo-burger-perfil.jpeg',0,'1',16);
INSERT INTO "alumno_alumno" VALUES (12,3011215,'curriculums/curriculum-gianfranco-capodici-curriculum.pdf','planes_de_estudio/plan-gianfranco-capodici-plan_de_estudio.pdf','historias_academicas/historia-gianfranco-capodici-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','',0,'','',0,'4',17);
INSERT INTO "alumno_alumno" VALUES (13,3073604,'curriculums/curriculum-ema-noemi-ciavarelli-curriculum.pdf','planes_de_estudio/plan-ema-noemi-ciavarelli-plan_de_estudio.pdf','historias_academicas/historia-ema-noemi-ciavarelli-historia_academica.pdf','','','2019-08-11',NULL,0,'La alumna no posee el porcentaje de materias requerido.','',0,'','perfiles/perfil-ema-noemi-ciavarelli-perfil.jpeg',0,'1',18);
INSERT INTO "alumno_alumno" VALUES (14,3064504,'curriculums/curriculum-ezequiel-oscar-gaggioli-curriculum.pdf','planes_de_estudio/plan-ezequiel-oscar-gaggioli-plan_de_estudio.pdf','historias_academicas/historia-ezequiel-oscar-gaggioli-historia_academica.pdf','Aprender programación front end','no tengo ninguna','2019-08-11',NULL,NULL,'','',0,'','',0,'3',19);
INSERT INTO "alumno_alumno" VALUES (15,3034914,'curriculums/curriculum-atilio-raul-guzman-curriculum.pdf','planes_de_estudio/plan-atilio-raul-guzman-plan_de_estudio.pdf','historias_academicas/historia-atilio-raul-guzman-historia_academica.pdf','','','2001-08-11',NULL,1,'','Alumno con gran desempeño académico.',1,'','',0,'4',20);
INSERT INTO "alumno_alumno" VALUES (16,3008317,'curriculums/curriculum-facundo-agustin-homola-curriculum.pdf','planes_de_estudio/plan-facundo-agustin-homola-plan_de_estudio.pdf','historias_academicas/historia-facundo-agustin-homola-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','',0,'','perfiles/perfil-facundo-agustin-homola-perfil.jpeg',0,'5',21);
INSERT INTO "alumno_alumno" VALUES (17,3023717,'curriculums/curriculum-daniel-eliezer-kwist-curriculum.pdf','planes_de_estudio/plan-daniel-eliezer-kwist-plan_de_estudio.pdf','historias_academicas/historia-daniel-eliezer-kwist-historia_academica.pdf','crear una red de hackers por medio de mi enseñanza','Hackeo la computadora del delivery','2017-08-11',NULL,1,'','Alumno con gran capacidad para organizar y dirigir proyectos.',1,'','perfiles/perfil-daniel-eliezer-kwist-perfil.jpeg',0,'6',22);
INSERT INTO "alumno_alumno" VALUES (18,3015815,'curriculums/curriculum-alexey-kutalo-curriculum.pdf','planes_de_estudio/plan-alexey-kutalo-plan_de_estudio.pdf','historias_academicas/historia-alexey-kutalo-historia_academica.pdf','Aprender pyton','Planificador de proyectos extensos.','2019-08-11',NULL,0,'El alumno no posee el porcentaje de materias requerido.','',0,'','',0,'2',23);
INSERT INTO "alumno_alumno" VALUES (19,3011414,'curriculums/curriculum-gianni-roman-lupi-casale-curriculum.pdf','planes_de_estudio/plan-gianni-roman-lupi-casale-plan_de_estudio.pdf','historias_academicas/historia-gianni-roman-lupi-casale-historia_academica.pdf','','','2011-08-11',NULL,NULL,'','',0,'','perfiles/perfil-gianni-roman-lupi-casale-perfil.jpeg',0,'1',24);
INSERT INTO "alumno_alumno" VALUES (20,3021917,'curriculums/curriculum-tomas-bautista-maldocena-curriculum.pdf','planes_de_estudio/plan-tomas-bautista-maldocena-plan_de_estudio.pdf','historias_academicas/historia-tomas-bautista-maldocena-historia_academica.pdf','interesado en programación front end','no tengo ninguna','2019-08-11',NULL,NULL,'','',0,'','',0,'3',25);
INSERT INTO "alumno_alumno" VALUES (21,3017708,'curriculums/curriculum-pedro-arturo-mas-bustos-curriculum.pdf','planes_de_estudio/plan-pedro-arturo-mas-bustos-plan_de_estudio.pdf','historias_academicas/historia-pedro-arturo-mas-bustos-historia_academica.pdf','','','2015-08-11',NULL,1,'','',0,'','perfiles/perfil-pedro-arturo-mas-bustos-perfil.jpeg',0,'4',26);
INSERT INTO "alumno_alumno" VALUES (22,3028517,'curriculums/curriculum-leonela-sofia-oyarzun-curriculum.pdf','planes_de_estudio/plan-leonela-sofia-oyarzun-plan_de_estudio.pdf','historias_academicas/historia-leonela-sofia-oyarzun-historia_academica.pdf','Interesada en lenguaje C++','nivel de programación C avanzado.','2019-08-11',NULL,0,'La alumna no posee el porcentaje de materias requerido','',0,'','perfiles/perfil-leonela-sofia-oyarzun-perfil.jpeg',0,'5',27);
INSERT INTO "alumno_alumno" VALUES (23,3016209,'curriculums/curriculum-juan-alejandro-palma-curriculum.pdf','planes_de_estudio/plan-juan-alejandro-palma-plan_de_estudio.pdf','historias_academicas/historia-juan-alejandro-palma-historia_academica.pdf','Enseñanza didáctica de ciencias modernas','Aprendo rápido','2015-08-11',NULL,1,'','',0,'','perfiles/perfil-juan-alejandro-palma-perfil.jpeg',0,'6',28);
INSERT INTO "alumno_alumno" VALUES (24,3032416,'curriculums/curriculum-florencia-azul-parnisari-curriculum.pdf','planes_de_estudio/plan-florencia-azul-parnisari-plan_de_estudio.pdf','historias_academicas/historia-florencia-azul-parnisari-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','Alumno persistente y responsable.',1,'','perfiles/perfil-florencia-azul-parnisari-perfil.jpeg',0,'1',29);
INSERT INTO "alumno_alumno" VALUES (25,3027817,'curriculums/curriculum-federico-gabriel-reylova-curriculum.pdf','planes_de_estudio/plan-federico-gabriel-reylova-plan_de_estudio.pdf','historias_academicas/historia-federico-gabriel-reylova-historia_academica.pdf','Desarrollo de videojuegos','Escribo 50 palabras por minuto.','2019-08-11',NULL,NULL,'','Alumno con alto rendimiento en el desarrollo de videojuegos.',1,'','perfiles/perfil-federico-gabriel-reylova-perfil.jpeg',0,'4',30);
INSERT INTO "alumno_alumno" VALUES (26,3028616,'curriculums/curriculum-elias-martin-schiel-curriculum.pdf','planes_de_estudio/plan-elias-martin-schiel-plan_de_estudio.pdf','historias_academicas/historia-elias-martin-schiel-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','',0,'','perfiles/perfil-elias-martin-schiel-perfil.jpeg',0,'6',31);
INSERT INTO "alumno_alumno" VALUES (27,3037110,'curriculums/curriculum-maria-silvia-sofia-saieg-curriculum.pdf','planes_de_estudio/plan-maria-silvia-sofia-saieg-plan_de_estudio.pdf','historias_academicas/historia-maria-silvia-sofia-saieg-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','',0,'','',0,'6',32);
INSERT INTO "alumno_alumno" VALUES (28,3027912,'curriculums/curriculum-carlos-dante-scala-necco-curriculum.pdf','planes_de_estudio/plan-carlos-dante-scala-necco-plan_de_estudio.pdf','historias_academicas/historia-carlos-dante-scala-necco-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','',0,'','perfiles/perfil-carlos-dante-scala-necco-perfil.jpeg',0,'2',33);
INSERT INTO "alumno_alumno" VALUES (29,3019916,'curriculums/curriculum-leandro-troncoso-curriculum.pdf','planes_de_estudio/plan-leandro-troncoso-plan_de_estudio.pdf','historias_academicas/historia-leandro-troncoso-historia_academica.pdf','','','2019-08-11',NULL,NULL,'','',0,'','',0,'1',34);
INSERT INTO "alumno_postulacion" VALUES (1,'2019-08-21','2019-08-21',0,1,1,1);
INSERT INTO "alumno_postulacion" VALUES (2,'2019-08-21','2019-08-21',0,1,2,2);
INSERT INTO "alumno_postulacion" VALUES (3,'2019-08-21','2019-08-21',0,1,3,3);
CREATE UNIQUE INDEX IF NOT EXISTS "alumno_user_groups_user_id_group_id_795cb1a7_uniq" ON "alumno_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "alumno_user_groups_user_id_2d910415" ON "alumno_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "alumno_user_groups_group_id_b22eb17f" ON "alumno_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "alumno_user_user_permissions_user_id_permission_id_0722545d_uniq" ON "alumno_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "alumno_user_user_permissions_user_id_7d3342b2" ON "alumno_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "alumno_user_user_permissions_permission_id_d6517408" ON "alumno_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "alumno_docente_departamento_id_44da43af" ON "alumno_docente" (
	"departamento_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "alumno_empresa_departamento_id_nombre_fantasia_b76d5106_uniq" ON "alumno_empresa" (
	"departamento_id",
	"nombre_fantasia"
);
CREATE INDEX IF NOT EXISTS "alumno_empresa_departamento_id_0fac954e" ON "alumno_empresa" (
	"departamento_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "alumno_entrevista_alumno_id_empresa_id_fecha_57d68c85_uniq" ON "alumno_entrevista" (
	"alumno_id",
	"empresa_id",
	"fecha"
);
CREATE INDEX IF NOT EXISTS "alumno_entrevista_alumno_id_e9c64cc7" ON "alumno_entrevista" (
	"alumno_id"
);
CREATE INDEX IF NOT EXISTS "alumno_entrevista_empresa_id_e0ffe55f" ON "alumno_entrevista" (
	"empresa_id"
);
CREATE INDEX IF NOT EXISTS "alumno_tutorempresa_empresa_id_eb9e5289" ON "alumno_tutorempresa" (
	"empresa_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "alumno_subcomisionpasantiaspps_docentes_subcomisionpasantiaspps_id_docente_id_91b318b5_uniq" ON "alumno_subcomisionpasantiaspps_docentes" (
	"subcomisionpasantiaspps_id",
	"docente_id"
);
CREATE INDEX IF NOT EXISTS "alumno_subcomisionpasantiaspps_docentes_subcomisionpasantiaspps_id_ef8f9a58" ON "alumno_subcomisionpasantiaspps_docentes" (
	"subcomisionpasantiaspps_id"
);
CREATE INDEX IF NOT EXISTS "alumno_subcomisionpasantiaspps_docentes_docente_id_59069914" ON "alumno_subcomisionpasantiaspps_docentes" (
	"docente_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "alumno_subcomisioncarrera_docentes_subcomisioncarrera_id_docente_id_bd35e735_uniq" ON "alumno_subcomisioncarrera_docentes" (
	"subcomisioncarrera_id",
	"docente_id"
);
CREATE INDEX IF NOT EXISTS "alumno_subcomisioncarrera_docentes_subcomisioncarrera_id_ac986598" ON "alumno_subcomisioncarrera_docentes" (
	"subcomisioncarrera_id"
);
CREATE INDEX IF NOT EXISTS "alumno_subcomisioncarrera_docentes_docente_id_8cba08d1" ON "alumno_subcomisioncarrera_docentes" (
	"docente_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "alumno_puesto_empresa_id_nombre_8f9c006f_uniq" ON "alumno_puesto" (
	"empresa_id",
	"nombre"
);
CREATE INDEX IF NOT EXISTS "alumno_puesto_empresa_id_29e2ace8" ON "alumno_puesto" (
	"empresa_id"
);
CREATE INDEX IF NOT EXISTS "alumno_pasantia_entrevista_id_3a65b663" ON "alumno_pasantia" (
	"entrevista_id"
);
CREATE INDEX IF NOT EXISTS "alumno_pasantia_tutor_docente_id_4198a0c7" ON "alumno_pasantia" (
	"tutor_docente_id"
);
CREATE INDEX IF NOT EXISTS "alumno_pasantia_tutor_empresa_id_272f645e" ON "alumno_pasantia" (
	"tutor_empresa_id"
);
CREATE INDEX IF NOT EXISTS "alumno_carrera_departamento_id_0050a97f" ON "alumno_carrera" (
	"departamento_id"
);
CREATE INDEX IF NOT EXISTS "alumno_alumno_carrera_id_41131f15" ON "alumno_alumno" (
	"carrera_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "alumno_carrera_departamento_id_nombre_d3e76cfd_uniq" ON "alumno_carrera" (
	"departamento_id",
	"nombre"
);
CREATE UNIQUE INDEX IF NOT EXISTS "alumno_postulacion_puesto_id_alumno_id_0f8fc76c_uniq" ON "alumno_postulacion" (
	"puesto_id",
	"alumno_id"
);
CREATE INDEX IF NOT EXISTS "alumno_postulacion_alumno_id_aea9d63f" ON "alumno_postulacion" (
	"alumno_id"
);
CREATE INDEX IF NOT EXISTS "alumno_postulacion_puesto_id_b4725e47" ON "alumno_postulacion" (
	"puesto_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "alumno_directordepartamento_departamento_id_docente_id_dc031f05_uniq" ON "alumno_directordepartamento" (
	"departamento_id",
	"docente_id"
);
COMMIT;
