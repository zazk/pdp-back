
var table;

$(document)
.ready(
		function() {

		$("#btnBuscarNotificacion").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
			table.ajax.reload();
		});	 
			
	
		table=$('#notificacionGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "notificacion/listar", 
            "type": "GET",
            "data": function ( notificacion ) {
            	notificacion.tipoNotificacion=$('#tipoNotificacionBusq').val(),
            	notificacion.tipoMedio=$('#tipoMedioBusq').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "desTipoNotificacion" },
	            { data: "desTipoMedio" },
	            { data: "usuarioEmisor" },
	            { data: "usuarioDestino" },
	            {
	            	
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="notificacion/notificacion_form?idNotificacion=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-notificacionid="' + id + '" class="btn btn-danger eliminar-notificacion"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-notificacion').unbind('click');
                
                $('.eliminar-notificacion').click(function(){
                    var id = $(this).attr('data-notificacionid');
                    swal({
                         title: "Eliminar Notificación",
                         text: "¿Seguro de eliminar la notificacion seleccionado?",
                         type: "info",
                         showCancelButton: true,
                         closeOnConfirm: false,
                         showLoaderOnConfirm: true,
                         confirmButtonText: "Si",
                         cancelButtonText: "No"
                     }, function () {

                     $.ajax({
                             method: "POST",
                             url: 'desactivar',
                             dataType: 'json',
                             data:{
                                 'idNotificacion':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = '../notificacion';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = '../notificacion';
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
			url : '../catalogo/elemento/listar',
			contentType: "application/json",	
			dataType: 'json',
			data : {
				'grupoElementoId':4
			},
			mimeType: 'application/json',
			beforeSend: function() {
				//blockUI('','#FCFDFE',null); 
			  },
			success : function(response) {
				
				if(response.success){
//					 $.unblockUI();
//		        	 sweetAlert("",response.message, "success");
					var dataElementos = response.data;
					$('#tipoNotificacionBusq').find('option').remove();
					$('#tipoNotificacionBusq').append("<option value=0>-- Seleccionar Tipo Notificaci&oacute;n --</option>");
					
					jQuery.each(dataElementos, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.desNombre
						}).appendTo('#tipoNotificacionBusq');
					});

				}else{
//					$.unblockUI();
//		        	 sweetAlert("",response.message, "error");
				}
				
			}
		});
		
		
		$.ajax({
			url : '../catalogo/elemento/listar',
			contentType: "application/json",	
			dataType: 'json',
			data : {
				'grupoElementoId':5
			},
			mimeType: 'application/json',
			beforeSend: function() {
				//blockUI('','#FCFDFE',null); 
			  },
			success : function(response) {
				
				if(response.success){
//					 $.unblockUI();
//		        	 sweetAlert("",response.message, "success");
					var dataElementos = response.data;
					$('#tipoMedioBusq').find('option').remove();
					$('#tipoMedioBusq').append("<option value=0>-- Seleccionar Medio --</option>");
					
					jQuery.each(dataElementos, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.desNombre
						}).appendTo('#tipoMedioBusq');
					});

				}else{
//					$.unblockUI();
//		        	 sweetAlert("",response.message, "error");
				}
				
			}
		});

   
      
             
});
function parseJSON(data) {
    return window.JSON && window.JSON.parse ? window.JSON.parse( data ) : (new Function("return " + data))(); 
}









