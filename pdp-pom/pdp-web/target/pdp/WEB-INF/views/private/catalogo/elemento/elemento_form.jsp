<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		                                <li><a href="../elemento">Listado Elemento</a></li>
		                                <li class="active">${tituloElemento}</li>
		        </ol>
                           
 	
 			<form id="formElemento_validation" method="POST" >
 			
 			 		<div class="row clearfix">  
 			 			<input type="hidden" id="dataElemento" value='${dataElemento}'/>
                  		<input type="hidden" id="id" name="id"  />   
                          <div class="col-lg-4 col-lg-4 col-sm-4 " >
                     		 <div class="form-group form-float">
                                   <select name="grupoElementoId" id="grupoElementoId" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Grupo--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
		                  <div class="col-lg-6 col-lg-6 col-sm-6 " >  
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         <label class="form-label" for="desNombre" >Nombre</label>
	                         	<input type="text" id="desNombre" name="desNombre" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                      	 </div>
                     </div> 
 			
		          <div class="row clearfix">  
		                  <div class="col-lg-9 col-lg-9 col-sm-9 " >  
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         <label class="form-label" for="desAbreviacion" >Abreviaci&oacute;n</label>
	                         	<input type="text" id="desAbreviacion" name="desAbreviacion" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                      	 </div>
                     </div> 
                     
                       <button class="btn btn-primary waves-effect" type="submit" id="guardarElemento" >Guardar</button>
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
 	 	
 	<!-- Input Mask Plugin Js -->
    <script src="<c:url value="/plugins/jquery-inputmask/jquery.inputmask.bundle.js"/>"></script>
    
     <!-- Slimscroll Plugin Js -->
    <script src="<c:url value="/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>	
     	
     <script src="<c:url value="/js/modals.js"/>"></script>	
     <script src="<c:url value="/js/admin.js"/>"></script>
    <script src="<c:url value="/js/pages/elemento/elemento_form.js"/>"></script>


</body>
</html>