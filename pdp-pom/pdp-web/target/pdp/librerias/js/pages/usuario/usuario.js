
var table;
var usuario=null;
var usuarios=[];
$(document).ready(

function() {

	//	var $form = $('#misTablasForm').configurarFormulario();
	$("#btnBuscarUsuario").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
		table.ajax.reload();
	});	 


			
table=$('#usuarioGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "usuario/listar", 
            "type": "GET",
            "data":function ( usuario ) {
            	
            	usuario.usuario=$('#usuarioBusq').val(),
            	usuario.nombreCompleto=$('#nombreBusq').val(),
            	usuario.rolid=$('#rolIdBusq').val()
            }
        },
         "columns": [
          
	            { data: "id" },
	            { data: "usuario" },
	            { data: "nombre_completo" },
	            { data: "nombre_rol" },
	            { data: "des_alerta" },
	            {
	            	data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="usuario/usuario_form?idUsuario=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-usuarioid="' + id + '" class="btn btn-danger eliminar-usuario"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-usuario').unbind('click');
                
                $('.eliminar-usuario').click(function(){
                    var id = $(this).attr('data-usuarioid');
                    swal({
                         title: "Eliminar Usuario",
                         text: "Seguro de eliminar el usuario seleccionado?",
                         type: "info",
                         showCancelButton: true,
                         closeOnConfirm: false,
                         showLoaderOnConfirm: true,
                         confirmButtonText: "Si",
                         cancelButtonText: "No"
                     }, function () {

                     $.ajax({
                             method: "POST",
                             url: 'usuario/eliminar',
                             dataType: 'json',
                             data:{
                                 'idUsuario':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = '../seguridad/usuario';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = '../seguridad/usuario';
                        });
                     });
                         
                         
                     });
                    
                });
                
             },   
	        
        "searching": false,
        "iDisplayLength": 10,
          "lengthMenu": [
       	 [ 10, 20 ],
        	[ '10', '20' ]
   		 ],
          "paging": true,
          "error": function (xhr, error, thrown) {
        	 
          }
    } );
    

		$.ajax({
			url : 'rol/listar',
			contentType: "application/json",	
			dataType: 'json',
			mimeType: 'application/json',
			beforeSend: function() {
				//blockUI('','#FCFDFE',null); 
			  },
			success : function(response) {
				
				if(response.success){

					var dataRol = response.data;
					$('#rolIdBusq').find('option').remove();
					$('#rolIdBusq').append("<option value=0>-- Seleccionar Rol--</option>");
					
					jQuery.each(dataRol, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.nombre
						}).appendTo('#rolIdBusq');
					});

				}else{
//					$.unblockUI();
//	            	 sweetAlert("",response.message, "error");
				}
				
			}
		});
		


});





	
	
