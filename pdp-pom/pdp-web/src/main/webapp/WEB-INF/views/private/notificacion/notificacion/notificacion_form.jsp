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
		                                <li><a href="../notificacion">Listado Notificaci&oacute;n</a></li>
		                                <li class="active">${tituloNotificacion}</li>
		        </ol>
                           
 	
 			<form id="formNotificacion_validation" method="POST" enctype="multipart/form-data" accept-charset="utf-8" >
 			
 			 		<div class="row clearfix">  
 			 			<input type="hidden" id="dataNotificacion" value='${dataNotificacion}'/>
                  		<input type="hidden" id="id" name="id"  />   
                          <div class="col-lg-4 col-lg-4 col-sm-4 " >
                     		 <div class="form-group form-float">
                     		 <label>Tipo Notificación</label>
                                   <select name="tipoNotificacion" id="tipoNotificacion" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Tipo Notificaci&oacute;n --</option>
                                     
                                   </select>
                              </div> 
		                   </div>
		                  <div class="col-lg-4 col-lg-4 col-sm-4 " >
                     		 <div class="form-group form-float">
                     		 <label>Medio</label>
                                   <select name="tipoMedio" id="tipoMedio" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Medio --</option>
                                     
                                   </select>
                              </div> 
		                   </div>
                     </div> 
 			
		                                
                  <div class="row clearfix" >  
                         <div class="col-lg-4 col-md-4 col-sm-4 " > 
                         <label>Fecha Emision</label> 
	                      		 <div class="input-group">
                                       <span class="input-group-addon">
                                           <i class="material-icons">date_range</i>
                                       </span>
                                       <div class="form-line" >
                                           <input type="text"  name="fechaEmision" id="fechaEmision" class="datepicker" placeholder="Fecha Emision">
                                       </div>
                                  </div>
                      	 </div>
		                  <div class="col-lg-4 col-md-4 col-sm-4 " >  
		                  <label>Fecha de Recepcion</label>
	                      		 <div class="input-group">
                                       <span class="input-group-addon">
                                           <i class="material-icons">date_range</i>
                                       </span>
                                       <div class="form-line" >
                                           <input type="text"  name="fechaRecepcion" id="fechaRecepcion" class="datepicker"  placeholder="Fecha Recepcion">
                                       </div>
                                  </div>
                      	 </div>
                      	 
                      	   <div class="col-lg-3 col-lg-3 col-sm-3 " >
                     		 <div class="form-group form-float">
                     		 <label>Estado</label>
                                   <select name="estaoo" id="estado" class="form-control show-tick">
                                      <option value="0">-- Seleccionar Estado--</option>
                                      <option value="1" selected="selected">ACTIVO</option>
                                      <option value="2">DESACTIVADO</option>
                                   </select>
                              </div> 
		                   </div>
                      	 
                      	  
                     </div>   
                     
                   	<div class="row clearfix">
                   	 	<div class="col-lg-2 col-md-2 col-sm-2 " >  
	                      		 <div class="input-group">
                                       <span class="input-group-addon">
                                           <i class="material-icons">mail</i>
                                           <i class="material-icons">send</i>
                                       </span>
                                       
                                         <label class="form-label" for="Titulo" >Enviar a Receptor(es) por:</label>
                    
                                  </div>
                      	 </div>
                   	 	<div class="col-lg-5 col-lg-5 col-sm-5 " >
		                 	 <div class="input-group input-group-lg-2">
		                		<span class="input-group-addon">
                                            <input type="checkbox" class="filled-in" id="ig_checkbox" onclick="changeDestino(this)">
                                            <label for="ig_checkbox"></label>
                                        </span>
	                     		 <div class="form-group form-float">
	                     		 <label>ROL</label>
	                                   <select name="rolId" id="rolId" class="form-control show-tick">
	                                       <option value="0">-- Seleccionar Rol --</option>
	                                     
	                                   </select>
	                              </div> 
                             </div>
		               </div>
                   	
		                <div class="input-field col s5">
		                    <div class="autocomplete" id="multiple">
		                        <div class="ac-input">
		                            <input type="text" id="usuarioDestino" name="usuarioDestino" placeholder="Ingresar un usuario(Destino) especifico.." data-activates="multipleDropdown" data-beloworigin="true" autocomplete="off">
		                        </div>
		                         <input type="hidden" id="usuarioDestinoId" name="usuarioDestinoId" />
		                         <div id="suggesstion-box" class="ac-users"></div>
		                    </div>
		                </div>
		            </div>
                     
                     <div class="row clearfix">  
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <textarea rows="4" name="descripcion"  id="descripcion"  class="form-control no-resize" placeholder="Contenido"></textarea>
                                        </div>
                                    </div>
                                </div>
                     </div> 
                     
                     
                       <button class="btn btn-primary waves-effect" type="submit" id="guardarNotificacion" >Guardar</button>
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
     <script src="<c:url value="/js/pages/notificacion/notificacion_form.js"/>"></script>

	<script src="<c:url value="/plugins/materialize-css/materialize.js"/>"></script>
</body>
</html>