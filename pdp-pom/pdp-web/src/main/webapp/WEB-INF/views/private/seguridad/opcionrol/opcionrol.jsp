<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>

    <jsp:include page="../../include/includescripts.jsp"></jsp:include>

<!-- Ext Js 6 -->
<link href="<c:url value="/ext/theme-triton/resources/theme-triton-all.css" />" rel="stylesheet" />
<script type='text/javascript'  src="<c:url value="/ext/ext-all.js" />"></script>
<script type='text/javascript' src="<c:url value="/ext/theme-triton/theme-triton.js" />"></script>
<script type='text/javascript' src="<c:url value="/ext/locale/locale-es.js" />"></script>

</head>

<body style="background: #fff;">
<div class="row clearfix">
     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
 		<div class="card">  	
 			
 			<div class="header"> 
				<h5 >Administración
				de Roles por Opción</h5>
			</div>
		 	<div class="body"> 
			
				<div id="jstree" ></div>
			
			</div>	
				
			<div style="width:100%;">
					<div style="width:300px;text-align: center;padding-top: 40px;">
					
					<a href="#" class="btn btn-primary btn-lg m-l-15 waves-effect" id="btn-guardar-rol-opcion">Guardar cambios</a>
					
					</div>
				</div>
			</div>
		</div>
	</div>

  	<!-- Jquery Core Js -->
 	<script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>
 	
    <!-- Sweet Js -->
 	<script src="<c:url value="/plugins/sweetalert/sweetalert.min.js"/>"></script>  

 	<!-- Validate Js -->
 	<script src="<c:url value="/plugins/jquery-validation/jquery.validate.js"/>"></script>
 	<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
 	 	
 	 	
    <!-- Bootstrap Core Js -->
    <script src="<c:url value="/plugins/bootstrap/js/bootstrap.js"/>"></script>


 	<script src="<c:url value="/js/admin.js"/>"></script>
 	<script src="<c:url value="/js/pages/main.js"/>"></script>  
	<script src="<c:url value="/js/pages/opcion_rol/opcion_rol.js"/>"></script>
	


</body>
</html>
