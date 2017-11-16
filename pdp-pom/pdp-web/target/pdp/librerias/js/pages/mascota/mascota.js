
var table;

$(document)
.ready(
		function() {

		$("#btnBuscarMascota").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
			table.ajax.reload();
		});	 
			
	
		table=$('#mascotaGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "mascota/listar", 
            "type": "GET",
            "data": function ( mascota ) {
            	mascota.nombre=$('#nombre').val(),
            	mascota.raza=$('#raza').val(),
            	mascota.tamanio=$('#tamanio').val(),
            	mascota.genero=$('#genero').val(),
            	mascota.nombreCompleto=$('#nombreCompleto').val(),
            	mascota.nroDocumento=$('#nroDocumento').val(),
            	mascota.tipoDocumento=$('#tipoDocumento').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "nombre" },
	            { data: "desRaza" },
	            { data: "desTamanio" },
	            { data: "nombreCompleto" },
	            
	            {
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="mascota/mascota_form?idMascota=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-mascotaid="' + id + '" class="btn btn-danger eliminar-mascota"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-mascota').unbind('click');
                
                $('.eliminar-mascota').click(function(){
                    var id = $(this).attr('data-mascotaid');
                    swal({
                         title: "Eliminar Mascota",
                         text: "Seguro de eliminar la mascota seleccionado?",
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
                                 'idMascota':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = '../mascota';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = '../mascota';
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
				'grupoElementoId':3
			},
			mimeType: 'application/json',
			success : function(response) {
				
				if(response.success){
					var dataElementos = response.data;
					$('#raza').find('option').remove();
					$('#raza').append("<option value=0>-- Seleccionar Raza--</option>");
					
					jQuery.each(dataElementos, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.desNombre
						}).appendTo('#raza');
					});

				}
				
			}
		});
		
		$.ajax({
			url : '../catalogo/elemento/listar',
			contentType: "application/json",	
			dataType: 'json',
			data : {
				'grupoElementoId':2
			},
			mimeType: 'application/json',
			success : function(response) {
				
				if(response.success){
					var dataElementos = response.data;
					$('#genero').find('option').remove();
					$('#genero').append("<option value=0>-- Seleccionar Genero--</option>");
					
					jQuery.each(dataElementos, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.desAbreviacion
						}).appendTo('#genero');
					});

				}
				
			}
		});
		
		$.ajax({
			url : '../catalogo/elemento/listar',
			contentType: "application/json",	
			dataType: 'json',
			data : {
				'grupoElementoId':12
			},
			mimeType: 'application/json',
			success : function(response) {
				
				if(response.success){
					var dataElementos = response.data;
					$('#tamanio').find('option').remove();
					$('#tamanio').append("<option value=0>-- Seleccionar Tama&ntilde;o--</option>");
					
					jQuery.each(dataElementos, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.desNombre
						}).appendTo('#tamanio');
					});

				}
				
			}
		});
		
		
		$.ajax({
			url : '../catalogo/elemento/listar',
			contentType: "application/json",	
			dataType: 'json',
			data : {
				'grupoElementoId':1
			},
			mimeType: 'application/json',
			success : function(response) {
				
				if(response.success){
					var dataElementos = response.data;
					$('#tipoDocumento').find('option').remove();
					$('#tipoDocumento').append("<option value=0>-- Seleccionar Tipo Documento --</option>");
					
					jQuery.each(dataElementos, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.desNombre
						}).appendTo('#tipoDocumento');
					});

				}
				
			}
		});
		
		
             
});
function parseJSON(data) {
    return window.JSON && window.JSON.parse ? window.JSON.parse( data ) : (new Function("return " + data))(); 
}









