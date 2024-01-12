BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "filme_filme" (
	"id"	integer NOT NULL,
	"titulo"	varchar(100) NOT NULL,
	"thumb"	varchar(100) NOT NULL,
	"descricao"	text NOT NULL,
	"categoria"	varchar(15) NOT NULL,
	"visualizacoes"	integer NOT NULL,
	"data_criacao"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "filme_episodio" (
	"id"	integer NOT NULL,
	"titulo"	varchar(100) NOT NULL,
	"video"	varchar(200) NOT NULL,
	"filme_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("filme_id") REFERENCES "filme_filme"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "filme_usuario" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(150) NOT NULL,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "filme_usuario_filmes_vistos" (
	"id"	integer NOT NULL,
	"usuario_id"	bigint NOT NULL,
	"filme_id"	bigint NOT NULL,
	FOREIGN KEY("usuario_id") REFERENCES "filme_usuario"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("filme_id") REFERENCES "filme_filme"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "filme_usuario_groups" (
	"id"	integer NOT NULL,
	"usuario_id"	bigint NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("usuario_id") REFERENCES "filme_usuario"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "filme_usuario_user_permissions" (
	"id"	integer NOT NULL,
	"usuario_id"	bigint NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("usuario_id") REFERENCES "filme_usuario"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	bigint NOT NULL,
	"action_time"	datetime NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "filme_usuario"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2023-11-22 18:23:01.656408'),
 (2,'contenttypes','0002_remove_content_type_name','2023-11-22 18:23:01.698676'),
 (3,'auth','0001_initial','2023-11-22 18:23:01.760054'),
 (4,'auth','0002_alter_permission_name_max_length','2023-11-22 18:23:01.788740'),
 (5,'auth','0003_alter_user_email_max_length','2023-11-22 18:23:01.816262'),
 (6,'auth','0004_alter_user_username_opts','2023-11-22 18:23:01.837990'),
 (7,'auth','0005_alter_user_last_login_null','2023-11-22 18:23:01.859085'),
 (8,'auth','0006_require_contenttypes_0002','2023-11-22 18:23:01.866603'),
 (9,'auth','0007_alter_validators_add_error_messages','2023-11-22 18:23:01.883634'),
 (10,'auth','0008_alter_user_username_max_length','2023-11-22 18:23:01.906462'),
 (11,'auth','0009_alter_user_last_name_max_length','2023-11-22 18:23:01.926276'),
 (12,'auth','0010_alter_group_name_max_length','2023-11-22 18:23:01.957839'),
 (13,'auth','0011_update_proxy_permissions','2023-11-22 18:23:01.979983'),
 (14,'auth','0012_alter_user_first_name_max_length','2023-11-22 18:23:02.007977'),
 (15,'filme','0001_initial','2023-11-22 18:23:02.067806'),
 (16,'admin','0001_initial','2023-11-22 18:23:02.113843'),
 (17,'admin','0002_logentry_remove_auto_add','2023-11-22 18:23:02.162317'),
 (18,'admin','0003_logentry_add_action_flag_choices','2023-11-22 18:23:02.198157'),
 (19,'sessions','0001_initial','2023-11-22 18:23:02.221300');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'contenttypes','contenttype'),
 (5,'sessions','session'),
 (6,'filme','filme'),
 (7,'filme','episodio'),
 (8,'filme','usuario');
INSERT INTO "auth_group_permissions" ("id","group_id","permission_id") VALUES (1,2,1),
 (2,2,2),
 (3,2,3),
 (4,2,4),
 (5,2,5),
 (6,2,6),
 (7,2,7),
 (8,2,8),
 (9,2,9),
 (10,2,10),
 (11,2,11),
 (12,2,12),
 (13,2,13),
 (14,2,14),
 (15,2,15),
 (16,2,16),
 (17,2,17),
 (18,2,18),
 (19,2,19),
 (20,2,20),
 (21,2,21),
 (22,2,22),
 (23,2,23),
 (24,2,24),
 (25,2,25),
 (26,2,26),
 (27,2,27),
 (28,2,28),
 (29,2,29),
 (30,2,30),
 (31,2,31),
 (32,2,32);
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_contenttype','Can add content type'),
 (14,4,'change_contenttype','Can change content type'),
 (15,4,'delete_contenttype','Can delete content type'),
 (16,4,'view_contenttype','Can view content type'),
 (17,5,'add_session','Can add session'),
 (18,5,'change_session','Can change session'),
 (19,5,'delete_session','Can delete session'),
 (20,5,'view_session','Can view session'),
 (21,6,'add_filme','Can add filme'),
 (22,6,'change_filme','Can change filme'),
 (23,6,'delete_filme','Can delete filme'),
 (24,6,'view_filme','Can view filme'),
 (25,7,'add_episodio','Can add episodio'),
 (26,7,'change_episodio','Can change episodio'),
 (27,7,'delete_episodio','Can delete episodio'),
 (28,7,'view_episodio','Can view episodio'),
 (29,8,'add_usuario','Can add user'),
 (30,8,'change_usuario','Can change user'),
 (31,8,'delete_usuario','Can delete user'),
 (32,8,'view_usuario','Can view user');
INSERT INTO "auth_group" ("id","name") VALUES (2,'admin');
INSERT INTO "filme_filme" ("id","titulo","thumb","descricao","categoria","visualizacoes","data_criacao") VALUES (1,'Python impressionador','thumb_filmes/PYTHON_IMPRESSIONADOR_1280X725_eTGKscr.png','Saia do zero a um nível avançado em pouco tempo','PROGRAMACAO',23,'2023-11-22 18:51:37'),
 (2,'Javascript Impressionador','thumb_filmes/mockup-javascriptimpressionador-1_fXox8Zj.webp','Curso com  um excelente nível técnico','PROGRAMACAO',13,'2023-11-22 18:52:33'),
 (3,'Sql impressionador','thumb_filmes/SQL_IMPRESSIONADOR_1280X725_Dgja6nP.png','Curso completo do zero ao avançado','PROGRAMACAO',3,'2023-11-22 18:53:25'),
 (4,'PowerBI impressionador','thumb_filmes/POWER_BI_IMPRESSIONADOR_1280X725_jDDNtoY.png','Excelente curso para quem quer dominar dashboards','ANALISES',11,'2023-11-22 18:54:01'),
 (5,'PowerPoint impressionador','thumb_filmes/POWER_POINT_IMPRESSIONADOR_1280X720_iMpbTwm.png','Curso que fará com que você domine o  Powerpoint','APRESENTACAO',7,'2023-11-22 18:54:52'),
 (6,'Excel  impressionador','thumb_filmes/EXCEL_IMPRESSIONADOR_1280X725_QSxFiXv.png','Aprenda a dominar o Excel','ANALISES',10,'2023-11-22 18:55:49'),
 (7,'Data Science impressionador','thumb_filmes/Box-Ciencia-de-Dados-Impressionador-1-1024x576.png_sAq8RW9.webp','Aprenda a dominar a Ciência de Dados','ANALISES',8,'2023-11-22 18:57:44'),
 (8,'HTML e CSS impressionador','thumb_filmes/Box-html-e-css-Impressionador_kQGX18O.webp','Chegue em um nível estratosférico no front end','PROGRAMACAO',5,'2023-11-22 19:07:44'),
 (9,'VBA Impressionador','thumb_filmes/Box-VBA-Impressionador-768x432.png_1ALG8wo.webp','Start from scratch and reach an advanced level in no time','PROGRAMACAO',21,'2023-11-22 19:09:32');
INSERT INTO "filme_episodio" ("id","titulo","video","filme_id") VALUES (1,'Como sair do zero em uma aula','https://www.youtube.com/embed/GQpQha2Mfpg?si=7GXrVNEqnAEmkYCV',1),
 (2,'Envio de mensagens automáticas com o python','https://www.youtube.com/embed/wrxrpC5Yeac?si=e_bpKY-XSIrTQcJf',1),
 (3,'Criando chat bot com Python','https://www.youtube.com/embed/eNpkQOMnF8g?si=ALqq_nan8GWob1NG',1),
 (4,'Ordenando e Classificando Colunas de um Banco de Dados','https://www.youtube.com/embed/l59hZbMuB4g?si=HoQSrWRsWhgqKahW',3),
 (5,'Funções e Parâmetros Predefinidos no JavaScript','https://www.youtube.com/embed/JNdH0j4okcw?si=hJYgT6DerpuYtqUy',2),
 (6,'Como sair do ZERO no POWER BI em apenas UMA AULA','https://www.youtube.com/embed/UFGe25gydxo?si=M6LLZFPsMc6QeSrK',4),
 (7,'Boas Práticas para a sua Apresentação - Aula 1','https://www.youtube.com/embed/KLOQCtVyPWA?si=hVv691Q__BLwdj2c',5),
 (8,'Funcão PROCV, Função SE, Ferramentas e Atalhos do Excel','https://www.youtube.com/embed/fmKp1GRciNo?si=XVLPNGBwfG3aizdI',6),
 (9,'Estatística para Data Science no Python','https://www.youtube.com/embed/lm5MK7SAbs0?si=_eb2C2GuBMWEoGYh',7),
 (10,'Curso HTML e CSS para Iniciantes','https://www.youtube.com/embed/w7sIMxxVELs?si=lA5-XC0Fqgn39DRj',8),
 (11,'Como sair do ZERO no VBA em apenas UMA aula','https://www.youtube.com/embed/ZFdrlOlFE6Q?si=bhmY88IKauSn23RA',9),
 (12,'Controle de Estoque Completo no VBA - Aula 1','https://www.youtube.com/embed/82Er9QC2Iak?si=4XhLjLgj8wBiHlrn',9),
 (13,'Curso Básico de JavaScript - Primeiro Projeto Web - Aula 1','https://www.youtube.com/embed/rmNMBjse-m0?si=lU0u6MaXt1e3YCNn',2),
 (14,'Fundamentos do SQL - Curso de SQL - Aula 1','https://www.youtube.com/embed/ncgEQBONI_w?si=xewhq6zOAAba82fN',3),
 (15,'Curso Power BI para Iniciantes','https://www.youtube.com/embed/Vh6FS-pqjsM?si=BsD2jP-R6ZlySlt3',4),
 (16,'Como Impressionar na Apresentação de TCC Usando o PowerPoint','https://www.youtube.com/embed/weCRK0lKLWI?si=qiAf1Z58TXetpFkM',5),
 (17,'Construindo Background do Dashboard dentro do Excel','https://www.youtube.com/embed/OK2YZjdYMKk?si=4O1v6TOpIdfX0_9X',6),
 (18,'Introdução a Ciência de Dados','https://www.youtube.com/embed/bEs1OKnuSaA?si=WrtTom3vEv_VrOW7',7);
INSERT INTO "filme_usuario" ("id","password","last_login","is_superuser","username","first_name","last_name","email","is_staff","is_active","date_joined") VALUES (1,'pbkdf2_sha256$600000$SeYu9VgxNhPMljpnu6oXF8$OzRIlZtkUhyNz6rgastSePfgE5YCI33bAE+KAvxIYhc=','2024-01-03 14:08:56.184216',1,'acesar','','','alecesar27@yahoo.com.br',1,1,'2023-11-22 18:25:38'),
 (2,'pbkdf2_sha256$600000$rOMJst6OtbwI8zCgbByqPE$GowXFHrM4JNBhAoNiWg/TrAknG+bSb7YclnKtexd4F4=','2024-01-10 16:14:42.305130',1,'alecesar27','Alex Cesar','dos Santos','alecesar27@yahoo.com.br',1,1,'2023-12-07 17:26:50.231462'),
 (9,'pbkdf2_sha256$600000$QEw4dcfluHpFGBqIvlhRIf$g4kyl2LnHBIiliEvGlaCWyxjcOz8unLibsTPXR5R30M=','2024-01-03 16:24:46.213263',0,'john','John','Seccadas','john@gmail.com',0,1,'2024-01-03 14:36:40.989942');
INSERT INTO "filme_usuario_filmes_vistos" ("id","usuario_id","filme_id") VALUES (3,1,3),
 (4,1,9),
 (5,1,1),
 (7,1,2),
 (9,2,9),
 (10,2,1),
 (11,2,2),
 (27,2,4),
 (31,2,5),
 (39,2,3),
 (43,2,7),
 (44,2,6),
 (60,2,8),
 (73,9,1),
 (74,9,6),
 (75,9,4),
 (76,9,9),
 (77,9,2);
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (1,'1','Python impressionador',1,'[{"added": {}}]',6,1,'2023-11-22 18:52:26.801057'),
 (2,'2','Javascript Impressionador',1,'[{"added": {}}]',6,1,'2023-11-22 18:53:19.503723'),
 (3,'3','Sql impressionador',1,'[{"added": {}}]',6,1,'2023-11-22 18:53:54.961489'),
 (4,'4','PowerBI impressionador',1,'[{"added": {}}]',6,1,'2023-11-22 18:54:50.350596'),
 (5,'5','Power Point impressionador',1,'[{"added": {}}]',6,1,'2023-11-22 18:55:38.188352'),
 (6,'6','Excel  impressionador',1,'[{"added": {}}]',6,1,'2023-11-22 18:56:44.092163'),
 (7,'7','Data Science impressionador',1,'[{"added": {}}]',6,1,'2023-11-22 18:58:16.712748'),
 (8,'1','acesar',2,'[{"changed": {"fields": ["Filmes vistos"]}}]',8,1,'2023-11-22 19:03:37.675211'),
 (9,'1','acesar',2,'[{"changed": {"fields": ["Filmes vistos"]}}]',8,1,'2023-11-22 19:03:51.998680'),
 (10,'1','acesar',2,'[{"changed": {"fields": ["Filmes vistos"]}}]',8,1,'2023-11-22 19:04:05.310078'),
 (11,'8','HTML e CSS impressionador',1,'[{"added": {}}]',6,1,'2023-11-22 19:09:24.804545'),
 (12,'9','VBA Impressionador',1,'[{"added": {}}]',6,1,'2023-11-22 19:10:46.575780'),
 (13,'1','Python impressionador - Como sair do zero em uma aula',1,'[{"added": {}}]',7,1,'2023-11-22 19:24:17.558556'),
 (14,'2','Python impressionador - Envio de mensagens automáticas com o python',1,'[{"added": {}}]',7,1,'2023-11-22 19:26:08.237086'),
 (15,'3','Python impressionador - Criando chat bot com Python',1,'[{"added": {}}]',7,1,'2023-11-22 19:28:29.734543'),
 (16,'1','acesar',1,'[{"added": {}}]',3,2,'2023-12-13 19:33:26.658791'),
 (17,'1','acesar',3,'',3,2,'2023-12-13 19:33:49.093069'),
 (18,'2','admin',1,'[{"added": {}}]',3,2,'2023-12-13 19:34:23.360529'),
 (19,'9','VBA Impressionador',2,'[{"changed": {"fields": ["Descricao"]}}]',6,2,'2023-12-29 08:44:13.453738'),
 (20,'4','Sql impressionador - Ordenando e Classificando Colunas de um Banco de Dados',1,'[{"added": {}}]',7,2,'2023-12-29 08:49:29.866735'),
 (21,'5','Javascript Impressionador - Funções e Parâmetros Predefinidos no JavaScript',1,'[{"added": {}}]',7,2,'2023-12-29 08:51:13.630736'),
 (22,'6','PowerBI impressionador - Como sair do ZERO no POWER BI em apenas UMA AULA',1,'[{"added": {}}]',7,2,'2023-12-29 08:53:43.808152'),
 (23,'7','Power Point impressionador - Boas Práticas para a sua Apresentação - Aula 1',1,'[{"added": {}}]',7,2,'2023-12-29 08:56:44.139215'),
 (24,'8','Excel  impressionador - Funcão PROCV, Função SE, Ferramentas e Atalhos do Excel',1,'[{"added": {}}]',7,2,'2023-12-29 08:59:18.428615'),
 (25,'9','Data Science impressionador - Estatística para Data Science no Python',1,'[{"added": {}}]',7,2,'2023-12-29 09:00:44.116382'),
 (26,'10','HTML e CSS impressionador - Curso HTML e CSS para Iniciantes',1,'[{"added": {}}]',7,2,'2023-12-29 09:02:21.298619'),
 (27,'11','VBA Impressionador - Como sair do ZERO no VBA em apenas UMA aula',1,'[{"added": {}}]',7,2,'2023-12-29 09:03:41.449085'),
 (28,'12','VBA Impressionador - Controle de Estoque Completo no VBA - Aula 1',1,'[{"added": {}}]',7,2,'2023-12-29 09:09:30.464150'),
 (29,'13','Javascript Impressionador - Curso Básico de JavaScript - Primeiro Projeto Web - Aula 1',1,'[{"added": {}}]',7,2,'2023-12-29 09:10:54.967476'),
 (30,'14','Sql impressionador - Fundamentos do SQL - Curso de SQL - Aula 1',1,'[{"added": {}}]',7,2,'2023-12-29 09:12:04.423091'),
 (31,'15','PowerBI impressionador - Curso Power BI para Iniciantes',1,'[{"added": {}}]',7,2,'2023-12-29 09:13:13.378413'),
 (32,'16','Power Point impressionador - Como Impressionar na Apresentação de TCC Usando o PowerPoint',1,'[{"added": {}}]',7,2,'2023-12-29 09:14:55.226587'),
 (33,'17','Excel  impressionador - Construindo Background do Dashboard dentro do Excel',1,'[{"added": {}}]',7,2,'2023-12-29 09:16:49.333100'),
 (34,'18','Data Science impressionador - Introdução a Ciência de Dados',1,'[{"added": {}}]',7,2,'2023-12-29 09:21:16.639682'),
 (35,'5','PowerPoint impressionador',2,'[{"changed": {"fields": ["Titulo"]}}]',6,2,'2023-12-29 09:33:06.911999'),
 (36,'4','Edna',3,'',8,2,'2023-12-29 11:29:21.171514'),
 (37,'5','Edna2023',3,'',8,2,'2023-12-29 11:29:32.311949'),
 (38,'3','alansets',3,'',8,2,'2023-12-29 11:29:49.240684'),
 (39,'6','Edna',3,'',8,2,'2023-12-29 11:51:40.961166'),
 (40,'7','Edna',3,'',8,2,'2023-12-29 11:58:58.539953'),
 (41,'8','John',3,'',8,2,'2024-01-03 14:13:58.418248');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('pizx8ro3u94fs5vqwhjq4re8yq754zk7','.eJxVjE0OwiAYBe_C2pBCoIBL956BfD8gVQNJaVeNd7dNutDtzLy3iQjrUuLa0xwnFlehxeWXIdAr1UPwE-qjSWp1mSeURyJP2-W9cXrfzvbvoEAv-5oCZw2g2Hsf7JAUZQMWdphpNCpbjYpcyAHZeHCjcQqTR2AavLGgxecLC8M4yA:1rFtDP:3tCTfCUNxknypnQNsjdX80LYLg-puxU_zsSv3H_MRss','2024-01-03 09:50:11.471308'),
 ('lvyvlg0jd3iuu06ogm4prk2nnooucu7n','.eJxVjDsOwjAQBe_iGllex59dSvqcIbLXDg4gR4qTCnF3EikFtG9m3lsMYVvLsLW8DFMSV6HF5XeLgZ-5HiA9Qr3Pkue6LlOUhyJP2mQ_p_y6ne7fQQmt7DUwE1o2JlhHHjE6NWoTvU-2s86xBwKV0CBEHFF3oEZHTLQroCCT-HwBuJY2dg:1rFtIy:KkVCm4TMtkA_JMFhGcCqRngk-w6MZNsjecyYvcylw50','2024-01-03 09:55:56.938152'),
 ('8rm3fokvda5heqd8dpgevwofba3220ws','.eJxVjDkOwjAQAP_iGlm-D0r6vMHa9YEDyJbipEL8HVlKAe3MaN4kwLHXcIy8hTWRK-Hk8ssQ4jO3KdID2r3T2Nu-rUhnQk876NJTft3O9m9QYdS5tcIZL6NDI4FjKtxw5bVS2iZmS0LUTEWh0Zmis4lModBORuCeMQBBPl_DDTcy:1rL1vu:46J2u-S61B1mx1poWQdSy-ct7BoMiZyyqvEchLSNVqc','2024-01-17 14:09:22.944912'),
 ('ul9jillzffggwgczittbdxtagwzwra7m','.eJxVjDsOwjAQBe_iGln2-htKes5gre1dHECxlE-FuDtESgHtm5n3Egm3taVtoTmNVZwFiNPvlrE8aNpBveN067L0aZ3HLHdFHnSR117peTncv4OGS_vWGfxAihU7H4wmjdZpcJYD1QIx82BZA1qKJtjKhjEqxxU0qFiy9UW8P9tON88:1rNbE2:9hrrgsquVPIRhpDa5tQOsce5Hh60GbVHt35Qad_zgew','2024-01-24 16:14:42.326837');
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "filme_episodio_filme_id_a27fa3ee" ON "filme_episodio" (
	"filme_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "filme_usuario_filmes_vistos_usuario_id_filme_id_4f96f2e0_uniq" ON "filme_usuario_filmes_vistos" (
	"usuario_id",
	"filme_id"
);
CREATE INDEX IF NOT EXISTS "filme_usuario_filmes_vistos_usuario_id_a22e7a24" ON "filme_usuario_filmes_vistos" (
	"usuario_id"
);
CREATE INDEX IF NOT EXISTS "filme_usuario_filmes_vistos_filme_id_bac63a09" ON "filme_usuario_filmes_vistos" (
	"filme_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "filme_usuario_groups_usuario_id_group_id_b0d1fbc3_uniq" ON "filme_usuario_groups" (
	"usuario_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "filme_usuario_groups_usuario_id_2234266d" ON "filme_usuario_groups" (
	"usuario_id"
);
CREATE INDEX IF NOT EXISTS "filme_usuario_groups_group_id_d4bfacf9" ON "filme_usuario_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "filme_usuario_user_permissions_usuario_id_permission_id_a67e1336_uniq" ON "filme_usuario_user_permissions" (
	"usuario_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "filme_usuario_user_permissions_usuario_id_ba14c733" ON "filme_usuario_user_permissions" (
	"usuario_id"
);
CREATE INDEX IF NOT EXISTS "filme_usuario_user_permissions_permission_id_6e7f0478" ON "filme_usuario_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
COMMIT;
