


drop table "pataPerro".tm_email;
drop table "pataPerro".td_mascota_foto;
drop table "pataPerro".tm_contacto;
drop table "pataPerro".td_rol_opcion;
drop table "pataPerro".td_usuario_rol;
drop table "pataPerro".td_persona_mascota;
drop table "pataPerro".td_encontrado_foto;
drop table "pataPerro".tm_rol;
drop table "pataPerro".tm_opcion;
drop table "pataPerro".tm_elemento;
drop table "pataPerro".tm_grupo_elemento;
drop table "pataPerro".tm_notificacion;
drop table "pataPerro".td_busqueda_foto;
drop table "pataPerro".tm_busqueda;
drop table "pataPerro".tm_encontrado;
drop table "pataPerro".tm_mascota;
drop table "pataPerro".tm_usuario;
drop table "pataPerro".tm_persona;
drop table "pataPerro".tm_negocio;
drop table "pataPerro".tm_anuncio;
drop table "pataPerro".oauth_users_roles;
drop table "pataPerro".oauth_users;




CREATE SEQUENCE "pataPerro".tm_persona_id_seq;

CREATE TABLE "pataPerro".tm_persona (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_persona_id_seq'),
                DESCRIPCION TEXT,
                TIPO_DOCUMENTO INTEGER,
                NRO_DOCUMENTO VARCHAR(50),
                NOMBRES VARCHAR(45),
                APELLIDO_MATERNO VARCHAR(45),
                APELLIDO_PATERNO VARCHAR(45),
                GENERO INTEGER,
                NOMBRE_COMPLETO VARCHAR(255),
                ESTADO INTEGER,
                UBICACION_CATASTRO VARCHAR(255),
                TIPO_PERSONA INTEGER,
                FECHA_NACIMIENTO TIMESTAMP,
                IND_PADRE INTEGER,
                PAIS INTEGER,
                DISTRITO INTEGER,
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                CONSTRAINT tm_persona_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_persona_id_seq OWNED BY "pataPerro".tm_persona.ID;

CREATE SEQUENCE "pataPerro".tm_encontrado_id_seq;

CREATE TABLE "pataPerro".tm_encontrado (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_encontrado_id_seq'),
                FECHA_ENCONTRADO TIMESTAMP,
                ESTADO_ENCONTRADO INTEGER,
                UBICACION_CATASTRO VARCHAR(255),
                DESCRIPCION TEXT,
                USUARIO_ENCONTRO INTEGER,
                TELEFONO INTEGER,
                EMAIL  VARCHAR(255),
                DISTRITO INTEGER,
                COMENTARIO TEXT,
                TIPO_ENCUENTRO INTEGER,
				ESTADO INTEGER,
				USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                NOMBRE_COMPLETO VARCHAR(255),
                CONSTRAINT tm_encontrado_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_encontrado_id_seq OWNED BY "pataPerro".tm_encontrado.ID;

CREATE SEQUENCE "pataPerro".tm_email_id_seq;

CREATE TABLE "pataPerro".tm_email (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_email_id_seq'),
                PERSONA_ID INTEGER NOT NULL,
                EMAIL VARCHAR(255),
                IND_PRINCIPAL INTEGER,
                ESTADO INTEGER,
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                CONSTRAINT tm_email_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_email_id_seq OWNED BY "pataPerro".tm_email.ID;

CREATE INDEX tm_email_fkindex1
 ON "pataPerro".tm_email USING BTREE
 ( PERSONA_ID ASC );

CREATE SEQUENCE "pataPerro".tm_negocio_id_seq;

CREATE TABLE "pataPerro".tm_negocio (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_negocio_id_seq'),
                TITULO VARCHAR(255),
                DESCRIPCION TEXT,
                FOTO VARCHAR(255),
                ESTADO INTEGER,
                ID_TIPO_NEGOCIO INTEGER,
                UBICACION_CATASTRO VARCHAR(255),
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                FECHA_MODIFICO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                CONSTRAINT tm_negocio_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_negocio_id_seq OWNED BY "pataPerro".tm_negocio.ID;

CREATE SEQUENCE "pataPerro".tm_usuario_id_seq;

CREATE TABLE "pataPerro".tm_usuario (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_usuario_id_seq'),
                PERSONA_ID INTEGER NOT NULL,
                USUARIO VARCHAR(85),
                PASS VARCHAR(45),
                ESTADO INTEGER,
                IND_ALERTA INTEGER,
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                CONSTRAINT tm_usuario_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_usuario_id_seq OWNED BY "pataPerro".tm_usuario.ID;

CREATE INDEX tm_usuario_fkindex1
 ON "pataPerro".tm_usuario USING BTREE
 ( PERSONA_ID ASC );

CREATE SEQUENCE "pataPerro".tm_opcion_id_seq;

CREATE TABLE "pataPerro".tm_opcion (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_opcion_id_seq'),
                NOMBRE VARCHAR(255),
                ACCION VARCHAR(255),
                IND_PADRE INTEGER,
                MODULO INTEGER,
                IND_TIPO_MENU INTEGER,
                ESTADO INTEGER,
                ORDEN INTEGER,
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                CONSTRAINT tm_opcion_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_opcion_id_seq OWNED BY "pataPerro".tm_opcion.ID;

CREATE SEQUENCE "pataPerro".tm_mascota_id_seq;

CREATE TABLE "pataPerro".tm_mascota (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_mascota_id_seq'),
                NOMBRE VARCHAR(255),
                GENERO INTEGER,
                TAMANIO INTEGER,
                RAZA INTEGER,
                DISTRITO INTEGER,
                CARACTERISTICA TEXT,
                IND_RECIBIDO INTEGER,
                DES_COMENTARIO TEXT,
                UBICACION_CATASTRO VARCHAR(255),
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                COLOR INTEGER,
                ESTADO INTEGER,
                CONSTRAINT tm_mascota_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_mascota_id_seq OWNED BY "pataPerro".tm_mascota.ID;

CREATE SEQUENCE "pataPerro".td_mascota_foto_id_seq;

CREATE TABLE "pataPerro".td_mascota_foto (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".td_mascota_foto_id_seq'),
                MASCOTA_ID INTEGER NOT NULL,
                FOTO VARCHAR(255),
                IND_PRINCIPAL INTEGER,
                CONSTRAINT td_mascota_foto_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".td_mascota_foto_id_seq OWNED BY "pataPerro".td_mascota_foto.ID;

CREATE INDEX td_mascota_foto_fkindex1
 ON "pataPerro".td_mascota_foto USING BTREE
 ( MASCOTA_ID ASC );

CREATE SEQUENCE "pataPerro".tm_contacto_id_seq;

CREATE TABLE "pataPerro".tm_contacto (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_contacto_id_seq'),
                PERSONA_ID INTEGER NOT NULL,
                TIPO_TELEFONO INTEGER,
                NUMERO VARCHAR(45),
                ESTADO INTEGER,
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                CONSTRAINT tm_contacto_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_contacto_id_seq OWNED BY "pataPerro".tm_contacto.ID;

CREATE INDEX tm_contacto_fkindex1
 ON "pataPerro".tm_contacto USING BTREE
 ( PERSONA_ID ASC );

CREATE SEQUENCE "pataPerro".td_persona_mascota_id_seq;

CREATE TABLE "pataPerro".td_persona_mascota (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".td_persona_mascota_id_seq'),
                PERSONA_ID INTEGER NOT NULL,
                MASCOTA_ID INTEGER NOT NULL,
                CONSTRAINT td_persona_mascota_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".td_persona_mascota_id_seq OWNED BY "pataPerro".td_persona_mascota.ID;

CREATE INDEX td_persona_mascota_fkindex1
 ON "pataPerro".td_persona_mascota USING BTREE
 ( PERSONA_ID ASC );

CREATE INDEX td_persona_mascota_fkindex2
 ON "pataPerro".td_persona_mascota USING BTREE
 ( MASCOTA_ID ASC );

CREATE SEQUENCE "pataPerro".td_encontrado_foto_id_seq;

CREATE TABLE "pataPerro".td_encontrado_foto (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".td_encontrado_foto_id_seq'),
                ENCONTRADO_ID INTEGER NOT NULL,
                FOTO VARCHAR(255),
                CONSTRAINT td_encontrado_foto_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".td_encontrado_foto_id_seq OWNED BY "pataPerro".td_encontrado_foto.ID;

CREATE INDEX td_foto_encontrado_fkindex1
 ON "pataPerro".td_encontrado_foto USING BTREE
 ( ENCONTRADO_ID ASC );

CREATE SEQUENCE "pataPerro".tm_rol_id_seq;

CREATE TABLE "pataPerro".tm_rol (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_rol_id_seq'),
                NOMBRE VARCHAR(255),
                TIPO INTEGER,
                ESTADO INTEGER,
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                CONSTRAINT tm_rol_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_rol_id_seq OWNED BY "pataPerro".tm_rol.ID;

CREATE SEQUENCE "pataPerro".td_usuario_rol_id_seq;

CREATE TABLE "pataPerro".td_usuario_rol (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".td_usuario_rol_id_seq'),
                ROL_ID INTEGER NOT NULL,
                USUARIO_ID INTEGER NOT NULL,
                CONSTRAINT td_usuario_rol_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".td_usuario_rol_id_seq OWNED BY "pataPerro".td_usuario_rol.ID;

CREATE INDEX td_usuario_rol_fkindex1
 ON "pataPerro".td_usuario_rol USING BTREE
 ( USUARIO_ID ASC );

CREATE INDEX td_usuario_rol_fkindex2
 ON "pataPerro".td_usuario_rol USING BTREE
 ( ROL_ID ASC );

CREATE SEQUENCE "pataPerro".td_rol_opcion_id_seq;

CREATE TABLE "pataPerro".td_rol_opcion (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".td_rol_opcion_id_seq'),
                ROL_ID INTEGER NOT NULL,
                OPCION_ID INTEGER NOT NULL,
                CONSTRAINT td_rol_opcion_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".td_rol_opcion_id_seq OWNED BY "pataPerro".td_rol_opcion.ID;

CREATE INDEX td_rol_opcion_fkindex1
 ON "pataPerro".td_rol_opcion USING BTREE
 ( OPCION_ID ASC );

CREATE INDEX td_rol_opcion_fkindex2
 ON "pataPerro".td_rol_opcion USING BTREE
 ( ROL_ID ASC );

CREATE SEQUENCE "pataPerro".tm_grupo_elemento_id_seq;

CREATE TABLE "pataPerro".tm_grupo_elemento (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_grupo_elemento_id_seq'),
                DES_ABREVIACION VARCHAR(45),
                ESTADO INTEGER,
                NOMBRE VARCHAR(255),
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                CONSTRAINT tm_grupo_elemento_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_grupo_elemento_id_seq OWNED BY "pataPerro".tm_grupo_elemento.ID;

CREATE SEQUENCE "pataPerro".tm_elemento_id_seq;

CREATE TABLE "pataPerro".tm_elemento (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_elemento_id_seq'),
                GRUPO_ELEMENTO_ID INTEGER NOT NULL,
                DES_ABREVIACION VARCHAR(150),
                DES_CODIGO VARCHAR(100),
                DES_NOMBRE VARCHAR(45),
                ESTADO INTEGER,
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                DES_REFERENCIA VARCHAR(150),
                CONSTRAINT tm_elemento_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_elemento_id_seq OWNED BY "pataPerro".tm_elemento.ID;

CREATE INDEX tm_elemento_fkindex1
 ON "pataPerro".tm_elemento USING BTREE
 ( GRUPO_ELEMENTO_ID ASC );

CREATE SEQUENCE "pataPerro".tm_notificacion_id_seq;

CREATE TABLE "pataPerro".tm_notificacion (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_notificacion_id_seq'),
                TIPO_NOTIFICACION INTEGER,
                TIPO_MEDIO INTEGER,
                DESCRIPCION TEXT,
                USUARIO_EMISOR VARCHAR(45),
				USUARIO_EMISOR_ID INTEGER,
                USUARIO_DESTINO VARCHAR(45),
				USUARIO_DESTINO_ID INTEGER,
                FECHA_RECEPCION TIMESTAMP,
                ESTADO INTEGER,
				FECHA_REGISTRO TIMESTAMP,
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                CONSTRAINT tm_notificacion_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_notificacion_id_seq OWNED BY "pataPerro".tm_notificacion.ID;

CREATE SEQUENCE "pataPerro".tm_anuncio_id_seq;

CREATE TABLE "pataPerro".tm_anuncio (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_anuncio_id_seq'),
                TIPO_ANUNCIO INTEGER,
                DESCRIPCION TEXT,
                FECHA_ANUNCIO TIMESTAMP,
                FECHA_VENCIMIENTO TIMESTAMP,
                FOTO VARCHAR(255),
                TITULO VARCHAR(255),
                ESTAOO INTEGER,
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                DISTRITO INTEGER,
                CONSTRAINT tm_anuncio_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_anuncio_id_seq OWNED BY "pataPerro".tm_anuncio.ID;

CREATE SEQUENCE "pataPerro".tm_busqueda_id_seq;

CREATE TABLE "pataPerro".tm_busqueda (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_busqueda_id_seq'),
                MASCOTA_ID INTEGER NOT NULL,
                FECHA_PERDIDA TIMESTAMP,
                UBICACION_CATASTRO VARCHAR(255),
                DESCRIPCION TEXT,
                DISTRITO INTEGER,
                ESTADO_BUSQUEDA INTEGER,
                ESTADO INTEGER,          
                IND_RECOMPENSA INTEGER,
                COMENTARIO_ADICIONAL TEXT,
				USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                CONSTRAINT tm_busqueda_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".tm_busqueda_id_seq OWNED BY "pataPerro".tm_busqueda.ID;

CREATE INDEX tm_busqueda_fkindex1
 ON "pataPerro".tm_busqueda USING BTREE
 ( MASCOTA_ID ASC );

CREATE SEQUENCE "pataPerro".td_busqueda_foto_id_seq;

CREATE TABLE "pataPerro".td_busqueda_foto (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".td_busqueda_foto_id_seq'),
                BUSQUEDA_ID INTEGER NOT NULL,
                FOTO VARCHAR(255),
                CONSTRAINT td_busqueda_foto_pk PRIMARY KEY (ID)
);

ALTER SEQUENCE "pataPerro".td_busqueda_foto_id_seq OWNED BY "pataPerro".td_busqueda_foto.ID;

CREATE INDEX td_busqueda_foto_fkindex1
 ON "pataPerro".td_busqueda_foto USING BTREE
 ( BUSQUEDA_ID ASC );
 
 
 
CREATE SEQUENCE "pataPerro".td_negocio_categoria_id_seq;
CREATE TABLE "pataPerro".td_negocio_categoria (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".td_negocio_categoria_id_seq'),
                NEGOCIO_ID INTEGER NOT NULL,
                CATEGORIA_ID INTEGER NOT NULL,
                CONSTRAINT td_negocio_categoria_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE "pataPerro".td_negocio_categoria_id_seq OWNED BY "pataPerro".td_negocio_categoria.ID;

CREATE INDEX td_negocio_categoria_fkindex1
 ON "pataPerro".td_negocio_categoria USING BTREE
 ( NEGOCIO_ID ASC );

CREATE INDEX td_negocio_categoria_fkindex2
 ON "pataPerro".td_negocio_categoria USING BTREE
 ( CATEGORIA_ID ASC );
 
 
 --UBIGEO--
CREATE SEQUENCE "pataPerro".tm_ubigeo_id_seq   start with 2078;
CREATE TABLE "pataPerro".tm_ubigeo (
                ID INTEGER NOT NULL DEFAULT nextval('"pataPerro".tm_ubigeo_id_seq'),
                IND_PAIS INTEGER,
                IND_DEPARTAMENTO VARCHAR(4),
                IND_PROVINCIA VARCHAR(4),
                IND_DISTRITO VARCHAR(4),
                ESTADO INTEGER,
                NOMBRE VARCHAR(255),
                GENTILICIO VARCHAR(255),
    			DES_CATASTRO  VARCHAR(255),
                USUARIO_REGISTRO VARCHAR(255),
                FECHA_REGISTRO TIMESTAMP,
                USUARIO_MODIFICO VARCHAR(255),
                FECHA_MODIFICO TIMESTAMP,
                CONSTRAINT tm_ubigeo_pk PRIMARY KEY (ID)
);

ALTER SEQUENCE "pataPerro".tm_ubigeo_id_seq OWNED BY "pataPerro".tm_ubigeo.ID;

 

ALTER TABLE "pataPerro".td_persona_mascota ADD CONSTRAINT td_persona_mascota_ibfk_1
FOREIGN KEY (PERSONA_ID)
REFERENCES "pataPerro".tm_persona (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".tm_contacto ADD CONSTRAINT tm_contacto_ibfk_1
FOREIGN KEY (PERSONA_ID)
REFERENCES "pataPerro".tm_persona (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".tm_email ADD CONSTRAINT tm_email_ibfk_1
FOREIGN KEY (PERSONA_ID)
REFERENCES "pataPerro".tm_persona (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".tm_usuario ADD CONSTRAINT tm_usuario_ibfk_1
FOREIGN KEY (PERSONA_ID)
REFERENCES "pataPerro".tm_persona (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".td_encontrado_foto ADD CONSTRAINT td_encontrado_foto_ibfk_1
FOREIGN KEY (ENCONTRADO_ID)
REFERENCES "pataPerro".tm_encontrado (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".td_usuario_rol ADD CONSTRAINT td_usuario_rol_ibfk_1
FOREIGN KEY (USUARIO_ID)
REFERENCES "pataPerro".tm_usuario (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".td_rol_opcion ADD CONSTRAINT td_rol_opcion_ibfk_1
FOREIGN KEY (OPCION_ID)
REFERENCES "pataPerro".tm_opcion (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".td_persona_mascota ADD CONSTRAINT td_persona_mascota_ibfk_2
FOREIGN KEY (MASCOTA_ID)
REFERENCES "pataPerro".tm_mascota (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".tm_busqueda ADD CONSTRAINT tm_busqueda_ibfk_1
FOREIGN KEY (MASCOTA_ID)
REFERENCES "pataPerro".tm_mascota (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".td_mascota_foto ADD CONSTRAINT td_mascota_foto_ibfk_1
FOREIGN KEY (MASCOTA_ID)
REFERENCES "pataPerro".tm_mascota (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".td_rol_opcion ADD CONSTRAINT td_rol_opcion_ibfk_2
FOREIGN KEY (ROL_ID)
REFERENCES "pataPerro".tm_rol (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".td_usuario_rol ADD CONSTRAINT td_usuario_rol_ibfk_2
FOREIGN KEY (ROL_ID)
REFERENCES "pataPerro".tm_rol (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".tm_elemento ADD CONSTRAINT tm_elemento_ibfk_1
FOREIGN KEY (GRUPO_ELEMENTO_ID)
REFERENCES "pataPerro".tm_grupo_elemento (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE "pataPerro".td_busqueda_foto ADD CONSTRAINT td_busqueda_foto_ibfk_1
FOREIGN KEY (BUSQUEDA_ID)
REFERENCES "pataPerro".tm_busqueda (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



 ALTER TABLE "pataPerro".td_negocio_categoria ADD CONSTRAINT td_negocio_categoria_fkindex1
FOREIGN KEY (NEGOCIO_ID)
REFERENCES "pataPerro".tm_negocio (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


ALTER TABLE "pataPerro".td_negocio_categoria ADD CONSTRAINT td_negocio_categoria_fkindex2
FOREIGN KEY (CATEGORIA_ID)
REFERENCES "pataPerro".tm_elemento (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

---Oaut--

CREATE TABLE "pataPerro".oauth_users
(
    username character varying(45)  NOT NULL,
    password character varying(45)  NOT NULL,
    enabled integer NOT NULL,
    CONSTRAINT oauth_users_pkey PRIMARY KEY (username)
);


CREATE TABLE "pataPerro".oauth_users_roles
(
    user_role_id integer NOT NULL,
    username character varying(45)  NOT NULL,
    role character varying(45)  NOT NULL,
    CONSTRAINT oauth_users_roles_pkey PRIMARY KEY (user_role_id)
);

INSERT INTO "pataPerro".oauth_users (username,password,enabled) VALUES ('pdp_movil_user','153952ff0ed1fdd851a22c9277af8dd5',1);
INSERT INTO "pataPerro".oauth_users (username,password,enabled) VALUES ('ADMIN','153952ff0ed1fdd851a22c9277af8dd5',1);

INSERT INTO "pataPerro".oauth_users_roles (user_role_id,username,role) VALUES (2,'ADMIN','ROLE_ADMIN');
INSERT INTO "pataPerro".oauth_users_roles (user_role_id,username,role) VALUES (1,'pdp_movil_user','ROLE_ADMIN');


----TIPO DOCUMENTO---

INSERT INTO "pataPerro".tm_grupo_elemento(id, des_abreviacion, estado, nombre, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_grupo_elemento_id_seq'), 'TIPO_DOC', 1, 'TIPO DOCUMENTO', 'ADMIN', now(), null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 1, 'DNI', '01', 'DNI', 1, now(), 'ADMIN', null,null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 1, 'RUC', '02', 'RUC', 1, now(), 'ADMIN', null,null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 1, 'CEXT', '03', 'CEXT', 1, now(), 'ADMIN', null,null, null);

	
----GENERO---
	
INSERT INTO "pataPerro".tm_grupo_elemento(id, des_abreviacion, estado, nombre, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_grupo_elemento_id_seq'), 'GENERO', 1, 'GENERO', 'ADMIN', now(), null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 2, 'MACHO', '01', 'MASCULINO', 1, now(), 'ADMIN', null,null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 2, 'HEMBRA', '02', 'FEMENINO', 1, now(), 'ADMIN', null,null, null);
	
	
	
----RAZA---	
	
INSERT INTO "pataPerro".tm_grupo_elemento(id, des_abreviacion, estado, nombre, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_grupo_elemento_id_seq'), 'RAZA', 1, 'RAZA', 'ADMIN', now(), null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '01', 'AFGNANO', 1, now(), 'ADMIN', null,null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '02', 'BARBET', 1, now(), 'ADMIN', null,null, null);
		
INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '03', 'BEAGLE', 1, now(), 'ADMIN', null,null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '04', 'BOXER', 1, now(), 'ADMIN', null,null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '05', 'CHOW CHOW', 1, now(), 'ADMIN', null,null, null);
			
	
----NOTIFICACION--	

INSERT INTO "pataPerro".tm_grupo_elemento(id, des_abreviacion, estado, nombre, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_grupo_elemento_id_seq'), 'TIPO_NOTIFICACION', 1, 'TIPO_NOTIFICACION', 'ADMIN', now(), null, null);	

	
INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 4, '', '01', 'AVISO BUSQUEDA', 1, now(), 'ADMIN', null,null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 4, '', '02', 'AVISO SERVICIO', 1, now(), 'ADMIN', null,null, null);
		
INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 4, '', '03', 'AVISO ENCONTRADO', 1, now(), 'ADMIN', null,null, null);
		

----TIPO MEDIO AVISO---
	
INSERT INTO "pataPerro".tm_grupo_elemento(id, des_abreviacion, estado, nombre, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_grupo_elemento_id_seq'), 'TIPO_MEDIO', 1, 'TIPO_MEDIO', 'ADMIN', now(), null, null);	

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 5, '', '01', 'MOBIL', 1, now(), 'ADMIN', null,null, null);
				

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 5, '', '02', 'WEB', 1, now(), 'ADMIN', null,null, null);
		

----TIPO TELEFONO---
	
INSERT INTO "pataPerro".tm_grupo_elemento(id, des_abreviacion, estado, nombre, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_grupo_elemento_id_seq'), 'TIPO_TELEFONO', 1, 'TIPO_TELEFONO', 'ADMIN', now(), null, null);	

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 6, '', '01', 'FIJO/CASA', 1, now(), 'ADMIN', null,null, null);
				

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 6, '', '02', 'CELULAR', 1, now(), 'ADMIN', null,null, null);
	
---TIPO DE PERSONA--
INSERT INTO "pataPerro".tm_grupo_elemento(id, des_abreviacion, estado, nombre, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_grupo_elemento_id_seq'), 'TIPO_PERSONA', 1, 'TIPO_PERSONA', 'ADMIN', now(), null, null);	

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 7, '', '01', 'NATURAL', 1, now(), 'ADMIN', null,null, null);
				

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 7, '', '02', 'JURIDICA', 1, now(), 'ADMIN', null,null, null);
		
	
	
---TIPO DE ANUNCIO--
INSERT INTO "pataPerro".tm_grupo_elemento(id, des_abreviacion, estado, nombre, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_grupo_elemento_id_seq'), 'TIPO_ANUNCIO', 1, 'TIPO_ANUNCIO', 'ADMIN', now(), null, null);	

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 8, '', '01', 'CONCURSO', 1, now(), 'ADMIN', null,null, null);
				

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 8, '', '02', 'EVENTO', 1, now(), 'ADMIN', null,null, null);
    

	
---TIPO DE NEGOCIO--
INSERT INTO "pataPerro".tm_grupo_elemento(id, des_abreviacion, estado, nombre, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_grupo_elemento_id_seq'), 'TIPO_NEGOCIO', 1, 'TIPO_NEGOCIO', 'ADMIN', now(), null, null);	

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 9, '', '01', 'VETERINARIA', 1, now(), 'ADMIN', null,null, null);
				
INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 9, '', '02', 'TIENDA', 1, now(), 'ADMIN', null,null, null);
    		
---PAIS--
INSERT INTO "pataPerro".tm_grupo_elemento(id, des_abreviacion, estado, nombre, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_grupo_elemento_id_seq'), 'PAIS', 1, 'PAIS', 'ADMIN', now(), null, null);

INSERT INTO "pataPerro".tm_elemento(
	id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)
	VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 10, 'PERÚ', '01', 'PERÚ', 1, now(), 'ADMIN', null,null, null);



---PERSONA---
INSERT INTO "pataPerro".tm_persona(
	id, descripcion, tipo_documento, nombres, apellido_materno, apellido_paterno, genero, nro_documento, nombre_completo, fecha_nacimiento, estado, ubicacion_catastro, ind_padre, tipo_persona, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_persona_id_seq'), '', 1, 'JOSE LUIS', 'BUENO', 'MANDUJANO', 4, '44496812', 'JOSE LUIS MANDUJANO BUENO', now(), 1, null,null , 18, 'ADMIN', now(), null, null);	
	
--USUARIO--
INSERT INTO "pataPerro".tm_usuario(
	id, persona_id, usuario, pass, estado,ind_alerta, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_usuario_id_seq'),1, 'ADMIN', 'e10adc3949ba59abbe56e057f20f883e', 1, 0,'ADMIN', now(), null, null);	

--ROL--
INSERT INTO "pataPerro".tm_rol(
	id, nombre, tipo, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico)
	VALUES (nextval('"pataPerro".tm_rol_id_seq'), 'ADMINISTRADOR-MASTER',15, 1, now(), 'ADMIN', null, null);	
	
INSERT INTO "pataPerro".tm_rol(
	id, nombre, tipo, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico)
	VALUES (nextval('"pataPerro".tm_rol_id_seq'), 'USUARIO_MOBIL',14, 1, now(), 'ADMIN', null, null);	
	
	
--ROL USUARIO--
INSERT INTO "pataPerro".td_usuario_rol(	id, rol_id, usuario_id)	VALUES (nextval('"pataPerro".td_usuario_rol_id_seq'), 1, 1);
INSERT INTO "pataPerro".td_usuario_rol(	id, rol_id, usuario_id)	VALUES (nextval('"pataPerro".td_usuario_rol_id_seq'), 2, 2);
INSERT INTO "pataPerro".td_usuario_rol(	id, rol_id, usuario_id)	VALUES (nextval('"pataPerro".td_usuario_rol_id_seq'), 2, 3);

--OPCION --

INSERT INTO "pataPerro".tm_opcion(
	id, nombre, accion, ind_padre, modulo, ind_tipo_menu, estado, orden, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_opcion_id_seq'), 'INICIO', null, 0, null, 14, 1, 1,'ADMIN', now(),null, null);

INSERT INTO "pataPerro".tm_opcion(
	id, nombre, accion, ind_padre, modulo, ind_tipo_menu, estado, orden, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_opcion_id_seq'), 'SEGURIDAD', null, 0, null, 14, 1, 1,'ADMIN', now(),null, null);

INSERT INTO "pataPerro".tm_opcion( 
	id, nombre, accion, ind_padre, modulo, ind_tipo_menu, estado, orden, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_opcion_id_seq'), 'USUARIO', 'seguridad/usuario', 2, null, 14, 1, 1,'ADMIN', now(),null, null);
 
INSERT INTO "pataPerro".tm_opcion(
	id, nombre, accion, ind_padre, modulo, ind_tipo_menu, estado, orden, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_opcion_id_seq'), 'ROL', 'seguridad/rol', 2, null, 14, 1, 1,'ADMIN', now(),null, null);
	
INSERT INTO "pataPerro".tm_opcion(
	id, nombre, accion, ind_padre, modulo, ind_tipo_menu, estado, orden, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_opcion_id_seq'), 'OPCION', 'seguridad/opcion', 2, null, 14, 1, 1,'ADMIN', now(),null, null);

INSERT INTO "pataPerro".tm_opcion(
	id, nombre, accion, ind_padre, modulo, ind_tipo_menu, estado, orden, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_opcion_id_seq'), 'OPCION POR ROL', 'seguridad/opcionrol', 2, null, 14, 1, 1,'ADMIN', now(),null, null);
			
INSERT INTO "pataPerro".tm_opcion(
	id, nombre, accion, ind_padre, modulo, ind_tipo_menu, estado, orden, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_opcion_id_seq'), 'PERSONA', 'persona/persona', 0, null, 14, 1, 1,  'ADMIN', now(),null, null);
	


	
--ROL OPCION--
INSERT INTO "pataPerro".td_rol_opcion(	id, rol_id, opcion_id)	VALUES (nextval('"pataPerro".td_rol_opcion_id_seq'), 1, 1);
INSERT INTO "pataPerro".td_rol_opcion(	id, rol_id, opcion_id)	VALUES (nextval('"pataPerro".td_rol_opcion_id_seq'), 1, 2);
INSERT INTO "pataPerro".td_rol_opcion(	id, rol_id, opcion_id)	VALUES (nextval('"pataPerro".td_rol_opcion_id_seq'), 1, 3);
INSERT INTO "pataPerro".td_rol_opcion(	id, rol_id, opcion_id)	VALUES (nextval('"pataPerro".td_rol_opcion_id_seq'), 1, 4);
INSERT INTO "pataPerro".td_rol_opcion(	id, rol_id, opcion_id)	VALUES (nextval('"pataPerro".td_rol_opcion_id_seq'), 1, 5);
INSERT INTO "pataPerro".td_rol_opcion(	id, rol_id, opcion_id)	VALUES (nextval('"pataPerro".td_rol_opcion_id_seq'), 1, 6);
INSERT INTO "pataPerro".td_rol_opcion(	id, rol_id, opcion_id)	VALUES (nextval('"pataPerro".td_rol_opcion_id_seq'), 1, 7);


--EMAIL--
INSERT INTO "pataPerro".tm_email(
	id, persona_id, email, ind_principal, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico)
	VALUES (nextval('"pataPerro".tm_email_id_seq'), 1, 'JOSELUIS0428@GMAIL.COM', 1, 1,now(), 'ADMIN', null, null);
INSERT INTO "pataPerro".tm_email(
	id, persona_id, email, ind_principal, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico)
	VALUES (nextval('"pataPerro".tm_email_id_seq'), 1, 'JOSELUI_0428@HOTMAIL.COM', null, 1,now(), 'ADMIN', null, null);

	
--CONTACTO--
INSERT INTO "pataPerro".tm_contacto(
	id, persona_id, tipo_telefono, numero, estado, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_contacto_id_seq'), 1, 16, '234213',1,'ADMIN', now(), null, null);	
	
INSERT INTO "pataPerro".tm_contacto(
	id, persona_id, tipo_telefono, numero, estado, usuario_registro, fecha_registro, usuario_modifico, fecha_modifico)
	VALUES (nextval('"pataPerro".tm_contacto_id_seq'), 1, 17, '9993170383',1,'ADMIN', now(), null, null);	
	
	
--ANUNCIO--
    INSERT INTO "pataPerro".tm_anuncio(
	id, tipo_anuncio, descripcion, fecha_anuncio, fecha_vencimiento, foto, titulo, estaoo, usuario_registro, fecha_registro)
	VALUES (nextval('"pataPerro".tm_anuncio_id_seq'), 20,'Se realizara el concurso CAN 2017 de las diferentes razas que se encuentran en nuestro pais.', now(),now(), '','Concurso de Lima CAN 2017', 1, 'ADMIN', now());
	
INSERT INTO "pataPerro".tm_anuncio(
	id, tipo_anuncio, descripcion, fecha_anuncio, fecha_vencimiento, foto, titulo, estaoo, usuario_registro, fecha_registro)
	VALUES (nextval('"pataPerro".tm_anuncio_id_seq'), 21,'Corte Gratuito en todos los distritos de lima metropolitana.', now(), now(),'', 'CORTE DE CABELLO GRATUITO', 1,  'ADMIN', now());
    	
--NEGOCIO--
	INSERT INTO "pataPerro".tm_negocio(
	id, titulo, descripcion, foto, estado, id_tipo_negocio, ubicacion_catastro, usuario_registro, fecha_registro)
	VALUES (nextval('"pataPerro".tm_negocio_id_seq'), 'VETERINARIA PEPITO', 'Brindamos un servicio de calidad a tu mascota con personal de calidad.', '',
            1, 22,'', 'ADMIN',  now());
 
 INSERT INTO "pataPerro".tm_negocio(
	id, titulo, descripcion, foto, estado, id_tipo_negocio, ubicacion_catastro, usuario_registro, fecha_registro)
	VALUES (nextval('"pataPerro".tm_negocio_id_seq'), 'TIENDA PEPITO', 'Brindamos implementos, ropa, accesorios para tu mascota de calidad.', '',
            1, 23,'', 'ADMIN',  now());
            
--UBIGEO--
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1,24 ,'01' ,'00' ,'00',1,' Amazonas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2,24 , '01' ,'01' ,'00',1,' Chachapoyas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 3,24 ,'01' ,'01' ,'01',1,' Chachapoyas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 4,24 , '01' ,'01' ,'02',1,' Asunción',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 5,24 ,'01' ,'01' ,'03',1,' Balsas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 6,24 , '01' ,'01' ,'04',1,' Cheto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 7,24 ,'01' ,'01' ,'05',1,' Chiliquin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 8,24 ,'01' ,'01' ,'06',1,' Chuquibamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 9,24 , '01' ,'01' ,'07',1,' Granada',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 10,24 ,'01' , '01' ,'08',1,' Huancas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 11,24 , '01' ,'01' ,'09',1,' La Jalca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 12,24 ,'01' , '01' ,'10',1,' Leimebamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 13,24 , '01' ,'01' ,'11',1,' Levanto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 14,24 ,'01' ,'01' ,'12',1,' Magdalena',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 15,24 ,'01' ,'01' ,'13',1,' Mariscal Castilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 16,24 , '01' , '01' ,'14',1,' Molinopampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 17,24 ,'01' ,'01' ,'15',1,' Montevideo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 18,24 , '01' , '01' ,'16',1,' Olleros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 19,24 ,'01' ,'01' ,'17',1,' Quinjalca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 20,24 , '01' , '01' ,'18',1,' San Francisco de Daguas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 21,24 ,'01' ,'01' ,'19',1,' San Isidro de Maino',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 22,24 ,'01' , '01' ,'20',1,' Soloco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 23,24 , '01' ,'01' ,'21',1,' Sonche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 24,24 ,'01' ,'02' ,'00',1,' Bagua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 25,24 , '01' ,'02' ,'01',1,' Bagua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 26,24 ,'01' ,'02' ,'02',1,' Aramango',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 27,24 , '01' ,'02' ,'03',1,' Copallin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 28,24 ,'01' ,'02' ,'04',1,' El Parco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 29,24 ,'01' ,'02' ,'05',1,' Imaza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 30,24 , '01' ,'02' ,'06',1,' La Peca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 31,24 ,'01' ,'03' ,'00',1,' Bongará',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 32,24 , '01' ,'03' ,'01',1,' Jumbilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 33,24 ,'01' ,'03' ,'02',1,' Chisquilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 34,24 , '01' ,'03' ,'03',1,' Churuja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 35,24 ,'01' ,'03' ,'04',1,' Corosha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 36,24 ,'01' ,'03' ,'05',1,' Cuispes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 37,24 , '01' ,'03' ,'06',1,' Florida',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 38,24 ,'01' ,'03' ,'07',1,' Jazan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 39,24 , '01' ,'03' ,'08',1,' Recta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 40,24 ,'01' ,'03' ,'09',1,' San Carlos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 41,24 , '01' ,'03' ,'10',1,' Shipasbamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 42,24 ,'01' ,'03' ,'11',1,' Valera',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 43,24 ,'01' ,'03' ,'12',1,' Yambrasbamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 44,24 , '01' ,'04' ,'00',1,' Condorcanqui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 45,24 ,'01' ,'04' ,'01',1,' Nieva',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 46,24 , '01' ,'04' ,'02',1,' El Cenepa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 47,24 ,'01' ,'04' ,'03',1,' Río Santiago',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 48,24 , '01' ,'05' ,'00',1,' Luya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 49,24 ,'01' ,'05' ,'01',1,' Lamud',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 50,24 ,'01' ,'05' ,'02',1,' Camporredondo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 51,24 , '01' ,'05' ,'03',1,' Cocabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 52,24 ,'01' ,'05' ,'04',1,' Colcamar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 53,24 , '01' ,'05' ,'05',1,' Conila',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 54,24 ,'01' ,'05' ,'06',1,' Inguilpata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 55,24 , '01' ,'05' ,'07',1,' Longuita',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 56,24 ,'01' ,'05' ,'08',1,' Lonya Chico',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 57,24 ,'01' ,'05' ,'09',1,' Luya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 58,24 , '01' ,'05' ,'10',1,' Luya Viejo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 59,24 ,'01' ,'05' ,'11',1,' María',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 60,24 , '01' ,'05' ,'12',1,' Ocalli',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 61,24 ,'01' ,'05' ,'13',1,' Ocumal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 62,24 , '01' ,'05' ,'14',1,' Pisuquia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 63,24 ,'01' ,'05' ,'15',1,' Providencia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 64,24 ,'01' ,'05' ,'16',1,' San Cristóbal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 65,24 , '01' ,'05' ,'17',1,' San Francisco de Yeso',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 66,24 ,'01' ,'05' ,'18',1,' San Jerónimo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 67,24 , '01' ,'05' ,'19',1,' San Juan de Lopecancha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 68,24 ,'01' ,'05' ,'20',1,' Santa Catalina',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 69,24 , '01' ,'05' ,'21',1,' Santo Tomas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 70,24 ,'01' ,'05' ,'22',1,' Tingo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 71,24 ,'01' ,'05' ,'23',1,' Trita',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 72,24 , '01' ,'06' ,'00',1,' Rodríguez de Mendoza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 73,24 ,'01' ,'06' ,'01',1,' San Nicolás',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 74,24 , '01' ,'06' ,'02',1,' Chirimoto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 75,24 ,'01' ,'06' ,'03',1,' Cochamal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 76,24 , '01' ,'06' ,'04',1,' Huambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 77,24 ,'01' ,'06' ,'05',1,' Limabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 78,24 ,'01' ,'06' ,'06',1,' Longar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 79,24 , '01' ,'06' ,'07',1,' Mariscal Benavides',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 80,24 ,'01' ,'06' ,'08',1,' Milpuc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 81,24 , '01' ,'06' ,'09',1,' Omia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 82,24 ,'01' ,'06' ,'10',1,' Santa Rosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 83,24 , '01' ,'06' ,'11',1,' Totora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 84,24 ,'01' ,'06' ,'12',1,' Vista Alegre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 85,24 ,'01' ,'07' ,'00',1,' Utcubamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 86,24 , '01' ,'07' ,'01',1,' Bagua Grande',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 87,24 ,'01' ,'07' ,'02',1,' Cajaruro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 88,24 , '01' ,'07' ,'03',1,' Cumba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 89,24 ,'01' ,'07' ,'04',1,' El Milagro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 90,24 , '01' ,'07' ,'05',1,' Jamalca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 91,24 ,'01' ,'07' ,'06',1,' Lonya Grande',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 92,24 ,'01' ,'07' ,'07',1,' Yamon',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 93,24 ,'02' ,'00' ,'00',1,' Áncash',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 94,24 ,'02' ,'01' ,'00',1,' Áncash Huaraz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 95,24 ,'02' ,'01' ,'01',1,' Huaraz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 96,24 ,'02' ,'01' ,'02',1,' Cochabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 97,24 ,'02' ,'01' ,'03',1,' Colcabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 98,24 ,'02' ,'01' ,'04',1,' Huanchay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 99,24 ,'02' ,'01' ,'05',1,' Independencia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 100,24 ,'02' ,'01' ,'06',1,' Jangas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 101,24 ,'02' ,'01' ,'07',1,' La Libertad',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 102,24 ,'02' ,'01' ,'08',1,' Olleros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 103,24 ,'02' ,'01' ,'09',1,' Pampas Grande',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 104,24 ,'02' ,'01' ,'10',1,' Pariacoto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 105,24 ,'02' ,'01' ,'11',1,' Pira',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 106,24 ,'02' ,'01' ,'12',1,' Tarica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 107,24 ,'02' ,'02' ,'00',1,' Aija',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 108,24 ,'02' ,'02' ,'01',1,' Aija',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 109,24 ,'02' ,'02' ,'02',1,' Coris',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 110,24 ,'02' ,'02' ,'03',1,' Huacllan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 111,24 ,'02' ,'02' ,'04',1,' La Merced',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 112,24 ,'02' ,'02' ,'05',1,' Succha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 113,24 ,'02' ,'03' ,'00',1,' Antonio Raymondi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 114,24 ,'02' ,'03' ,'01',1,' Llamellin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 115,24 ,'02' ,'03' ,'02',1,' Aczo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 116,24 ,'02' ,'03' ,'03',1,' Chaccho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 117,24 ,'02' ,'03' ,'04',1,' Chingas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 118,24 ,'02' ,'03' ,'05',1,' Mirgas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 119,24 ,'02' ,'03' ,'06',1,' San Juan de Rontoy',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 120,24 ,'02' ,'04' ,'00',1,' Asunción',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 121,24 ,'02' ,'04' ,'01',1,' Chacas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 122,24 ,'02' ,'04' ,'02',1,' Acochaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 123,24 ,'02' ,'05' ,'00',1,' Bolognesi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 124,24 ,'02' ,'05' ,'01',1,' Chiquian',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 125,24 ,'02' ,'05' ,'02',1,' Abelardo Pardo Lezameta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 126,24 ,'02' ,'05' ,'03',1,' Antonio Raymondi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 127,24 ,'02' ,'05' ,'04',1,' Aquia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 128,24 ,'02' ,'05' ,'05',1,' Cajacay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 129,24 ,'02' ,'05' ,'06',1,' Canis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 130,24 ,'02' ,'05' ,'07',1,' Colquioc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 131,24 ,'02' ,'05' ,'08',1,' Huallanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 132,24 ,'02' ,'05' ,'09',1,' Huasta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 133,24 ,'02' ,'05' ,'10',1,' Huayllacayan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 134,24 ,'02' ,'05' ,'11',1,' La Primavera',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 135,24 ,'02' ,'05' ,'12',1,' Mangas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 136,24 ,'02' ,'05' ,'13',1,' Pacllon',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 137,24 ,'02' ,'05' ,'14',1,' San Miguel de Corpanqui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 138,24 ,'02' ,'05' ,'15',1,' Ticllos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 139,24 ,'02' ,'06' ,'00',1,' Carhuaz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 140,24 ,'02' ,'06' ,'01',1,' Carhuaz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 141,24 ,'02' ,'06' ,'02',1,' Acopampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 142,24 ,'02' ,'06' ,'03',1,' Amashca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 143,24 ,'02' ,'06' ,'04',1,' Anta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 144,24 ,'02' ,'06' ,'05',1,' Ataquero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 145,24 ,'02' ,'06' ,'06',1,' Marcara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 146,24 ,'02' ,'06' ,'07',1,' Pariahuanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 147,24 ,'02' ,'06' ,'08',1,' San Miguel de Aco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 148,24 ,'02' ,'06' ,'09',1,' Shilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 149,24 ,'02' ,'06' ,'10',1,' Tinco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 150,24 ,'02' ,'06' ,'11',1,' Yungar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 151,24 ,'02' ,'07' ,'00',1,' Carlos Fermín Fitzcarrald',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 152,24 ,'02' ,'07' ,'01',1,' San Luis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 153,24 ,'02' ,'07' ,'02',1,' San Nicolás',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 154,24 ,'02' ,'07' ,'03',1,' Yauya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 155,24 ,'02' ,'08' ,'00',1,' Casma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 156,24 ,'02' ,'08' ,'01',1,' Casma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 157,24 ,'02' ,'08' ,'02',1,' Buena Vista Alta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 158,24 ,'02' ,'08' ,'03',1,' Comandante Noel',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 159,24 ,'02' ,'08' ,'04',1,' Yautan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 160,24 ,'02' ,'09' ,'00',1,' Corongo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 161,24 ,'02' ,'09' ,'01',1,' Corongo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 162,24 ,'02' ,'09' ,'02',1,' Aco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 163,24 ,'02' ,'09' ,'03',1,' Bambas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 164,24 ,'02' ,'09' ,'04',1,' Cusca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 165,24 ,'02' ,'09' ,'05',1,' La Pampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 166,24 ,'02' ,'09' ,'06',1,' Yanac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 167,24 ,'02' ,'09' ,'07',1,' Yupan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 168,24 ,'02' ,'10' ,'00',1,' Huari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 169,24 ,'02' ,'10' ,'01',1,' Huari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 170,24 ,'02' ,'10' ,'02',1,' Anra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 171,24 ,'02' ,'10' ,'03',1,' Cajay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 172,24 ,'02' ,'10' ,'04',1,' Chavin de Huantar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 173,24 ,'02' ,'10' ,'05',1,' Huacachi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 174,24 ,'02' ,'10' ,'06',1,' Huacchis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 175,24 ,'02' ,'10' ,'07',1,' Huachis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 176,24 ,'02' ,'10' ,'08',1,' Huantar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 177,24 ,'02' ,'10' ,'09',1,' Masin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 178,24 ,'02' ,'10' ,'10',1,' Paucas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 179,24 ,'02' ,'10' ,'11',1,' Ponto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 180,24 ,'02' ,'10' ,'12',1,' Rahuapampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 181,24 ,'02' ,'10' ,'13',1,' Rapayan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 182,24 ,'02' ,'10' ,'14',1,' San Marcos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 183,24 ,'02' ,'10' ,'15',1,' San Pedro de Chana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 184,24 ,'02' ,'10' ,'16',1,' Uco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 185,24 ,'02' ,'11' ,'00',1,' Huarmey',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 186,24 ,'02' ,'11' ,'01',1,' Huarmey',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 187,24 ,'02' ,'11' ,'02',1,' Cochapeti',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 188,24 ,'02' ,'11' ,'03',1,' Culebras',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 189,24 ,'02' ,'11' ,'04',1,' Huayan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 190,24 ,'02' ,'11' ,'05',1,' Malvas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 191,24 ,'02' ,'12' ,'00',1,' Huaylas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 192,24 ,'02' ,'12' ,'01',1,' Caraz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 193,24 ,'02' ,'12' ,'02',1,' Huallanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 194,24 ,'02' ,'12' ,'03',1,' Huata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 195,24 ,'02' ,'12' ,'04',1,' Huaylas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 196,24 ,'02' ,'12' ,'05',1,' Mato',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 197,24 ,'02' ,'12' ,'06',1,' Pamparomas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 198,24 ,'02' ,'12' ,'07',1,' Pueblo Libre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 199,24 ,'02' ,'12' ,'08',1,' Santa Cruz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 200,24 ,'02' ,'12' ,'09',1,' Santo Toribio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 201,24 ,'02' ,'12' ,'10',1,' Yuracmarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 202,24 ,'02' ,'13' ,'00',1,' Mariscal Luzuriaga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 203,24 ,'02' ,'13' ,'01',1,' Piscobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 204,24 ,'02' ,'13' ,'02',1,' Casca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 205,24 ,'02' ,'13' ,'03',1,' Eleazar Guzmán Barron',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 206,24 ,'02' ,'13' ,'04',1,' Fidel Olivas Escudero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 207,24 ,'02' ,'13' ,'05',1,' Llama',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 208,24 ,'02' ,'13' ,'06',1,' Llumpa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 209,24 ,'02' ,'13' ,'07',1,' Lucma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 210,24 ,'02' ,'13' ,'08',1,' Musga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 211,24 ,'02' ,'14' ,'00',1,' Ocros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 212,24 ,'02' ,'14' ,'01',1,' Ocros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 213,24 ,'02' ,'14' ,'02',1,' Acas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 214,24 ,'02' ,'14' ,'03',1,' Cajamarquilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 215,24 ,'02' ,'14' ,'04',1,' Carhuapampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 216,24 ,'02' ,'14' ,'05',1,' Cochas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 217,24 ,'02' ,'14' ,'06',1,' Congas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 218,24 ,'02' ,'14' ,'07',1,' Llipa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 219,24 ,'02' ,'14' ,'08',1,' San Cristóbal de Rajan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 220,24 ,'02' ,'14' ,'09',1,' San Pedro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 221,24 ,'02' ,'14' ,'10',1,' Santiago de Chilcas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 222,24 ,'02' ,'15' ,'00',1,' Pallasca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 223,24 ,'02' ,'15' ,'01',1,' Cabana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 224,24 ,'02' ,'15' ,'02',1,' Bolognesi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 225,24 ,'02' ,'15' ,'03',1,' Conchucos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 226,24 ,'02' ,'15' ,'04',1,' Huacaschuque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 227,24 ,'02' ,'15' ,'05',1,' Huandoval',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 228,24 ,'02' ,'15' ,'06',1,' Lacabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 229,24 ,'02' ,'15' ,'07',1,' Llapo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 230,24 ,'02' ,'15' ,'08',1,' Pallasca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 231,24 ,'02' ,'15' ,'09',1,' Pampas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 232,24 ,'02' ,'15' ,'10',1,' Santa Rosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 233,24 ,'02' ,'15' ,'11',1,' Tauca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 234,24 ,'02' ,'16' ,'00',1,' Pomabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 235,24 ,'02' ,'16' ,'01',1,' Pomabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 236,24 ,'02' ,'16' ,'02',1,' Huayllan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 237,24 ,'02' ,'16' ,'03',1,' Parobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 238,24 ,'02' ,'16' ,'04',1,' Quinuabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 239,24 ,'02' ,'17' ,'00',1,' Recuay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 240,24 ,'02' ,'17' ,'01',1,' Recuay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 241,24 ,'02' ,'17' ,'02',1,' Catac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 242,24 ,'02' ,'17' ,'03',1,' Cotaparaco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 243,24 ,'02' ,'17' ,'04',1,' Huayllapampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 244,24 ,'02' ,'17' ,'05',1,' Llacllin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 245,24 ,'02' ,'17' ,'06',1,' Marca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 246,24 ,'02' ,'17' ,'07',1,' Pampas Chico',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 247,24 ,'02' ,'17' ,'08',1,' Pararin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 248,24 ,'02' ,'17' ,'09',1,' Tapacocha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 249,24 ,'02' ,'17' ,'10',1,' Ticapampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 250,24 ,'02' ,'18' ,'00',1,' Santa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 251,24 ,'02' ,'18' ,'01',1,' Chimbote',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 252,24 ,'02' ,'18' ,'02',1,' Cáceres del Perú',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 253,24 ,'02' ,'18' ,'03',1,' Coishco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 254,24 ,'02' ,'18' ,'04',1,' Macate',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 255,24 ,'02' ,'18' ,'05',1,' Moro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 256,24 ,'02' ,'18' ,'06',1,' Nepeña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 257,24 ,'02' ,'18' ,'07',1,' Samanco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 258,24 ,'02' ,'18' ,'08',1,' Santa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 259,24 ,'02' ,'18' ,'09',1,' Nuevo Chimbote',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 260,24 ,'02' ,'19' ,'00',1,' Sihuas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 261,24 ,'02' ,'19' ,'01',1,' Sihuas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 262,24 ,'02' ,'19' ,'02',1,' Acobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 263,24 ,'02' ,'19' ,'03',1,' Alfonso Ugarte',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 264,24 ,'02' ,'19' ,'04',1,' Cashapampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 265,24 ,'02' ,'19' ,'05',1,' Chingalpo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 266,24 ,'02' ,'19' ,'06',1,' Huayllabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 267,24 ,'02' ,'19' ,'07',1,' Quiches',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 268,24 ,'02' ,'19' ,'08',1,' Ragash',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 269,24 ,'02' ,'19' ,'09',1,' San Juan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 270,24 ,'02' ,'19' ,'10',1,' Sicsibamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 271,24 ,'02' ,'20' ,'00',1,' Yungay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 272,24 ,'02' ,'20' ,'01',1,' Yungay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 273,24 ,'02' ,'20' ,'02',1,' Cascapara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 274,24 ,'02' ,'20' ,'03',1,' Mancos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 275,24 ,'02' ,'20' ,'04',1,' Matacoto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 276,24 ,'02' ,'20' ,'05',1,' Quillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 277,24 ,'02' ,'20' ,'06',1,' Ranrahirca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 278,24 ,'02' ,'20' ,'07',1,' Shupluy',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 279,24 ,'02' ,'20' ,'08',1,' Yanama',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 280,24 ,'03' ,'00' ,'00',1,' Apurímac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 281,24 ,'03' ,'01' ,'00',1,' Abancay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 282,24 ,'03' ,'01' ,'01',1,' Abancay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 283,24 ,'03' ,'01' ,'02',1,' Chacoche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 284,24 ,'03' ,'01' ,'03',1,' Circa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 285,24 ,'03' ,'01' ,'04',1,' Curahuasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 286,24 ,'03' ,'01' ,'05',1,' Huanipaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 287,24 ,'03' ,'01' ,'06',1,' Lambrama',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 288,24 ,'03' ,'01' ,'07',1,' Pichirhua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 289,24 ,'03' ,'01' ,'08',1,' San Pedro de Cachora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 290,24 ,'03' ,'01' ,'09',1,' Tamburco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 291,24 ,'03' ,'02' ,'00',1,' Andahuaylas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 292,24 ,'03' ,'02' ,'01',1,' Andahuaylas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 293,24 ,'03' ,'02' ,'02',1,' Andarapa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 294,24 ,'03' ,'02' ,'03',1,' Chiara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 295,24 ,'03' ,'02' ,'04',1,' Huancarama',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 296,24 ,'03' ,'02' ,'05',1,' Huancaray',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 297,24 ,'03' ,'02' ,'06',1,' Huayana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 298,24 ,'03' ,'02' ,'07',1,' Kishuara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 299,24 ,'03' ,'02' ,'08',1,' Pacobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 300,24 ,'03' ,'02' ,'09',1,' Pacucha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 301,24 ,'03' ,'02' ,'10',1,' Pampachiri',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 302,24 ,'03' ,'02' ,'11',1,' Pomacocha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 303,24 ,'03' ,'02' ,'12',1,' San Antonio de Cachi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 304,24 ,'03' ,'02' ,'13',1,' San Jerónimo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 305,24 ,'03' ,'02' ,'14',1,' San Miguel de Chaccrampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 306,24 ,'03' ,'02' ,'15',1,' Santa María de Chicmo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 307,24 ,'03' ,'02' ,'16',1,' Talavera',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 308,24 ,'03' ,'02' ,'17',1,' Tumay Huaraca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 309,24 ,'03' ,'02' ,'18',1,' Turpo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 310,24 ,'03' ,'02' ,'19',1,' Kaquiabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 311,24 ,'03' ,'02' ,'20',1,' José María Arguedas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 312,24 ,'03' ,'03' ,'00',1,' Antabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 313,24 ,'03' ,'03' ,'01',1,' Antabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 314,24 ,'03' ,'03' ,'02',1,' El Oro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 315,24 ,'03' ,'03' ,'03',1,' Huaquirca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 316,24 ,'03' ,'03' ,'04',1,' Juan Espinoza Medrano',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 317,24 ,'03' ,'03' ,'05',1,' Oropesa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 318,24 ,'03' ,'03' ,'06',1,' Pachaconas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 319,24 ,'03' ,'03' ,'07',1,' Sabaino',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 320,24 ,'03' ,'04' ,'00',1,' Aymaraes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 321,24 ,'03' ,'04' ,'01',1,' Chalhuanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 322,24 ,'03' ,'04' ,'02',1,' Capaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 323,24 ,'03' ,'04' ,'03',1,' Caraybamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 324,24 ,'03' ,'04' ,'04',1,' Chapimarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 325,24 ,'03' ,'04' ,'05',1,' Colcabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 326,24 ,'03' ,'04' ,'06',1,' Cotaruse',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 327,24 ,'03' ,'04' ,'07',1,' Huayllo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 328,24 ,'03' ,'04' ,'08',1,' Justo Apu Sahuaraura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 329,24 ,'03' ,'04' ,'09',1,' Lucre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 330,24 ,'03' ,'04' ,'10',1,' Pocohuanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 331,24 ,'03' ,'04' ,'11',1,' San Juan de Chacña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 332,24 ,'03' ,'04' ,'12',1,' Sañayca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 333,24 ,'03' ,'04' ,'13',1,' Soraya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 334,24 ,'03' ,'04' ,'14',1,' Tapairihua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 335,24 ,'03' ,'04' ,'15',1,' Tintay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 336,24 ,'03' ,'04' ,'16',1,' Toraya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 337,24 ,'03' ,'04' ,'17',1,' Yanaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 338,24 ,'03' ,'05' ,'00',1,' Cotabambas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 339,24 ,'03' ,'05' ,'01',1,' Tambobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 340,24 ,'03' ,'05' ,'20',1,' Cotabambas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 341,24 ,'03' ,'05' ,'03',1,' Coyllurqui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 342,24 ,'03' ,'05' ,'04',1,' Haquira',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 343,24 ,'03' ,'05' ,'05',1,' Mara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 344,24 ,'03' ,'05' ,'06',1,' Challhuahuacho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 345,24 ,'03' ,'06' ,'00',1,' Chincheros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 346,24 ,'03' ,'06' ,'01',1,' Chincheros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 347,24 ,'03' ,'06' ,'02',1,' Anco_Huallo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 348,24 ,'03' ,'06' ,'03',1,' Cocharcas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 349,24 ,'03' ,'06' ,'04',1,' Huaccana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 350,24 ,'03' ,'06' ,'05',1,' Ocobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 351,24 ,'03' ,'06' ,'06',1,' Ongoy',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 352,24 ,'03' ,'06' ,'07',1,' Uranmarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 353,24 ,'03' ,'06' ,'08',1,' Ranracancha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 354,24 ,'03' ,'07' ,'00',1,' Grau',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 355,24 ,'03' ,'07' ,'01',1,' Chuquibambilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 356,24 ,'03' ,'07' ,'02',1,' Curpahuasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 357,24 ,'03' ,'07' ,'03',1,' Gamarra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 358,24 ,'03' ,'07' ,'04',1,' Huayllati',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 359,24 ,'03' ,'07' ,'05',1,' Mamara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 360,24 ,'03' ,'07' ,'06',1,' Micaela Bastidas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 361,24 ,'03' ,'07' ,'07',1,' Pataypampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 362,24 ,'03' ,'07' ,'08',1,' Progreso',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 363,24 ,'03' ,'07' ,'09',1,' San Antonio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 364,24 ,'03' ,'07' ,'10',1,' Santa Rosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 365,24 ,'03' ,'07' ,'11',1,' Turpay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 366,24 ,'03' ,'07' ,'12',1,' Vilcabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 367,24 ,'03' ,'07' ,'13',1,' Virundo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 368,24 ,'03' ,'07' ,'14',1,' Curasco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 369,24 ,'04' ,'00' ,'00',1,' Arequipa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 370,24 ,'04' ,'01' ,'00',1,' Arequipa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 371,24 ,'04' ,'01' ,'01',1,' Arequipa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 372,24 ,'04' ,'01' ,'02',1,' Alto Selva Alegre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 373,24 ,'04' ,'01' ,'03',1,' Cayma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 374,24 ,'04' ,'01' ,'04',1,' Cerro Colorado',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 375,24 ,'04' ,'01' ,'05',1,' Characato',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 376,24 ,'04' ,'01' ,'06',1,' Chiguata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 377,24 ,'04' ,'01' ,'07',1,' Jacobo Hunter',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 378,24 ,'04' ,'01' ,'08',1,' La Joya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 379,24 ,'04' ,'01' ,'09',1,' Mariano Melgar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 380,24 ,'04' ,'01' ,'10',1,' Miraflores',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 381,24 ,'04' ,'01' ,'11',1,' Mollebaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 382,24 ,'04' ,'01' ,'12',1,' Paucarpata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 383,24 ,'04' ,'01' ,'13',1,' Pocsi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 384,24 ,'04' ,'01' ,'14',1,' Polobaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 385,24 ,'04' ,'01' ,'15',1,' Quequeña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 386,24 ,'04' ,'01' ,'16',1,' Sabandia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 387,24 ,'04' ,'01' ,'17',1,' Sachaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 388,24 ,'04' ,'01' ,'18',1,' San Juan de Siguas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 389,24 ,'04' ,'01' ,'19',1,' San Juan de Tarucani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 390,24 ,'04' ,'01' ,'20',1,' Santa Isabel de Siguas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 391,24 ,'04' ,'01' ,'21',1,' Santa Rita de Siguas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 392,24 ,'04' ,'01' ,'22',1,' Socabaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 393,24 ,'04' ,'01' ,'23',1,' Tiabaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 394,24 ,'04' ,'01' ,'24',1,' Uchumayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 395,24 ,'04' ,'01' ,'25',1,' Vitor',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 396,24 ,'04' ,'01' ,'26',1,' Yanahuara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 397,24 ,'04' ,'01' ,'27',1,' Yarabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 398,24 ,'04' ,'01' ,'28',1,' Yura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 399,24 ,'04' ,'01' ,'29',1,' José Luis Bustamante Y Rivero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 400,24 ,'04' ,'02' ,'00',1,' Camaná',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 401,24 ,'04' ,'02' ,'01',1,' Camaná',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 402,24 ,'04' ,'02' ,'02',1,' José María Quimper',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 403,24 ,'04' ,'02' ,'03',1,' Mariano Nicolás Valcárcel',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 404,24 ,'04' ,'02' ,'04',1,' Mariscal Cáceres',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 405,24 ,'04' ,'02' ,'05',1,' Nicolás de Pierola',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 406,24 ,'04' ,'02' ,'06',1,' Ocoña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 407,24 ,'04' ,'02' ,'07',1,' Quilca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 408,24 ,'04' ,'02' ,'08',1,' Samuel Pastor',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 409,24 ,'04' ,'03' ,'00',1,' Caravelí',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 410,24 ,'04' ,'03' ,'01',1,' Caravelí',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 411,24 ,'04' ,'03' ,'02',1,' Acarí',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 412,24 ,'04' ,'03' ,'03',1,' Atico',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 413,24 ,'04' ,'03' ,'04',1,' Atiquipa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 414,24 ,'04' ,'03' ,'05',1,' Bella Unión',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 415,24 ,'04' ,'03' ,'06',1,' Cahuacho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 416,24 ,'04' ,'03' ,'07',1,' Chala',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 417,24 ,'04' ,'03' ,'08',1,' Chaparra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 418,24 ,'04' ,'03' ,'09',1,' Huanuhuanu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 419,24 ,'04' ,'03' ,'10',1,' Jaqui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 420,24 ,'04' ,'03' ,'11',1,' Lomas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 421,24 ,'04' ,'03' ,'12',1,' Quicacha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 422,24 ,'04' ,'03' ,'13',1,' Yauca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 423,24 ,'04' ,'04' ,'00',1,' Castilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 424,24 ,'04' ,'04' ,'01',1,' Aplao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 425,24 ,'04' ,'04' ,'02',1,' Andagua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 426,24 ,'04' ,'04' ,'03',1,' Ayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 427,24 ,'04' ,'04' ,'04',1,' Chachas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 428,24 ,'04' ,'04' ,'05',1,' Chilcaymarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 429,24 ,'04' ,'04' ,'06',1,' Choco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 430,24 ,'04' ,'04' ,'07',1,' Huancarqui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 431,24 ,'04' ,'04' ,'08',1,' Machaguay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 432,24 ,'04' ,'04' ,'09',1,' Orcopampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 433,24 ,'04' ,'04' ,'10',1,' Pampacolca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 434,24 ,'04' ,'04' ,'11',1,' Tipan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 435,24 ,'04' ,'04' ,'12',1,' Uñon',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 436,24 ,'04' ,'04' ,'13',1,' Uraca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 437,24 ,'04' ,'04' ,'14',1,' Viraco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 438,24 ,'04' ,'05' ,'00',1,' Caylloma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 439,24 ,'04' ,'05' ,'01',1,' Chivay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 440,24 ,'04' ,'05' ,'02',1,' Achoma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 441,24 ,'04' ,'05' ,'03',1,' Cabanaconde',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 442,24 ,'04' ,'05' ,'04',1,' Callalli',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 443,24 ,'04' ,'05' ,'05',1,' Caylloma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 444,24 ,'04' ,'05' ,'06',1,' Coporaque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 445,24 ,'04' ,'05' ,'07',1,' Huambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 446,24 ,'04' ,'05' ,'08',1,' Huanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 447,24 ,'04' ,'05' ,'09',1,' Ichupampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 448,24 ,'04' ,'05' ,'10',1,' Lari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 449,24 ,'04' ,'05' ,'11',1,' Lluta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 450,24 ,'04' ,'05' ,'12',1,' Maca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 451,24 ,'04' ,'05' ,'13',1,' Madrigal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 452,24 ,'04' ,'05' ,'14',1,' San Antonio de Chuca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 453,24 ,'04' ,'05' ,'15',1,' Sibayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 454,24 ,'04' ,'05' ,'16',1,' Tapay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 455,24 ,'04' ,'05' ,'17',1,' Tisco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 456,24 ,'04' ,'05' ,'18',1,' Tuti',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 457,24 ,'04' ,'05' ,'19',1,' Yanque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 458,24 ,'04' ,'05' ,'20',1,' Majes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 459,24 ,'04' ,'06' ,'00',1,' Condesuyos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 460,24 ,'04' ,'06' ,'01',1,' Chuquibamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 461,24 ,'04' ,'06' ,'02',1,' Andaray',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 462,24 ,'04' ,'06' ,'03',1,' Cayarani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 463,24 ,'04' ,'06' ,'04',1,' Chichas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 464,24 ,'04' ,'06' ,'05',1,' Iray',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 465,24 ,'04' ,'06' ,'06',1,' Río Grande',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 466,24 ,'04' ,'06' ,'07',1,' Salamanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 467,24 ,'04' ,'06' ,'08',1,' Yanaquihua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 468,24 ,'04' ,'07' ,'00',1,' Islay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 469,24 ,'04' ,'07' ,'01',1,' Mollendo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 470,24 ,'04' ,'07' ,'02',1,' Cocachacra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 471,24 ,'04' ,'07' ,'03',1,' Dean Valdivia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 472,24 ,'04' ,'07' ,'04',1,' Islay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 473,24 ,'04' ,'07' ,'05',1,' Mejia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 474,24 ,'04' ,'07' ,'06',1,' Punta de Bombón',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 475,24 ,'04' ,'08' ,'00',1,' La Uniòn',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 476,24 ,'04' ,'08' ,'01',1,' Cotahuasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 477,24 ,'04' ,'08' ,'02',1,' Alca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 478,24 ,'04' ,'08' ,'03',1,' Charcana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 479,24 ,'04' ,'08' ,'04',1,' Huaynacotas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 480,24 ,'04' ,'08' ,'05',1,' Pampamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 481,24 ,'04' ,'08' ,'06',1,' Puyca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 482,24 ,'04' ,'08' ,'07',1,' Quechualla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 483,24 ,'04' ,'08' ,'08',1,' Sayla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 484,24 ,'04' ,'08' ,'09',1,' Tauria',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 485,24 ,'04' ,'08' ,'10',1,' Tomepampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 486,24 ,'04' ,'08' ,'11',1,' Toro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 487,24 ,'05' ,'00' ,'00',1,' Ayacucho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 488,24 ,'05' ,'01' ,'00',1,' Huamanga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 489,24 ,'05' ,'01' ,'01',1,' Ayacucho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 490,24 ,'05' ,'01' ,'02',1,' Acocro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 491,24 ,'05' ,'01' ,'03',1,' Acos Vinchos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 492,24 ,'05' ,'01' ,'04',1,' Carmen Alto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 493,24 ,'05' ,'01' ,'05',1,' Chiara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 494,24 ,'05' ,'01' ,'06',1,' Ocros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 495,24 ,'05' ,'01' ,'07',1,' Pacaycasa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 496,24 ,'05' ,'01' ,'08',1,' Quinua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 497,24 ,'05' ,'01' ,'09',1,' San José de Ticllas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 498,24 ,'05' ,'01' ,'10',1,' San Juan Bautista',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 499,24 ,'05' ,'01' ,'11',1,' Santiago de Pischa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 500,24 ,'05' ,'01' ,'12',1,' Socos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 501,24 ,'05' ,'01' ,'13',1,' Tambillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 502,24 ,'05' ,'01' ,'14',1,' Vinchos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 503,24 ,'05' ,'01' ,'15',1,' Jesús Nazareno',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 504,24 ,'05' ,'01' ,'16',1,' Andrés Avelino Cáceres Dorregaray',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 505,24 ,'05' ,'02' ,'00',1,' Cangallo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 506,24 ,'05' ,'02' ,'01',1,' Cangallo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 507,24 ,'05' ,'02' ,'02',1,' Chuschi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 508,24 ,'05' ,'02' ,'03',1,' Los Morochucos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 509,24 ,'05' ,'02' ,'04',1,' María Parado de Bellido',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 510,24 ,'05' ,'02' ,'05',1,' Paras',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 511,24 ,'05' ,'02' ,'06',1,' Totos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 512,24 ,'05' ,'03' ,'00',1,' Huanca Sancos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 513,24 ,'05' ,'03' ,'01',1,' Sancos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 514,24 ,'05' ,'03' ,'02',1,' Carapo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 515,24 ,'05' ,'03' ,'03',1,' Sacsamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 516,24 ,'05' ,'03' ,'04',1,' Santiago de Lucanamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 517,24 ,'05' ,'04' ,'00',1,' Huanta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 518,24 ,'05' ,'04' ,'01',1,' Huanta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 519,24 ,'05' ,'04' ,'02',1,' Ayahuanco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 520,24 ,'05' ,'04' ,'03',1,' Huamanguilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 521,24 ,'05' ,'04' ,'04',1,' Iguain',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 522,24 ,'05' ,'04' ,'05',1,' Luricocha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 523,24 ,'05' ,'04' ,'06',1,' Santillana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 524,24 ,'05' ,'04' ,'07',1,' Sivia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 525,24 ,'05' ,'04' ,'08',1,' Llochegua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 526,24 ,'05' ,'04' ,'09',1,' Canayre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 527,24 ,'05' ,'04' ,'10',1,' Uchuraccay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 528,24 ,'05' ,'04' ,'11',1,' Pucacolpa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 529,24 ,'05' ,'05' ,'00',1,' La Mar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 530,24 ,'05' ,'05' ,'01',1,' San Miguel',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 531,24 ,'05' ,'05' ,'02',1,' Anco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 532,24 ,'05' ,'05' ,'03',1,' Ayna',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 533,24 ,'05' ,'05' ,'04',1,' Chilcas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 534,24 ,'05' ,'05' ,'05',1,' Chungui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 535,24 ,'05' ,'05' ,'06',1,' Luis Carranza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 536,24 ,'05' ,'05' ,'07',1,' Santa Rosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 537,24 ,'05' ,'05' ,'08',1,' Tambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 538,24 ,'05' ,'05' ,'09',1,' Samugari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 539,24 ,'05' ,'05' ,'10',1,' Anchihuay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 540,24 ,'05' ,'06' ,'00',1,' Lucanas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 541,24 ,'05' ,'06' ,'01',1,' Puquio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 542,24 ,'05' ,'06' ,'02',1,' Aucara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 543,24 ,'05' ,'06' ,'03',1,' Cabana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 544,24 ,'05' ,'06' ,'04',1,' Carmen Salcedo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 545,24 ,'05' ,'06' ,'05',1,' Chaviña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 546,24 ,'05' ,'06' ,'06',1,' Chipao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 547,24 ,'05' ,'06' ,'07',1,' Huac-Huas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 548,24 ,'05' ,'06' ,'08',1,' Laramate',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 549,24 ,'05' ,'06' ,'09',1,' Leoncio Prado',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 550,24 ,'05' ,'06' ,'10',1,' Llauta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 551,24 ,'05' ,'06' ,'11',1,' Lucanas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 552,24 ,'05' ,'06' ,'12',1,' Ocaña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 553,24 ,'05' ,'06' ,'13',1,' Otoca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 554,24 ,'05' ,'06' ,'14',1,' Saisa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 555,24 ,'05' ,'06' ,'15',1,' San Cristóbal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 556,24 ,'05' ,'06' ,'16',1,' San Juan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 557,24 ,'05' ,'06' ,'17',1,' San Pedro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 558,24 ,'05' ,'06' ,'18',1,' San Pedro de Palco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 559,24 ,'05' ,'06' ,'19',1,' Sancos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 560,24 ,'05' ,'06' ,'20',1,' Santa Ana de Huaycahuacho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 561,24 ,'05' ,'06' ,'21',1,' Santa Lucia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 562,24 ,'05' ,'07' ,'00',1,' Parinacochas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 563,24 ,'05' ,'07' ,'01',1,' Coracora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 564,24 ,'05' ,'07' ,'02',1,' Chumpi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 565,24 ,'05' ,'07' ,'03',1,' Coronel Castañeda',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 566,24 ,'05' ,'07' ,'04',1,' Pacapausa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 567,24 ,'05' ,'07' ,'05',1,' Pullo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 568,24 ,'05' ,'07' ,'06',1,' Puyusca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 569,24 ,'05' ,'07' ,'07',1,' San Francisco de Ravacayco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 570,24 ,'05' ,'07' ,'08',1,' Upahuacho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 571,24 ,'05' ,'08' ,'00',1,' Pàucar del Sara Sara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 572,24 ,'05' ,'08' ,'01',1,' Pausa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 573,24 ,'05' ,'08' ,'02',1,' Colta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 574,24 ,'05' ,'08' ,'03',1,' Corculla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 575,24 ,'05' ,'08' ,'04',1,' Lampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 576,24 ,'05' ,'08' ,'05',1,' Marcabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 577,24 ,'05' ,'08' ,'06',1,' Oyolo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 578,24 ,'05' ,'08' ,'07',1,' Pararca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 579,24 ,'05' ,'08' ,'08',1,' San Javier de Alpabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 580,24 ,'05' ,'08' ,'09',1,' San José de Ushua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 581,24 ,'05' ,'08' ,'10',1,' Sara Sara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 582,24 ,'05' ,'09' ,'00',1,' Sucre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 583,24 ,'05' ,'09' ,'01',1,' Querobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 584,24 ,'05' ,'09' ,'02',1,' Belén',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 585,24 ,'05' ,'09' ,'03',1,' Chalcos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 586,24 ,'05' ,'09' ,'04',1,' Chilcayoc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 587,24 ,'05' ,'09' ,'05',1,' Huacaña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 588,24 ,'05' ,'09' ,'06',1,' Morcolla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 589,24 ,'05' ,'09' ,'07',1,' Paico',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 590,24 ,'05' ,'09' ,'08',1,' San Pedro de Larcay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 591,24 ,'05' ,'09' ,'09',1,' San Salvador de Quije',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 592,24 ,'05' ,'09' ,'10',1,' Santiago de Paucaray',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 593,24 ,'05' ,'09' ,'11',1,' Soras',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 594,24 ,'05' ,'10' ,'00',1,' Víctor Fajardo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 595,24 ,'05' ,'10' ,'01',1,' Huancapi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 596,24 ,'05' ,'10' ,'02',1,' Alcamenca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 597,24 ,'05' ,'10' ,'03',1,' Apongo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 598,24 ,'05' ,'10' ,'04',1,' Asquipata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 599,24 ,'05' ,'10' ,'05',1,' Canaria',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 600,24 ,'05' ,'10' ,'06',1,' Cayara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 601,24 ,'05' ,'10' ,'07',1,' Colca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 602,24 ,'05' ,'10' ,'08',1,' Huamanquiquia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 603,24 ,'05' ,'10' ,'09',1,' Huancaraylla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 604,24 ,'05' ,'10' ,'10',1,' Huaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 605,24 ,'05' ,'10' ,'11',1,' Sarhua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 606,24 ,'05' ,'10' ,'12',1,' Vilcanchos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 607,24 ,'05' ,'11' ,'00',1,' ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 608,24 ,'05' ,'11' ,'01',1,' Vilcas Huaman',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 609,24 ,'05' ,'11' ,'02',1,' Accomarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 610,24 ,'05' ,'11' ,'03',1,' Carhuanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 611,24 ,'05' ,'11' ,'04',1,' Concepción',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 612,24 ,'05' ,'11' ,'05',1,' Huambalpa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 613,24 ,'05' ,'11' ,'06',1,' Independencia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 614,24 ,'05' ,'11' ,'07',1,' Saurama',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 615,24 ,'05' ,'11' ,'08',1,' Vischongo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 616,24 ,'06' ,'00' ,'00',1,' Cajamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 617,24 ,'06' ,'01' ,'00',1,' Cajamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 618,24 ,'06' ,'01' ,'01',1,' Cajamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 619,24 ,'06' ,'01' ,'02',1,' Asunción',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 620,24 ,'06' ,'01' ,'03',1,' Chetilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 621,24 ,'06' ,'01' ,'04',1,' Cospan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 622,24 ,'06' ,'01' ,'05',1,' Encañada',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 623,24 ,'06' ,'01' ,'06',1,' Jesús',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 624,24 ,'06' ,'01' ,'07',1,' Llacanora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 625,24 ,'06' ,'01' ,'08',1,' Los Baños del Inca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 626,24 ,'06' ,'01' ,'09',1,' Magdalena',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 627,24 ,'06' ,'01' ,'10',1,' Matara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 628,24 ,'06' ,'01' ,'11',1,' Namora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 629,24 ,'06' ,'01' ,'12',1,' San Juan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 630,24 ,'06' ,'02' ,'00',1,' Cajabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 631,24 ,'06' ,'02' ,'01',1,' Cajabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 632,24 ,'06' ,'02' ,'02',1,' Cachachi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 633,24 ,'06' ,'02' ,'03',1,' Condebamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 634,24 ,'06' ,'02' ,'04',1,' Sitacocha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 635,24 ,'06' ,'03' ,'00',1,' Celendín',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 636,24 ,'06' ,'03' ,'01',1,' Celendín',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 637,24 ,'06' ,'03' ,'02',1,' Chumuch',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 638,24 ,'06' ,'03' ,'03',1,' Cortegana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 639,24 ,'06' ,'03' ,'04',1,' Huasmin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 640,24 ,'06' ,'03' ,'05',1,' Jorge Chávez',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 641,24 ,'06' ,'03' ,'06',1,' José Gálvez',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 642,24 ,'06' ,'03' ,'07',1,' Miguel Iglesias',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 643,24 ,'06' ,'03' ,'08',1,' Oxamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 644,24 ,'06' ,'03' ,'09',1,' Sorochuco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 645,24 ,'06' ,'03' ,'10',1,' Sucre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 646,24 ,'06' ,'03' ,'11',1,' Utco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 647,24 ,'06' ,'03' ,'12',1,' La Libertad de Pallan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 648,24 ,'06' ,'04' ,'00',1,' Chota',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 649,24 ,'06' ,'04' ,'01',1,' Chota',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 650,24 ,'06' ,'04' ,'02',1,' Anguia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 651,24 ,'06' ,'04' ,'03',1,' Chadin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 652,24 ,'06' ,'04' ,'04',1,' Chiguirip',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 653,24 ,'06' ,'04' ,'05',1,' Chimban',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 654,24 ,'06' ,'04' ,'06',1,' Choropampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 655,24 ,'06' ,'04' ,'07',1,' Cochabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 656,24 ,'06' ,'04' ,'08',1,' Conchan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 657,24 ,'06' ,'04' ,'09',1,' Huambos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 658,24 ,'06' ,'04' ,'10',1,' Lajas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 659,24 ,'06' ,'04' ,'11',1,' Llama',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 660,24 ,'06' ,'04' ,'12',1,' Miracosta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 661,24 ,'06' ,'04' ,'13',1,' Paccha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 662,24 ,'06' ,'04' ,'14',1,' Pion',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 663,24 ,'06' ,'04' ,'15',1,' Querocoto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 664,24 ,'06' ,'04' ,'16',1,' San Juan de Licupis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 665,24 ,'06' ,'04' ,'17',1,' Tacabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 666,24 ,'06' ,'04' ,'18',1,' Tocmoche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 667,24 ,'06' ,'04' ,'19',1,' Chalamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 668,24 ,'06' ,'05' ,'00',1,' Contumazá',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 669,24 ,'06' ,'05' ,'01',1,' Contumaza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 670,24 ,'06' ,'05' ,'02',1,' Chilete',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 671,24 ,'06' ,'05' ,'03',1,' Cupisnique',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 672,24 ,'06' ,'05' ,'04',1,' Guzmango',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 673,24 ,'06' ,'05' ,'05',1,' San Benito',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 674,24 ,'06' ,'05' ,'06',1,' Santa Cruz de Toledo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 675,24 ,'06' ,'05' ,'07',1,' Tantarica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 676,24 ,'06' ,'05' ,'08',1,' Yonan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 677,24 ,'06' ,'06' ,'00',1,' Cutervo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 678,24 ,'06' ,'06' ,'01',1,' Cutervo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 679,24 ,'06' ,'06' ,'02',1,' Callayuc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 680,24 ,'06' ,'06' ,'03',1,' Choros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 681,24 ,'06' ,'06' ,'04',1,' Cujillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 682,24 ,'06' ,'06' ,'05',1,' La Ramada',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 683,24 ,'06' ,'06' ,'06',1,' Pimpingos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 684,24 ,'06' ,'06' ,'07',1,' Querocotillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 685,24 ,'06' ,'06' ,'08',1,' San Andrés de Cutervo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 686,24 ,'06' ,'06' ,'09',1,' San Juan de Cutervo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 687,24 ,'06' ,'06' ,'10',1,' San Luis de Lucma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 688,24 ,'06' ,'06' ,'11',1,' Santa Cruz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 689,24 ,'06' ,'06' ,'12',1,' Santo Domingo de la Capilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 690,24 ,'06' ,'06' ,'13',1,' Santo Tomas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 691,24 ,'06' ,'06' ,'14',1,' Socota',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 692,24 ,'06' ,'06' ,'15',1,' Toribio Casanova',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 693,24 ,'06' ,'06' ,'00',1,' Hualgayoc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 694,24 ,'06' ,'07' ,'01',1,' Bambamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 695,24 ,'06' ,'07' ,'02',1,' Chugur',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 696,24 ,'06' ,'07' ,'03',1,' Hualgayoc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 697,24 ,'06' ,'08' ,'00',1,' Jaén',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 698,24 ,'06' ,'08' ,'01',1,' Jaén',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 699,24 ,'06' ,'08' ,'02',1,' Bellavista',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 700,24 ,'06' ,'08' ,'03',1,' Chontali',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 701,24 ,'06' ,'08' ,'04',1,' Colasay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 702,24 ,'06' ,'08' ,'05',1,' Huabal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 703,24 ,'06' ,'08' ,'06',1,' Las Pirias',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 704,24 ,'06' ,'08' ,'07',1,' Pomahuaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 705,24 ,'06' ,'08' ,'08',1,' Pucara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 706,24 ,'06' ,'08' ,'09',1,' Sallique',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 707,24 ,'06' ,'08' ,'10',1,' San Felipe',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 708,24 ,'06' ,'08' ,'11',1,' San José del Alto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 709,24 ,'06' ,'08' ,'12',1,' Santa Rosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 710,24 ,'06' ,'09' ,'00',1,' San Ignacio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 711,24 ,'06' ,'09' ,'01',1,' San Ignacio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 712,24 ,'06' ,'09' ,'02',1,' Chirinos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 713,24 ,'06' ,'09' ,'03',1,' Huarango',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 714,24 ,'06' ,'09' ,'04',1,' La Coipa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 715,24 ,'06' ,'09' ,'05',1,' Namballe',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 716,24 ,'06' ,'09' ,'06',1,' San José de Lourdes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 717,24 ,'06' ,'09' ,'07',1,' Tabaconas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 718,24 ,'06' ,'10' ,'00',1,' San Marcos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 719,24 ,'06' ,'10' ,'01',1,' Pedro Gálvez',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 720,24 ,'06' ,'10' ,'02',1,' Chancay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 721,24 ,'06' ,'10' ,'03',1,' Eduardo Villanueva',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 722,24 ,'06' ,'10' ,'04',1,' Gregorio Pita',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 723,24 ,'06' ,'10' ,'05',1,' Ichocan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 724,24 ,'06' ,'10' ,'06',1,' José Manuel Quiroz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 725,24 ,'06' ,'10' ,'07',1,' José Sabogal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 726,24 ,'06' ,'11' ,'00',1,' San Miguel',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 727,24 ,'06' ,'11' ,'01',1,' San Miguel',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 728,24 ,'06' ,'11' ,'02',1,' Bolívar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 729,24 ,'06' ,'11' ,'03',1,' Calquis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 730,24 ,'06' ,'11' ,'04',1,' Catilluc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 731,24 ,'06' ,'11' ,'05',1,' El Prado',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 732,24 ,'06' ,'11' ,'06',1,' La Florida',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 733,24 ,'06' ,'11' ,'07',1,' Llapa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 734,24 ,'06' ,'11' ,'08',1,' Nanchoc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 735,24 ,'06' ,'11' ,'09',1,' Niepos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 736,24 ,'06' ,'11' ,'10',1,' San Gregorio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 737,24 ,'06' ,'11' ,'11',1,' San Silvestre de Cochan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 738,24 ,'06' ,'11' ,'12',1,' Tongod',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 739,24 ,'06' ,'11' ,'13',1,' Unión Agua Blanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 740,24 ,'06' ,'12' ,'00',1,' San Pablo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 741,24 ,'06' ,'12' ,'01',1,' San Pablo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 742,24 ,'06' ,'12' ,'02',1,' San Bernardino',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 743,24 ,'06' ,'12' ,'03',1,' San Luis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 744,24 ,'06' ,'12' ,'04',1,' Tumbaden',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 745,24 ,'06' ,'13' ,'00',1,' Santa Cruz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 746,24 ,'06' ,'13' ,'01',1,' Santa Cruz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 747,24 ,'06' ,'13' ,'02',1,' Andabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 748,24 ,'06' ,'13' ,'03',1,' Catache',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 749,24 ,'06' ,'13' ,'04',1,' Chancaybaños',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 750,24 ,'06' ,'13' ,'05',1,' La Esperanza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 751,24 ,'06' ,'13' ,'06',1,' Ninabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 752,24 ,'06' ,'13' ,'07',1,' Pulan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 753,24 ,'06' ,'13' ,'08',1,' Saucepampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 754,24 ,'06' ,'13' ,'09',1,' Sexi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 755,24 ,'06' ,'13' ,'10',1,' Uticyacu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 756,24 ,'06' ,'13' ,'11',1,' Yauyucan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 757,24 ,'07' ,'00' ,'00',1,' Callao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 758,24 ,'07' ,'01' ,'00',1,' Prov. Const. del Callao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 759,24 ,'07' ,'01' ,'01',1,' Callao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 760,24 ,'07' ,'01' ,'02',1,' Bellavista',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 761,24 ,'07' ,'01' ,'03',1,' Carmen de la Legua Reynoso',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 762,24 ,'07' ,'01' ,'04',1,' La Perla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 763,24 ,'07' ,'01' ,'05',1,' La Punta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 764,24 ,'07' ,'01' ,'06',1,' Ventanilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 765,24 ,'07' ,'01' ,'07',1,' Mi Perú',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 766,24 ,'08' ,'00' ,'08',1,' Cusco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 767,24 ,'08' ,'01' ,'00',1,' Cusco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 768,24 ,'08' ,'01' ,'01',1,' Cusco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 769,24 ,'08' ,'01' ,'02',1,' Ccorca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 770,24 ,'08' ,'01' ,'03',1,' Poroy',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 771,24 ,'08' ,'01' ,'04',1,' San Jerónimo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 772,24 ,'08' ,'01' ,'05',1,' San Sebastian',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 773,24 ,'08' ,'01' ,'06',1,' Santiago',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 774,24 ,'08' ,'01' ,'07',1,' Saylla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 775,24 ,'08' ,'01' ,'08',1,' Wanchaq',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 776,24 ,'08' ,'02' ,'00',1,' Acomayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 777,24 ,'08' ,'02' ,'01',1,' Acomayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 778,24 ,'08' ,'02' ,'02',1,' Acopia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 779,24 ,'08' ,'02' ,'03',1,' Acos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 780,24 ,'08' ,'02' ,'04',1,' Mosoc Llacta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 781,24 ,'08' ,'02' ,'05',1,' Pomacanchi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 782,24 ,'08' ,'02' ,'06',1,' Rondocan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 783,24 ,'08' ,'02' ,'07',1,' Sangarara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 784,24 ,'08' ,'03' ,'00',1,' Anta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 785,24 ,'08' ,'03' ,'01',1,' Anta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 786,24 ,'08' ,'03' ,'02',1,' Ancahuasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 787,24 ,'08' ,'03' ,'03',1,' Cachimayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 788,24 ,'08' ,'03' ,'04',1,' Chinchaypujio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 789,24 ,'08' ,'03' ,'05',1,' Huarocondo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 790,24 ,'08' ,'03' ,'06',1,' Limatambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 791,24 ,'08' ,'03' ,'07',1,' Mollepata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 792,24 ,'08' ,'03' ,'08',1,' Pucyura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 793,24 ,'08' ,'03' ,'09',1,' Zurite',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 794,24 ,'08' ,'04' ,'00',1,' Calca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 795,24 ,'08' ,'04' ,'01',1,' Calca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 796,24 ,'08' ,'04' ,'02',1,' Coya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 797,24 ,'08' ,'04' ,'03',1,' Lamay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 798,24 ,'08' ,'04' ,'04',1,' Lares',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 799,24 ,'08' ,'04' ,'05',1,' Pisac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 800,24 ,'08' ,'04' ,'06',1,' San Salvador',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 801,24 ,'08' ,'04' ,'07',1,' Taray',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 802,24 ,'08' ,'04' ,'08',1,' Yanatile',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 803,24 ,'08' ,'05' ,'00',1,' Canas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 804,24 ,'08' ,'05' ,'01',1,' Yanaoca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 805,24 ,'08' ,'05' ,'02',1,' Checca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 806,24 ,'08' ,'05' ,'03',1,' Kunturkanki',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 807,24 ,'08' ,'05' ,'04',1,' Langui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 808,24 ,'08' ,'05' ,'05',1,' Layo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 809,24 ,'08' ,'05' ,'06',1,' Pampamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 810,24 ,'08' ,'05' ,'07',1,' Quehue',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 811,24 ,'08' ,'05' ,'08',1,' Tupac Amaru',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 812,24 ,'08' ,'06' ,'00',1,' Canchis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 813,24 ,'08' ,'06' ,'01',1,' Sicuani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 814,24 ,'08' ,'06' ,'02',1,' Checacupe',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 815,24 ,'08' ,'06' ,'03',1,' Combapata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 816,24 ,'08' ,'06' ,'04',1,' Marangani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 817,24 ,'08' ,'06' ,'05',1,' Pitumarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 818,24 ,'08' ,'06' ,'06',1,' San Pablo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 819,24 ,'08' ,'06' ,'07',1,' San Pedro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 820,24 ,'08' ,'06' ,'08',1,' Tinta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 821,24 ,'08' ,'07' ,'00',1,' Chumbivilcas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 822,24 ,'08' ,'07' ,'01',1,' Santo Tomas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 823,24 ,'08' ,'07' ,'02',1,' Capacmarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 824,24 ,'08' ,'07' ,'03',1,' Chamaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 825,24 ,'08' ,'07' ,'04',1,' Colquemarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 826,24 ,'08' ,'07' ,'05',1,' Livitaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 827,24 ,'08' ,'07' ,'06',1,' Llusco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 828,24 ,'08' ,'07' ,'07',1,' Quiñota',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 829,24 ,'08' ,'07' ,'08',1,' Velille',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 830,24 ,'08' ,'08' ,'00',1,' Espinar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 831,24 ,'08' ,'08' ,'01',1,' Espinar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 832,24 ,'08' ,'08' ,'02',1,' Condoroma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 833,24 ,'08' ,'08' ,'03',1,' Coporaque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 834,24 ,'08' ,'08' ,'04',1,' Ocoruro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 835,24 ,'08' ,'08' ,'05',1,' Pallpata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 836,24 ,'08' ,'08' ,'06',1,' Pichigua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 837,24 ,'08' ,'08' ,'07',1,' Suyckutambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 838,24 ,'08' ,'08' ,'08',1,' Alto Pichigua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 839,24 ,'08' ,'09' ,'00',1,' La Convención',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 840,24 ,'08' ,'09' ,'01',1,' Santa Ana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 841,24 ,'08' ,'09' ,'02',1,' Echarate',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 842,24 ,'08' ,'09' ,'03',1,' Huayopata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 843,24 ,'08' ,'09' ,'04',1,' Maranura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 844,24 ,'08' ,'09' ,'05',1,' Ocobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 845,24 ,'08' ,'09' ,'06',1,' Quellouno',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 846,24 ,'08' ,'09' ,'07',1,' Kimbiri',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 847,24 ,'08' ,'09' ,'08',1,' Santa Teresa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 848,24 ,'08' ,'09' ,'09',1,' Vilcabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 849,24 ,'08' ,'09' ,'10',1,' Pichari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 850,24 ,'08' ,'09' ,'11',1,' Inkawasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 851,24 ,'08' ,'09' ,'12',1,' Villa Virgen',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 852,24 ,'08' ,'09' ,'13',1,' Villa Kintiarina',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 853,24 ,'08' ,'10' ,'00',1,' Paruro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 854,24 ,'08' ,'10' ,'01',1,' Paruro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 855,24 ,'08' ,'10' ,'02',1,' Accha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 856,24 ,'08' ,'10' ,'03',1,' Ccapi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 857,24 ,'08' ,'10' ,'04',1,' Colcha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 858,24 ,'08' ,'10' ,'05',1,' Huanoquite',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 859,24 ,'08' ,'10' ,'06',1,' Omacha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 860,24 ,'08' ,'10' ,'07',1,' Paccaritambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 861,24 ,'08' ,'10' ,'08',1,' Pillpinto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 862,24 ,'08' ,'11' ,'09',1,' Yaurisque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 863,24 ,'08' ,'11' ,'00',1,' Paucartambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 864,24 ,'08' ,'11' ,'01',1,' Paucartambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 865,24 ,'08' ,'11' ,'02',1,' Caicay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 866,24 ,'08' ,'11' ,'03',1,' Challabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 867,24 ,'08' ,'11' ,'04',1,' Colquepata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 868,24 ,'08' ,'11' ,'05',1,' Huancarani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 869,24 ,'08' ,'11' ,'06',1,' Kosñipata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 870,24 ,'08' ,'12' ,'00',1,' Quispicanchi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 871,24 ,'08' ,'12' ,'01',1,' Urcos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 872,24 ,'08' ,'12' ,'02',1,' Andahuaylillas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 873,24 ,'08' ,'12' ,'03',1,' Camanti',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 874,24 ,'08' ,'12' ,'04',1,' Ccarhuayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 875,24 ,'08' ,'12' ,'05',1,' Ccatca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 876,24 ,'08' ,'12' ,'06',1,' Cusipata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 877,24 ,'08' ,'12' ,'07',1,' Huaro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 878,24 ,'08' ,'12' ,'08',1,' Lucre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 879,24 ,'08' ,'12' ,'09',1,' Marcapata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 880,24 ,'08' ,'12' ,'10',1,' Ocongate',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 881,24 ,'08' ,'12' ,'11',1,' Oropesa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 882,24 ,'08' ,'12' ,'12',1,' Quiquijana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 883,24 ,'08' ,'13' ,'00',1,' Urubamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 884,24 ,'08' ,'13' ,'01',1,' Urubamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 885,24 ,'08' ,'13' ,'02',1,' Chinchero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 886,24 ,'08' ,'13' ,'03',1,' Huayllabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 887,24 ,'08' ,'13' ,'04',1,' Machupicchu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 888,24 ,'08' ,'13' ,'05',1,' Maras',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 889,24 ,'08' ,'13' ,'06',1,' Ollantaytambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 890,24 ,'08' ,'13' ,'07',1,' Yucay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 891,24 ,'09' ,'00' ,'00',1,' Huancavelica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 892,24 ,'09' ,'01' ,'00',1,' Huancavelica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 893,24 ,'09' ,'01' ,'01',1,' Huancavelica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 894,24 ,'09' ,'01' ,'02',1,' Acobambilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 895,24 ,'09' ,'01' ,'03',1,' Acoria',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 896,24 ,'09' ,'01' ,'04',1,' Conayca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 897,24 ,'09' ,'01' ,'05',1,' Cuenca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 898,24 ,'09' ,'01' ,'06',1,' Huachocolpa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 899,24 ,'09' ,'01' ,'07',1,' Huayllahuara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 900,24 ,'09' ,'01' ,'08',1,' Izcuchaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 901,24 ,'09' ,'01' ,'09',1,' Laria',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 902,24 ,'09' ,'01' ,'10',1,' Manta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 903,24 ,'09' ,'01' ,'11',1,' Mariscal Cáceres',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 904,24 ,'09' ,'01' ,'12',1,' Moya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 905,24 ,'09' ,'01' ,'13',1,' Nuevo Occoro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 906,24 ,'09' ,'01' ,'14',1,' Palca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 907,24 ,'09' ,'01' ,'15',1,' Pilchaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 908,24 ,'09' ,'01' ,'16',1,' Vilca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 909,24 ,'09' ,'01' ,'17',1,' Yauli',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 910,24 ,'09' ,'01' ,'18',1,' Ascensión',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 911,24 ,'09' ,'01' ,'19',1,' Huando',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 912,24 ,'09' ,'02' ,'00',1,' Acobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 913,24 ,'09' ,'02' ,'01',1,' Acobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 914,24 ,'09' ,'02' ,'02',1,' Andabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 915,24 ,'09' ,'02' ,'03',1,' Anta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 916,24 ,'09' ,'02' ,'04',1,' Caja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 917,24 ,'09' ,'02' ,'05',1,' Marcas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 918,24 ,'09' ,'02' ,'06',1,' Paucara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 919,24 ,'09' ,'02' ,'07',1,' Pomacocha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 920,24 ,'09' ,'02' ,'08',1,' Rosario',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 921,24 ,'09' ,'03' ,'00',1,' Angaraes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 922,24 ,'09' ,'03' ,'01',1,' Lircay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 923,24 ,'09' ,'03' ,'02',1,' Anchonga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 924,24 ,'09' ,'03' ,'03',1,' Callanmarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 925,24 ,'09' ,'03' ,'04',1,' Ccochaccasa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 926,24 ,'09' ,'03' ,'05',1,' Chincho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 927,24 ,'09' ,'03' ,'06',1,' Congalla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 928,24 ,'09' ,'03' ,'07',1,' Huanca-Huanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 929,24 ,'09' ,'03' ,'08',1,' Huayllay Grande',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 930,24 ,'09' ,'03' ,'09',1,' Julcamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 931,24 ,'09' ,'03' ,'10',1,' San Antonio de Antaparco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 932,24 ,'09' ,'03' ,'11',1,' Santo Tomas de Pata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 933,24 ,'09' ,'03' ,'12',1,' Secclla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 934,24 ,'09' ,'04' ,'00',1,' Castrovirreyna',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 935,24 ,'09' ,'04' ,'01',1,' Castrovirreyna',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 936,24 ,'09' ,'04' ,'02',1,' Arma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 937,24 ,'09' ,'04' ,'03',1,' Aurahua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 938,24 ,'09' ,'04' ,'04',1,' Capillas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 939,24 ,'09' ,'04' ,'05',1,' Chupamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 940,24 ,'09' ,'04' ,'06',1,' Cocas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 941,24 ,'09' ,'04' ,'07',1,' Huachos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 942,24 ,'09' ,'04' ,'08',1,' Huamatambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 943,24 ,'09' ,'04' ,'09',1,' Mollepampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 944,24 ,'09' ,'04' ,'10',1,' San Juan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 945,24 ,'09' ,'04' ,'11',1,' Santa Ana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 946,24 ,'09' ,'04' ,'12',1,' Tantara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 947,24 ,'09' ,'04' ,'13',1,' Ticrapo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 948,24 ,'09' ,'05' ,'00',1,' Churcampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 949,24 ,'09' ,'05' ,'01',1,' Churcampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 950,24 ,'09' ,'05' ,'02',1,' Anco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 951,24 ,'09' ,'05' ,'03',1,' Chinchihuasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 952,24 ,'09' ,'05' ,'04',1,' El Carmen',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 953,24 ,'09' ,'05' ,'05',1,' La Merced',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 954,24 ,'09' ,'05' ,'06',1,' Locroja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 955,24 ,'09' ,'05' ,'07',1,' Paucarbamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 956,24 ,'09' ,'05' ,'08',1,' San Miguel de Mayocc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 957,24 ,'09' ,'05' ,'09',1,' San Pedro de Coris',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 958,24 ,'09' ,'05' ,'10',1,' Pachamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 959,24 ,'09' ,'05' ,'11',1,' Cosme',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 960,24 ,'09' ,'06' ,'00',1,' Huaytará',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 961,24 ,'09' ,'06' ,'01',1,' Huaytara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 962,24 ,'09' ,'06' ,'02',1,' Ayavi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 963,24 ,'09' ,'06' ,'03',1,' Córdova',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 964,24 ,'09' ,'06' ,'04',1,' Huayacundo Arma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 965,24 ,'09' ,'06' ,'05',1,' Laramarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 966,24 ,'09' ,'06' ,'06',1,' Ocoyo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 967,24 ,'09' ,'06' ,'07',1,' Pilpichaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 968,24 ,'09' ,'06' ,'08',1,' Querco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 969,24 ,'09' ,'06' ,'09',1,' Quito-Arma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 970,24 ,'09' ,'06' ,'10',1,' San Antonio de Cusicancha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 971,24 ,'09' ,'06' ,'11',1,' San Francisco de Sangayaico',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 972,24 ,'09' ,'06' ,'12',1,' San Isidro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 973,24 ,'09' ,'06' ,'13',1,' Santiago de Chocorvos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 974,24 ,'09' ,'06' ,'14',1,' Santiago de Quirahuara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 975,24 ,'09' ,'06' ,'15',1,' Santo Domingo de Capillas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 976,24 ,'09' ,'06' ,'16',1,' Tambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 977,24 ,'09' ,'07' ,'00',1,' Tayacaja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 978,24 ,'09' ,'07' ,'01',1,' Pampas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 979,24 ,'09' ,'07' ,'02',1,' Acostambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 980,24 ,'09' ,'07' ,'03',1,' Acraquia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 981,24 ,'09' ,'07' ,'04',1,' Ahuaycha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 982,24 ,'09' ,'07' ,'05',1,' Colcabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 983,24 ,'09' ,'07' ,'06',1,' Daniel Hernández',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 984,24 ,'09' ,'07' ,'07',1,' Huachocolpa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 985,24 ,'09' ,'07' ,'09',1,' Huaribamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 986,24 ,'09' ,'07' ,'10',1,' Ñahuimpuquio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 987,24 ,'09' ,'07' ,'11',1,' Pazos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 988,24 ,'09' ,'07' ,'13',1,' Quishuar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 989,24 ,'09' ,'07' ,'14',1,' Salcabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 990,24 ,'09' ,'07' ,'15',1,' Salcahuasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 991,24 ,'09' ,'07' ,'16',1,' San Marcos de Rocchac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 992,24 ,'09' ,'07' ,'17',1,' Surcubamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 993,24 ,'09' ,'07' ,'18',1,' Tintay Puncu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 994,24 ,'09' ,'07' ,'19',1,' Quichuas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 995,24 ,'09' ,'07' ,'20',1,' Andaymarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 996,24 ,'10' ,'00' ,'00',1,' Huánuco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 997,24 ,'10' ,'01' ,'00',1,' Huánuco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 998,24 ,'10' ,'01' ,'01',1,' Huanuco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 999,24 ,'10' ,'01' ,'02',1,' Amarilis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1000,24 ,'10' ,'01' ,'03',1,' Chinchao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1001,24 ,'10' ,'01' ,'04',1,' Churubamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1002,24 ,'10' ,'01' ,'05',1,' Margos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1003,24 ,'10' ,'01' ,'06',1,' Quisqui (Kichki)',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1004,24 ,'10' ,'01' ,'07',1,' San Francisco de Cayran',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1005,24 ,'10' ,'01' ,'08',1,' San Pedro de Chaulan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1006,24 ,'10' ,'01' ,'09',1,' Santa María del Valle',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1007,24 ,'10' ,'01' ,'10',1,' Yarumayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1008,24 ,'10' ,'01' ,'11',1,' Pillco Marca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1009,24 ,'10' ,'01' ,'12',1,' Yacus',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1010,24 ,'10' ,'02' ,'00',1,' Ambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1011,24 ,'10' ,'02' ,'01',1,' Ambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1012,24 ,'10' ,'02' ,'02',1,' Cayna',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1013,24 ,'10' ,'02' ,'03',1,' Colpas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1014,24 ,'10' ,'02' ,'04',1,' Conchamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1015,24 ,'10' ,'02' ,'05',1,' Huacar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1016,24 ,'10' ,'02' ,'06',1,' San Francisco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1017,24 ,'10' ,'02' ,'07',1,' San Rafael',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1018,24 ,'10' ,'02' ,'08',1,' Tomay Kichwa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1019,24 ,'10' ,'03' ,'00',1,' Dos de Mayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1020,24 ,'10' ,'03' ,'01',1,' La Unión',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1021,24 ,'10' ,'03' ,'07',1,' Chuquis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1022,24 ,'10' ,'03' ,'11',1,' Marías',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1023,24 ,'10' ,'03' ,'13',1,' Pachas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1024,24 ,'10' ,'03' ,'16',1,' Quivilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1025,24 ,'10' ,'03' ,'17',1,' Ripan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1026,24 ,'10' ,'03' ,'21',1,' Shunqui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1027,24 ,'10' ,'03' ,'22',1,' Sillapata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1028,24 ,'10' ,'03' ,'23',1,' Yanas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1029,24 ,'10' ,'04' ,'00',1,' Huacaybamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1030,24 ,'10' ,'04' ,'01',1,' Huacaybamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1031,24 ,'10' ,'04' ,'02',1,' Canchabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1032,24 ,'10' ,'04' ,'03',1,' Cochabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1033,24 ,'10' ,'04' ,'04',1,' Pinra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1034,24 ,'10' ,'05' ,'00',1,' Huamalíes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1035,24 ,'10' ,'05' ,'01',1,' Llata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1036,24 ,'10' ,'05' ,'02',1,' Arancay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1037,24 ,'10' ,'05' ,'03',1,' Chavín de Pariarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1038,24 ,'10' ,'05' ,'04',1,' Jacas Grande',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1039,24 ,'10' ,'05' ,'05',1,' Jircan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1040,24 ,'10' ,'05' ,'06',1,' Miraflores',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1041,24 ,'10' ,'05' ,'07',1,' Monzón',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1042,24 ,'10' ,'05' ,'08',1,' Punchao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1043,24 ,'10' ,'05' ,'09',1,' Puños',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1044,24 ,'10' ,'05' ,'10',1,' Singa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1045,24 ,'10' ,'05' ,'11',1,' Tantamayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1046,24 ,'10' ,'06' ,'00',1,' Leoncio Prado',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1047,24 ,'10' ,'06' ,'01',1,' Rupa-Rupa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1048,24 ,'10' ,'06' ,'02',1,' Daniel Alomía Robles',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1049,24 ,'10' ,'06' ,'03',1,' Hermílio Valdizan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1050,24 ,'10' ,'06' ,'04',1,' José Crespo y Castillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1051,24 ,'10' ,'06' ,'05',1,' Luyando',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1052,24 ,'10' ,'06' ,'06',1,' Mariano Damaso Beraun',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1053,24 ,'10' ,'07' ,'00',1,' Marañón',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1054,24 ,'10' ,'07' ,'01',1,' Huacrachuco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1055,24 ,'10' ,'07' ,'02',1,' Cholon',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1056,24 ,'10' ,'07' ,'03',1,' San Buenaventura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1057,24 ,'10' ,'08' ,'00',1,' Pachitea',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1058,24 ,'10' ,'08' ,'01',1,' Panao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1059,24 ,'10' ,'08' ,'02',1,' Chaglla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1060,24 ,'10' ,'08' ,'03',1,' Molino',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1061,24 ,'10' ,'08' ,'04',1,' Umari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1062,24 ,'10' ,'09' ,'00',1,' Puerto Inca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1063,24 ,'10' ,'09' ,'01',1,' Puerto Inca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1064,24 ,'10' ,'09' ,'02',1,' Codo del Pozuzo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1065,24 ,'10' ,'09' ,'03',1,' Honoria',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1066,24 ,'10' ,'09' ,'04',1,' Tournavista',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1067,24 ,'10' ,'09' ,'05',1,' Yuyapichis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1068,24 ,'10' ,'10' ,'00',1,' Lauricocha ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1069,24 ,'10' ,'10' ,'01',1,' Jesús',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1070,24 ,'10' ,'10' ,'02',1,' Baños',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1071,24 ,'10' ,'10' ,'03',1,' Jivia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1072,24 ,'10' ,'10' ,'04',1,' Queropalca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1073,24 ,'10' ,'10' ,'05',1,' Rondos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1074,24 ,'10' ,'10' ,'06',1,' San Francisco de Asís',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1075,24 ,'10' ,'10' ,'07',1,' San Miguel de Cauri',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1076,24 ,'10' ,'11' ,'00',1,' Yarowilca ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1077,24 ,'10' ,'11' ,'01',1,' Chavinillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1078,24 ,'10' ,'11' ,'02',1,' Cahuac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1079,24 ,'10' ,'11' ,'03',1,' Chacabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1080,24 ,'10' ,'11' ,'04',1,' Aparicio Pomares',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1081,24 ,'10' ,'11' ,'05',1,' Jacas Chico',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1082,24 ,'10' ,'11' ,'06',1,' Obas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1083,24 ,'10' ,'11' ,'07',1,' Pampamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1084,24 ,'10' ,'11' ,'08',1,' Choras',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1085,24 ,'11' ,'00' ,'00',1,' Ica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1086,24 ,'11' ,'01' ,'00',1,' Ica ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1087,24 ,'11' ,'01' ,'01',1,' Ica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1088,24 ,'11' ,'01' ,'02',1,' La Tinguiña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1089,24 ,'11' ,'01' ,'03',1,' Los Aquijes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1090,24 ,'11' ,'01' ,'04',1,' Ocucaje',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1091,24 ,'11' ,'01' ,'05',1,' Pachacutec',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1092,24 ,'11' ,'01' ,'06',1,' Parcona',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1093,24 ,'11' ,'01' ,'07',1,' Pueblo Nuevo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1094,24 ,'11' ,'01' ,'08',1,' Salas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1095,24 ,'11' ,'01' ,'09',1,' San José de Los Molinos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1096,24 ,'11' ,'01' ,'10',1,' San Juan Bautista',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1097,24 ,'11' ,'01' ,'11',1,' Santiago',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1098,24 ,'11' ,'01' ,'12',1,' Subtanjalla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1099,24 ,'11' ,'01' ,'13',1,' Tate',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1100,24 ,'11' ,'01' ,'14',1,' Yauca del Rosario',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1101,24 ,'11' ,'02' ,'00',1,' Chincha ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1102,24 ,'11' ,'02' ,'01',1,' Chincha Alta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1103,24 ,'11' ,'02' ,'02',1,' Alto Laran',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1104,24 ,'11' ,'02' ,'03',1,' Chavin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1105,24 ,'11' ,'02' ,'04',1,' Chincha Baja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1106,24 ,'11' ,'02' ,'05',1,' El Carmen',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1107,24 ,'11' ,'02' ,'06',1,' Grocio Prado',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1108,24 ,'11' ,'02' ,'07',1,' Pueblo Nuevo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1109,24 ,'11' ,'02' ,'08',1,' San Juan de Yanac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1110,24 ,'11' ,'02' ,'09',1,' San Pedro de Huacarpana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1111,24 ,'11' ,'02' ,'10',1,' Sunampe',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1112,24 ,'11' ,'02' ,'11',1,' Tambo de Mora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1113,24 ,'11' ,'03' ,'00',1,' Nazca ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1114,24 ,'11' ,'03' ,'01',1,' Nasca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1115,24 ,'11' ,'03' ,'02',1,' Changuillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1116,24 ,'11' ,'03' ,'03',1,' El Ingenio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1117,24 ,'11' ,'03' ,'04',1,' Marcona',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1118,24 ,'11' ,'03' ,'05',1,' Vista Alegre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1119,24 ,'11' ,'04' ,'00',1,' Palpa ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1120,24 ,'11' ,'04' ,'01',1,' Palpa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1121,24 ,'11' ,'04' ,'02',1,' Llipata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1122,24 ,'11' ,'04' ,'03',1,' Río Grande',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1123,24 ,'11' ,'04' ,'04',1,' Santa Cruz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1124,24 ,'11' ,'04' ,'05',1,' Tibillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1125,24 ,'11' ,'05' ,'00',1,' Pisco ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1126,24 ,'11' ,'05' ,'01',1,' Pisco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1127,24 ,'11' ,'05' ,'02',1,' Huancano',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1128,24 ,'11' ,'05' ,'03',1,' Humay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1129,24 ,'11' ,'05' ,'04',1,' Independencia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1130,24 ,'11' ,'05' ,'05',1,' Paracas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1131,24 ,'11' ,'05' ,'06',1,' San Andrés',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1132,24 ,'11' ,'05' ,'07',1,' San Clemente',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1133,24 ,'11' ,'05' ,'08',1,' Tupac Amaru Inca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1134,24 ,'12' ,'00' ,'00',1,' Junín',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1135,24 ,'12' ,'01' ,'00',1,' Huancayo ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1136,24 ,'12' ,'01' ,'01',1,' Huancayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1137,24 ,'12' ,'01' ,'04',1,' Carhuacallanga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1138,24 ,'12' ,'01' ,'05',1,' Chacapampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1139,24 ,'12' ,'01' ,'06',1,' Chicche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1140,24 ,'12' ,'01' ,'07',1,' Chilca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1141,24 ,'12' ,'01' ,'08',1,' Chongos Alto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1142,24 ,'12' ,'01' ,'11',1,' Chupuro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1143,24 ,'12' ,'01' ,'12',1,' Colca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1144,24 ,'12' ,'01' ,'13',1,' Cullhuas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1145,24 ,'12' ,'01' ,'14',1,' El Tambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1146,24 ,'12' ,'01' ,'16',1,' Huacrapuquio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1147,24 ,'12' ,'01' ,'17',1,' Hualhuas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1148,24 ,'12' ,'01' ,'19',1,' Huancan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1149,24 ,'12' ,'01' ,'20',1,' Huasicancha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1150,24 ,'12' ,'01' ,'21',1,' Huayucachi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1151,24 ,'12' ,'01' ,'22',1,' Ingenio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1152,24 ,'12' ,'01' ,'24',1,' Pariahuanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1153,24 ,'12' ,'01' ,'25',1,' Pilcomayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1154,24 ,'12' ,'01' ,'26',1,' Pucara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1155,24 ,'12' ,'01' ,'27',1,' Quichuay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1156,24 ,'12' ,'01' ,'28',1,' Quilcas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1157,24 ,'12' ,'01' ,'29',1,' San Agustín',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1158,24 ,'12' ,'01' ,'30',1,' San Jerónimo de Tunan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1159,24 ,'12' ,'01' ,'32',1,' Saño',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1160,24 ,'12' ,'01' ,'33',1,' Sapallanga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1161,24 ,'12' ,'01' ,'34',1,' Sicaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1162,24 ,'12' ,'01' ,'35',1,' Santo Domingo de Acobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1163,24 ,'12' ,'01' ,'36',1,' Viques',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1164,24 ,'12' ,'02' ,'00',1,' Concepción ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1165,24 ,'12' ,'02' ,'01',1,' Concepción',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1166,24 ,'12' ,'02' ,'02',1,' Aco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1167,24 ,'12' ,'02' ,'03',1,' Andamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1168,24 ,'12' ,'02' ,'04',1,' Chambara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1169,24 ,'12' ,'02' ,'05',1,' Cochas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1170,24 ,'12' ,'02' ,'06',1,' Comas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1171,24 ,'12' ,'02' ,'07',1,' Heroínas Toledo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1172,24 ,'12' ,'02' ,'08',1,' Manzanares',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1173,24 ,'12' ,'02' ,'09',1,' Mariscal Castilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1174,24 ,'12' ,'02' ,'10',1,' Matahuasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1175,24 ,'12' ,'02' ,'11',1,' Mito',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1176,24 ,'12' ,'02' ,'12',1,' Nueve de Julio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1177,24 ,'12' ,'02' ,'13',1,' Orcotuna',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1178,24 ,'12' ,'02' ,'14',1,' San José de Quero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1179,24 ,'12' ,'02' ,'15',1,' Santa Rosa de Ocopa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1180,24 ,'12' ,'03' ,'00',1,' Chanchamayo ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1181,24 ,'12' ,'03' ,'01',1,' Chanchamayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1182,24 ,'12' ,'03' ,'02',1,' Perene',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1183,24 ,'12' ,'03' ,'03',1,' Pichanaqui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1184,24 ,'12' ,'03' ,'04',1,' San Luis de Shuaro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1185,24 ,'12' ,'03' ,'05',1,' San Ramón',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1186,24 ,'12' ,'03' ,'06',1,' Vitoc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1187,24 ,'12' ,'04' ,'00',1,' Jauja ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1188,24 ,'12' ,'04' ,'01',1,' Jauja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1189,24 ,'12' ,'04' ,'02',1,' Acolla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1190,24 ,'12' ,'04' ,'03',1,' Apata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1191,24 ,'12' ,'04' ,'04',1,' Ataura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1192,24 ,'12' ,'04' ,'05',1,' Canchayllo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1193,24 ,'12' ,'04' ,'06',1,' Curicaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1194,24 ,'12' ,'04' ,'07',1,' El Mantaro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1195,24 ,'12' ,'04' ,'08',1,' Huamali',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1196,24 ,'12' ,'04' ,'09',1,' Huaripampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1197,24 ,'12' ,'04' ,'10',1,' Huertas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1198,24 ,'12' ,'04' ,'11',1,' Janjaillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1199,24 ,'12' ,'04' ,'12',1,' Julcán',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1200,24 ,'12' ,'04' ,'13',1,' Leonor Ordóñez',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1201,24 ,'12' ,'04' ,'14',1,' Llocllapampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1202,24 ,'12' ,'04' ,'15',1,' Marco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1203,24 ,'12' ,'04' ,'16',1,' Masma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1204,24 ,'12' ,'04' ,'17',1,' Masma Chicche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1205,24 ,'12' ,'04' ,'18',1,' Molinos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1206,24 ,'12' ,'04' ,'19',1,' Monobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1207,24 ,'12' ,'04' ,'20',1,' Muqui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1208,24 ,'12' ,'04' ,'21',1,' Muquiyauyo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1209,24 ,'12' ,'04' ,'22',1,' Paca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1210,24 ,'12' ,'04' ,'23',1,' Paccha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1211,24 ,'12' ,'04' ,'24',1,' Pancan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1212,24 ,'12' ,'04' ,'25',1,' Parco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1213,24 ,'12' ,'04' ,'26',1,' Pomacancha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1214,24 ,'12' ,'04' ,'27',1,' Ricran',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1215,24 ,'12' ,'04' ,'28',1,' San Lorenzo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1216,24 ,'12' ,'04' ,'29',1,' San Pedro de Chunan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1217,24 ,'12' ,'04' ,'30',1,' Sausa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1218,24 ,'12' ,'04' ,'31',1,' Sincos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1219,24 ,'12' ,'04' ,'32',1,' Tunan Marca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1220,24 ,'12' ,'04' ,'33',1,' Yauli',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1221,24 ,'12' ,'04' ,'34',1,' Yauyos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1222,24 ,'12' ,'05' ,'00',1,' Junín ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1223,24 ,'12' ,'05' ,'01',1,' Junin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1224,24 ,'12' ,'05' ,'02',1,' Carhuamayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1225,24 ,'12' ,'05' ,'03',1,' Ondores',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1226,24 ,'12' ,'05' ,'04',1,' Ulcumayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1227,24 ,'12' ,'06' ,'00',1,' Satipo ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1228,24 ,'12' ,'06' ,'01',1,' Satipo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1229,24 ,'12' ,'06' ,'02',1,' Coviriali',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1230,24 ,'12' ,'06' ,'03',1,' Llaylla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1231,24 ,'12' ,'06' ,'04',1,' Mazamari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1232,24 ,'12' ,'06' ,'05',1,' Pampa Hermosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1233,24 ,'12' ,'06' ,'06',1,' Pangoa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1234,24 ,'12' ,'06' ,'07',1,' Río Negro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1235,24 ,'12' ,'06' ,'08',1,' Río Tambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1236,24 ,'12' ,'06' ,'09',1,' Vizcatan del Ene',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1237,24 ,'12' ,'07' ,'00',1,' Tarma ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1238,24 ,'12' ,'07' ,'01',1,' Tarma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1239,24 ,'12' ,'07' ,'02',1,' Acobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1240,24 ,'12' ,'07' ,'03',1,' Huaricolca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1241,24 ,'12' ,'07' ,'04',1,' Huasahuasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1242,24 ,'12' ,'07' ,'05',1,' La Unión',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1243,24 ,'12' ,'07' ,'06',1,' Palca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1244,24 ,'12' ,'07' ,'07',1,' Palcamayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1245,24 ,'12' ,'07' ,'08',1,' San Pedro de Cajas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1246,24 ,'12' ,'07' ,'09',1,' Tapo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1247,24 ,'12' ,'08' ,'00',1,' Yauli ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1248,24 ,'12' ,'08' ,'01',1,' La Oroya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1249,24 ,'12' ,'08' ,'02',1,' Chacapalpa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1250,24 ,'12' ,'08' ,'03',1,' Huay-Huay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1251,24 ,'12' ,'08' ,'04',1,' Marcapomacocha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1252,24 ,'12' ,'08' ,'05',1,' Morococha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1253,24 ,'12' ,'08' ,'06',1,' Paccha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1254,24 ,'12' ,'08' ,'07',1,' Santa Bárbara de Carhuacayan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1255,24 ,'12' ,'08' ,'08',1,' Santa Rosa de Sacco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1256,24 ,'12' ,'08' ,'09',1,' Suitucancha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1257,24 ,'12' ,'08' ,'10',1,' Yauli',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1258,24 ,'12' ,'09' ,'00',1,' Chupaca ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1259,24 ,'12' ,'09' ,'01',1,' Chupaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1260,24 ,'12' ,'09' ,'02',1,' Ahuac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1261,24 ,'12' ,'09' ,'03',1,' Chongos Bajo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1262,24 ,'12' ,'09' ,'04',1,' Huachac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1263,24 ,'12' ,'09' ,'05',1,' Huamancaca Chico',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1264,24 ,'12' ,'09' ,'06',1,' San Juan de Iscos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1265,24 ,'12' ,'09' ,'07',1,' San Juan de Jarpa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1266,24 ,'12' ,'09' ,'08',1,' Tres de Diciembre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1267,24 ,'12' ,'09' ,'09',1,' Yanacancha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1268,24 ,'13' ,'00' ,'00',1,' La Libertad',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1269,24 ,'13' ,'01' ,'00',1,' Trujillo ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1270,24 ,'13' ,'01' ,'01',1,' Trujillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1271,24 ,'13' ,'01' ,'02',1,' El Porvenir',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1272,24 ,'13' ,'01' ,'03',1,' Florencia de Mora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1273,24 ,'13' ,'01' ,'04',1,' Huanchaco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1274,24 ,'13' ,'01' ,'05',1,' La Esperanza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1275,24 ,'13' ,'01' ,'06',1,' Laredo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1276,24 ,'13' ,'01' ,'07',1,' Moche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1277,24 ,'13' ,'01' ,'08',1,' Poroto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1278,24 ,'13' ,'01' ,'09',1,' Salaverry',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1279,24 ,'13' ,'01' ,'10',1,' Simbal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1280,24 ,'13' ,'01' ,'11',1,' Victor Larco Herrera',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1281,24 ,'13' ,'02' ,'00',1,' Ascope ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1282,24 ,'13' ,'02' ,'01',1,' Ascope',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1283,24 ,'13' ,'02' ,'02',1,' Chicama',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1284,24 ,'13' ,'02' ,'03',1,' Chocope',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1285,24 ,'13' ,'02' ,'04',1,' Magdalena de Cao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1286,24 ,'13' ,'02' ,'05',1,' Paijan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1287,24 ,'13' ,'02' ,'06',1,' Rázuri',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1288,24 ,'13' ,'02' ,'07',1,' Santiago de Cao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1289,24 ,'13' ,'02' ,'08',1,' Casa Grande',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1290,24 ,'13' ,'03' ,'00',1,' Bolívar ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1291,24 ,'13' ,'03' ,'01',1,' Bolívar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1292,24 ,'13' ,'03' ,'02',1,' Bambamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1293,24 ,'13' ,'03' ,'03',1,' Condormarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1294,24 ,'13' ,'03' ,'04',1,' Longotea',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1295,24 ,'13' ,'03' ,'05',1,' Uchumarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1296,24 ,'13' ,'03' ,'06',1,' Ucuncha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1297,24 ,'13' ,'04' ,'00',1,' Chepén ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1298,24 ,'13' ,'04' ,'01',1,' Chepen',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1299,24 ,'13' ,'04' ,'02',1,' Pacanga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1300,24 ,'13' ,'04' ,'03',1,' Pueblo Nuevo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1301,24 ,'13' ,'05' ,'04',1,' Julcán ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1302,24 ,'13' ,'05' ,'05',1,' Julcan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1303,24 ,'13' ,'05' ,'06',1,' Calamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1304,24 ,'13' ,'05' ,'07',1,' Carabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1305,24 ,'13' ,'05' ,'08',1,' Huaso',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1306,24 ,'13' ,'06' ,'00',1,' Otuzco ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1307,24 ,'13' ,'06' ,'01',1,' Otuzco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1308,24 ,'13' ,'06' ,'02',1,' Agallpampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1309,24 ,'13' ,'06' ,'04',1,' Charat',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1310,24 ,'13' ,'06' ,'05',1,' Huaranchal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1311,24 ,'13' ,'06' ,'06',1,' La Cuesta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1312,24 ,'13' ,'06' ,'08',1,' Mache',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1313,24 ,'13' ,'06' ,'10',1,' Paranday',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1314,24 ,'13' ,'06' ,'11',1,' Salpo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1315,24 ,'13' ,'06' ,'13',1,' Sinsicap',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1316,24 ,'13' ,'06' ,'14',1,' Usquil',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1317,24 ,'13' ,'07' ,'00',1,' Pacasmayo ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1318,24 ,'13' ,'07' ,'01',1,' San Pedro de Lloc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1319,24 ,'13' ,'07' ,'02',1,' Guadalupe',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1320,24 ,'13' ,'07' ,'03',1,' Jequetepeque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1321,24 ,'13' ,'07' ,'04',1,' Pacasmayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1322,24 ,'13' ,'07' ,'05',1,' San José',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1323,24 ,'13' ,'08' ,'00',1,' Pataz ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1324,24 ,'13' ,'08' ,'01',1,' Tayabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1325,24 ,'13' ,'08' ,'02',1,' Buldibuyo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1326,24 ,'13' ,'08' ,'03',1,' Chillia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1327,24 ,'13' ,'08' ,'04',1,' Huancaspata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1328,24 ,'13' ,'08' ,'05',1,' Huaylillas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1329,24 ,'13' ,'08' ,'06',1,' Huayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1330,24 ,'13' ,'08' ,'07',1,' Ongon',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1331,24 ,'13' ,'08' ,'08',1,' Parcoy',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1332,24 ,'13' ,'08' ,'09',1,' Pataz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1333,24 ,'13' ,'08' ,'10',1,' Pias',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1334,24 ,'13' ,'08' ,'11',1,' Santiago de Challas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1335,24 ,'13' ,'08' ,'12',1,' Taurija',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1336,24 ,'13' ,'08' ,'13',1,' Urpay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1337,24 ,'13' ,'09' ,'00',1,' Sánchez Carrión ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1338,24 ,'13' ,'09' ,'01',1,' Huamachuco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1339,24 ,'13' ,'09' ,'02',1,' Chugay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1340,24 ,'13' ,'09' ,'03',1,' Cochorco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1341,24 ,'13' ,'09' ,'04',1,' Curgos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1342,24 ,'13' ,'09' ,'05',1,' Marcabal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1343,24 ,'13' ,'09' ,'06',1,' Sanagoran',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1344,24 ,'13' ,'09' ,'07',1,' Sarin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1345,24 ,'13' ,'09' ,'08',1,' Sartimbamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1346,24 ,'13' ,'10' ,'00',1,' Santiago de Chuco ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1347,24 ,'13' ,'10' ,'01',1,' Santiago de Chuco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1348,24 ,'13' ,'10' ,'02',1,' Angasmarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1349,24 ,'13' ,'10' ,'03',1,' Cachicadan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1350,24 ,'13' ,'10' ,'04',1,' Mollebamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1351,24 ,'13' ,'10' ,'05',1,' Mollepata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1352,24 ,'13' ,'10' ,'06',1,' Quiruvilca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1353,24 ,'13' ,'10' ,'07',1,' Santa Cruz de Chuca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1354,24 ,'13' ,'10' ,'08',1,' Sitabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1355,24 ,'13' ,'11' ,'00',1,' Gran Chimú ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1356,24 ,'13' ,'11' ,'01',1,' Cascas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1357,24 ,'13' ,'11' ,'02',1,' Lucma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1358,24 ,'13' ,'11' ,'03',1,' Marmot',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1359,24 ,'13' ,'11' ,'04',1,' Sayapullo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1360,24 ,'13' ,'12' ,'05',1,' Virú ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1361,24 ,'13' ,'12' ,'06',1,' Viru',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1362,24 ,'13' ,'12' ,'07',1,' Chao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1363,24 ,'13' ,'12' ,'08',1,' Guadalupito',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1364,24 ,'14' ,'00' ,'00',1,' Lambayeque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1365,24 ,'14' ,'01' ,'00',1,' Chiclayo ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1366,24 ,'14' ,'01' ,'01',1,' Chiclayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1367,24 ,'14' ,'01' ,'02',1,' Chongoyape',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1368,24 ,'14' ,'01' ,'03',1,' Eten',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1369,24 ,'14' ,'01' ,'04',1,' Eten Puerto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1370,24 ,'14' ,'01' ,'05',1,' José Leonardo Ortiz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1371,24 ,'14' ,'01' ,'06',1,' La Victoria',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1372,24 ,'14' ,'01' ,'07',1,' Lagunas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1373,24 ,'14' ,'01' ,'08',1,' Monsefu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1374,24 ,'14' ,'01' ,'09',1,' Nueva Arica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1375,24 ,'14' ,'01' ,'10',1,' Oyotun',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1376,24 ,'14' ,'01' ,'11',1,' Picsi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1377,24 ,'14' ,'01' ,'12',1,' Pimentel',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1378,24 ,'14' ,'01' ,'13',1,' Reque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1379,24 ,'14' ,'01' ,'14',1,' Santa Rosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1380,24 ,'14' ,'01' ,'15',1,' Saña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1381,24 ,'14' ,'01' ,'16',1,' Cayalti',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1382,24 ,'14' ,'01' ,'17',1,' Patapo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1383,24 ,'14' ,'01' ,'18',1,' Pomalca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1384,24 ,'14' ,'01' ,'19',1,' Pucala',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1385,24 ,'14' ,'01' ,'20',1,' Tuman',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1386,24 ,'14' ,'02' ,'00',1,' Ferreñafe ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1387,24 ,'14' ,'02' ,'01',1,' Ferreñafe',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1388,24 ,'14' ,'02' ,'02',1,' Cañaris',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1389,24 ,'14' ,'02' ,'03',1,' Incahuasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1390,24 ,'14' ,'02' ,'04',1,' Manuel Antonio Mesones Muro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1391,24 ,'14' ,'02' ,'05',1,' Pitipo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1392,24 ,'14' ,'02' ,'06',1,' Pueblo Nuevo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1393,24 ,'14' ,'03' ,'00',1,' Lambayeque ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1394,24 ,'14' ,'03' ,'01',1,' Lambayeque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1395,24 ,'14' ,'03' ,'02',1,' Chochope',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1396,24 ,'14' ,'03' ,'03',1,' Illimo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1397,24 ,'14' ,'03' ,'04',1,' Jayanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1398,24 ,'14' ,'03' ,'05',1,' Mochumi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1399,24 ,'14' ,'03' ,'06',1,' Morrope',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1400,24 ,'14' ,'03' ,'07',1,' Motupe',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1401,24 ,'14' ,'03' ,'08',1,' Olmos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1402,24 ,'14' ,'03' ,'09',1,' Pacora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1403,24 ,'14' ,'03' ,'10',1,' Salas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1404,24 ,'14' ,'03' ,'11',1,' San José',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1405,24 ,'14' ,'03' ,'12',1,' Tucume',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1406,24 ,'15' ,'00' ,'00',1,' Lima',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1407,24 ,'15' ,'01' ,'00',1,' Lima ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1408,24 ,'15' ,'01' ,'01',1,' Lima',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1409,24 ,'15' ,'01' ,'02',1,' Ancón',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1410,24 ,'15' ,'01' ,'03',1,' Ate',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1411,24 ,'15' ,'01' ,'04',1,' Barranco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1412,24 ,'15' ,'01' ,'05',1,' Breña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1413,24 ,'15' ,'01' ,'06',1,' Carabayllo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1414,24 ,'15' ,'01' ,'07',1,' Chaclacayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1415,24 ,'15' ,'01' ,'08',1,' Chorrillos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1416,24 ,'15' ,'01' ,'09',1,' Cieneguilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1417,24 ,'15' ,'01' ,'10',1,' Comas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1418,24 ,'15' ,'01' ,'11',1,' El Agustino',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1419,24 ,'15' ,'01' ,'12',1,' Independencia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1420,24 ,'15' ,'01' ,'13',1,' Jesús María',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1421,24 ,'15' ,'01' ,'14',1,' La Molina',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1422,24 ,'15' ,'01' ,'15',1,' La Victoria',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1423,24 ,'15' ,'01' ,'16',1,' Lince',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1424,24 ,'15' ,'01' ,'17',1,' Los Olivos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1425,24 ,'15' ,'01' ,'18',1,' Lurigancho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1426,24 ,'15' ,'01' ,'19',1,' Lurin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1427,24 ,'15' ,'01' ,'20',1,' Magdalena del Mar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1428,24 ,'15' ,'01' ,'21',1,' Pueblo Libre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1429,24 ,'15' ,'01' ,'22',1,' Miraflores',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1430,24 ,'15' ,'01' ,'23',1,' Pachacamac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1431,24 ,'15' ,'01' ,'24',1,' Pucusana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1432,24 ,'15' ,'01' ,'25',1,' Puente Piedra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1433,24 ,'15' ,'01' ,'26',1,' Punta Hermosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1434,24 ,'15' ,'01' ,'27',1,' Punta Negra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1435,24 ,'15' ,'01' ,'28',1,' Rímac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1436,24 ,'15' ,'01' ,'29',1,' San Bartolo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1437,24 ,'15' ,'01' ,'30',1,' San Borja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1438,24 ,'15' ,'01' ,'31',1,' San Isidro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1439,24 ,'15' ,'01' ,'32',1,' San Juan de Lurigancho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1440,24 ,'15' ,'01' ,'33',1,' San Juan de Miraflores',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1441,24 ,'15' ,'01' ,'34',1,' San Luis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1442,24 ,'15' ,'01' ,'35',1,' San Martín de Porres',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1443,24 ,'15' ,'01' ,'36',1,' San Miguel',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1444,24 ,'15' ,'01' ,'37',1,' Santa Anita',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1445,24 ,'15' ,'01' ,'38',1,' Santa María del Mar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1446,24 ,'15' ,'01' ,'39',1,' Santa Rosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1447,24 ,'15' ,'01' ,'40',1,' Santiago de Surco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1448,24 ,'15' ,'01' ,'41',1,' Surquillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1449,24 ,'15' ,'01' ,'42',1,' Villa El Salvador',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1450,24 ,'15' ,'01' ,'43',1,' Villa María del Triunfo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1451,24 ,'15' ,'02' ,'00',1,' Barranca ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1452,24 ,'15' ,'02' ,'01',1,' Barranca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1453,24 ,'15' ,'02' ,'02',1,' Paramonga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1454,24 ,'15' ,'02' ,'03',1,' Pativilca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1455,24 ,'15' ,'02' ,'04',1,' Supe',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1456,24 ,'15' ,'02' ,'05',1,' Supe Puerto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1457,24 ,'15' ,'03' ,'00',1,' Cajatambo ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1458,24 ,'15' ,'03' ,'01',1,' Cajatambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1459,24 ,'15' ,'03' ,'02',1,' Copa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1460,24 ,'15' ,'03' ,'03',1,' Gorgor',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1461,24 ,'15' ,'03' ,'04',1,' Huancapon',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1462,24 ,'15' ,'03' ,'05',1,' Manas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1463,24 ,'15' ,'04' ,'00',1,' Canta ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1464,24 ,'15' ,'04' ,'01',1,' Canta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1465,24 ,'15' ,'04' ,'02',1,' Arahuay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1466,24 ,'15' ,'04' ,'03',1,' Huamantanga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1467,24 ,'15' ,'04' ,'04',1,' Huaros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1468,24 ,'15' ,'04' ,'05',1,' Lachaqui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1469,24 ,'15' ,'04' ,'06',1,' San Buenaventura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1470,24 ,'15' ,'04' ,'07',1,' Santa Rosa de Quives',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1471,24 ,'15' ,'05' ,'00',1,' Cañete ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1472,24 ,'15' ,'05' ,'01',1,' San Vicente de Cañete',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1473,24 ,'15' ,'05' ,'02',1,' Asia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1474,24 ,'15' ,'05' ,'03',1,' Calango',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1475,24 ,'15' ,'05' ,'04',1,' Cerro Azul',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1476,24 ,'15' ,'05' ,'05',1,' Chilca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1477,24 ,'15' ,'05' ,'06',1,' Coayllo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1478,24 ,'15' ,'05' ,'07',1,' Imperial',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1479,24 ,'15' ,'05' ,'08',1,' Lunahuana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1480,24 ,'15' ,'05' ,'09',1,' Mala',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1481,24 ,'15' ,'05' ,'10',1,' Nuevo Imperial',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1482,24 ,'15' ,'05' ,'11',1,' Pacaran',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1483,24 ,'15' ,'05' ,'12',1,' Quilmana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1484,24 ,'15' ,'05' ,'13',1,' San Antonio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1485,24 ,'15' ,'05' ,'14',1,' San Luis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1486,24 ,'15' ,'05' ,'15',1,' Santa Cruz de Flores',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1487,24 ,'15' ,'05' ,'16',1,' Zúñiga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1488,24 ,'15' ,'06' ,'00',1,' Huaral ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1489,24 ,'15' ,'06' ,'01',1,' Huaral',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1490,24 ,'15' ,'06' ,'02',1,' Atavillos Alto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1491,24 ,'15' ,'06' ,'03',1,' Atavillos Bajo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1492,24 ,'15' ,'06' ,'04',1,' Aucallama',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1493,24 ,'15' ,'06' ,'05',1,' Chancay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1494,24 ,'15' ,'06' ,'06',1,' Ihuari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1495,24 ,'15' ,'06' ,'07',1,' Lampian',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1496,24 ,'15' ,'06' ,'08',1,' Pacaraos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1497,24 ,'15' ,'06' ,'09',1,' San Miguel de Acos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1498,24 ,'15' ,'06' ,'10',1,' Santa Cruz de Andamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1499,24 ,'15' ,'06' ,'11',1,' Sumbilca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1500,24 ,'15' ,'06' ,'12',1,' Veintisiete de Noviembre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1501,24 ,'15' ,'07' ,'00',1,' Huarochirí ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1502,24 ,'15' ,'07' ,'01',1,' Matucana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1503,24 ,'15' ,'07' ,'02',1,' Antioquia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1504,24 ,'15' ,'07' ,'03',1,' Callahuanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1505,24 ,'15' ,'07' ,'04',1,' Carampoma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1506,24 ,'15' ,'07' ,'05',1,' Chicla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1507,24 ,'15' ,'07' ,'06',1,' Cuenca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1508,24 ,'15' ,'07' ,'07',1,' Huachupampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1509,24 ,'15' ,'07' ,'08',1,' Huanza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1510,24 ,'15' ,'07' ,'09',1,' Huarochiri',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1511,24 ,'15' ,'07' ,'10',1,' Lahuaytambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1512,24 ,'15' ,'07' ,'11',1,' Langa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1513,24 ,'15' ,'07' ,'12',1,' Laraos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1514,24 ,'15' ,'07' ,'13',1,' Mariatana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1515,24 ,'15' ,'07' ,'14',1,' Ricardo Palma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1516,24 ,'15' ,'07' ,'15',1,' San Andrés de Tupicocha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1517,24 ,'15' ,'07' ,'16',1,' San Antonio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1518,24 ,'15' ,'07' ,'17',1,' San Bartolomé',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1519,24 ,'15' ,'07' ,'18',1,' San Damian',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1520,24 ,'15' ,'07' ,'19',1,' San Juan de Iris',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1521,24 ,'15' ,'07' ,'20',1,' San Juan de Tantaranche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1522,24 ,'15' ,'07' ,'21',1,' San Lorenzo de Quinti',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1523,24 ,'15' ,'07' ,'22',1,' San Mateo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1524,24 ,'15' ,'07' ,'23',1,' San Mateo de Otao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1525,24 ,'15' ,'07' ,'24',1,' San Pedro de Casta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1526,24 ,'15' ,'07' ,'25',1,' San Pedro de Huancayre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1527,24 ,'15' ,'07' ,'26',1,' Sangallaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1528,24 ,'15' ,'07' ,'27',1,' Santa Cruz de Cocachacra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1529,24 ,'15' ,'07' ,'28',1,' Santa Eulalia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1530,24 ,'15' ,'07' ,'29',1,' Santiago de Anchucaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1531,24 ,'15' ,'07' ,'30',1,' Santiago de Tuna',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1532,24 ,'15' ,'07' ,'31',1,' Santo Domingo de Los Olleros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1533,24 ,'15' ,'07' ,'32',1,' Surco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1534,24 ,'15' ,'08' ,'00',1,' Huaura ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1535,24 ,'15' ,'08' ,'01',1,' Huacho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1536,24 ,'15' ,'08' ,'02',1,' Ambar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1537,24 ,'15' ,'08' ,'03',1,' Caleta de Carquin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1538,24 ,'15' ,'08' ,'04',1,' Checras',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1539,24 ,'15' ,'08' ,'05',1,' Hualmay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1540,24 ,'15' ,'08' ,'06',1,' Huaura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1541,24 ,'15' ,'08' ,'07',1,' Leoncio Prado',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1542,24 ,'15' ,'08' ,'08',1,' Paccho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1543,24 ,'15' ,'08' ,'09',1,' Santa Leonor',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1544,24 ,'15' ,'08' ,'10',1,' Santa María',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1545,24 ,'15' ,'08' ,'11',1,' Sayan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1546,24 ,'15' ,'08' ,'12',1,' Vegueta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1547,24 ,'15' ,'09' ,'00',1,' Oyón ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1548,24 ,'15' ,'09' ,'01',1,' Oyon',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1549,24 ,'15' ,'09' ,'02',1,' Andajes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1550,24 ,'15' ,'09' ,'03',1,' Caujul',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1551,24 ,'15' ,'09' ,'04',1,' Cochamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1552,24 ,'15' ,'09' ,'05',1,' Navan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1553,24 ,'15' ,'09' ,'06',1,' Pachangara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1554,24 ,'15' ,'10' ,'00',1,' Yauyos ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1555,24 ,'15' ,'10' ,'01',1,' Yauyos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1556,24 ,'15' ,'10' ,'02',1,' Alis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1557,24 ,'15' ,'10' ,'03',1,' Allauca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1558,24 ,'15' ,'10' ,'04',1,' Ayaviri',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1559,24 ,'15' ,'10' ,'05',1,' Azángaro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1560,24 ,'15' ,'10' ,'06',1,' Cacra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1561,24 ,'15' ,'10' ,'07',1,' Carania',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1562,24 ,'15' ,'10' ,'08',1,' Catahuasi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1563,24 ,'15' ,'10' ,'09',1,' Chocos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1564,24 ,'15' ,'10' ,'10',1,' Cochas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1565,24 ,'15' ,'10' ,'11',1,' Colonia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1566,24 ,'15' ,'10' ,'12',1,' Hongos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1567,24 ,'15' ,'10' ,'13',1,' Huampara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1568,24 ,'15' ,'10' ,'14',1,' Huancaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1569,24 ,'15' ,'10' ,'15',1,' Huangascar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1570,24 ,'15' ,'10' ,'16',1,' Huantan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1571,24 ,'15' ,'10' ,'17',1,' Huañec',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1572,24 ,'15' ,'10' ,'18',1,' Laraos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1573,24 ,'15' ,'10' ,'19',1,' Lincha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1574,24 ,'15' ,'10' ,'20',1,' Madean',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1575,24 ,'15' ,'10' ,'21',1,' Miraflores',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1576,24 ,'15' ,'10' ,'22',1,' Omas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1577,24 ,'15' ,'10' ,'23',1,' Putinza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1578,24 ,'15' ,'10' ,'24',1,' Quinches',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1579,24 ,'15' ,'10' ,'25',1,' Quinocay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1580,24 ,'15' ,'10' ,'26',1,' San Joaquín',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1581,24 ,'15' ,'10' ,'27',1,' San Pedro de Pilas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1582,24 ,'15' ,'10' ,'28',1,' Tanta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1583,24 ,'15' ,'10' ,'29',1,' Tauripampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1584,24 ,'15' ,'10' ,'30',1,' Tomas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1585,24 ,'15' ,'10' ,'31',1,' Tupe',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1586,24 ,'15' ,'10' ,'32',1,' Viñac',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1587,24 ,'15' ,'10' ,'33',1,' Vitis',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1588,24 ,'16' ,'00' ,'00',1,' Loreto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1589,24 ,'16' ,'01' ,'00',1,' Maynas ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1590,24 ,'16' ,'01' ,'01',1,' Iquitos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1591,24 ,'16' ,'01' ,'02',1,' Alto Nanay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1592,24 ,'16' ,'01' ,'03',1,' Fernando Lores',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1593,24 ,'16' ,'01' ,'04',1,' Indiana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1594,24 ,'16' ,'01' ,'05',1,' Las Amazonas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1595,24 ,'16' ,'01' ,'06',1,' Mazan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1596,24 ,'16' ,'01' ,'07',1,' Napo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1597,24 ,'16' ,'01' ,'08',1,' Punchana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1598,24 ,'16' ,'01' ,'10',1,' Torres Causana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1599,24 ,'16' ,'01' ,'12',1,' Belén',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1600,24 ,'16' ,'01' ,'13',1,' San Juan Bautista',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1601,24 ,'16' ,'02' ,'00',1,' Alto Amazonas ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1602,24 ,'16' ,'02' ,'01',1,' Yurimaguas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1603,24 ,'16' ,'02' ,'02',1,' Balsapuerto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1604,24 ,'16' ,'02' ,'05',1,' Jeberos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1605,24 ,'16' ,'02' ,'06',1,' Lagunas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1606,24 ,'16' ,'02' ,'10',1,' Santa Cruz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1607,24 ,'16' ,'02' ,'11',1,' Teniente Cesar López Rojas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1608,24 ,'16' ,'03' ,'00',1,' Loreto ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1609,24 ,'16' ,'03' ,'01',1,' Nauta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1610,24 ,'16' ,'03' ,'02',1,' Parinari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1611,24 ,'16' ,'03' ,'03',1,' Tigre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1612,24 ,'16' ,'03' ,'04',1,' Trompeteros',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1613,24 ,'16' ,'03' ,'05',1,' Urarinas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1614,24 ,'16' ,'04' ,'00',1,' Mariscal Ramón Castilla ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1615,24 ,'16' ,'04' ,'01',1,' Ramón Castilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1616,24 ,'16' ,'04' ,'02',1,' Pebas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1617,24 ,'16' ,'04' ,'03',1,' Yavari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1618,24 ,'16' ,'04' ,'04',1,' San Pablo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1619,24 ,'16' ,'05' ,'00',1,' Requena ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1620,24 ,'16' ,'05' ,'01',1,' Requena',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1621,24 ,'16' ,'05' ,'02',1,' Alto Tapiche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1622,24 ,'16' ,'05' ,'03',1,' Capelo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1623,24 ,'16' ,'05' ,'04',1,' Emilio San Martín',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1624,24 ,'16' ,'05' ,'05',1,' Maquia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1625,24 ,'16' ,'05' ,'06',1,' Puinahua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1626,24 ,'16' ,'05' ,'07',1,' Saquena',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1627,24 ,'16' ,'05' ,'08',1,' Soplin',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1628,24 ,'16' ,'05' ,'09',1,' Tapiche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1629,24 ,'16' ,'05' ,'10',1,' Jenaro Herrera',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1630,24 ,'16' ,'05' ,'11',1,' Yaquerana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1631,24 ,'16' ,'06' ,'00',1,' Ucayali ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1632,24 ,'16' ,'06' ,'01',1,' Contamana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1633,24 ,'16' ,'06' ,'02',1,' Inahuaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1634,24 ,'16' ,'06' ,'03',1,' Padre Márquez',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1635,24 ,'16' ,'06' ,'04',1,' Pampa Hermosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1636,24 ,'16' ,'06' ,'05',1,' Sarayacu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1637,24 ,'16' ,'06' ,'06',1,' Vargas Guerra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1638,24 ,'16' ,'07' ,'00',1,' Datem del Marañón ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1639,24 ,'16' ,'07' ,'01',1,' Barranca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1640,24 ,'16' ,'07' ,'02',1,' Cahuapanas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1641,24 ,'16' ,'07' ,'03',1,' Manseriche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1642,24 ,'16' ,'07' ,'04',1,' Morona',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1643,24 ,'16' ,'07' ,'05',1,' Pastaza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1644,24 ,'16' ,'07' ,'06',1,' Andoas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1645,24 ,'16' ,'08' ,'00',1,' Putumayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1646,24 ,'16' ,'08' ,'01',1,' Putumayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1647,24 ,'16' ,'08' ,'02',1,' Rosa Panduro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1648,24 ,'16' ,'08' ,'03',1,' Teniente Manuel Clavero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1649,24 ,'16' ,'08' ,'04',1,' Yaguas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1650,24 ,'17' ,'00' ,'00',1,' Madre de Dios',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1651,24 ,'17' ,'01' ,'00',1,' Tambopata ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1652,24 ,'17' ,'01' ,'01',1,' Tambopata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1653,24 ,'17' ,'01' ,'02',1,' Inambari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1654,24 ,'17' ,'01' ,'03',1,' Las Piedras',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1655,24 ,'17' ,'01' ,'04',1,' Laberinto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1656,24 ,'17' ,'02' ,'00',1,' Manu ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1657,24 ,'17' ,'02' ,'01',1,' Manu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1658,24 ,'17' ,'02' ,'02',1,' Fitzcarrald',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1659,24 ,'17' ,'02' ,'03',1,' Madre de Dios',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1660,24 ,'17' ,'02' ,'04',1,' Huepetuhe',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1661,24 ,'17' ,'03' ,'00',1,' Tahuamanu ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1662,24 ,'17' ,'03' ,'01',1,' Iñapari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1663,24 ,'17' ,'03' ,'02',1,' Iberia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1664,24 ,'17' ,'03' ,'03',1,' Tahuamanu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1665,24 ,'18' ,'00' ,'00',1,' Moquegua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1666,24 ,'18' ,'01' ,'00',1,' Mariscal Nieto ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1667,24 ,'18' ,'01' ,'01',1,' Moquegua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1668,24 ,'18' ,'01' ,'02',1,' Carumas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1669,24 ,'18' ,'01' ,'03',1,' Cuchumbaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1670,24 ,'18' ,'01' ,'04',1,' Samegua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1671,24 ,'18' ,'01' ,'05',1,' San Cristóbal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1672,24 ,'18' ,'01' ,'06',1,' Torata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1673,24 ,'18' ,'02' ,'00',1,' General Sánchez Cerro ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1674,24 ,'18' ,'02' ,'01',1,' Omate',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1675,24 ,'18' ,'02' ,'02',1,' Chojata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1676,24 ,'18' ,'02' ,'03',1,' Coalaque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1677,24 ,'18' ,'02' ,'04',1,' Ichuña',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1678,24 ,'18' ,'02' ,'05',1,' La Capilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1679,24 ,'18' ,'02' ,'06',1,' Lloque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1680,24 ,'18' ,'02' ,'07',1,' Matalaque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1681,24 ,'18' ,'02' ,'08',1,' Puquina',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1682,24 ,'18' ,'02' ,'09',1,' Quinistaquillas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1683,24 ,'18' ,'02' ,'10',1,' Ubinas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1684,24 ,'18' ,'02' ,'11',1,' Yunga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1685,24 ,'18' ,'03' ,'00',1,' Ilo ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1686,24 ,'18' ,'03' ,'01',1,' Ilo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1687,24 ,'18' ,'03' ,'02',1,' El Algarrobal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1688,24 ,'18' ,'03' ,'03',1,' Pacocha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1689,24 ,'19' ,'00' ,'00',1,' Pasco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1690,24 ,'19' ,'01' ,'00',1,' Pasco ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1691,24 ,'19' ,'01' ,'01',1,' Chaupimarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1692,24 ,'19' ,'01' ,'02',1,' Huachon',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1693,24 ,'19' ,'01' ,'03',1,' Huariaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1694,24 ,'19' ,'01' ,'04',1,' Huayllay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1695,24 ,'19' ,'01' ,'05',1,' Ninacaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1696,24 ,'19' ,'01' ,'06',1,' Pallanchacra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1697,24 ,'19' ,'01' ,'07',1,' Paucartambo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1698,24 ,'19' ,'01' ,'08',1,' San Francisco de Asís de Yarusyacan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1699,24 ,'19' ,'01' ,'09',1,' Simon Bolívar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1700,24 ,'19' ,'01' ,'10',1,' Ticlacayan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1701,24 ,'19' ,'01' ,'11',1,' Tinyahuarco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1702,24 ,'19' ,'01' ,'12',1,' Vicco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1703,24 ,'19' ,'01' ,'13',1,' Yanacancha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1704,24 ,'19' ,'02' ,'00',1,' Daniel Alcides Carrión ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1705,24 ,'19' ,'02' ,'01',1,' Yanahuanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1706,24 ,'19' ,'02' ,'02',1,' Chacayan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1707,24 ,'19' ,'02' ,'03',1,' Goyllarisquizga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1708,24 ,'19' ,'02' ,'04',1,' Paucar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1709,24 ,'19' ,'02' ,'05',1,' San Pedro de Pillao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1710,24 ,'19' ,'02' ,'06',1,' Santa Ana de Tusi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1711,24 ,'19' ,'02' ,'07',1,' Tapuc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1712,24 ,'19' ,'02' ,'08',1,' Vilcabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1713,24 ,'19' ,'03' ,'00',1,' Pasco Oxapampa ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1714,24 ,'19' ,'03' ,'01',1,' Oxapampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1715,24 ,'19' ,'03' ,'02',1,' Chontabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1716,24 ,'19' ,'03' ,'03',1,' Huancabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1717,24 ,'19' ,'03' ,'04',1,' Palcazu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1718,24 ,'19' ,'03' ,'05',1,' Pozuzo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1719,24 ,'19' ,'03' ,'06',1,' Puerto Bermúdez',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1720,24 ,'19' ,'03' ,'07',1,' Villa Rica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1721,24 ,'19' ,'03' ,'08',1,' Constitución',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1722,24 ,'20' ,'00' ,'00',1,' Piura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1723,24 ,'20' ,'01' ,'00',1,' Piura ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1724,24 ,'20' ,'01' ,'01',1,' Piura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1725,24 ,'20' ,'01' ,'04',1,' Castilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1726,24 ,'20' ,'01' ,'05',1,' Atacaos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1727,24 ,'20' ,'01' ,'07',1,' Cura Mori',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1728,24 ,'20' ,'01' ,'08',1,' El Tallan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1729,24 ,'20' ,'01' ,'09',1,' La Arena',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1730,24 ,'20' ,'01' ,'10',1,' La Unión',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1731,24 ,'20' ,'01' ,'11',1,' Las Lomas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1732,24 ,'20' ,'01' ,'14',1,' Tambo Grande',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1733,24 ,'20' ,'01' ,'15',1,' Veintiseis de Octubre',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1734,24 ,'20' ,'02' ,'00',1,' Ayabaca ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1735,24 ,'20' ,'02' ,'01',1,' Ayabaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1736,24 ,'20' ,'02' ,'02',1,' Frias',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1737,24 ,'20' ,'02' ,'03',1,' Jilili',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1738,24 ,'20' ,'02' ,'04',1,' Lagunas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1739,24 ,'20' ,'02' ,'05',1,' Montero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1740,24 ,'20' ,'02' ,'06',1,' Pacaipampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1741,24 ,'20' ,'02' ,'07',1,' Paimas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1742,24 ,'20' ,'02' ,'08',1,' Sapillica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1743,24 ,'20' ,'02' ,'09',1,' Sicchez',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1744,24 ,'20' ,'02' ,'10',1,' Suyo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1745,24 ,'20' ,'03' ,'00',1,' Huancabamba ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1746,24 ,'20' ,'03' ,'01',1,' Huancabamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1747,24 ,'20' ,'03' ,'02',1,' Canchaque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1748,24 ,'20' ,'03' ,'03',1,' El Carmen de la Frontera',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1749,24 ,'20' ,'03' ,'04',1,' Huarmaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1750,24 ,'20' ,'03' ,'05',1,' Lalaquiz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1751,24 ,'20' ,'03' ,'06',1,' San Miguel de El Faique',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1752,24 ,'20' ,'03' ,'07',1,' Sondor',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1753,24 ,'20' ,'03' ,'08',1,' Sondorillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1754,24 ,'20' ,'04' ,'00',1,' Morropón ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1755,24 ,'20' ,'04' ,'01',1,' Chulucanas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1756,24 ,'20' ,'04' ,'02',1,' Buenos Aires',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1757,24 ,'20' ,'04' ,'03',1,' Chalaco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1758,24 ,'20' ,'04' ,'04',1,' La Matanza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1759,24 ,'20' ,'04' ,'05',1,' Morropon',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1760,24 ,'20' ,'04' ,'06',1,' Salitral',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1761,24 ,'20' ,'04' ,'07',1,' San Juan de Bigote',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1762,24 ,'20' ,'04' ,'08',1,' Santa Catalina de Mossa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1763,24 ,'20' ,'04' ,'09',1,' Santo Domingo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1764,24 ,'20' ,'04' ,'10',1,' Yamango',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1765,24 ,'20' ,'05' ,'00',1,' Paita ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1766,24 ,'20' ,'05' ,'01',1,' Paita',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1767,24 ,'20' ,'05' ,'02',1,' Amotape',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1768,24 ,'20' ,'05' ,'03',1,' Arenal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1769,24 ,'20' ,'05' ,'04',1,' Colan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1770,24 ,'20' ,'05' ,'05',1,' La Huaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1771,24 ,'20' ,'05' ,'06',1,' Tamarindo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1772,24 ,'20' ,'05' ,'07',1,' Vichayal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1773,24 ,'20' ,'06' ,'00',1,' Sullana ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1774,24 ,'20' ,'06' ,'01',1,' Sullana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1775,24 ,'20' ,'06' ,'02',1,' Bellavista',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1776,24 ,'20' ,'06' ,'03',1,' Ignacio Escudero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1777,24 ,'20' ,'06' ,'04',1,' Lancones',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1778,24 ,'20' ,'06' ,'05',1,' Marcavelica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1779,24 ,'20' ,'06' ,'06',1,' Miguel Checa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1780,24 ,'20' ,'06' ,'07',1,' Querecotillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1781,24 ,'20' ,'06' ,'08',1,' Salitral',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1782,24 ,'20' ,'07' ,'00',1,' Talara ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1783,24 ,'20' ,'07' ,'01',1,' Pariñas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1784,24 ,'20' ,'07' ,'02',1,' El Alto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1785,24 ,'20' ,'07' ,'03',1,' La Brea',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1786,24 ,'20' ,'07' ,'04',1,' Lobitos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1787,24 ,'20' ,'07' ,'05',1,' Los Organos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1788,24 ,'20' ,'07' ,'06',1,' Mancora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1789,24 ,'20' ,'08' ,'00',1,' Sechura ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1790,24 ,'20' ,'08' ,'01',1,' Sechura',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1791,24 ,'20' ,'08' ,'02',1,' Bellavista de la Unión',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1792,24 ,'20' ,'08' ,'03',1,' Bernal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1793,24 ,'20' ,'08' ,'04',1,' Cristo Nos Valga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1794,24 ,'20' ,'08' ,'05',1,' Vice',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1795,24 ,'20' ,'08' ,'06',1,' Rinconada Llicuar',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1796,24 ,'21' ,'00' ,'00',1,' Puno',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1797,24 ,'21' ,'01' ,'00',1,' Puno ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1798,24 ,'21' ,'01' ,'01',1,' Puno',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1799,24 ,'21' ,'01' ,'02',1,' Acora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1800,24 ,'21' ,'01' ,'03',1,' Amantani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1801,24 ,'21' ,'01' ,'04',1,' Atuncolla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1802,24 ,'21' ,'01' ,'05',1,' Capachica',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1803,24 ,'21' ,'01' ,'06',1,' Chucuito',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1804,24 ,'21' ,'01' ,'07',1,' Coata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1805,24 ,'21' ,'01' ,'08',1,' Huata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1806,24 ,'21' ,'01' ,'09',1,' Mañazo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1807,24 ,'21' ,'01' ,'10',1,' Paucarcolla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1808,24 ,'21' ,'01' ,'11',1,' Pichacani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1809,24 ,'21' ,'01' ,'12',1,' Plateria',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1810,24 ,'21' ,'01' ,'13',1,' San Antonio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1811,24 ,'21' ,'01' ,'14',1,' Tiquillaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1812,24 ,'21' ,'01' ,'15',1,' Vilque',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1813,24 ,'21' ,'02' ,'00',1,' Azángaro ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1814,24 ,'21' ,'02' ,'01',1,' Azángaro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1815,24 ,'21' ,'02' ,'02',1,' Achaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1816,24 ,'21' ,'02' ,'03',1,' Arapa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1817,24 ,'21' ,'02' ,'04',1,' Asillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1818,24 ,'21' ,'02' ,'05',1,' Caminaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1819,24 ,'21' ,'02' ,'06',1,' Chupa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1820,24 ,'21' ,'02' ,'07',1,' José Domingo Choquehuanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1821,24 ,'21' ,'02' ,'08',1,' Muñani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1822,24 ,'21' ,'02' ,'09',1,' Potoni',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1823,24 ,'21' ,'02' ,'10',1,' Saman',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1824,24 ,'21' ,'02' ,'11',1,' San Anton',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1825,24 ,'21' ,'02' ,'12',1,' San José',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1826,24 ,'21' ,'02' ,'13',1,' San Juan de Salinas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1827,24 ,'21' ,'02' ,'14',1,' Santiago de Pupuja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1828,24 ,'21' ,'02' ,'15',1,' Tirapata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1829,24 ,'21' ,'03' ,'00',1,' Carabaya ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1830,24 ,'21' ,'03' ,'01',1,' Macusani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1831,24 ,'21' ,'03' ,'02',1,' Ajoyani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1832,24 ,'21' ,'03' ,'03',1,' Ayapata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1833,24 ,'21' ,'03' ,'04',1,' Coasa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1834,24 ,'21' ,'03' ,'05',1,' Corani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1835,24 ,'21' ,'03' ,'06',1,' Crucero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1836,24 ,'21' ,'03' ,'07',1,' Ituata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1837,24 ,'21' ,'03' ,'08',1,' Ollachea',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1838,24 ,'21' ,'03' ,'09',1,' San Gaban',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1839,24 ,'21' ,'03' ,'10',1,' Usicayos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1840,24 ,'21' ,'04' ,'00',1,' Chucuito ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1841,24 ,'21' ,'04' ,'01',1,' Juli',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1842,24 ,'21' ,'04' ,'02',1,' Desaguadero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1843,24 ,'21' ,'04' ,'03',1,' Huacullani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1844,24 ,'21' ,'04' ,'04',1,' Kelluyo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1845,24 ,'21' ,'04' ,'05',1,' Pisacoma',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1846,24 ,'21' ,'04' ,'06',1,' Pomata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1847,24 ,'21' ,'04' ,'07',1,' Zepita',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1848,24 ,'21' ,'05' ,'00',1,' El Collao ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1849,24 ,'21' ,'05' ,'01',1,' Ilave',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1850,24 ,'21' ,'05' ,'02',1,' Capazo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1851,24 ,'21' ,'05' ,'03',1,' Pilcuyo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1852,24 ,'21' ,'05' ,'04',1,' Santa Rosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1853,24 ,'21' ,'05' ,'05',1,' Conduriri',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1854,24 ,'21' ,'06' ,'00',1,' Huancané ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1855,24 ,'21' ,'06' ,'01',1,' Huancane',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1856,24 ,'21' ,'06' ,'02',1,' Cojata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1857,24 ,'21' ,'06' ,'03',1,' Huatasani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1858,24 ,'21' ,'06' ,'04',1,' Inchupalla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1859,24 ,'21' ,'06' ,'05',1,' Pusi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1860,24 ,'21' ,'06' ,'06',1,' Rosaspata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1861,24 ,'21' ,'06' ,'07',1,' Taraco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1862,24 ,'21' ,'06' ,'08',1,' Vilque Chico',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1863,24 ,'21' ,'07' ,'00',1,' Lampa ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1864,24 ,'21' ,'07' ,'01',1,' Lampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1865,24 ,'21' ,'07' ,'02',1,' Cabanilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1866,24 ,'21' ,'07' ,'03',1,' Calapuja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1867,24 ,'21' ,'07' ,'04',1,' Nicasio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1868,24 ,'21' ,'07' ,'05',1,' Ocuviri',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1869,24 ,'21' ,'07' ,'06',1,' Palca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1870,24 ,'21' ,'07' ,'07',1,' Paratia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1871,24 ,'21' ,'07' ,'08',1,' Pucara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1872,24 ,'21' ,'07' ,'09',1,' Santa Lucia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1873,24 ,'21' ,'07' ,'10',1,' Vilavila',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1874,24 ,'21' ,'08' ,'00',1,' Melgar ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1875,24 ,'21' ,'08' ,'01',1,' Ayaviri',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1876,24 ,'21' ,'08' ,'02',1,' Antauta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1877,24 ,'21' ,'08' ,'03',1,' Cupi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1878,24 ,'21' ,'08' ,'04',1,' Llalli',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1879,24 ,'21' ,'08' ,'05',1,' Macari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1880,24 ,'21' ,'08' ,'06',1,' Nuñoa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1881,24 ,'21' ,'08' ,'07',1,' Orurillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1882,24 ,'21' ,'08' ,'08',1,' Santa Rosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1883,24 ,'21' ,'08' ,'09',1,' Umachiri',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1884,24 ,'21' ,'09' ,'00',1,' Moho ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1885,24 ,'21' ,'09' ,'01',1,' Moho',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1886,24 ,'21' ,'09' ,'02',1,' Conima',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1887,24 ,'21' ,'09' ,'03',1,' Huayrapata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1888,24 ,'21' ,'09' ,'04',1,' Tilali',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1889,24 ,'21' ,'10' ,'00',1,' San Antonio de Putina ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1890,24 ,'21' ,'10' ,'01',1,' Putina',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1891,24 ,'21' ,'10' ,'02',1,' Ananea',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1892,24 ,'21' ,'10' ,'03',1,' Pedro Vilca Apaza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1893,24 ,'21' ,'10' ,'04',1,' Quilcapuncu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1894,24 ,'21' ,'10' ,'05',1,' Sina',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1895,24 ,'21' ,'11' ,'00',1,' San Román ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1896,24 ,'21' ,'11' ,'01',1,' Juliaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1897,24 ,'21' ,'11' ,'02',1,' Cabana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1898,24 ,'21' ,'11' ,'03',1,' Cabanillas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1899,24 ,'21' ,'11' ,'04',1,' Caracoto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1900,24 ,'21' ,'12' ,'00',1,' Sandia ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1901,24 ,'21' ,'12' ,'01',1,' Sandia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1902,24 ,'21' ,'12' ,'02',1,' Cuyocuyo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1903,24 ,'21' ,'12' ,'03',1,' Limbani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1904,24 ,'21' ,'12' ,'04',1,' Patambuco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1905,24 ,'21' ,'12' ,'05',1,' Phara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1906,24 ,'21' ,'12' ,'06',1,' Quiaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1907,24 ,'21' ,'12' ,'07',1,' San Juan del Oro',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1908,24 ,'21' ,'12' ,'08',1,' Yanahuaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1909,24 ,'21' ,'12' ,'09',1,' Alto Inambari',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1910,24 ,'21' ,'12' ,'10',1,' San Pedro de Putina Punco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1911,24 ,'21' ,'13' ,'00',1,' Yunguyo ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1912,24 ,'21' ,'13' ,'01',1,' Yunguyo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1913,24 ,'21' ,'13' ,'02',1,' Anapia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1914,24 ,'21' ,'13' ,'03',1,' Copani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1915,24 ,'21' ,'13' ,'04',1,' Cuturapi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1916,24 ,'21' ,'13' ,'05',1,' Ollaraya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1917,24 ,'21' ,'13' ,'06',1,' Tinicachi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1918,24 ,'21' ,'13' ,'07',1,' Unicachi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1919,24 ,'22' ,'00' ,'00',1,' San Martín',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1920,24 ,'22' ,'01' ,'00',1,' Moyobamba ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1921,24 ,'22' ,'01' ,'01',1,' Moyobamba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1922,24 ,'22' ,'01' ,'02',1,' Calzada',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1923,24 ,'22' ,'01' ,'03',1,' Habana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1924,24 ,'22' ,'01' ,'04',1,' Jepelacio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1925,24 ,'22' ,'01' ,'05',1,' Soritor',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1926,24 ,'22' ,'01' ,'06',1,' Yantalo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1927,24 ,'22' ,'02' ,'00',1,' Bellavista ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1928,24 ,'22' ,'02' ,'01',1,' Bellavista',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1929,24 ,'22' ,'02' ,'02',1,' Alto Biavo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1930,24 ,'22' ,'02' ,'03',1,' Bajo Biavo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1931,24 ,'22' ,'02' ,'04',1,' Huallaga',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1932,24 ,'22' ,'02' ,'05',1,' San Pablo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1933,24 ,'22' ,'02' ,'06',1,' San Rafael',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1934,24 ,'22' ,'03' ,'00',1,' El Dorado ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1935,24 ,'22' ,'03' ,'01',1,' San José de Sisa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1936,24 ,'22' ,'03' ,'02',1,' Agua Blanca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1937,24 ,'22' ,'03' ,'03',1,' San Martín',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1938,24 ,'22' ,'03' ,'04',1,' Santa Rosa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1939,24 ,'22' ,'03' ,'05',1,' Shatoja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1940,24 ,'22' ,'04' ,'00',1,' Huallaga ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1941,24 ,'22' ,'04' ,'01',1,' Saposoa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1942,24 ,'22' ,'04' ,'02',1,' Alto Saposoa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1943,24 ,'22' ,'04' ,'03',1,' El Eslabón',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1944,24 ,'22' ,'04' ,'04',1,' Piscoyacu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1945,24 ,'22' ,'04' ,'05',1,' Sacanche',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1946,24 ,'22' ,'04' ,'06',1,' Tingo de Saposoa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1947,24 ,'22' ,'05' ,'00',1,' Lamas ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1948,24 ,'22' ,'05' ,'01',1,' Lamas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1949,24 ,'22' ,'05' ,'02',1,' Alonso de Alvarado',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1950,24 ,'22' ,'05' ,'03',1,' Barranquita',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1951,24 ,'22' ,'05' ,'04',1,' Caynarachi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1952,24 ,'22' ,'05' ,'05',1,' Cuñumbuqui',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1953,24 ,'22' ,'05' ,'06',1,' Pinto Recodo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1954,24 ,'22' ,'05' ,'07',1,' Rumisapa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1955,24 ,'22' ,'05' ,'08',1,' San Roque de Cumbaza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1956,24 ,'22' ,'05' ,'09',1,' Shanao',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1957,24 ,'22' ,'05' ,'10',1,' Tabalosos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1958,24 ,'22' ,'05' ,'11',1,' Zapatero',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1959,24 ,'22' ,'06' ,'00',1,' Mariscal Cáceres ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1960,24 ,'22' ,'06' ,'01',1,' Juanjuí',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1961,24 ,'22' ,'06' ,'02',1,' Campanilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1962,24 ,'22' ,'06' ,'03',1,' Huicungo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1963,24 ,'22' ,'06' ,'04',1,' Pachiza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1964,24 ,'22' ,'06' ,'05',1,' Pajarillo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1965,24 ,'22' ,'07' ,'00',1,' Picota ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1966,24 ,'22' ,'07' ,'01',1,' Picota',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1967,24 ,'22' ,'07' ,'02',1,' Buenos Aires',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1968,24 ,'22' ,'07' ,'03',1,' Caspisapa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1969,24 ,'22' ,'07' ,'04',1,' Pilluana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1970,24 ,'22' ,'07' ,'05',1,' Pucacaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1971,24 ,'22' ,'07' ,'06',1,' San Cristóbal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1972,24 ,'22' ,'07' ,'07',1,' San Hilarión',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1973,24 ,'22' ,'07' ,'08',1,' Shamboyacu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1974,24 ,'22' ,'07' ,'09',1,' Tingo de Ponasa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1975,24 ,'22' ,'07' ,'10',1,' Tres Unidos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1976,24 ,'22' ,'08' ,'00',1,' Rioja ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1977,24 ,'22' ,'08' ,'01',1,' Rioja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1978,24 ,'22' ,'08' ,'02',1,' Awajun',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1979,24 ,'22' ,'08' ,'03',1,' Elías Soplin Vargas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1980,24 ,'22' ,'08' ,'04',1,' Nueva Cajamarca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1981,24 ,'22' ,'08' ,'05',1,' Pardo Miguel',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1982,24 ,'22' ,'08' ,'06',1,' Posic',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1983,24 ,'22' ,'08' ,'07',1,' San Fernando',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1984,24 ,'22' ,'08' ,'08',1,' Yorongos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1985,24 ,'22' ,'08' ,'09',1,' Yuracyacu',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1986,24 ,'22' ,'09' ,'00',1,' San Martín ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1987,24 ,'22' ,'09' ,'01',1,' Tarapoto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1988,24 ,'22' ,'09' ,'02',1,' Alberto Leveau',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1989,24 ,'22' ,'09' ,'03',1,' Cacatachi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1990,24 ,'22' ,'09' ,'04',1,' Chazuta',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1991,24 ,'22' ,'09' ,'05',1,' Chipurana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1992,24 ,'22' ,'09' ,'06',1,' El Porvenir',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1993,24 ,'22' ,'09' ,'07',1,' Huimbayoc',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1994,24 ,'22' ,'09' ,'08',1,' Juan Guerra',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1995,24 ,'22' ,'09' ,'09',1,' La Banda de Shilcayo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1996,24 ,'22' ,'09' ,'10',1,' Morales',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1997,24 ,'22' ,'09' ,'11',1,' Papaplaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1998,24 ,'22' ,'09' ,'12',1,' San Antonio',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 1999,24 ,'22' ,'09' ,'13',1,' Sauce',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2000,24 ,'22' ,'09' ,'14',1,' Shapaja',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2001,24 ,'22' ,'10' ,'00',1,' Tocache ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2002,24 ,'22' ,'10' ,'01',1,' Tocache',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2003,24 ,'22' ,'10' ,'02',1,' Nuevo Progreso',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2004,24 ,'22' ,'10' ,'03',1,' Polvora',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2005,24 ,'22' ,'10' ,'04',1,' Shunte',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2006,24 ,'22' ,'10' ,'05',1,' Uchiza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2007,24 ,'23' ,'00' ,'00',1,' Tacna',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2008,24 ,'23' ,'01' ,'00',1,' Tacna ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2009,24 ,'23' ,'01' ,'01',1,' Tacna',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2010,24 ,'23' ,'01' ,'02',1,' Alto de la Alianza',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2011,24 ,'23' ,'01' ,'03',1,' Calana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2012,24 ,'23' ,'01' ,'04',1,' Ciudad Nueva',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2013,24 ,'23' ,'01' ,'05',1,' Inclan',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2014,24 ,'23' ,'01' ,'06',1,' Pachia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2015,24 ,'23' ,'01' ,'07',1,' Palca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2016,24 ,'23' ,'01' ,'08',1,' Pocollay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2017,24 ,'23' ,'01' ,'09',1,' Sama',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2018,24 ,'23' ,'01' ,'10',1,' Coronel Gregorio Albarracín Lanchipa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2019,24 ,'23' ,'02' ,'00',1,' Candarave ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2020,24 ,'23' ,'02' ,'01',1,' Candarave',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2021,24 ,'23' ,'02' ,'02',1,' Cairani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2022,24 ,'23' ,'02' ,'03',1,' Camilaca',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2023,24 ,'23' ,'02' ,'04',1,' Curibaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2024,24 ,'23' ,'02' ,'05',1,' Huanuara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2025,24 ,'23' ,'02' ,'06',1,' Quilahuani',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2026,24 ,'23' ,'03' ,'00',1,' Jorge Basadre ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2027,24 ,'23' ,'03' ,'01',1,' Locumba',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2028,24 ,'23' ,'03' ,'02',1,' Ilabaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2029,24 ,'23' ,'03' ,'03',1,' Ite',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2030,24 ,'23' ,'04' ,'00',1,' Tarata ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2031,24 ,'23' ,'04' ,'01',1,' Tarata',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2032,24 ,'23' ,'04' ,'02',1,' Héroes Albarracín',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2033,24 ,'23' ,'04' ,'03',1,' Estique',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2034,24 ,'23' ,'04' ,'04',1,' Estique-Pampa',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2035,24 ,'23' ,'04' ,'05',1,' Sitajara',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2036,24 ,'23' ,'04' ,'06',1,' Susapaya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2037,24 ,'23' ,'04' ,'07',1,' Tarucachi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2038,24 ,'23' ,'04' ,'08',1,' Ticaco',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2039,24 ,'24' ,'00' ,'00',1,' Tumbes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2040,24 ,'24' ,'01' ,'00',1,' Tumbes ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2041,24 ,'24' ,'01' ,'01',1,' Tumbes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2042,24 ,'24' ,'01' ,'02',1,' Corrales',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2043,24 ,'24' ,'01' ,'03',1,' La Cruz',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2044,24 ,'24' ,'01' ,'04',1,' Pampas de Hospital',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2045,24 ,'24' ,'01' ,'05',1,' San Jacinto',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2046,24 ,'24' ,'01' ,'06',1,' San Juan de la Virgen',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2047,24 ,'24' ,'02' ,'00',1,' Contralmirante Villar ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2048,24 ,'24' ,'02' ,'01',1,' Zorritos',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2049,24 ,'24' ,'02' ,'02',1,' Casitas',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2050,24 ,'24' ,'02' ,'03',1,' Canoas de Punta Sal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2051,24 ,'24' ,'03' ,'00',1,' Zarumilla ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2052,24 ,'24' ,'03' ,'01',1,' Zarumilla',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2053,24 ,'24' ,'03' ,'02',1,' Aguas Verdes',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2054,24 ,'24' ,'03' ,'03',1,' Matapalo',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2055,24 ,'24' ,'03' ,'04',1,' Papayal',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2056,24 ,'25' ,'00' ,'00',1,' Ucayali',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2057,24 ,'25' ,'01' ,'00',1,' Coronel Portillo ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2058,24 ,'25' ,'01' ,'01',1,' Calleria',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2059,24 ,'25' ,'01' ,'02',1,' Campoverde',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2060,24 ,'25' ,'01' ,'03',1,' Iparia',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2061,24 ,'25' ,'01' ,'04',1,' Masisea',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2062,24 ,'25' ,'01' ,'05',1,' Yarinacocha',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2063,24 ,'25' ,'01' ,'06',1,' Nueva Requena',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2064,24 ,'25' ,'01' ,'07',1,' Manantay',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2065,24 ,'25' ,'02' ,'00',1,' Atalaya ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2066,24 ,'25' ,'02' ,'01',1,' Raymondi',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2067,24 ,'25' ,'02' ,'02',1,' Sepahua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2068,24 ,'25' ,'02' ,'03',1,' Tahuania',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2069,24 ,'25' ,'02' ,'04',1,' Yurua',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2070,24 ,'25' ,'03' ,'00',1,' Padre Abad ',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2071,24 ,'25' ,'03' ,'01',1,' Padre Abad',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2072,24 ,'25' ,'03' ,'02',1,' Irazola',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2073,24 ,'25' ,'03' ,'03',1,' Curimana',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2074,24 ,'25' ,'03' ,'04',1,' Neshuya',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2075,24 ,'25' ,'03' ,'05',1,' Alexander Von Humboldt',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2076,24 ,'25' ,'04' ,'00',1,' Purús',' ','ADMIN',now() );
INSERT INTO "pataPerro".tm_ubigeo( id, ind_pais, ind_departamento, ind_provincia,ind_distrito, estado, nombre,gentilicio, usuario_registro,fecha_registro) VALUES ( 2077,24 ,'25' ,'04' ,'01',1,' Purus',' ','ADMIN',now() );


/**RAZAS**/
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '06','AMERICAN BULLY', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '07','AMERICAN FOXHOUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '08','AMERICAN PITBULL TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '09','AMERICAN STAFFORDSHIRE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '10','AUSTRALIAN SILKY TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '11','AZAWAKH', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '12','BARBET', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '13','BASENJI', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '14','BASSET ARTESIANO DE NORMANDIA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '15','BASSET AZUL DE GASCUÑA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '16','BASSET HOUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '17','BASSET LEONARDO DE BRETAÑA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '18','BEAGLE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '19','BEAGLE – HARRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '20','BERGER DE PICARDIE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '21','BICHÓN BOLOÑÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '22','BICHÓN FRISÉ', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '23','BICHÓN HABANERO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '24','BICHÓN MALTÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '25','BILLY', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '26','BLACK AND TAN COONHOUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '27','BLOODHOUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '28','BOBTAIL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '29','BODEGUERO ANDALUZ', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '30','BOERBOEL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '31','BORDER COLLIE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '32','BORDER TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '33','BORZOI (GALGO RUSO)', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '34','BOSTON TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '35','BÓXER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '36','BOYERO AUSTRALIANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '37','BOYERO DE FLANDES', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '38','BOYERO DE LAS ARDENAS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '39','BRACO ALEMÁN DE PELO CORTO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '40','BRACO ALEMÁN DE PELO DURO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '41','BRACO DE AUVERNIA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '42','BRACO DE WEIMAR', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '43','BRACO DEL ARIÈGE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '44','BRACO DEL BOURBONNAIS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '45','BRACO FRANCÉS, TIPO GASCUÑA, TALLA GRANDE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '46','BRACO FRANCÉS, TIPO PIRINEOS, TALLA PEQUEÑA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '47','BRACO ITALIANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '48','BRACO SAN GERMAIN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '49','BRIARD', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '50','BRITTANY', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '51','BROHOLMER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '52','BUHUND NORUEGO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '53','BULL TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '54','BULL TERRIER MINIATURE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '55','BULLDOG', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '56','BULLDOG AMERICANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '57','BULLDOG FRANCÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '58','BULLMASTÍN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '59','CAIRN TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '60','CANE CORSO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '61','CANICHE (POODLE)', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '62','CARLINO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '63','CAVALIER KING CHARLES', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '64','CHIHUAHUA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '65','CHIN JAPONÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '66','CHOW CHOW', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '67','CIMARRÓN URUGUAYO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '68','CIRNECO DEL ETNA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '69','CLUMBER SPANIEL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '70','COBRADOR DE NUEVA ESCOCIA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '71','COCKER SPANIEL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '72','COCKER AMERICANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '73','COLLIE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '74','COLLIE BARBUDO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '75','COLLIE SMOOTH', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '76','CORGI GALÉS CÁRDIGAN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '77','CORGI GALÉS PEMBROKE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '78','COTÓN DE TULÉAR', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '79','CURLY COATED RETRIEVER (DE PELO RIZADO)', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '80','DÁLMATA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '81','DANDIE DINMONT TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '82','DEERHOUND ESCOCÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '83','DOBERMAN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '84','DOGO ARGENTINO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '85','DOGO CANARIO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '86','DOGO DE BURDEOS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '87','DOGO MALLORQUÍN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '88','DREVER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '89','ELKHOUND NORUEGO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '90','EPAGNEUL BRETON', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '91','EURASIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '92','FARAÓN HOUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '93','FIELD SPANIEL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '94','FILA BRASILEIRO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '95','FILA DE SAN MIGUEL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '96','FOX TERRIER PELO DURO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '97','FOX TERRIER DE PELO LISO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '98','FOX TERRIER TOY', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '99','FOXHOUND AMERICANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '100','FOXHOUND INGLÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '101','GALGO ESPAÑOL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '102','GALGO ITALIANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '103','GASCON SAINTONGEOIS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '104','GLEN OF IMAAL TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '105','GOLDEN RETRIEVER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '106','GRAN BASSET GRIFÓN VENDEANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '107','GRAN DANÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '108','GREYHOUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '109','GRIFON BELGA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '110','GRIFÓN DE BRUSELAS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '111','GRIFÓN DE MUESTRA BOHEMIO DE PELO DURO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '112','GRIFÓN DE MUESTRA ESLOVACO DE PELO DURO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '113','GRIFÓN DE MUESTRA KORTHALS DE PELO DURO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '114','HAMILTON STOVARE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '115','HARRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '116','HOKKAÏDO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '117','HOVAWART', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '118','HUSKY SIBERIANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '119','IRISH SOFT COATED WHEATEN TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '120','JACK RUSSELL TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '121','JAMTHUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '122','KAI', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '123','KARJALANKARHUKOIRA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '124','KEEDHOND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '125','KERRY BLUE TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '126','KISHU', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '127','KOMONDOR', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '128','KOREA JINCO DOG', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '129','KROMFOHRLÄNDER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '130','KUVASZ', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '131','LABRADOR RETRIEVER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '132','LAÏKA DE SIBERIA ORIENTAL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '133','LAÏKA RUSO-EUROPEO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '134','LAKELAND TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '135','LANDSEER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '136','LEBREL HÚNGARO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '137','LEONBERGER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '138','LHASA APSO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '139','LUNDEHUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '140','LÖWCHEN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '141','MALAMUTE DE ALASKA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '142','MASTÍN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '143','MASTÍN NAPOLITANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '144','MASTÍN TIBETANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '145','MESTIZO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '146','MUDI', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '147','MÜNSTERLÄNDER GRANDE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '148','MÜNSTERLÄNDER PEQUEÑO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '149','OTTERHOUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '150','PAPILLON', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '151','PARSON RUSSELL TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '152','PASTOR ALEMÁN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '153','PASTOR AUSTRALIANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '154','PASTOR BELGA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '155','PASTOR BLANCO SUIZO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '156','PASTOR CATALÁN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '157','PASTOR DE ANATOLIA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '158','PASTOR DE BEAUCE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '159','PASTOR DE LOS PIRINEOS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '160','PASTOR DE SHETLAND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '161','PASTOR POLACO DE TIERRAS BAJAS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '162','PEQUEÑO BASSET GRIFÓN VENDEANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '163','PEQUEÑO BRABANZÓN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '164','PEQUEÑO PERRO HOLANDÉS PARA LA CAZA ACUÁTICA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '165','PEQUINÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '166','PERDIGUERO DE BURGOS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '167','PERDIGUERO DE DRENTE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '168','PERDIGUERO PORTUGUÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '169','PERRO CRESTADO CHINO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '170','PERRO DE AGUA AMERICANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '171','PERRO DE AGUA ESPAÑOL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '172','PERRO DE AGUA PORTUGUÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '173','PERRO DE CANAAN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '174','PERRO DE CASTRO LABOREIRO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '175','PERRO DE GROENLANDIA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '176','PERRO DE MONTAÑA APPENZELL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '177','PERRO DE MONTAÑA BERNÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '178','PERRO DE MONTAÑA DE LA SIERRA DE LA ESTRELA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '179','PERRO DE MONTAÑA DE LOS PIRINEOS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '180','PERRO DE MONTAÑA DEL ATLAS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '181','PERRO DE MONTAÑA GRAN SUIZO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '182','PERRO DE MUESTRA ALEMÁN DE PELO CERDOSO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '183','PERRO DE MUESTRA DANÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '184','PERRO DE PASTOR BERGAMASCO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '185','PERRO DE PASTOR DE ASIA CENTRAL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '186','PERRO DE PASTOR DE KARST', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '187','PERRO DE PASTOR DE RUSIA MERIDIONAL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '188','PERRO DE PASTOR DEL CÁUCASO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '189','PERRO DE PASTOR ISLANDÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '190','PERRO DE PASTOR POLACO DE LAS LLANURAS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '191','PERRO DE PASTOR POLACO DE PODHALE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '192','PERRO DE PASTOR PORTUGUÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '193','PERRO DE PASTOR YUGOSLAVO DE CHARPLANINA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '194','PERRO ENTLEBUCHER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '195','PERRO ESQUIMAL AMERICANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '196','PERRO ESQUIMAL CANADIENSE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '197','PERRO LOBO CHECOSLOVACO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '198','PERRO LOBO DE SARLOOS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '199','PERRO PASTOR CROATO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '200','PERRO PASTOR MALLORQUÍN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '201','PERRO PASTOR MAREMMANO-ABRUZZESE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '202','PERRO SIN PELO DEL PERÚ', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '203','PERRO SIN PELO MEXICANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '204','PERRO SMOUS HOLANDÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '205','PINSCHER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '206','PINSCHER AUSTRIACO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '207','PINSCHER MINIATURA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '208','PLOTT HOUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '209','PODENCO CANARIO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '210','PODENCO IBICENCO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '211','PODENCO PORTUGUÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '212','POINTER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '213','POINTER ALEMÁN DE PELO CORTO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '214','POINTER ALEMÁN DE PELO DURO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '215','POITEVIN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '216','POMERANIA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '217','PORCELAINE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '218','PUDELPOINTER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '219','PULI', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '220','PUMI', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '221','RAFEIRO DEL ALENTEJO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '222','RASTREADOR DE HANNOVER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '223','RASTREADOR MONTAÑÉS DE BAVIERA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '224','RETRIEVER DE LA BAHÍA DE CHESAPEAKE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '225','RETRIEVER DE PELO LISO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '226','RIDGEBACK DE RODESIA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '227','ROTTWEILER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '228','SABUESO ALEMÁN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '229','SABUESO ARTESIANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '230','SABUESO AUSTRIACO NEGRO Y FUEGO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '231','SABUESO DE BOSNIA DE PELO CERDOSO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '232','SABUESO DE HYGEN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '233','SABUESO DE LAS MONTAÑAS DE MONTENEGRO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '234','SABUESO DE SMALAND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '235','SABUESO DE TRANSILVANIA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '236','SABUESO DEL TIROL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '237','SABUESO ESLOVACO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '238','SABUESO ESPAÑOL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '239','SABUESO ESTIRIO DE PELO DURO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '240','SABUESO FINLANDÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '241','SABUESO FRANCÉS TRICOLOR', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '242','SABUESO HALDEN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '243','SABUESO ITALIANO DE PELO CORTO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '244','SABUESO ITALIANO DE PELO DURO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '245','SABUESO NORUEGO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '246','SABUESO POLACO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '247','SABUESO SCHILLER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '248','SABUESO SERBIO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '249','SABUESO SUIZO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '250','SABUESO TRICOLOR SERBIO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '251','SALUKI (GALGO PERSA)', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '252','SAMOYEDO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '253','SAN BERNARDO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '254','SCHAPENDOES NEERLANDÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '255','SCHIPPERKE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '256','SCHNAUZER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '257','SCHNAUZER GIGANTE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '258','SCHNAUZER MINIATURA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '259','SEALYHAM TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '260','SETTER GORDON', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '261','SETTER INGLÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '262','SETTER IRLANDÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '263','SETTER IRLANDÉS ROJO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '264','SETTER IRLANDÉS ROJO Y BLANCO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '265','SHAR PEI', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '266','SHIBA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '267','SHIHTZU', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '268','SHIKOKU', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '269','SILKY TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '270','SLOUGHI (GALGO ÁRABE)', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '271','SPANIEL CONTINENTAL ENANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '272','SPANIEL DE AGUA IRLANDÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '273','SPANIEL DE PONT-AUDEMER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '274','SPANIEL DE SUSSEX', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '275','SPANIEL PICARDO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '276','SPANIEL TIBETANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '277','SPINONE ITALIANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '278','SPITZ ALEMÁN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '279','SPITZ FINLANDÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '280','SPITZ JAPONÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '281','SPRINGER SPANIEL GALÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '282','SPRINGER SPANIEL INGLÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '283','SPITZ DE NORRBOTTEN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '284','STABYHOUN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '285','STAFFORDSHIRE BULL TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '286','TCHUVATCH ESLOVACO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '287','TECKEL', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '288','TEJONERO ALPINO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '289','TEJONERO DE WESTFALIA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '290','TERRANOVA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '291','TERRIER AUSTRALIANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '292','TERRIER BEDLINGTON', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '293','TERRIER BRASILEÑO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '294','TERRIER CAZADOR ALEMÁN', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '295','TERRIER CESKY', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '296','TERRIER DE AIREDALE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '297','TERRIER DE NORFOLK', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '298','TERRIER DE SKYE', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '299','TERRIER ESCOCÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '300','TERRIER GALÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '301','TERRIER IRLANDÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '302','TERRIER JAPONÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '303','TERRIER TIBETANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '304','THAI RIDGEBACK DOG', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '305','TOSA INU', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '306','VALHUND SUECO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '307','VIZSLA', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '308','VOLPINO ITALIANO', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '309','WEST HIGHLAND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '310','WETTERHOUND', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '311','WHEATEN TERRIER', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '312','WHIPPET', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '313','WOLFHOUND IRLANDÉS', 1, now(), 'ADMIN', null,null, null);
INSERT INTO "pataPerro".tm_elemento(id, grupo_elemento_id, des_abreviacion, des_codigo, des_nombre, estado, fecha_registro, usuario_registro, fecha_modifico, usuario_modifico, des_referencia)VALUES (nextval('"pataPerro".tm_elemento_id_seq'), 3, '', '314','YORKSHIRE TERRIER', 1, now(), 'ADMIN', null,null, null);

	