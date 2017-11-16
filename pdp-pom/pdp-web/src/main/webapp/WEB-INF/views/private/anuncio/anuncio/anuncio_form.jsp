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
		                                <li><a href="../anuncio">Listado Anuncios</a></li>
		                                <li class="active">${tituloAnuncio}</li>
		        </ol>
                           
 	
 			<form id="formAnuncio_validation" method="POST" enctype="multipart/form-data" accept-charset="utf-8" >
 			
 			 		<div class="row clearfix">  
 			 			<input type="hidden" id="dataAnuncio" value='${dataAnuncio}'/>
                  		<input type="hidden" id="id" name="id"  />   
                          <div class="col-lg-4 col-lg-4 col-sm-4 " >
                     		 <div class="form-group form-float">
                     		  <label>Tipo Anuncio</label>
                                   <select name="tipoAnuncio" id="tipoAnuncio" class="form-control show-tick">
                                       <option value="0">-- Seleccionar Tipo--</option>
                                     
                                   </select>
                              </div> 
		                   </div>
		                  <div class="col-lg-8 col-lg-8 col-sm-8 " >  
	                        <div class="form-group form-float">
	                           <div class="form-line">
	                         <label class="form-label" for="titulo" >Titulo</label>
	                         	<input type="text" id="titulo" name="titulo" value="" class="form-control" minlength="1">
	                         	</div>
	                        </div>
                      	 </div>
                     </div> 
 			
		                                
                  <div class="row clearfix" >  
                            <div class="col-lg-4 col-md-4 col-sm-4 " >  
	                      		 <div class="input-group">
                                       <span class="input-group-addon">
                                           <i class="material-icons">date_range</i>
                                       </span>
                                      
                                       <input type="text"  name="fechaAnuncio" id="fechaAnuncio" class="datepicker"  placeholder="Fecha Anuncio">
                                      
                                  </div>
                      	 </div>
		                  <div class="col-lg-4 col-md-4 col-sm-4 " >  
	                      		 <div class="input-group">
                                       <span class="input-group-addon">
                                           <i class="material-icons">date_range</i>
                                       </span>
                                      
                                           <input type="text"  name="fechaVencimiento" id="fechaVencimiento" class="datepicker" placeholder="Fecha Vencimiento">
                                       
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
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <textarea rows="4" name="descripcion"  id="descripcion"  class="form-control no-resize" placeholder="Contenido"></textarea>
                                        </div>
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
                     
                     <div class="row clearfix">  
                     	<div class="col-lg-9 col-md-9 col-sm-9 " >
                     	<div class="file-field input-field">
						      <div class="btn">
						        <span>Foto</span>
						        <input type="file" id="fileFoto" name="fileFoto">
						      </div>
						      <div class="file-path-wrapper">
						        <input class="file-path validate" id="fileFoto" name="fileFoto" type="text" placeholder="Imagen del anuncio..">
						      </div>
						 </div>
						 </div>
                     	 <div class="col-lg-2 col-md-2 col-sm-2 " id="verFoto" hidden>
                     		  <div class="input-group">
                                       <span class="input-group-addon">
                                           <i class="material-icons">image</i>
                                       </span>
                                        <button class="btn btn-success waves-effect" type="button" id="verFotoAnuncio" data-toggle="modal" data-target="#fotoModal" >Ver</button>
                               
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
					                                Foto del Anuncio
					                            </h2>
						                </div>      
				                        <div class="card">
				                        	<div class="card-image">
				                            	<img class="img-responsive"  id="fotoAnuncio" width="400px" height="auto"   src="">
				                            </div>
				                        </div>
						              
		                        </div>
		                        <div class="modal-footer">
		                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">Cerrar</button>
		                        </div>
		                    </div>
		                </div>
		         	</div>
                     
                       <button class="btn btn-primary waves-effect" type="submit" id="guardarAnuncio" >Guardar</button>
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
  <%--   <script src="<c:url value="/plugins/materialize-css/js/materialize.js"/>"></script> --%> 
     
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
     <script src="<c:url value="/js/pages/anuncio/anuncio_form.js"/>"></script>
     
     


</body>
</html>