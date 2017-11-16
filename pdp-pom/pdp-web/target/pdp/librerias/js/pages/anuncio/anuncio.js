
var table;

$(document)
.ready(
		function() {

		$("#btnBuscarAnuncio").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
			table.ajax.reload();
		});	 
			
	
		table=$('#anuncioGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "anuncio/listar", 
            "type": "GET",
            "data": function ( anuncio ) {
            	anuncio.titulo=$('#tituloBusq').val(),
            	anuncio.tipoAnuncio=$('#tipoAnuncioBusq').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "titulo" },
	            { data: "desTipoAnuncio" },
	            {
	                data: "estaoo",
                    width: "60px",
                    mRender: function (id, e,record) {
                    	var el='DESACTIVADO';
                        if(record.estaoo==1){
                        	el='ACTIVO';
                        }
                        return el;
                    }    
	            },
	            {
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" style="margin:0px !important;" href ="anuncio/anuncio_form?idAnuncio=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-anuncioid="' + id + '" class="btn btn-danger eliminar-anuncio"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-anuncio').unbind('click');
                
                $('.eliminar-anuncio').click(function(){
                    var id = $(this).attr('data-anuncioid');
                    swal({
                         title: "Eliminar Anuncio",
                         text: "Seguro de eliminar el anuncio seleccionado?",
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
                                 'idAnuncio':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = '../anuncio';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = '../anuncio';
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
				'grupoElementoId':8
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
					$('#tipoAnuncioBusq').find('option').remove();
					$('#tipoAnuncioBusq').append("<option value=0>-- Seleccionar --</option>");
					
					jQuery.each(dataElementos, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.desNombre
						}).appendTo('#tipoAnuncioBusq');
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









