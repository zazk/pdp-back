
var table;

$(document)
.ready(
		function() {

//			var $form = $('#misTablasForm').configurarFormulario();
			$("#btnBuscarRol").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
				table.ajax.reload();
			});	 
			
			
table=$('#rolGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "rol/listar", 
            "type": "GET",
            "data": function ( rol ) {
            	rol.nombre=$('#rolBusq').val(),
            	rol.tipo=$('#tipoAccesoBusq').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "nombre" },
	            { data: "desTipoRol" },
	            {
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="rol/rol_form?idRol=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-rolid="' + id + '" class="btn btn-danger eliminar-rol"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-rol').unbind('click');
                
                $('.eliminar-rol').click(function(){
                    var id = $(this).attr('data-rolid');
                    swal({
                         title: "Eliminar Rol",
                         text: "Seguro de eliminar el rol seleccionado?",
                         type: "info",
                         showCancelButton: true,
                         closeOnConfirm: false,
                         showLoaderOnConfirm: true,
                         confirmButtonText: "Si",
                         cancelButtonText: "No"
                     }, function () {

                     $.ajax({
                             method: "POST",
                             url: 'rol/eliminar',
                             dataType: 'json',
                             data:{
                                 'idRol':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = '../seguridad/rol';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = '../seguridad/rol';
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
			if($('#tipoAccesoBusq')!=null){
				$.ajax({
					url : '../catalogo/elemento/listar',
					contentType: "application/json",	
					dataType: 'json',
					data : {
						'grupoElementoId':5
					},
					mimeType: 'application/json',
					beforeSend: function() {
						
					  },
					success : function(response) {
						
						if(response.success){
			
							var dataElementos = response.data;
							$('#tipoAccesoBusq').find('option').remove();
							$('#tipoAccesoBusq').append("<option value=0>-- Seleccionar Medio --</option>");
							
							jQuery.each(dataElementos, function() {
								$('<option/>', {
									'value' : this.id,
									'text' : this.desNombre
								}).appendTo('#tipoAccesoBusq');
							});
				
						}else{
				//			$.unblockUI();
				//        	 sweetAlert("",response.message, "error");
						}
						
					}
				});
				
				
			}
		

    
});
