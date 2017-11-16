
var table;

$(document)
.ready(
		function() {

		$("#btnBuscarElmento").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
			table.ajax.reload();
		});	 
			
	
		table=$('#elementoGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "elemento/listar", 
            "type": "GET",
            "data": function ( elemento ) {
            	elemento.desNombre=$('#nombreBusq').val(),
            	elemento.grupoElementoId=$('#tipoGrupoBusq').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "desNombre" },
	            { data: "desAbreviacion" },
	            { data: "desTipoGrupo" },
	            {
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="elemento/elemento_form?idElemento=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-elementoid="' + id + '" class="btn btn-danger eliminar-elemento"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-elemento').unbind('click');
                
                $('.eliminar-elemento').click(function(){
                    var id = $(this).attr('data-elementoid');
                    swal({
                         title: "Eliminar Elemento",
                         text: "Seguro de eliminar el elemento seleccionado?",
                         type: "info",
                         showCancelButton: true,
                         closeOnConfirm: false,
                         showLoaderOnConfirm: true,
                         confirmButtonText: "Si",
                         cancelButtonText: "No"
                     }, function () {

                     $.ajax({
                             method: "POST",
                             url: 'elemento/eliminar',
                             dataType: 'json',
                             data:{
                                 'id':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = './elemento';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = './elemento';
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
			url : '../catalogo/grupo/listar',
			contentType: "application/json",	
			dataType: 'json',
			data : {
				
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
					$('#tipoGrupoBusq').find('option').remove();
					$('#tipoGrupoBusq').append("<option value=0>-- Seleccionar Grupo --</option>");
					
					jQuery.each(dataElementos, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.nombre
						}).appendTo('#tipoGrupoBusq');
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









