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
		               <li><a href="../mascota">Listado Mascotas</a></li>
		               <li class="active">${tituloMascota}</li>
		        </ol>
                           
 	
 			<form id="formMascota_validation" name="formMascota_validation" method="POST" 
 			enctype="multipart/form-data" accept-charset="utf-8" >
 			

		             <div class="row clearfix">
		                <div class="input-field col s8">
		                    <div class="autocomplete" id="multiple">
		                        <div class="ac-input">
		                            <input type="text" id="search-box" placeholder="Ingresar el nombre de la persona.." data-activates="multipleDropdown" data-beloworigin="true" autocomplete="off">
		                        </div>
		                         <input type="hidden" id="personaId" name="personaId"  />
		                         <div id="suggesstion-box" class="ac-users"></div>
		                    </div>
		                    
		                </div>
		            </div>
 			
 			
 			
 			 		<div class="row clearfix">  
 			 			<input type="hidden" id="dataMascota" value='${dataMascota}'/>
                  		<input type="hidden" id="id" name="id"  />
                  		<input type="hidden" id="ubicacionCatastro" name="ubicacionCatastro" />
                  		
                  		<div class="col-lg-3 col-lg-3 col-sm-3 " >  
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         <label class="form-label" for="nombre" >Nombre</label>
	                         	<input type="text" id="nombre" name="nombre" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                      	 </div>
                  		
                  		   
                          <div class="col-lg-3 col-lg-3 col-sm-3 " >
                     		 <div class="form-group form-float">
                     		 <label>Raza</label>
                                   <select name="raza" id="raza" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Raza--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
		                   
		                    
                          <div class="col-lg-3 col-lg-3 col-sm-3 " >
                     		 <div class="form-group form-float">
                     		 <label>Genero</label>
                                   <select name="genero" id="genero" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Genero--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
		                   
		                   
		                   <div class="col-lg-3 col-lg-3 col-sm-3 " >
                     		 <div class="form-group form-float">
                     		 <label>Tamaño</label>
                                   <select name="tamanio" id="tamanio" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Tamaño--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
		                  
                  </div> 
 			
		                                
                  <div class="row clearfix">
                  
                  		 <div class="col-lg-3 col-lg-3 col-sm-3 " >
                     		 <div class="form-group form-float">
                     		 <label>Color</label>
                                   <select name="color" id="color" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Color--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
                    
                  	 	<div class="col-lg-3 col-md-3 col-sm-3 ">
                     		<div class="form-group form-float">
                     		<label>Distrito</label>
                                   <select name="distrito" id="distrito" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Distrito--</option>
                                   </select>
                              </div> 
		                </div>
                  
		                   
                     
                     </div>  
                     
                       <div class="row clearfix">
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
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <textarea rows="3" name="caracteristica" id="caracteristica" class="form-control no-resize" placeholder="Caracteristica.."></textarea>
                                        </div>
                                    </div>
                                </div>
                     </div> 
                     
                     
                     
                       <div class="row clearfix">  
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <textarea rows="3" name="desComentario" id="desComentario" class="form-control no-resize" placeholder="Comentario.."></textarea>
                                        </div>
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
							        <input class="file-path validate"  type="text" placeholder="Imagen principal de la mascota..">
							      </div>
							  </div>
						  </div>
						  <div class="col-lg-2 col-md-2 col-sm-2 " id="verFoto" hidden>
                     		  <div class="input-group">
                                       <span class="input-group-addon">
                                           <i class="material-icons">image</i>
                                       </span>
                                        <button class="btn btn-success waves-effect" type="button" id="agregarLocazion" data-toggle="modal" data-target="#fotoModal" >Ver</button>
                               
                                  </div>  
		                   </div>
                     
                     </div>
                     
                     
                     <div class="row clearfix">  
                     	<div class="col-lg-9 col-md-9 col-sm-9 ">
                     		<div class="file-field input-field">
							      <div class="btn">
							        <span>Fotos</span>
							        <input type="file" id="filesFoto" name="filesFoto" multiple>
							      </div>
							      <div class="file-path-wrapper">
							        <input class="file-path validate"  type="text" placeholder="Imagenes adicionales  de la mascota..">
							      </div>
							  </div>
						  </div>
						  <div class="col-lg-2 col-md-2 col-sm-2 " id="verGaleria" >
                     		  <div class="input-group">
                                       <span class="input-group-addon">
                                           <i class="material-icons">image</i>
                                       </span>
                                        <button class="btn btn-success waves-effect" type="button" id="verGaleriaMascota" data-toggle="modal" data-target="#galeriaModal" >Ver Galeria</button>
                               
                                  </div>  
		                   </div>
                     
                     </div>
                   
		         	
		         	<!-- Modal de Imagen -->
				 	<div class="modal fade" id="fotoModal" tabindex="-1" role="dialog">
		                  <div class="modal-body">
		                  		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
						             <div class="card">
			                               <div class="header">
						                            <h2>
						                                Foto de la Mascota
						                            </h2>
							                </div>      
					                        <div class="body">
					                        	<div class="card-image">
					                            	<img id="fotoMascota" alt="" src="">
					                            </div>
					                        </div>
						         	</div>
						         </div>   
	                        </div>
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">Cerrar</button>
	                        </div>
		              

		         	</div>
		         	
		         	
		         	
		         	
		         	<!-- Modal Galeria -->
				 	<div class="modal fade" id="galeriaModal" tabindex="-1" role="dialog">
		                <div class="modal-body">
		                              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
						                    <div class="card">
						                        <div class="header">
						                            <h2>Galeria de Mascota</h2>
						                            
						                        </div>
						                        <div class="body">
						                            <div id="carousel-example-generic_2" class="carousel slide" data-ride="carousel">
						                                <!-- Indicators -->
						                                <ol class="carousel-indicators" id="ind_fotoMascota">
						                                 </ol>
						                                <!-- Wrapper for slides -->
						                                <div class="carousel-inner" role="listbox" id="listMascotaFoto">
						                                    
						                                </div>
						                                <!-- Controls -->
						                                <a class="left carousel-control" href="#carousel-example-generic_2" role="button" data-slide="prev">
						                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						                                    <span class="sr-only">Previous</span>
						                                </a>
						                                <a class="right carousel-control" href="#carousel-example-generic_2" role="button" data-slide="next">
						                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						                                    <span class="sr-only">Next</span>
						                                </a>
						                            </div>
						                        </div>
						                    </div>
						                </div>
						              
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">Cerrar</button>
                        </div>
		                    
		                
		         	</div>
		         	
		         	
                    <button class="btn btn-primary waves-effect" type="submit" id="guardarMascota" >Guardar</button>
                  </form>
			</div>
		</div>
		</div>
		</div>


  	<!-- Jquery Core Js -->			
	<script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/js/pages/mascota/mascota_form.js"/>"></script>

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

	<script src="<c:url value="/js/pages/mascota/mascota_mapa.js"/>"></script>

   	<!-- Google Maps API Js -->
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&oe=utf8&key=AIzaSyBI8ANaDD0A_LNzeGeLiYHIH7bX0I-OMVs&libraries=places&callback=initAutocomplete" async defer></script>
    

</body>
</html>