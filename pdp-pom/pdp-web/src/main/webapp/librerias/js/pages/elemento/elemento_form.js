$(document)
.ready(
		function() {

			jQuery.validator.addMethod('notEqualTo', function(value, element, param) {
			    return  (value!="0") &&  (value != jQuery(param).val());
			}, 'No debe ser igual {0}.' );
			
			/**Formulario Elemento - INICIO**/
	        var rules = {
        		grupoElementoId: {
       			 	required: true , 
       			 	notEqualTo: "0" 
       			 	},
	        	desNombre: "required"
	        	
	            };
	            
	         var messages = {
	        		 grupoElementoId:{
	                		notEqualTo : "Debe escoger un Grupo"
	                        },
	        		 desNombre: "Ingrese el nombre",
	        		 
	            };
	         
	      
	       
	        $('#formElemento_validation').validate({
	       	    rules: rules,
	       	    messages: messages,
	       	    submitHandler: function (form) {
	       	   
	       	        var listEmail=[];
	       	        var email=null
	       	        var elementoObj=new Object();
	       	       
	       	        elementoObj.grupoElementoId=$('#grupoElementoId').val();
		       	    elementoObj.desAbreviacion=$('#desAbreviacion').val();
		       	    elementoObj.desNombre=$('#desNombre').val();
			       	elementoObj.estado=1;
			       	elementoObj.id=$('#id').val();
	       	        
		       	  
			        console.log(elementoObj);
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
	       	            data: elementoObj,
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
	       	                            window.location = '../elemento';
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
	        
	        
			
			
			 var modelJson =$('#dataElemento').val();
	            
	            if(modelJson!=null && modelJson!=''){
	            	
	            	var data= parseJSON(modelJson);
	            	
	            	   $('#desNombre').val(data.desNombre);
	          		   $("label[for='desNombre']").removeClass('form-label'); 
	          		 
	          		   $('#desAbreviacion').val(data.desAbreviacion);
	          		   $("label[for='desAbreviacion']").removeClass('form-label'); 
	          		   $('#id').val(data.id);
	          		   
	            	$.ajax({
    					url : '../../catalogo/grupo/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){

    							var dataElementos = response.data;
    							$('#grupoElementoId').find('option').remove();
    							$('#grupoElementoId').append("<option value='0'>-- Seleccionar Grupo --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.id,
    									'text' : this.nombre
    								}).appendTo('#grupoElementoId');
    							});
    							
    							$("#grupoElementoId option[value='" + data.grupoElementoId
										+ "']")
								.attr("selected", "selected");
    				
    						}
    					}
    				});
	            	
	            }else{
	            	
	            	
	            	$.ajax({
    					url : '../../catalogo/grupo/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    					
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){

    							var dataElementos = response.data;
    							$('#grupoElementoId').find('option').remove();
    							$('#grupoElementoId').append("<option value='0'>-- Seleccionar Grupo --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.id,
    									'text' : this.nombre
    								}).appendTo('#grupoElementoId');
    							});
    							
    						
    				
    						}
    					}
    				});
	            }
		
});