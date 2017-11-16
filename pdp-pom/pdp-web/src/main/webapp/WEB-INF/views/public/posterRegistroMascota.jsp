<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>¡¡Patadeperroapp.com tiene un nuevo integrante!!</title>

<jsp:include page="include/includescripts.jsp"></jsp:include>
<style>
@font-face {
	font-family: segoePrint;
	src: url(plugins/bootstrap/fonts/fonts.com_SegoePrint.ttf)
		format('truetype');
}

@font-face {
	font-family: segoeUI;
	src: url(plugins/bootstrap/fonts/segoe-ui.ttf) format('truetype');
}
body{
font-family: segoePrint; !important;
background-image: url('imagenes/fondo_morado.jpg'); no-repeat;
	
}


.color-texto-bienvenido{
	color:#EDB63B;
}

.color-texto-bienvenido h4{
	text-align:center;
}

.color-texto-bienvenido h4>span{
	text-transform: uppercase;
}


</style>

</head>
<body class="theme-purple bg-purple" >

	<div class = "container">
	
		<div class = "row" >
			<div class = "col s12 color-texto color-texto-bienvenido">
			 <h4><span>${objectMascota.nombre}</span> es ahora parte de la comunidad mas grande de doglovers.</h4>
			<h4 >¡¡BIENVENIDO <span>${objectMascota.nombre}</span>!!</h4>
			</div>
		</div>
		
		<div class = "row center">
			<img id="fotoMascota" class="responsive-img"  src="http://138.197.88.11:8080/pdp/${objectMascota.fotoPrincipal.foto}"/>	
		</div>
		
		<div class = "row">
		
		<div class="col s6 m6 l6 center">
		 <img id="logo" class="responsive-img" style="width: 100%"    src="imagenes/pata_perro_logo_poster.jpg"/>	
		</div>
		
		<div class="col s6 m6 l6 center">
			<h6 style="color:#EDB63B !important;">Descargala ya!!</h6>
			<div class="row clearfix center">
			    <div class="col s12 m12 l12" >
			    <img id="appstore" class="responsive-img" style="width: 56%"  src="imagenes/google-play-store.png"  />
					
				</div>
			</div>
			
			<div class="row clearfix center">
			    <div class="col s12 m12 l12" >
					<img id="appstore" class="responsive-img" style="width: 56%"  src="imagenes/app-store.png"  />
				</div>
			</div>
			
		</div>
		
		</div>
        
	</div>

</body>
</html>