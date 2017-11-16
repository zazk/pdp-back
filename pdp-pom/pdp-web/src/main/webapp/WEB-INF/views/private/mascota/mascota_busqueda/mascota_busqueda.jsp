<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <jsp:include page="../../include/includescripts.jsp"></jsp:include>

</head>
<body>


<div class="container-fluid">

		<div class="row clearfix">
                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">             
                      <div class="card">  
                      
                       <div class="header"> 
                             <h5>
                               MASCOTAS BUSCADAS
                            </h5>
                         </div>      
                               
                         <div class="body"> 
   
                             <form  id="formBusquedaMascotaBusq">
                             
                                <div class="row clearfix">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                        <div class="form-group">
                                        <label>Nombre</label>
                                            <div class="form-line">
                                                <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombre">
                                            </div>
                                        </div>
                                    </div>
                       				
                       				 <div class="col-lg-3 col-md-3 col-sm-3 ">
                       						 <div class="form-group form-float">
                       						 <label>Raza</label>
		                                    <select name="raza" id="raza" class="form-control show-tick">
		                                        <option value="0">-- Seleccionar Raza --</option>
		                                      
		                                    </select>
		                                    </div>
		                             </div>
		                             
		                             
		                             <div class="col-lg-3 col-md-3 col-sm-3 ">
                       						 <div class="form-group form-float">
                       						 <label>Tama&ntilde;o</label>
		                                    <select name="tamanio" id="tamanio" class="form-control show-tick">
		                                        <option value="0">-- Seleccionar Tamaño --</option>
		                                      
		                                    </select>
		                                    </div>
		                             </div>
                       
                       	             <div class="col-lg-3 col-md-3 col-sm-3 ">
                       						 <div class="form-group form-float">
                       						 <label>Genero</label>
		                                    <select name="genero" id="genero" class="form-control show-tick">
		                                        <option value="0">-- Seleccionar Genero --</option>
		                                      
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
                               
                               
                               		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                        <div class="form-group">
                                        <label>Registrador</label>
                                            <div class="form-line">
                                                <input type="text" id="usuarioRegistro" name="usuarioRegistro" class="form-control" placeholder="Registrador">
                                            </div>
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
                               
                               
                               
                               		<div class="col-lg-3 col-md-3 col-sm-3">
                                        <button type="button" id="btnBuscarBusquedaMascota" name="btnBuscarBusquedaMascota" class="btn btn-primary btn-lg m-l-15 waves-effect">Buscar</button>
										<a  href="mascota_busqueda/mascota_busqueda_form"id="btnAddBusquedaMascota" name="btnAddBusquedaMascota" class="btn btn-primary btn-lg m-l-15 waves-effect">Agregar</a>
                                    </div>
                               </div>
                                                              
                            </form>
						</div>	
					</div>
				</div>
			</div>

            <!-- Basic Examples -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="body">
                            <table id="busquedaMascotaGrid" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>NOMBRE</th>
                                        <th>RAZA</th>
                                        <th>TAMAÑO</th>
                                        <th>DUEÑO</th>
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
            <!-- #END# Basic Examples -->
            
        </div>


  	<!-- Jquery Core Js -->
 	<script src="<c:url value="/plugins/jquery/jquery.min.js"/>"></script>

    <!-- Bootstrap Core Js -->
    <script src="<c:url value="/plugins/bootstrap/js/bootstrap.js"/>"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="<c:url value="/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>

    <!-- Waves Effect Plugin Js -->
     <script src="<c:url value="/plugins/node-waves/waves.js"/>"></script>
	<!-- Materialize Js -->
     <script src="<c:url value="/plugins/materialize-css/js/materialize.js"/>"></script> 
    <!-- Jquery DataTable Plugin Js -->
    <script src="<c:url value="/plugins/jquery-datatable/jquery.dataTables.js"/>"></script>
    <script src="<c:url value="/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"/>"></script>
    <script src="<c:url value="/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"/>"></script>
    <script src="<c:url value="/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"/>"></script>
    <script src="<c:url value="/plugins/jquery-datatable/extensions/export/jszip.min.js"/>"></script>
    <script src="<c:url value="/plugins/jquery-datatable/extensions/export/pdfmake.min.js"/>"></script>
    <script src="<c:url value="/plugins/jquery-datatable/extensions/export/vfs_fonts.js"/>"></script>
    <script src="<c:url value="/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"/>"></script>
    <script src="<c:url value="/plugins/jquery-datatable/extensions/export/buttons.print.min.js"/>"></script>
	
	<!-- Sweet Js -->
 	<script src="<c:url value="/plugins/sweetalert/sweetalert.min.js"/>"></script> 
 
 	<script src="<c:url value="/js/admin.js"/>"></script>
 	<script src="<c:url value="/js/pages/main.js"/>"></script>   
    <script src="<c:url value="/js/pages/mascota_busqueda/mascota_busqueda.js"/>"></script>


</body>
</html>