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
                                <li><a href="../opcion">Listado Opción</a></li>
                                <li class="active">${tituloOpcion}</li>
        </ol>
                           
 	
 		<form id="formOpcion_validation" method="POST" >
		                                
                    <div class="row clearfix">
                       <div class="col-lg-3 col-md-3 col-sm-3 ">
                  		<input type="hidden" id="dataOpcion" value='${dataOpcion}'/>
                  		<input type="hidden" id="id" name="id"  />
	                  		<div class="form-group form-float">
								<label>Nivel</label>
								<select class="form-control show-tick" id="indJerarquia" name="indJerarquia" >
									<option value="0" selected="selected">Seleccionar Nivel</option>
									<option value="1">Nivel Superior</option>
									<option value="2">Padre</option>
									<option value="3">Hijo</option>
							 	</select>
						      </div>                 
					     </div>
					      <div class="col-lg-3 col-md-3 col-sm-3 " id="padresuperior" style="display:none">
					        <div class="form-group form-float"> 
					        <label>Modulo</label>              
						          <select class="form-control show-tick" id="padreSuperiorId" name="padreId">
									<option value="0" selected="selected">Seleccionar Superior</option>		
							</select>
                      	    </div>
                     		
                       </div>
                       <div class="col-lg-3 col-md-3 col-sm-3 " id="padrehijo" style="display:none">
                      		<div class="form-group form-float">
	                           <select class="form-control show-tick" id="padreHijoId" name="hijoId">
								<option value="0" selected="selected">Seleccionar Padre/Hijo</option>
							</select>
                          	
                            </div>
                       </div>
                   </div>  
                   <div class="row clearfix">    
                       <div class="col-lg-6 col-md-6 col-sm-6 " id="modulo" style="display:none">
                        <div class="form-group form-float">
                           <div class="form-line">
                         <label class="form-label" for="nombre" >Opci&oacute;n</label>
                         	<input type="text" id="nombre" name="nombre"  class="form-control" minlength="1">
                         	</div>
                        </div>
                       </div>
                       <div class="col-lg-6 col-md-6 col-sm-6 " id="accionopcion" style="display:none">
                         <div class="form-group form-float">
                         <div class="form-line">
                         	<label class="form-label" for="accion" >Acci&oacute;n</label>
                         	<input type="text" id="accion" name="accion" class="form-control"  minlength="1">
                        	</div>
                        </div>
                        </div>
                     </div>   
                       <button class="btn btn-primary waves-effect" type="submit" id="guardarOpcion" >Guardar</button>
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
     
    <!-- Validate Js -->
 	<script src="<c:url value="/plugins/jquery-validation/jquery.validate.js"/>"></script>
 	<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
 	  
     
     <!-- Jquery DataTable Plugin Js -->
    <script src="<c:url value="/plugins/jquery-datatable/jquery.dataTables.js"/>"></script>
    
    <!-- Sweet Js -->
 	<script src="<c:url value="/plugins/sweetalert/sweetalert.min.js"/>"></script>  
 	 
 	<!-- Validate Js -->
 	<script src="<c:url value="/plugins/jquery-validation/jquery.validate.js"/>"></script>

 	
     	
     	
     <script src="<c:url value="/js/admin.js"/>"></script>
	 <script src="<c:url value="/js/pages/opcion/opcion.js"/>"></script>
</body>
</html>