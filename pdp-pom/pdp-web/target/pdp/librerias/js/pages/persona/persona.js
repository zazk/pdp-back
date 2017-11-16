
var table;

$(document)
.ready(
		function() {

//			var $form = $('#misTablasForm').configurarFormulario();
			$("#btnBuscarPersona").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
				table.ajax.reload();
			});	 
			
			
table=$('#personaGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "persona/listar", 
            "type": "GET",
            "data": function ( persona ) {
            	persona.nombreCompleto=$('#nombreCompleto').val(),
            	persona.tipoDocumento=$('#tipoDocumento').val(),
            	persona.nroDocumento=$('#nroDocumento').val(),
            	persona.tipoPersona=$('#tipoPersona').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "nombreCompleto" },
	            { data: "desTipoDocumento" },
	            { data: "nroDocumento" },
	            { data: "desTipoPersona" },
	            { data: "email" },
	            {
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="persona/persona_form?idPersona=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-personaid="' + id + '" class="btn btn-danger eliminar-persona"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-persona').unbind('click');
                
                $('.eliminar-persona').click(function(){
                    var id = $(this).attr('data-personaid');
                    swal({
                         title: "Eliminar Persona",
                         text: "Seguro de eliminar la persona seleccionado?",
                         type: "info",
                         showCancelButton: true,
                         closeOnConfirm: false,
                         showLoaderOnConfirm: true,
                         confirmButtonText: "Si",
                         cancelButtonText: "No"
                     }, function () {

                     $.ajax({
                             method: "POST",
                             url: 'persona/eliminar',
                             dataType: 'json',
                             data:{
                                 'idPersona':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = './persona';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = './persona';
                        });
                     });
                         
                         
                     });
                    
                });
                
             }
        
        ,
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




			if($('#tipoDocumento')!=null){
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
							$('#tipoDocumento').append("<option value=0>-- Seleccionar Tipo Doc.--</option>");
							
							jQuery.each(dataElementos, function() {
								$('<option/>', {
									'value' : this.id,
									'text' : this.desNombre
								}).appendTo('#tipoDocumento');
							});
				
						}
						
					}
				});
			}
			
			if($('#tipoPersona')!=null){
				$.ajax({
					url : '../catalogo/elemento/listar',
					contentType: "application/json",	
					dataType: 'json',
					data : {
						'grupoElementoId':7
					},
					mimeType: 'application/json',
					success : function(response) {
						
						if(response.success){
							var dataElementos = response.data;
							$('#tipoPersona').find('option').remove();
							$('#tipoPersona').append("<option value=0>-- Seleccionar Tipo Persona --</option>");
							
							jQuery.each(dataElementos, function() {
								$('<option/>', {
									'value' : this.id,
									'text' : this.desNombre
								}).appendTo('#tipoPersona');
							});
				
						}
						
					}
				});
			}
		

    
});
