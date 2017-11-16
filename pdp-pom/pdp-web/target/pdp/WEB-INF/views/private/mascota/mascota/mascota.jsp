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
                                MASCOTA
                            </h5>
                         </div>      
                               
                         <div class="body"> 
   
                             <form  id="formMascotaBusq">
                             
                                <div class="row clearfix">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                        <div class="form-group">
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
                               
                               		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                        <div class="form-group">
                                            <div class="form-line">
                                            <label>Nombre Completo</label>
                                                <input type="text" id="nombreCompleto" name="nombreCompleto" class="form-control" placeholder="Dueño">
                                            </div>
                                        </div>
                                    </div>
                               
                                	<div class="col-lg-4 col-md-4 col-sm-4 ">
                       						 <div class="form-group form-float">
                       						 <label>Tipo Documento</label>
		                                    <select name="tipoDocumento" id="tipoDocumento" class="form-control show-tick">
		                                        <option value="0">-- Seleccionar Tipo Documento --</option>
		                                      
		                                    </select>
		                                    </div>
		                             </div>
                               
                               		<div class="col-lg-2 col-md-2 col-sm-2 ">
                                        <div class="form-group">
                                            <div class="form-line">
                                            <label>Nro. Documento</label>
                                                <input type="text" id="nroDocumento" name="nroDocumento" class="form-control" placeholder="Nro Documento">
                                            </div>
                                        </div>
                                    </div>
                               
                               
                               		<div class="col-lg-3 col-md-3 col-sm-3">
                                        <button type="button" id="btnBuscarMascota" name="btnBuscarMascota" class="btn btn-primary btn-lg m-l-15 waves-effect">Buscar</button>
										<a  href="mascota/mascota_form"id="btnAddMascota" name="btnAddMascota" class="btn btn-primary btn-lg m-l-15 waves-effect">Agregar</a>
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
                            <table id="mascotaGrid" class="table table-bordered table-striped table-hover js-basic-example dataTable">
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
    <script src="<c:url value="/js/pages/mascota/mascota.js"/>"></script>


</body>
</html>