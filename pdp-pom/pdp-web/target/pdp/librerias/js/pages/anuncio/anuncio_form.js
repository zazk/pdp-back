$(document)
.ready(
		function() {

			jQuery.validator.addMethod('notEqualTo', function(value, element, param) {
			    return  (value!="0") &&  (value != jQuery(param).val());
			}, 'No debe ser igual {0}.' );
			
	        var rules = {
					titulo: "required",
					tipoAnuncio: {
		       			 	required: true , 
		       			 	notEqualTo: "0" 
		       			 	}
		        
		            };
		            
		         var messages = {
		        		 titulo: "Ingrese el Titulo del Anuncio",
		        		 tipoAnuncio:{
		                		notEqualTo : "Debe escoger un tipo negocio"
		                        }
		            };
		         
		         
		      
		       
		        $('#formAnuncio_validation').validate({
		       	    rules: rules,
		       	    messages: messages,
		       	    submitHandler: function (form) {
		       	    	
		       	    	var formData = new FormData($("#formAnuncio_validation")[0]);

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
		       	            async : true,
							cache : false,
							contentType : false,
							processData : false,
		       	            data: formData,
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
		       	                            window.location = '../anuncio';
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
			
			
			
			
			
			
			 var modelJson =$('#dataAnuncio').val();
	            
	            if(modelJson!=null && modelJson!=''){
	            	
	            	var data= parseJSON(modelJson);
	            	
	            	$('#titulo').val(data.titulo);
	       			$("label[for='titulo']").removeClass('form-label');
	       			$("#id").val(data.id);
	            	$("#fechaVencimiento").val(getFecha(data.fechaVencimiento));
	            	$("#fechaAnuncio").val(getFecha(data.fechaAnuncio));
	            	$('#descripcion').val(data.descripcion);
	            	
	            	$("#estado option[value='" + data.estaoo
							+ "']")
					.attr("selected", "selected");
	            	
	            	if(data.foto && data.foto!=''){
	          			$('#verFoto').show();
	          			$('#fotoAnuncio').attr('src','/pdp/'+data.foto);	
	          		}else{
	          			$('#verFoto').hide();
	          		}
	            	
	            	$.ajax({
    					url : '../../catalogo/elemento/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'grupoElementoId':8
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){

    							var dataElementos = response.data;
    							$('#tipoAnuncio').find('option').remove();
    							$('#tipoAnuncio').append("<option value='0'>-- Seleccionar Tipo --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#tipoAnuncio');
    							});
    							
    							$("#tipoAnuncio option[value='" + data.tipoAnuncio
										+ "']")
								.attr("selected", "selected");
    				
    						}
    					}
    				});
	            	$.ajax({
    					url : '../../ubigeo/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'indPais':data.ubigeo.indPais,
    						'indDepartamento':data.ubigeo.indDepartamento,
    						'indProvincia':data.ubigeo.indProvincia,
    						'indAllDistrito':1
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){
    							var dataElementos = response.data;
    							$('#distrito').find('option').remove();
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.id,
    									'text' : this.nombre
    								}).appendTo('#distrito');
    							});
    							$("#distrito option[value='" + data.ubigeo.id
										+ "']")
								.attr("selected", "selected");
    				
    						}
    					}
    					});
	            	
	            }else{
	            	
	            	$.ajax({
    					url : '../../ubigeo/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'indPais':24,
    						'indDepartamento':'15',
    						'indProvincia':'01',
    						'indAllDistrito':1
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){
    							var dataElementos = response.data;
    							$('#distrito').find('option').remove();
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.id,
    									'text' : this.nombre
    								}).appendTo('#distrito');
    							});
    					
    				
    						}
    					}
    					});
	            	
	            	
	            	$.ajax({
    					url : '../../catalogo/elemento/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'grupoElementoId':8
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){

    							var dataElementos = response.data;
    							$('#tipoAnuncio').find('option').remove();
    							$('#tipoAnuncio').append("<option value='0'>-- Seleccionar Tipo --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#tipoAnuncio');
    							});
    							
    						
    				
    						}
    					}
    				});
	            }
			
			
			$('#fechaAnuncio').inputmask('dd/mm/yyyy', { placeholder: '__/__/____' });
			$('#fechaVencimiento').inputmask('dd/mm/yyyy', { placeholder: '__/__/____' });



});