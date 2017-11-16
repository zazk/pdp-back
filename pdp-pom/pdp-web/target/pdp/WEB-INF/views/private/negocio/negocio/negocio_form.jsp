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
		               <li><a href="../negocio">Listado Negocios</a></li>
		               <li class="active">${tituloNegocio}</li>
		        </ol>
                           
 	
 			<form id="formNegocio_validation" name="formNegocio_validation" method="POST" 
 			enctype="multipart/form-data" accept-charset="utf-8" >
 			
 			 		<div class="row clearfix">  
 			 			<input type="hidden" id="dataNegocio" value='${dataNegocio}'/>
                  		<input type="hidden" id="id" name="id"  />   
                  	 	<input type="hidden" id="ubicacionCatastro" name="ubicacionCatastro" />
                          
		                  <div class="col-lg-9 col-lg-9 col-sm-9 " >  
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         <label class="form-label" for="titulo" >Titulo</label>
	                         	<input type="text" id="titulo" name="titulo" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                      	 </div>
                     </div> 
 				  <div class="row clearfix">  
 				  <div class="col-lg-12 col-lg-12 col-sm-12 " >  
					<div id="tipo_negocio">	
                    <!-- <div class="header">
					Tipo Negocio (Categorias)
                    </div> -->
		                        
<!-- 		           <div class="row clearfix">  
 				  	<div class="col-lg-12 col-lg-12 col-sm-12 " > 
			  			 <div class="input-group input-group-lg">
			  			 	 <span class="input-group-addon">
	                             <input type="checkbox" class="filled-in" name="idTipoNegocio" id="ig_checkbox4">
	                             <label for="ig_checkbox4">ENTRENADORES CANINOS</label>
	                          </span>
	                          <span class="input-group-addon">
	                              <input type="checkbox" class="filled-in" name="idTipoNegocio" id="ig_checkbox5">
	                              <label for="ig_checkbox5">PASTELERIA CANINA</label>
	                          </span>
	                            <span class="input-group-addon">
	                                <input type="checkbox" class="filled-in" name="idTipoNegocio" id="ig_checkbox6">
	                                <label for="ig_checkbox6">RESTAURANTS PETFRIENDLY</label>
	                          </span>
	                          <span class="input-group-addon">
                                    <input type="checkbox" class="filled-in" name="idTipoNegocio" id="ig_checkbox0">
                                    <label for="ig_checkbox0">PASEADORES DE PERROS</label>
                              </span>
	                       </div>
 				  	
 				  	</div>
 				  </div> -->
		                        
<!-- 		          <div class="row clearfix">  
 				  <div class="col-lg-12 col-lg-12 col-sm-12 " > 
                        <div class="input-group input-group-lg">
                                 <span class="input-group-addon">
                                     <input type="checkbox" class="filled-in"  name="idTipoNegocio" id="ig_checkbox1">
                                     <label for="ig_checkbox1">VETERINARIA</label>
                                 </span>
                                  <span class="input-group-addon">
                                     <input type="checkbox" class="filled-in" name="idTipoNegocio" id="ig_checkbox2">
                                     <label for="ig_checkbox2">PEATSHOP</label>
                                 </span>
                                 <span class="input-group-addon">
                                     <input type="checkbox" class="filled-in" name="idTipoNegocio" id="ig_checkbox3">
                                     <label for="ig_checkbox3">HOTEL PARA PERROS</label>
                                 </span>
                         </div>
               		 </div>       
                     </div> -->             
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
		                                
                   	
                     
                     <div class="row clearfix">  
                                <div class="col-sm-9">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <textarea rows="4" name="descripcion" id="descripcion" class="form-control no-resize" placeholder="Contenido"></textarea>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-lg-3 col-lg-3 col-sm-3 " >
	                     		 <div class="form-group form-float">
	                                   <select name="estado" id="estado" class="form-control show-tick">
	                                      <option value="0">-- Seleccionar Estado--</option>
	                                      <option value="1" selected="selected">ACTIVO</option>
	                                      <option value="2">DESACTIVADO</option>
	                                   </select>
	                              </div> 
			                   </div>
                     </div> 
                     
                     <div class="row clearfix">  
                     	<div class="col-lg-9 col-md-9 col-sm-9 ">
                     		<div class="file-field input-field">
							      <div class="btn">
							        <span>Foto</span>
							        <input type="file" id="fileFoto" name="fileFoto">
							      </div>
							      <div class="file-path-wrapper">
							        <input class="file-path validate"  type="text" placeholder="Imagen del negocio..">
							      </div>
							  </div>
						  </div>
						  <div class="col-lg-2 col-md-2 col-sm-2 " id="verFoto" hidden>
                     		  <div class="input-group">
                                       <span class="input-group-addon">
                                           <i class="material-icons">image</i>
                                       </span>
                                        <button class="btn btn-success waves-effect" type="button" id="verFotoNegocio" data-toggle="modal" data-target="#fotoModal" >Ver</button>
                               
                                  </div>  
		                   </div>
                     
                     </div>
                     
		         	
		         	<!-- Modal de Imagen -->
				 	<div class="modal fade" id="fotoModal" tabindex="-1" role="dialog">
		                <div class="modal-dialog" role="document">
		                    <div class="modal-content">
		                        <div class="modal-body">
		                               <div class="header">
					                            <h2>
					                                Foto del Negocio
					                            </h2>
						                </div>      
				                        <div class="card">
				                        	<div class="card-image">
				                            	<img id="fotoNegocio" alt="" src="">
				                            </div>
				                        </div>
						              
		                        </div>
		                        <div class="modal-footer">
		                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">Cerrar</button>
		                        </div>
		                    </div>
		                </div>
		         	</div>
		         	
		         	
		         	
                    <button class="btn btn-primary waves-effect" type="submit" id="guardarNegocio" >Guardar</button>
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
 	<script src="<c:url value="/js/pages/negocio/negocio_form.js"/>"></script>
 	<!-- Validate Js -->
 	<script src="<c:url value="/plugins/jquery-validation/jquery.validate.js"/>"></script>
 	<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
 	 	
 	<!-- Input Mask Plugin Js -->
    <script src="<c:url value="/plugins/jquery-inputmask/jquery.inputmask.bundle.js"/>"></script>
    
     <!-- Slimscroll Plugin Js -->
    <script src="<c:url value="/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>	
    
    <script src="<c:url value="/plugins/multi-select/js/jquery.multi-select.js"/>"></script>	
      	
    <script src="<c:url value="/js/modals.js"/>"></script>	
    <script src="<c:url value="/js/admin.js"/>"></script>

 	<script src="<c:url value="/js/pages/negocio/negocio_mapa.js"/>"></script>
 	  
     <!-- Google Maps API Js -->
  	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&oe=utf8&key=AIzaSyBI8ANaDD0A_LNzeGeLiYHIH7bX0I-OMVs&libraries=places&callback=initAutocomplete" async defer></script>
	<script src="<c:url value="/plugins/materialize-css/materialize.js"/>"></script>

</body>
</html>