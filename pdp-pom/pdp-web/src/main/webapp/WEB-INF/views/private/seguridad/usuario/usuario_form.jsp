<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <jsp:include page="../../include/includescripts.jsp"></jsp:include>
 <link  rel="stylesheet" href="<c:url value="/plugins/materialize-css/css/materialize.css"/>"   />

</head>
<body>

 <div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
     <div class="card">
 		<div class="body">
		 	   <ol class="breadcrumb breadcrumb-col-pink">
		               <li><a href="../usuario">Listado Usuarios</a></li>
		               <li class="active">${tituloUsuario}</li>
		        </ol>
                           
 	
 			<form id="formUsuario_validation" name="formUsuario_validation" method="POST" 
 			enctype="multipart/form-data" accept-charset="utf-8" >
 			

		           <div class="row clearfix">
		                <div class="input-field col s8">
		                    <div class="autocomplete" id="multiple">
		                        <div class="ac-input">
		                            <input type="text" id="search-box" placeholder="Ingresar el nombre de la persona.." data-activates="multipleDropdown" data-beloworigin="true" autocomplete="off">
		                        </div>
		                         <input type="hidden" id="personaId" name="personaId" />
		                         <div id="suggesstion-box" class="ac-users"></div>
		                    </div>
		                    
		                </div>
		            </div>
 			
 			
 			
 			 		<div class="row clearfix">  
 			 			<input type="hidden" id="dataUsuario" value='${dataUsuario}'/>
                  		<input type="hidden" id="id" name="id"  />
                  		
                  		
                  		<div class="col-lg-6 col-lg-6 col-sm-6 " >  
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         <label class="form-label" for="usuario" >Usuario</label>
	                         	<input type="text" id="usuario" name="usuario" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                      	 </div>
                  		   
                          <div class="col-lg-6 col-lg-6 col-sm-6 " >  
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         <label class="form-label" for="pass" >Contrase&ntilde;a</label>
	                         	<input type="password" id="pass" name="pass" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                      	 </div>
		                  
                  </div> 
 			
		                                
                 
                     
                   	
                     
                     <div class="row clearfix">  
                    		  <div class="col-lg-6 col-md-6 col-sm-6 ">
                    		  	
	                     		 <div class="form-group form-float">
	                            	   <label>Rol</label>
	                                   <select name="rolid" id="rolid" class="form-control show-tick">
	                                       <option value="0"> -- Seleccionar Rol -- </option>
	                                     
	                                   </select>
	                              </div> 
			                   </div>
		                   
		                   
		                    <div class="col-lg-3 col-md-3 col-sm-3 ">
	                     		 <div class="form-group form-float">
	                                   <label>Alerta de Notificaciones</label>
	                                   <select name="indAlerta" id="indAlerta" class="form-control show-tick">
	                                       <option value=""> -- Seleccionar Ind. Alerta -- </option>
	                                     <option value="1" selected>ON</option>
	                                     <option value="0">OFF</option>
	                                   </select>
	                              </div> 
			                   </div>
                               
                     </div> 
                     
                   
                    <button class="btn btn-primary waves-effect" type="submit" id="guardarUsuario" >Guardar</button>
                  </form>
			</div>
		</div>
		</div>
		</div>



	<!-- Jquery Core Js -->			
	<script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>

    <!-- Bootstrap Core Js -->
    <script src="<c:url value="/plugins/bootstrap/js/bootstrap.js"/>"></script>

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
    <script src="<c:url value="/js/pages/usuario/usuario_form.js"/>"></script>



</body>
</html>