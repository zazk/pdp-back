<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <jsp:include page="../../include/includescripts.jsp"></jsp:include>
</head>
<body>

   <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
   
 	<div class="body">
 	
 	   <ol class="breadcrumb breadcrumb-col-pink">
                                <li><a href="../rol">Listado Rol</a></li>
                                <li class="active">${tituloRol}</li>
        </ol>
                           
 	
 		<form id="formRol_validation" method="POST" >
		                                
                   <div class="row clearfix">  
                   		<input type="hidden" id="dataRol" value='${dataRol}'/>
                  		<input type="hidden" id="id" name="id"  />  
                       <div class="col-lg-3 col-lg-3 col-sm-3 " >
                        <div class="form-group form-float">
                           <div class="form-line">
                        	 <label class="form-label" for="nombre" >Rol</label>
                         	<input type="text" id="nombre" name="nombre" value="" class="form-control" minlength="1">
                         	</div>
                        </div>
                       </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 ">
                        	<div class="form-group form-float">
                        	 	<label>Medio</label>
					            <select class="form-control show-tick" id="tipo" name="tipo" >
									<option value="0" selected="selected">-- Seleccionar Medio --</option>		
								</select>
							</div>
                       </div>
                     </div>   
                       <button class="btn btn-primary waves-effect" type="submit" id="guardarRol" >Guardar</button>
                   </form>
			</div>
		</div>
		</div>
		</div>
	
	<!-- Jquery Core Js -->			
	<script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>

    <!-- Bootstrap Core Js -->
    <script src="<c:url value="/plugins/bootstrap/js/bootstrap.js"/>"></script>

 	<!-- Materialize Js -->
    <script src="<c:url value="/plugins/materialize-css/js/materialize.js"/>"></script> 
     
     <!-- Jquery DataTable Plugin Js -->
    <script src="<c:url value="/plugins/jquery-datatable/jquery.dataTables.js"/>"></script>
    
    <!-- Sweet Js -->
 	<script src="<c:url value="/plugins/sweetalert/sweetalert.min.js"/>"></script>  
 	 
 	<!-- Validate Js -->
 	<script src="<c:url value="/plugins/jquery-validation/jquery.validate.js"/>"></script>
 	 	<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
     	
     	
     <script src="<c:url value="/js/admin.js"/>"></script>
	 <script src="<c:url value="/js/pages/rol/rol_form.js"/>"></script>
</body>
</html>