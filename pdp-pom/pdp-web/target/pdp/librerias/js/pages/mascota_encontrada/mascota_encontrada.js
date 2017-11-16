
var table;

$(document)
.ready(
		function() {

		$("#btnBuscarMascotaEncontrada").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
			table.ajax.reload();
		});	 
			
	
		table=$('#EncontrarMascotaGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "mascota_encontrada/listar", 
            "type": "GET",
            "data": function ( encontrada ) {
            	encontrada.mascotaNombre=$('#nombre').val(),
            	encontrada.mascotaRaza=$('#raza').val(),
            	encontrada.mascotaTamanio=$('#tamanio').val(),
            	encontrada.mascotaGenero=$('#genero').val(),
            	encontrada.mascotaColor=$('#color').val(),
            	encontrada.usuarioRegistro=$('#usuarioRegistro').val(),
            	encontrada.distrito=$('#distrito').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "mascotaNombre" },
	            { data: "desRaza" },
	            { data: "desTamanio" },
	            { data: "desParametro1" },
	            
	            {
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="mascota_encontrada/mascota_encontrada_form?idEncontrarMascota=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-mascotaid="' + id + '" class="btn btn-danger eliminar-mascota_encontrada"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-mascota_encontrada').unbind('click');
                
                $('.eliminar-mascota_encontrada').click(function(){
                    var id = $(this).attr('data-mascotaid');
                    swal({
                         title: "Eliminar Mascota Vista/Encontrada",
                         text: "Seguro de eliminar la mascota vista/encontrada seleccionado?",
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
                                 'idEncontrarMascota':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = '../mascota_encontrada';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = '../mascota_encontrada';
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
		
		
		$.ajax({
			url : '../catalogo/elemento/listar',
			contentType: "application/json",	
			dataType: 'json',
			data : {
				'grupoElementoId':11
			},
			mimeType: 'application/json',
			success : function(response) {
				
				if(response.success){
					var dataElementos = response.data;
					$('#color').find('option').remove();
					$('#color').append("<option value=0>-- Seleccionar Color --</option>");
					
					jQuery.each(dataElementos, function() {
						$('<option/>', {
							'value' : this.id,
							'text' : this.desNombre
						}).appendTo('#color');
					});

				}
			}
		});
		
		
		$.ajax({
			url : '../ubigeo/listar',
			contentType: "application/json",	
			dataType: 'json',
			data : {
				'indPais':24,
				'indDepartamento':15,
				'indProvincia':'01',
				'indAllDistrito':1
			},
			mimeType: 'application/json',
			success : function(response) {
				
				if(response.success){
					var dataElementos = response.data;
					$('#distrito').find('option').remove();
					$('#distrito').append("<option value=0>-- Seleccionar Distrito --</option>");
					
					
					jQuery.each(dataElementos, function() {
						$('<option />', {
							'value' : this.id,
							'text' : this.nombre
						}).appendTo('#distrito');
					});
		
				}
			}
			});
		
		
             
});
function parseJSON(data) {
    return window.JSON && window.JSON.parse ? window.JSON.parse( data ) : (new Function("return " + data))(); 
}









