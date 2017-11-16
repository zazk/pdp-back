$(document)
.ready(
		function() {
			
			/**Formulario Rol**/
			
		
			
	        //GUARDAR ROL
//			$.validator.addMethod( "notEqualTo", function( value, element, param ) {
//				debugger;
//				return this.optional( element ) || !$.validator.methods.equalTo.call( this, value, element, param );
//			}, "Please enter a different value, values must not be the same." );
			jQuery.validator.addMethod('notEqualTo', function(value, element, param) {
			    return  (value!="0") &&  (value != jQuery(param).val());
			}, 'No debe ser igual {0}.' );
			
	        var rules = {
	       		 nombre: "required",
	       		tipo: {
	       			 	required: true , 
	       			 	notEqualTo: "0" 
	       			 	}
	        
	            };
	            
	         var messages = {
	                nombre: "Ingrese el rol",
	                tipo:{
	                		notEqualTo : "Debe escoger un medio"
	                        }
	            };
	         
	         
	      
	       
	        $('#formRol_validation').validate({
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
	       	                            window.location = '../rol';
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
	        
	        
	        var modelJson =$('#dataRol').val();
            
            
            if(modelJson!=null && modelJson!=''){
            	var data= parseJSON(modelJson);
            	
            	$('#nombre').val(data.nombre);
				$("label[for='nombre']").removeClass('form-label'); 
				$("label[for='nombre']").addClass('active');
				$('#id').val(data.id);
				$('#tipo').children().removeAttr("selected");
				
				if($('#tipo')!=null){
					$.ajax({
						url : '../../catalogo/elemento/listar',
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
								$('#tipo').find('option').remove();
								$('#tipo').append("<option value='0'>-- Seleccionar Medio --</option>");
								
								jQuery.each(dataElementos, function() {
									$('<option/>', {
										'value' : this.id,
										'text' : this.desNombre
									}).appendTo('#tipo');
								});
					
								$("#tipo option[value='" + data.tipo
										+ "']")
								.attr("selected", "selected");
								
							}
							
						}
					});
				}
				
			
            	
            }else{
            	
        		if($('#tipo')!=null){
    				$.ajax({
    					url : '../../catalogo/elemento/listar',
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
    							$('#tipo').find('option').remove();
    							$('#tipo').append("<option value='0'>-- Seleccionar Medio --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option/>', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#tipo');
    							});
    				
    						}else{
    				//			$.unblockUI();
    				//        	 sweetAlert("",response.message, "error");
    						}
    						
    					}
    				});
    			}
            }
	        
	        
	        
		    
		});