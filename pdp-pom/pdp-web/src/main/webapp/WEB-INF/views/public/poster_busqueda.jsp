<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="es">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Se perdió un engreído, ayúdanos a encontrarlo aquí</title>

<jsp:include page="include/includescripts.jsp"></jsp:include>

<!-- Mapa Google Styles -->
<link rel="stylesheet" href="css/mapaGoogle.css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" type="text/css">

<style>
.nav-wrapper{
background-color: #60116A;height: 74px !important;
}

.foto-publicacion{
margin-top: 30px;
}

.etiquetas{}

.etiquetas b{
color: #ffb300;
}

</style>

</head>
<body class="theme-purple bg-white" >

  <nav >
    <div class="nav-wrapper center">
   			<div class="container"><img src="imagenes/logo_top.jpg" class="responsive-img"  /></div>
    </div>
  </nav>
  
  <div class="container">
	  <div class = "row center foto-publicacion">
				
				<div class="col s12 m6 l6" style="margin-bottom: 15px;">
					<img id="fotoMascota" class="responsive-img z-depth-2"  src="http://138.197.88.11:8080/pdp/${item.fotoBusqueda.foto}"/>
				</div>
				
				<div class="col s12 m6 l6 responsive-img" id = "map" style="border:1px solid #ccc;" >
				
				</div>
				
					
	  </div>

		<div class="row black-text">
			<div class="col s12 m12 l12 center ">
				<h4 style="text-shadow: 1px 2px 2px #666;margin-bottom: 30px;">${item.nombre}</h4>
			</div>

			<div class="col s12 m6 l6 etiquetas">
				<div class="row">
					<div class="col s4 m4 l4"> <b>Raza</b></div> <div class="col s8 m8 l8">${item.desRaza}</div>
				</div>
				
				<div class="row">
					<div class="col s4 m4 l4"> <b>Sexo</b></div> <div class="col s8 m8 l8">${item.desGenero}</div>
				</div>
				
				<div class="row">
					<div class="col s4 m4 l4"> <b>Tamaño</b></div> <div class="col s8 m8 l8">${item.desTamanio}</div>
				</div>
				
				<div class="row">
					<div class="col s4 m4 l4"> <b>Color</b></div> <div class="col s8 m8 l8">${item.desColor}</div>
				</div>
				
			
			</div>
			
			<div class="col s12 m6 l6 etiquetas">
			
				<div class="row">
					<div class="col s4 m4 l4"> <b>Descripción</b></div> <div class="col s8 m8 l8">${item.descripcion}<br><b style="color:#000;" id="fecEvento"></b></div>
				</div>
				
				<div class="row">
					<div class="col s4 m4 l4"> <b>Distrito</b></div> <div class="col s8 m8 l8">${item.desDistrito}</div>
				</div>
				
				<div class="row">
					<div class="col s4 m4 l4"> <b>Recompensa</b></div> <div class="col s8 m8 l8">${item.montoRecompensa}</div>
				</div>
				
				<div class="row">
					<div class="col s4 m4 l4"> <b>Contacto</b></div> <div class="col s8 m8 l8"><b style="color:#000;">${item.usuario.persona.nombreCompleto}</b><br>${item.usuario.usuario}<br>${item.telefono}</div>
				</div>
			</div>
			
		</div>
		
		
		<div class="row">
			<div class="col s6 m6 l6 center">
			 	<img id="logo" class="responsive-img" style="width: 70%"    src="imagenes/google-play-store.png"/>	
			</div>
			<div class="col s6 m6 l6 center">
				 <img id="logo" class="responsive-img" style="width: 70%"    src="imagenes/app-store.png"/>	
			</div>	
		</div>
		
		
		

	</div>	
	
	
	<!-- Jquery Core Js -->
	<script src="plugins/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core Js -->
	<script src="plugins/bootstrap/js/bootstrap.js"></script>

	<!-- Bootstrap Core Js -->
	<script src="plugins/bootstrap/js/bootstrap.js"></script>

	<!-- Waves Effect Plugin Js -->
	<script src="plugins/node-waves/waves.js"></script>

	<!-- Jquery Core Js -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

	<!-- Custom Js -->
	<script src="js/admin.js"></script>
	
	<!-- moment Js -->
	<script src="js/moment.js"></script>

	<!-- Google Maps API Js -->
	<script	src="https://maps.googleapis.com/maps/api/js?v=3.exp&oe=utf8&key=AIzaSyBI8ANaDD0A_LNzeGeLiYHIH7bX0I-OMVs"></script>


<script type="text/javascript">

	function init() {
		var myLatlngBase;
		var ubicacion = '${item.busquedaUbicacionCatastro}';
		console.log(ubicacion);
		if (ubicacion != '') {
			var res = ubicacion.split(" ");
			myLatlngBase = new google.maps.LatLng(parseFloat(res[0]),
					parseFloat(res[1]));
		}
		//var myLatlng = new google.maps.LatLng(20.68009, -101.35403);
		var myOptions = {
			zoom : 17,
			center : myLatlngBase,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map($("#map").get(0), myOptions);
		var marker = new google.maps.Marker({
			position : myLatlngBase,
			map : map,
			title : "Mascota"
		});
	}

	$(document).ready(function(){

		try{
			$('#fecEvento').html('Se perdió el '+moment(new Date('${item.fechaPerdida}')).format('DD/MM/YYYY hh:mm A'));
		}catch(e){}
		
		$('#map').css('height',$('#fotoMascota').height()+'px');

		$( window ).resize(function() {
			$('#map').css('height',$('#fotoMascota').height()+'px');
		});

		init();
		
	});
	
</script>


</body>
</html>