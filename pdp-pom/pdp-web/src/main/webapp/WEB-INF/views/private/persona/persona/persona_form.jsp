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
	                                <li><a href="../persona">Listado Personas</a></li>
	                                <li class="active">${tituloPersona}</li>
	        </ol>
                           
 	
 			<form id="formPersona_validation" method="POST" >
 			
 			
 			
 				 <div class="row clearfix"> 
 				   		<input type="hidden" id="dataPersona" value='${dataPersona}'/>
                  		<input type="hidden" id="id" name="id"  />   
                  		<input type="hidden" id="ubicacionCatastro" name="ubicacionCatastro" />
                          <div class="col-lg-6 col-lg-6 col-sm-6 " >
                     		 <div class="form-group form-float">
                     		 <label>Tipo persona</label>
                                   <select name="tipoPersona" id="tipoPersona" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Tipo Persona--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
		                 
                 </div>
 			
 			
 			 		<div class="row clearfix">  
                          <div class="col-lg-6 col-lg-6 col-sm-6 " >
                     		 <div class="form-group form-float">
                     		 <label>Tipo Documento</label>
                                   <select name="tipoDocumento" id="tipoDocumento" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Tipo Doc.--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
		                  <div class="col-lg-6 col-lg-6 col-sm-6 " >  
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         <label class="form-label" for="nroDocumento" >Nro. Documento</label>
	                         	<input type="text" id="nroDocumento" name="nroDocumento" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                      	 </div>
                     </div> 
 			
 			
 					<div class="row clearfix" id="section_ruc" hidden>  
                 
                       <div class="col-lg-4 col-md-4 col-sm-4 ">
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                          <label class="form-label" for="nombreCompleto" >RAZ&Oacute;N SOCIAL</label>
	                         	<input type="text" id="nombreCompleto" name="nombreCompleto" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                       </div>
 			
 					</div>  
 			
		                                
                   <div class="row clearfix" id="section_dni">  
                 
                       <div class="col-lg-3 col-md-3 col-sm-3 ">
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                          <label class="form-label" for="nombres" >Nombres</label>
	                         	<input type="text" id="nombres" name="nombres" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                       </div>
                      
                       <div class="col-lg-2 col-md-2 col-sm-2 ">
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         <label class="form-label" for="apellidoPaterno" >Apellido Paterno</label>
	                         	<input type="text" id="apellidoPaterno" name="apellidoPaterno"  class="form-control" minlength="1">
	                         	</div>
	                        </div>
                       </div>
                       
                      <div class="col-lg-2 col-md-2 col-sm-2 ">
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         <label class="form-label" for="apellidoMaterno" >Apellido Materno</label>
	                         	<input type="text" id="apellidoMaterno" name="apellidoMaterno" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                       </div>
                       
                         <div class="col-lg-5 col-md-5 col-sm-5">
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         	<label class="form-label" for="nombresCompleto" >Nombre Completo</label>
	                         	<input type="text" disabled="true" id="nombresCompleto" name="nombresCompleto" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                       </div>
                      
                     </div>  
                     
                   	<div class="row clearfix" >  
                           <div class="col-lg-4 col-md-4 col-sm-4 " id="section_genero">
                     		 <div class="form-group form-float">
                     		 <label>Genero</label>
                                   <select name="genero" id="genero" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Genero--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
		                  <div class="col-lg-4 col-md-4 col-sm-4 " id="section_nacimiento">  
	                      		 <label>Fecha Nacimiento</label>
	                      		 <div class="input-group">
                                       <span class="input-group-addon">
                                           <i class="material-icons">date_range</i>
                                       </span>
                                        <div class="form-line">
                                           <input  name="fechaNacimiento" id="fechaNacimiento" type="text" class="datepicker"  placeholder="Fecha Nacimiento">
                                       </div>
                                  </div>
                      	 </div>
                      	  <div class="col-lg-4 col-md-4 col-sm-4 ">
                     		<div class="form-group form-float">
                     		<label>País</label>
                                   <select name="pais" id="pais" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Pais--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
                     </div> 
                     
                     <div class="row clearfix">  
                          <div class="col-lg-4 col-md-4 col-sm-4 ">
                     		 <div class="form-group form-float">
                     		 <label>Departamento</label>
                                   <select name="combdepartamento" id="combdepartamento" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Departamento--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
		                   <div class="col-lg-4 col-md-4 col-sm-4 ">
	                      		<div class="form-group form-float">
	                      		<label>Provincia</label>
                                   <select name="combprovincia" id="combprovincia" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Provincia--</option>
                                     
                                   </select>
                              </div> 
                      	 </div>
                      	   <div class="col-lg-4 col-md-4 col-sm-4 ">
                     		<div class="form-group form-float">
                     		<label>Distrito</label>
                                   <select name="distrito" id="distrito" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Distrito--</option>
                                   </select>
                              </div> 
		                   </div>
                     </div> 
                     
                    <div class="row clearfix" >
		                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                    <div class="card">
		                        <div class="header">
		                                Ubicaci&oacute;n
		                        </div>
		                        <div class="body" style="height: 300px; margin: 0;padding: 0;">
						                        
		                             <input id="pac-input" class="controls" type="text" placeholder="Search Box">
									 <div id="map"></div>
						        </div>
		                    </div>
		                </div>
		            </div>
                     
                     
                     
                     <div class="col-xs-12 ol-sm-12 col-md-12 col-lg-12">
                                    <div class="panel-group" id="accordion_2" role="tablist" aria-multiselectable="true">
                                        <div class="panel panel-success">
                                            <div class="panel-heading" role="tab" id="headingOne_2">
                                                <h4 class="panel-title">
                                                    <a role="button" data-toggle="collapse" data-parent="#accordion_2" href="#collapseOne_2" aria-expanded="true" aria-controls="collapseOne_2">
                                                        Contacto(s)
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne_2" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne_2">
                                                <div class="panel-body">
	                                                   <div class="row clearfix">  
							                           <div class="col-lg-5 col-md-5 col-sm-5 ">
							                     		 <div class="form-group form-float">
							                     		 <label>Tipo Telefono</label>
							                                   <select name="tipoTelefono" id="tipoTelefono" class="form-control show-tick">
							                                       <option value="0">-- Seleccionar Tipo Telefono--</option>
							                                     
							                                   </select>
							                              </div> 
									                  </div>
									                  <div class="col-lg-4 col-md-4 col-sm-4 "> 
								                      		 <div class="input-group">
							                                       <span class="input-group-addon">
							                                           <i class="material-icons">phone</i>
							                                       </span>
							                                       <div class="form-line">
							                                           <input type="text"  name="numero" id="numero" class="form-control" placeholder="Número">
							                                       </div>
							                                  </div>
							                      	 	</div>
							                      	  <div class="col-lg-2 col-md-2 col-sm-2 ">
						                     			  <div class="input-group">
						                                       <span class="input-group-addon">
						                                           <i class="material-icons">contact_phone</i>
						                                       </span>
						                                       <button class="btn btn-success waves-effect bg-green" type="button" id="addTelefono" onclick="agregarContacto();" >Agregar</button>
						                               
						                                  </div>
								                  	 </div>
	                      	 						</div>
	                      	 
							                      	 <div class="row clearfix">
							                      	 <input type="hidden" id="countContacto" value="0"/>
											                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											                    <div class="card">
											                        <div class="header">
											                            <h2>
											                                Listado
											                            </h2>
											                        </div>
											                        <div class="body table-responsive">
											                            <table class="table table-striped" id="forTableContacto">
											                                <thead>
											                                    <tr>
											                                        <th>TIPO TELEFONO</th>
											                                        <th>N&Uacute;MERO</th>
											                                        <th></th>
											                                    </tr>
											                                </thead>
											                                <tbody>
											                                   
											                                    
											                                </tbody>
											                            </table>
											                        </div>
											                    </div>
											                </div>
											            </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-success">
                                            <div class="panel-heading" role="tab" id="headingTwo_2">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_2" href="#collapseTwo_2" aria-expanded="false"
                                                       aria-controls="collapseTwo_2">
                                                       Email(s)
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo_2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo_2">
                                                <div class="panel-body">
                                                    <div class="row clearfix">  
							                        	<div class="col-lg-5 col-md-5 col-sm-5 ">
							                     		 <div class="form-group form-float">
							                     		 <label>Tipo Condición</label>
							                                   <select name="tipoCondicion" id="tipoCondicion" class="form-control show-tick">
							                                       <option value="0">-- Seleccionar Condici&oacute;n--</option>
							                                       <option value="1">PRINCIPAL</option>
							                                       <option value="2">SECUNDARIO</option>
							                                   </select>
							                              </div> 
									                  </div>
							                        
								                     	<div class="col-lg-3 col-lg-3 col-sm-3 " >  
									                        <div class="form-group form-float">
									                           <div class="form-line">
									                         <label class="form-label" for="email" >Email</label>
									                         	<input type="text" id="email" name="email"  data-inputmask-regex="[a-za-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?" value="" class="form-control" minlength="1">
									                         	</div>
									                        </div>
								                      	 </div>
								                      	 <div class="col-lg-3 col-md-3 col-sm-3 ">
								                     			  <div class="input-group">
								                                       <span class="input-group-addon">
								                                           <i class="material-icons">contact_mail</i>
								                                       </span>
								                                       <button class="btn btn-success waves-effect bg-green" type="button"  onclick="agregarEmail();" id="addMail" >Agregar</button>
								                               
								                                  </div>
										            	 </div>
							                     
							                     	</div>
							                     	<div class="row clearfix">
							                     	<input type="hidden" id="countEmail" value="0"/>
										                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										                    <div class="card">
										                        <div class="header">
										                            <h2>
										                                Listado
										                            </h2>
										                        </div>
										                        <div class="body table-responsive">
										                            <table class="table table-striped" id="forTableEmail">
										                                <thead>
										                                    <tr>
										                                        
										                                        <th>EMAIL</th>
										                                        <th>CONDICI&Oacute;N</th>
										                                        <th></th>
										                                    </tr>
										                                </thead>
										                                <tbody >
										                                   
										                                    
										                                </tbody>
										                            </table>
										                        </div>
										                    </div>
										                </div>
										            </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                      	</div>
                       <button class="btn btn-primary waves-effect" type="submit" id="guardarPersona" >Guardar</button>
                  </form>
                  
                
                  
			</div>
		</div>
		</div>
		</div>
		
		
	
         
     	
	
	<!-- Jquery Core Js -->			
	<script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>
	<script src="<c:url value="/js/pages/persona/persona_form.js"/>"></script>
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

	<script src="<c:url value="/js/pages/persona/persona_mapa.js"/>"></script> 

    <!-- Google Maps API Js -->
 	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&oe=utf8&key=AIzaSyBI8ANaDD0A_LNzeGeLiYHIH7bX0I-OMVs&libraries=places&callback=initAutocomplete" async defer></script>

		
	
</body>
</html>