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
                                PERSONA
                            </h5>
                         </div>      
                               
                             <div class="body"> 
                           
   
                             <form  id="formPersonaBusq">
                                <div class="row clearfix">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                        <div class="form-group">
                                        <label>Nombre Completo</label>
                                            <div class="form-line">
                                                <input type="text" id="nombreCompleto" name="nombreCompleto" class="form-control" placeholder="Nombre Completo">
                                            </div>
                                        </div>
                                    </div>
                       				
                       				 <div class="col-lg-3 col-md-3 col-sm-3 ">
                       						 <div class="form-group form-float">
                       						 <label>Tipo Documento</label>
		                                    <select name="tipoDocumento" id="tipoDocumento" class="form-control show-tick">
		                                        <option value="0">-- Seleccionar Tipo Doc.--</option>
		                                      
		                                    </select>
		                                    </div>
		                             </div>
                       
                       	            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                        <div class="form-group">
                                        <label>Nro. Documento</label>
                                            <div class="form-line">
                                                <input type="text" id="nroDocumento" name="nroDocumento" class="form-control" placeholder="Nro. Documento">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="col-lg-3 col-md-3 col-sm-3 ">
                       						 <div class="form-group form-float">
                       						 <label>Tipo Persona</label>
		                                    <select name="tipoPersona" id="tipoPersona" class="form-control show-tick">
		                                        <option value="0">-- Seleccionar Tipo Persona--</option>
		                                    </select>
		                                    </div>
		                             </div>
                                    
                                   	<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                        <button type="button" id="btnBuscarPersona" name="btnBuscarPersona" class="btn btn-primary btn-lg m-l-15 waves-effect">Buscar</button>
										<a href="persona/persona_form" id="btnAddPersona" name="btnAddPersona" class="btn btn-primary btn-lg m-l-15 waves-effect">Agregar</a>
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
                            <table id="personaGrid" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>NOMBRE COMPLETO</th>
                                        <th>TIPO DOC</th>
                                        <th>NRO. DOCUMENTO</th>
                                        <th>TIPO PERSONA</th>
                                         <th>EMAIL</th>
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
    <script src="<c:url value="/js/pages/persona/persona.js"/>"></script>


</body>
</html>