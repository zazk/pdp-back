
var table;

$(document)
.ready(
		function() {

		$("#btnBuscarBusquedaMascota").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
			table.ajax.reload();
		});	 
			
	
		table=$('#busquedaMascotaGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "mascota_busqueda/listar", 
            "type": "GET",
            "data": function ( busqueda ) {
            	busqueda.mascotaNombre=$('#nombre').val(),
            	busqueda.mascotaRaza=$('#raza').val(),
            	busqueda.mascotaTamanio=$('#tamanio').val(),
            	busqueda.mascotaGenero=$('#genero').val(),
            	busqueda.mascotaColor=$('#color').val(),
            	busqueda.usuarioRegistro=$('#usuarioRegistro').val(),
            	busqueda.desParametro1=$('#usuarioRegistro').val(),
            	busqueda.distrito=$('#distrito').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "nombre" },
	            { data: "desRaza" },
	            { data: "desTamanio" },
	            { data: "desParametro1" },
	            
	            {
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="mascota_busqueda/mascota_busqueda_form?idBusquedaMascota=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-mascotaid="' + id + '" class="btn btn-danger eliminar-mascota_busqueda"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-mascota_busqueda').unbind('click');
                
                $('.eliminar-mascota_busqueda').click(function(){
                    var id = $(this).attr('data-mascotaid');
                    swal({
                         title: "Eliminar Mascota Buscada",
                         text: "Seguro de eliminar la mascota buscada seleccionado?",
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
                                 'idBusquedaMascota':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = '../mascota_busqueda';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = '../mascota_busqueda';
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









