BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
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
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
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
CREATE TABLE IF NOT EXISTS "filme_usuario_filmes_vistos" (
	"id"	integer NOT NULL,
	"usuario_id"	bigint NOT NULL,
	"filme_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("filme_id") REFERENCES "filme_filme"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("usuario_id") REFERENCES "filme_usuario"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "filme_usuario_groups" (
	"id"	integer NOT NULL,
	"usuario_id"	bigint NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
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
CREATE TABLE IF NOT EXISTS "filme_usuario" (
	"id"	INTEGER NOT NULL,
	"password"	VARCHAR(128) NOT NULL,
	"last_login"	DATETIME,
	"is_superuser"	BOOLEAN NOT NULL,
	"username"	VARCHAR(150) NOT NULL UNIQUE,
	"first_name"	VARCHAR(150) NOT NULL,
	"last_name"	VARCHAR(150) NOT NULL,
	"email"	VARCHAR(254) NOT NULL,
	"is_staff"	BOOLEAN NOT NULL,
	"is_active"	BOOLEAN NOT NULL,
	"date_joined"	DATETIME NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2024-01-10 17:26:18.965992'),
 (2,'auth','0001_initial','2024-01-10 17:26:19.052216'),
 (3,'admin','0001_initial','2024-01-10 17:26:19.110528'),
 (4,'admin','0002_logentry_remove_auto_add','2024-01-10 17:26:19.255812'),
 (5,'admin','0003_logentry_add_action_flag_choices','2024-01-10 17:26:19.326285'),
 (6,'contenttypes','0002_remove_content_type_name','2024-01-10 17:26:19.410903'),
 (7,'auth','0002_alter_permission_name_max_length','2024-01-10 17:26:19.479179'),
 (8,'auth','0003_alter_user_email_max_length','2024-01-10 17:26:19.531918'),
 (9,'auth','0004_alter_user_username_opts','2024-01-10 17:26:19.567442'),
 (10,'auth','0005_alter_user_last_login_null','2024-01-10 17:26:19.627524'),
 (11,'auth','0006_require_contenttypes_0002','2024-01-10 17:26:19.639290'),
 (12,'auth','0007_alter_validators_add_error_messages','2024-01-10 17:26:19.687530'),
 (13,'auth','0008_alter_user_username_max_length','2024-01-10 17:26:19.730544'),
 (14,'auth','0009_alter_user_last_name_max_length','2024-01-10 17:26:19.796252'),
 (15,'auth','0010_alter_group_name_max_length','2024-01-10 17:26:19.842411'),
 (16,'auth','0011_update_proxy_permissions','2024-01-10 17:26:19.890375'),
 (17,'auth','0012_alter_user_first_name_max_length','2024-01-10 17:26:19.967228'),
 (18,'sessions','0001_initial','2024-01-10 17:26:20.023033');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'filme','filme');
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
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$720000$FpuqTyfJg2u1pN2frJojWS$BhBAgzKZqJxSmXDRo33Sb6KCG4y9slxKuXq72ESRlUs=','2024-01-10 17:34:58.673451',1,'alecesar27','','alecesar27@yahoo.com.br',1,1,'2024-01-10 17:33:33.968764','');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('6z87974axvm2sbwoxzpwxo8y3wl9c88c','.eJxVjEEOwiAQRe_C2hCGaSm4dN8zkBmY2qqBpLQr491Nky50-997_60i7dsc9yZrXLK6KlCX340pPaUcID-o3KtOtWzrwvpQ9EmbHmuW1-10_w5mavNR5957byQzg3XOpB4YkyM_hGkgsNKHBL7LggQwBYvGdg69ZcQBxbD6fAHcpzc3:1rNcTi:jOfeFrf6GVCVQRlSN_Zs0dyFDZPLVCeRmzCsPLk7WSI','2024-01-24 17:34:58.682814'),
 ('qn0dwzd9wpyy8jnx6y7jojpohduxplqp','.eJxVjEEOwiAQRe_C2pAGmKG4dO8ZyDCAVA0kpV013t026UK3_733N-FpXYpfe5r9FMVVKHH53QLxK9UDxCfVR5Pc6jJPQR6KPGmX9xbT-3a6fweFetlrmw0y4AjKQI6JMikiRGe1G3OGFAlYK4sDOORdAaeHrAJrQ-jIsPh8AefEN-4:1rOHkQ:B2Cr2Qk-XIbJh5kw_pVw-mTdcs55mJx1VlPb3mr3G20','2024-01-26 13:38:58.873944'),
 ('49pwl3mr3aidneokkkrs3fye6qg1wkbg','.eJxVjM0OwiAQhN-FsyEgP9169O4zkGXZStVAUtqT8d2lSQ96m8z3zbxFwG3NYWu8hDmJi9BKnH7LiPTkspP0wHKvkmpZlznKXZEHbfJWE7-uh_t3kLHlvmYDI7mz86CBtfEuAkXlHY4TDhEQQaND36NVkyetFXFHzliIHgcrPl_36Tfa:1rOIJx:eUXb51HCU1mLGUgSmPeKdTH1CEJcgx-OGFDTLS6eWmk','2024-01-26 14:15:41.515400');
INSERT INTO "filme_filme" ("id","titulo","thumb","descricao","categoria","visualizacoes","data_criacao") VALUES (1,'Python impressionador','thumb_filmes/PYTHON_IMPRESSIONADOR_1280X725_eTGKscr.png','Saia do zero a um nível avançado em pouco tempo','PROGRAMACAO',24,'2023-11-22 18:51:37'),
 (2,'Javascript Impressionador','thumb_filmes/mockup-javascriptimpressionador-1_fXox8Zj.webp','Curso com  um excelente nível técnico','PROGRAMACAO',14,'2023-11-22 18:52:33'),
 (3,'Sql impressionador','thumb_filmes/SQL_IMPRESSIONADOR_1280X725_Dgja6nP.png','Curso completo do zero ao avançado','PROGRAMACAO',3,'2023-11-22 18:53:25'),
 (4,'PowerBI impressionador','thumb_filmes/POWER_BI_IMPRESSIONADOR_1280X725_jDDNtoY.png','Excelente curso para quem quer dominar dashboards','ANALISES',11,'2023-11-22 18:54:01'),
 (5,'PowerPoint impressionador','thumb_filmes/POWER_POINT_IMPRESSIONADOR_1280X720_iMpbTwm.png','Curso que fará com que você domine o  Powerpoint','APRESENTACAO',7,'2023-11-22 18:54:52'),
 (6,'Excel  impressionador','thumb_filmes/EXCEL_IMPRESSIONADOR_1280X725_QSxFiXv.png','Aprenda a dominar o Excel','ANALISES',12,'2023-11-22 18:55:49'),
 (7,'Data Science impressionador','thumb_filmes/Box-Ciencia-de-Dados-Impressionador-1-1024x576.png_sAq8RW9.webp','Aprenda a dominar a Ciência de Dados','ANALISES',9,'2023-11-22 18:57:44'),
 (8,'HTML e CSS impressionador','thumb_filmes/Box-html-e-css-Impressionador_kQGX18O.webp','Chegue em um nível estratosférico no front end','PROGRAMACAO',7,'2023-11-22 19:07:44'),
 (9,'VBA Impressionador','thumb_filmes/Box-VBA-Impressionador-768x432.png_1ALG8wo.webp','Start from scratch and reach an advanced level in no time','PROGRAMACAO',23,'2023-11-22 19:09:32');
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
 (77,9,2),
 (86,10,1);
INSERT INTO "filme_usuario" ("id","password","last_login","is_superuser","username","first_name","last_name","email","is_staff","is_active","date_joined") VALUES (1,'pbkdf2_sha256$600000$SeYu9VgxNhPMljpnu6oXF8$OzRIlZtkUhyNz6rgastSePfgE5YCI33bAE+KAvxIYhc=','2024-01-03 14:08:56.184216',1,'acesar','','','alecesar27@yahoo.com.br',1,1,'2023-11-22 18:25:38'),
 (2,'pbkdf2_sha256$720000$aqRk6OktNBtBpuohiD0Jbf$DI0mqlHqsJy8/B/83Nuv7DU81xdfc6V/VvXPOzlJQyY=','2024-01-12 14:14:47.418985',1,'alecesar27','Alex Cesar','dos Santos','alecesar27@yahoo.com.br',1,1,'2023-12-07 17:26:50.231462'),
 (9,'pbkdf2_sha256$600000$QEw4dcfluHpFGBqIvlhRIf$g4kyl2LnHBIiliEvGlaCWyxjcOz8unLibsTPXR5R30M=','2024-01-03 16:24:46.213263',0,'john','John','Seccadas','john@gmail.com',0,1,'2024-01-03 14:36:40.989942'),
 (10,'pbkdf2_sha256$720000$1Gxhi57OatC8AAFTWe17gr$yt5thkesjSncvOeVXH6z7VQe8EpgiUBNHsNgVK1slRc=','2024-01-12 14:15:41.504387',0,'edna','Edna','Santana do Carmo Santos','edna@gmail.com',0,1,'2024-01-11 23:36:42.287152');
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
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
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
COMMIT;
