
INSERT INTO "pataPerro".tm_grupo_elemento (des_abreviacion,estado,nombre,usuario_registro,fecha_registro,usuario_modifico,fecha_modifico) 
VALUES ('PARAMETROS',1,'PARAMETROS','pdp_web_user','2017-03-19 21:24:00.796891','ADMIN','2017-04-14 02:36:23.495000');

select * from "pataPerro".tm_elemento;

INSERT INTO "pataPerro".tm_elemento (grupo_elemento_id,des_abreviacion,des_codigo,des_nombre,estado,fecha_registro,usuario_registro,fecha_modifico,usuario_modifico,des_referencia) 
VALUES (14,'URL_BUSQUEDA_QR','01','URL BUSQUEDA QR',1,'2017-03-19 21:24:00.796891','pdp_web_user',null,null,null);	