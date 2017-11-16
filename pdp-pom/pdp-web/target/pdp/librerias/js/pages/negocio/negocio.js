
var table;

$(document)
.ready(
		function() {

		$("#btnBuscarNegocio").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
			table.ajax.reload();
		});	 
			
	
		table=$('#negocioGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "negocio/listar", 
            "type": "GET",
            "data": function ( negocio ) {
            	negocio.titulo=$('#tituloBusq').val(),
            	negocio.idTipoNegocio=$('#tipoNegocioBusq').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "titulo" },
	            { data: "tipoNegocio" },
	            
	            {
	                data: "estado",
                    width: "60px",
                    mRender: function (id, e,record) {
                    	var el='DESACTIVADO';
                        if(record.estado==1){
                        	el='ACTIVO';
                        }
                        return el;
                    }    
	            },
	            
	            {
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="negocio/negocio_form?idNegocio=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-negocioid="' + id + '" class="btn btn-danger eliminar-negocio"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-negocio').unbind('click');
                
                $('.eliminar-negocio').click(function(){
                    var id = $(this).attr('data-negocioid');
                    swal({
                         title: "Eliminar Negocio",
                         text: "Â¿Seguro de eliminar el negocio seleccionado?",
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
                                 'idNegocio':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = '../negocio';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = '../negocio';
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
				'grupoElementoId':9
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
					$('#tipoNegocioBusq').find('option').remove();
					$('#tipoNegocioBusq').append("<option value=0>-- Seleccionar --</option>");
					
					jQuery.each(dataElementos, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.desNombre
						}).appendTo('#tipoNegocioBusq');
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









