
var table;

$(document)
.ready(
		function() {

		$("#btnBuscarOpcion").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
			table.ajax.reload();
		});	 
			
	
		table=$('#opcionGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "opcion/listar", 
            "type": "GET",
            "data": function ( opcion ) {
            	
            	opcion.nombre=$('#opcionBusq').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "nombre" },
	            { data: "padre" },
	            { data: "accion" },
	            {
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="opcion/opcion_form?idOpcion=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-opcionid="' + id + '" class="btn btn-danger eliminar-opcion"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-opcion').unbind('click');
                
                $('.eliminar-opcion').click(function(){
                    var id = $(this).attr('data-opcionid');
                    swal({
                         title: "Eliminar Opcion",
                         text: "Seguro de eliminar la opción seleccionado?",
                         type: "info",
                         showCancelButton: true,
                         closeOnConfirm: false,
                         showLoaderOnConfirm: true,
                         confirmButtonText: "Si",
                         cancelButtonText: "No"
                     }, function () {

                     $.ajax({
                             method: "POST",
                             url: 'opcion/eliminar',
                             dataType: 'json',
                             data:{
                                 'idOpcion':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = '../seguridad/opcion';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = '../seguridad/opcion';
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


	

             
             
  
             
             $('#indJerarquia').change(
            			function() {
            				var optVal = $("#indJerarquia option:selected").val();

            				if (optVal == 0) {
            					$('#padresuperior').hide();
            					$('#padrehijo').hide();
            					$('#accionopcion').hide();
            					$('#modulo').hide();

            				}

            				if (optVal == 1) {
            					$('#padresuperior').hide();
            					$('#padrehijo').hide();
            					$('#accionopcion').hide();
            					$('#modulo').show();

            				}

            				if (optVal == 2) {
            					$('#padresuperior').show();
            					$('#padrehijo').hide();
            					$('#modulo').show();
            					$('#accionopcion').show();

            					$.ajax({
//            								type : 'POST',
            								url : 'listadobyjerarquia',
            								data : {
            									indJerarquia : optVal,
            								},
            								success : function(
            										response) {

            									var data = response.data;

            									$('#padreSuperiorId').find('option').remove();
            									$('#padreSuperiorId').append("<option value=0>-- Seleccionar --</option>");
            									jQuery.each(data,function() {
            														$('<option/>',
            																{
            																	'value' : this.id,
            																	'text' : this.nombre
            																})
            																.appendTo(
            																		'#padreSuperiorId');
            													
            											});

            								}
            							});

            				}

            				if (optVal == 3) {
            					$('#padresuperior').hide();
            					$('#padrehijo').show();
            					$('#modulo').show();
            					$('#accionopcion').show();

            							$.ajax({
            								
            								url : 'listadobyjerarquia',
            								data : {
            									indJerarquia : optVal,
            								},
            								success : function(response) {

            									var data = response.data;

            									$('#padreHijoId').find('option').remove();
            									$('#padreHijoId').append("<option value=0>-- Seleccionar --</option>");
            									jQuery
            											.each(
            													data,
            													function() {
            														$(
            																'<option/>',
            																{
            																	'value' : this.id,
            																	'text' : this.nombre
            																})
            																.appendTo(
            																		'#padreHijoId');
            													});

            								}
            							});
            				}

            			});     
     
             var modelJson =$('#dataOpcion').val();
             
            
             if(modelJson!=null && modelJson!=''){
            	var data= parseJSON(modelJson);
            	
				$('#nombre').val(data.nombre);
				$("label[for='nombre']").removeClass('form-label'); 
				$("label[for='nombre']").addClass('active');
				$('#id').val(data.id);
				$('#accion').val(data.accion);
				$("label[for='accion']").removeClass('form-label'); 
				$("label[for='accion']").addClass('active');
			
            	 if (data.indJerarquia == 1) {

						$('#padresuperior').hide();
						$('#padrehijo').hide();
						$('#accionopcion').hide();
						$('#modulo').show();
						$('#indJerarquia').children().removeAttr("selected");
						$("#indJerarquia option[value=1]").attr("selected",
								"selected");

					}

					if ( data.indJerarquia == 2 ) {
						$('#padresuperior').show();
						$('#padrehijo').hide();
						$('#modulo').show();
						$('#accionopcion').show();

						$('#indJerarquia').children().removeAttr("selected");
						$("#indJerarquia option[value=2]").attr("selected",
								"selected");

						$.ajax({
							type : 'POST',
							url : 'listadobyjerarquia',
							data : {
								indJerarquia : data.indPadre,
							},
							success : function(response) {

								var dataPadre = response.data;

								$('#padreSuperiorId').find('option').remove();
								$('#padreSuperiorId').append("<option value=0>-- Seleccionar --</option>");
								jQuery.each(dataPadre, function() {
									$('<option/>', {
										'value' : this.id,
										'text' : this.nombre
									}).appendTo('#padreSuperiorId');
								});

								$("#padreSuperiorId option[value='"
												+ data.indPadre + "']").attr(
										"selected", "selected");

							}
						});

					}

					if (data.indJerarquia == 3) {
						$('#padresuperior').hide();
						$('#padrehijo').show();
						$('#modulo').show();
						$('#accionopcion').show();

						$('#indJerarquia').children().removeAttr("selected");
						$("#indJerarquia option[value=3]").attr("selected",
								"selected");

						$.ajax({
							type : 'POST',
							url : 'listadobyjerarquia',
							data : {
								indJerarquia : data.id,
							},
							success : function(response) {

								var dataHijo = response.data;

								$('#padreHijoId').find('option').remove();
								jQuery.each(dataHijo, function() {
									$('<option/>', {
										'value' : this.id,
										'text' : this.nombre
									}).appendTo('#padreHijoId');
								});

								$("#padreHijoId option[value='" + data.hijoId
												+ "']")
										.attr("selected", "selected");
							}
						});
					}
					
					 
             }
             
        //GUARDAR OPCION
             var rules = {
            		 nombre: "required"
                 };
                 
              var messages = {
                     nombre: "Ingresre la opción"
                     
                 };
              
              
          
            
             $('#formOpcion_validation').validate({
            	    rules: rules,
            	    messages: messages,
            	    submitHandler: function (form) {

            	        var data = $(form).serializeArray();
            	        console.log(Util.arrayDataToObject(data));

            	        swal({
            	            title: 'Espere un momento por favor.',
            	            html: true,
            	            text: '<div class="preloader pl-size-xl">' +
            	                    '<div class="spinner-layer">' +
            	                    '<div class="circle-clipper left">' +
            	                    '<div class="circle"></div>' +
            	                    '</div>' +
            	                    '<div class="circle-clipper right">' +
            	                    '<div class="circle"></div>' +
            	                    '</div>' +
            	                    '</div>' +
            	                    '</div>',
            	            showConfirmButton: false
            	        });

            	        $.ajax({
            	            method: "POST",
            	            url: 'guardar',
            	            data: Util.arrayDataToObject(data),
            	            dataType: 'json'
            	        })
            	                .done(function (response) {
            	                    swal.close();

            	                    setTimeout(function () {

            	                        swal({
            	                            title: (response.success ? '<span class="text-success">Ok!</span>' : '<span class="text-danger">Error!</span>'),
            	                            text: response.message,
            	                            html: true
            	                        },
            	                        function(){
            	                            window.location = '../opcion';
            	                        });

            	                    }, 200);

            	                }).fail(function (jqXHR, textStatus) {
            	                    swal.close();

            	                    setTimeout(function () {

            	                        swal({
            	                            title: '<span class="text-danger">Error!</span>',
            	                            text: 'Ha ocurrido un error inesperado.',
            	                            html: true
            	                        });

            	                    }, 200);

            	                });
            	    }
            	});            
             
             
             
});










