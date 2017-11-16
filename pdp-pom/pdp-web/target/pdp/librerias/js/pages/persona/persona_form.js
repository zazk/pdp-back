$(document)
.ready(
		function() {
			
			/**Formulario Persona - INICIO**/
			
			
	        //GUARDAR OPCION

			jQuery.validator.addMethod('notEqualTo', function(value, element, param) {
			    return  (value!="0") &&  (value != jQuery(param).val());
			}, 'No debe ser igual {0}.' );
			
	        var rules = {
//	       		nombre: "required",
//	       		tipo: {
//	       			 	required: true , 
//	       			 	notEqualTo: "0" 
//	       			 	}
	        
	            };
	            
	         var messages = {
//	                nombre: "Ingrese el Persona",
//	                tipo:{
//	                		notEqualTo : "Debe escoger un medio"
//	                        }
	            };
	         
	         
	      
	       
	        $('#formPersona_validation').validate({
	       	    rules: rules,
	       	    messages: messages,
	       	    submitHandler: function (form) {
	       	   
	       	        var listEmail=[];
	       	        var email=null
	       	        var personaObj=new Object();
	       	        var tipoPersona=$('#tipoPersona').val();
	       	        if(tipoPersona=18){
	       	        	personaObj.nombres=$('#nombres').val();
	       	        	personaObj.apellidoPaterno=$('#apellidoPaterno').val();
	       	        	personaObj.apellidoMaterno=$('#apellidoMaterno').val();
	       	        	personaObj.fechaNacimiento=$('#fechaNacimiento').val();
	       	        	personaObj.genero=$('#genero').val();
	       	        	personaObj.nombreCompleto=$('#nombres').val().trim()+' '+$('#apellidoPaterno').val().trim()+' '+$('#apellidoMaterno').val().trim();
	       	        }else{
	       	        	personaObj.nombreCompleto=$('#nombreCompleto').val();
	       	        }
	       	        personaObj.tipoDocumento=$('#tipoDocumento').val();
	       	        personaObj.nroDocumento=$('#nroDocumento').val();
	       	        personaObj.pais=$('#pais').val();
	       	        personaObj.distrito=$('#distrito').val();
	       	        personaObj.ubicacionCatastro=$('#ubicacionCatastro').val();
	       	        personaObj.tipoPersona=tipoPersona; 
	       	        personaObj.estado=1;
	       	        personaObj.id=$('#id').val();
	       	        
	       	        var listaEmail = $(".email");
		       	     listaEmail.each( function(i) {
		       	    	 var id=listaEmail[i].lang;
		       	    	
		       	    	
		       	    	personaObj['listEmail['+i+'].email']=$('#email'+id).val();
		       	    	personaObj['listEmail['+i+'].indPrincipal']=$('#indCondicion'+id).val();
		       	    	personaObj['listEmail['+i+'].estado']=1;
		       	    	
		       	     });
		       	     
		       	     var listaContacto = $(".contact");
		       	         listaContacto.each( function(i) {
		       	    	 var id=listaContacto[i].lang;
		       	    	
		       	    	
		       	    	personaObj['listContacto['+i+'].numero']=$('#numeroTelf'+id).val();
		       	    	personaObj['listContacto['+i+'].tipoTelefono']=$('#tipoTelf'+id).val();
		       	    	personaObj['listContacto['+i+'].estado']=1;
		       	    	
		       	     });
		       	  

		       	  
			       console.log(personaObj);
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
	       	            data: personaObj,
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
	       	                            window.location = '../persona';
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
	        
	        
	        /**Formulario Persona - FIN**/
	        
	        var modelJson =$('#dataPersona').val();
            
            if(modelJson!=null && modelJson!=''){
            	 /**Edicion Formulario Persona INICIO--**/
            	
            	var data= parseJSON(modelJson);
            	
            	console.log(data);
            	 if(data.tipoPersona==18){
          		   $('#section_nacimiento').show();
          		   $('#section_dni').show();
          		   $('#section_genero').show();
          		   $('#section_nacimiento').show();
          		   $('#section_ruc').hide();
          		   
          		   $('#nombres').val(data.nombres);
          		   $("label[for='nombres']").removeClass('form-label'); 
          		   
	          		$('#apellidoPaterno').val(data.apellidoPaterno);
	       			$("label[for='apellidoPaterno']").removeClass('form-label'); 
	       			
	       			$('#apellidoMaterno').val(data.apellidoMaterno);
	       			$("label[for='apellidoMaterno']").removeClass('form-label');
	       			
	       			$('#nroDocumento').val(data.nroDocumento);
	       			$("label[for='nroDocumento']").removeClass('form-label');
	       			$("#id").val(data.id);
	       			debugger;
					$("#fechaNacimiento").val(new Date(data.fechaNacimiento));
	       			
					$('#ubicacionCatastro').val(data.ubicacionCatastro);
	          		
					$('#nombresCompleto').val(data.nombreCompleto);
					$("label[for='nombresCompleto']").removeClass('form-label');
	       			console.log(data.ubigeo);
	       			
	       			$.ajax({
    					url : '../../catalogo/elemento/listar',
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
    							$('#genero').append("<option value='0'>-- Seleccionar Genero --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#genero');
    							});
    							
    							$("#genero option[value='" + data.genero
										+ "']")
								.attr("selected", "selected");
    				
    						}
    					}
    				});
	       			
	       			
	       			
          		   
          	   }else{
          		   
          		   $('#section_nacimiento').hide();
          		   $('#section_dni').hide();
          		   $('#section_genero').hide();
          		   $('#section_ruc').show();
          		   
         			$('#nombreCompleto').val(data.nombreCompleto);
	       			$("label[for='nombreCompleto']").removeClass('form-label');
          		   
          	   }
				
					$.ajax({
						url : '../../catalogo/elemento/listar',
						contentType: "application/json",	
						dataType: 'json',
						data : {
							'grupoElementoId':7
						},
						mimeType: 'application/json',
						beforeSend: function() {
							
						  },
						success : function(response) {
							
							if(response.success){

								var dataElementos = response.data;
								$('#tipoPersona').find('option').remove();
								$('#tipoPersona').append("<option value='0'>-- Seleccionar Tipo Persona --</option>");
								
								jQuery.each(dataElementos, function() {
									$('<option/>', {
										'value' : this.id,
										'text' : this.desNombre
									}).appendTo('#tipoPersona');
								});
					
								$("#tipoPersona option[value='" + data.tipoPersona
										+ "']")
								.attr("selected", "selected");
								//$('#tipoPersona').prop('disabled', true);
								$('#tipoPersona').attr("disabled", true); 
							}
							
						}
					});
					
					
					
					$.ajax({
    					url : '../../catalogo/elemento/listar',
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
    							$('#tipoDocumento').append("<option value='0'>-- Seleccionar Tipo Documento --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option/>', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#tipoDocumento');
    							});
    							$("#tipoDocumento option[value='" + data.tipoDocumento
										+ "']")
								.attr("selected", "selected");
    				
    						}
    						
    					}
    				});
					
					
					
					$.ajax({
    					url : '../../catalogo/elemento/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'grupoElementoId':10
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						if(response.success){
    							var dataElementos = response.data;
    							$('#pais').find('option').remove();
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#pais');
    							});
    							
    							$("#pais option[value='" + data.pais
										+ "']")
								.attr("selected", "selected");
    						}
    					}
    				});
			
					var idPais;
					var idProvincia;
					var idDepartamento;
					var idDistrito;
					if(data.ubigeo!=null ){
						idPais=data.ubigeo.indPais;
						idDepartamento=data.ubigeo.indDepartamento;
						idProvincia=data.ubigeo.indProvincia;
						idDistrito=data.ubigeo.id;
					}else{
						
						idPais=24;
						idDepartamento=null;
						idProvincia=null;
						idDistrito=null;
					}
					
					
					/*Ubicacion*/
    				$.ajax({
    					url : '../../ubigeo/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'indPais':idPais,
    						'indAllDepartamento':1
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){
    							var dataElementos = response.data;
    							$('#combdepartamento').find('option').remove();
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.indDepartamento,
    									'text' : this.nombre
    								}).appendTo('#combdepartamento');
    							});
    							
    							if(data.ubigeo!=null && data.ubigeo.indDepartamento!=null){
    								$("#combdepartamento option[value='" + data.ubigeo.indDepartamento
    										+ "']")
    								.attr("selected", "selected");
    							}
    							
    							
    				
    						}
    					}
    				});
    				
    				
    			
    				
    				$.ajax({
    					url : '../../ubigeo/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'indPais':idPais,
    						'indDepartamento':idDepartamento,
    						'indAllProvincia':1
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){
    							var dataElementos = response.data;
    							$('#combprovincia').find('option').remove();
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.indProvincia,
    									'text' : this.nombre
    								}).appendTo('#combprovincia');
    							});
    							
    							if(data.ubigeo!=null && data.ubigeo.indProvincia!=null){
    								$("#combprovincia option[value='" + data.ubigeo.indProvincia
    										+ "']")
    								.attr("selected", "selected");
    							}
    							
    						}
    					  }
    					});
    				
    				
    			
    		
    				
    				$.ajax({
    					url : '../../ubigeo/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'indPais':idPais,
    						'indDepartamento':idDepartamento,
    						'indProvincia':idProvincia,
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
    							
    							if( data.ubigeo!=null && data.ubigeo.id!=null){
    								$("#distrito option[value='" + data.ubigeo.id
    										+ "']")
    								.attr("selected", "selected");
    							}
    							
    				
    						}
    					}
    					});
    				
    				$.ajax({
    					url : '../../catalogo/elemento/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'grupoElementoId':6
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){
    							var dataElementos = response.data;
    							$('#tipoTelefono').find('option').remove();
    							$('#tipoTelefono').append("<option value='0'>-- Seleccionar Tipo Telefono --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option/>', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#tipoTelefono');
    							});
    				
    						}
    					}
    				});
    				
					
					/* Listado de Correo y Contacto*/
					for (var int = 0; int < data.listEmail.length; int++) {
						
						
						var condicion=data.listEmail[int].indPrincipal;
						var desCondicion='';
						if(condicion==1){
							desCondicion='PRINCIPAL';
						}else{
							desCondicion='SECUNDARIO';
						}
						
						var newRow=parseInt($('#countEmail').val());
						if(newRow==0){
							newRow=1;
						}else{
							newRow=newRow+1;
						}
						$('#countEmail').val(newRow);
						
						$('#forTableEmail > tbody:last-child').append("<tr id=\"rowEmail"+newRow+"\">" +
								
						"<td><input type=\"hidden\" id=\"email"+newRow+"\" class='email'  lang=\""+newRow+"\" name=\"email"+newRow+"\" value='"+data.listEmail[int].email+"'/>"+data.listEmail[int].email+"</td>"+
						"<td><input type=\"hidden\" id=\"indCondicion"+newRow+"\"  name=\"indCondicion"+newRow+"\" value='"+condicion+"'/>"+desCondicion+"</td>"+
						"<td> <button onclick=\"eliminarRow('rowEmail"+newRow+"')\"  class=\"btn btn-danger eliminar-persona\"><span class=\"glyphicon glyphicon-remove\"></span></button></td>"+
						"</tr>");
						
					}
					
					
					for (var int = 0; int < data.listContacto.length; int++) {
						
						
						var tipo_telefono=data.listContacto[int].tipoTelefono;
						var desTipotTelefono='';
						if(tipo_telefono==16){
							desTipotTelefono='FIJO/CASA';
						}else{
							desTipotTelefono='CELULAR';
						}
						
						
						var newRow=parseInt($('#countContacto').val());
						if(newRow==0){
							newRow=1;
						}else{
							newRow=newRow+1;
						}
						$('#countContacto').val(newRow);
						
						$('#forTableContacto > tbody:last-child').append("<tr id=\"rowContacto"+newRow+"\">" +
						
						"<td><input type=\"hidden\" id=\"tipoTelf"+newRow+"\" class='contact' lang=\""+newRow+"\" name=\"tipoTelf"+newRow+"\" value='"+tipo_telefono+"'/>"+desTipotTelefono+"</td>"+
						"<td><input type=\"hidden\" id=\"numeroTelf"+newRow+"\"  name=\"numeroTelf"+newRow+"\" value='"+data.listContacto[int].numero+"'/>"+data.listContacto[int].numero+"</td>"+
						"<td> <button onclick=\"eliminarRow('rowContacto"+newRow+"')\"  class=\"btn btn-danger eliminar-persona\"><span class=\"glyphicon glyphicon-remove\"></span></button></td>"+
						"</tr>")
						
						
					}
					
				
			
				 /**Edicion Formulario Persona FIN--**/
            }else{
            	/**Nuevo Formulario Persona INICIO--**/
    				$.ajax({
    					url : '../../catalogo/elemento/listar',
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
    							$('#tipoDocumento').append("<option value='0'>-- Seleccionar Tipo Documento --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option/>', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#tipoDocumento');
    							});
    							$("#tipoDocumento option[value='" + 1
										+ "']")
								.attr("selected", "selected");
    				
    						}
    						
    					}
    				});
    				
    				
    				
    				
    				$.ajax({
    					url : '../../catalogo/elemento/listar',
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
    							$('#tipoPersona').append("<option value='0'>-- Seleccionar Tipo Persona --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option/>', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#tipoPersona');
    							});
    							
    							$("#tipoPersona option[value='" + 18
										+ "']")
								.attr("selected", "selected");
    				
    						}
    						
    					}
    				}); 
    				
    				
    				$.ajax({
    					url : '../../catalogo/elemento/listar',
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
    							$('#genero').append("<option value='0'>-- Seleccionar Genero --</option>");
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#genero');
    							});
    				
    						}
    					}
    				});
    				
    				$.ajax({
    					url : '../../catalogo/elemento/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'grupoElementoId':10
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						if(response.success){
    							var dataElementos = response.data;
    							$('#pais').find('option').remove();
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.id,
    									'text' : this.desNombre
    								}).appendTo('#pais');
    							});
    							
    							$("#pais option[value='" + 24
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
    						'indPais':24,//$('#pais').val(),
    						'indAllDepartamento':1
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){
    							var dataElementos = response.data;
    							$('#combdepartamento').find('option').remove();
    							
    							jQuery.each(dataElementos, function() {
    								$('<option />', {
    									'value' : this.indDepartamento,
    									'text' : this.nombre
    								}).appendTo('#combdepartamento');
    							});
    				
    						}
    					}
    				});
    				
    	
    				
    			$.ajax({
					url : '../../catalogo/elemento/listar',
					contentType: "application/json",	
					dataType: 'json',
					data : {
						'grupoElementoId':6
					},
					mimeType: 'application/json',
					success : function(response) {
						
						if(response.success){
							var dataElementos = response.data;
							$('#tipoTelefono').find('option').remove();
							$('#tipoTelefono').append("<option value='0'>-- Seleccionar Tipo Telefono --</option>");
							
							jQuery.each(dataElementos, function() {
								$('<option/>', {
									'value' : this.id,
									'text' : this.desNombre
								}).appendTo('#tipoTelefono');
							});
				
						}
					}
				});
    			/**Nuevo Formulario Persona FIN--**/	
    			
            }
            
            
			
			$('#combdepartamento').change(function() {	
				
				$.ajax({
					url : '../../ubigeo/listar',
					contentType: "application/json",	
					dataType: 'json',
					data : {
						'indPais':24,//$('#pais').val(),
						'indDepartamento':$('#combdepartamento').val(),
						'indAllProvincia':1
					},
					mimeType: 'application/json',
					success : function(response) {
						
						if(response.success){
							var dataElementos = response.data;
							$('#combprovincia').find('option').remove();
							
							jQuery.each(dataElementos, function() {
								$('<option />', {
									'value' : this.indProvincia,
									'text' : this.nombre
								}).appendTo('#combprovincia');
							});
				
						}
					  }
					});
				});
				
			
			$('#combprovincia').change(function() {	
				
				$.ajax({
					url : '../../ubigeo/listar',
					contentType: "application/json",	
					dataType: 'json',
					data : {
						'indPais':24,//$('#pais').val(),
						'indDepartamento':$('#combdepartamento').val(),
						'indProvincia':$('#combprovincia').val(),
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
				});
            
            
            
           $('#tipoPersona').change(function() {	
        	   var valorTipoPersona=$('#tipoPersona').val();
        	   //natural
        	   if(valorTipoPersona==18){
        		   $('#section_nacimiento').show();
        		   $('#section_dni').show();
        		   $('#section_genero').show();
        		   $('#section_nacimiento').show();
        		   $('#section_ruc').hide();
        		   
        	   }else{
        		   
        		   $('#section_nacimiento').hide();
        		   $('#section_dni').hide();
        		   $('#section_genero').hide();
        		   $('#section_ruc').show();
        		   
        	   }
        	   
           });
            
            
            
            
           
            $('#fechaNacimiento').inputmask('dd/mm/yyyy', { placeholder: '__/__/____' });
          
            $('#numero').inputmask("9{7,13}");
            $('#email').inputmask({
                mask: "*{1,20}[.*{1,20}][.*{1,20}][.*{1,20}]@*{1,20}[.*{2,6}][.*{1,2}]",
                greedy: false,
                onBeforePaste: function (pastedValue, opts) {
                  pastedValue = pastedValue.toLowerCase();
                  return pastedValue.replace("mailto:", "");
                },
                definitions: {
                  '*': {
                    validator: "[0-9A-Za-z!#$%&'*+/=?^_`{|}~\-]",
                    cardinality: 1
                  }
                }
              });
	        
		    
		});


	
	function agregarEmail(){
		
		var condicion=$("#tipoCondicion").val();
		var desCondicion='';
		if(condicion==1){
			desCondicion='PRINCIPAL';
		}else{
			desCondicion='SECUNDARIO';
		}
		var email=$("#email").val();
		var newRow=parseInt($('#countEmail').val());
		if(newRow==0){
			newRow=1;
		}else{
			newRow=newRow+1;
		}
		$('#countEmail').val(newRow);
		
		$('#forTableEmail > tbody:last-child').append("<tr id=\"rowEmail"+newRow+"\">" +
				
		"<td><input type=\"hidden\" id=\"email"+newRow+"\" class='email'  lang=\""+newRow+"\" name=\"email"+newRow+"\" value='"+email+"'/>"+email+"</td>"+
		"<td><input type=\"hidden\" id=\"indCondicion"+newRow+"\"  name=\"indCondicion"+newRow+"\" value='"+condicion+"'/>"+desCondicion+"</td>"+
		"<td> <button onclick=\"eliminarRow('rowEmail"+newRow+"')\"  class=\"btn btn-danger eliminar-persona\"><span class=\"glyphicon glyphicon-remove\"></span></button></td>"+
		"</tr>");
		$('#email').val('')
		
		
		
	}
	
	function eliminarRow(idRow){
		
		$("#"+idRow).remove();
	}
	
	
	function agregarContacto(){
		
		var tipo_telefono=$("#tipoTelefono").val();
		var desTipotTelefono='';
		if(tipo_telefono==16){
			desTipotTelefono='FIJO/CASA';
		}else{
			desTipotTelefono='CELULAR';
		}
		var numero=$("#numero").val();
		
		var newRow=parseInt($('#countContacto').val());
		if(newRow==0){
			newRow=1;
		}else{
			newRow=newRow+1;
		}
		$('#countContacto').val(newRow);
		
		$('#forTableContacto > tbody:last-child').append("<tr id=\"rowContacto"+newRow+"\">" +
		
		"<td><input type=\"hidden\" id=\"tipoTelf"+newRow+"\" class='contact' lang=\""+newRow+"\" name=\"tipoTelf"+newRow+"\" value='"+tipo_telefono+"'/>"+desTipotTelefono+"</td>"+
		"<td><input type=\"hidden\" id=\"numeroTelf"+newRow+"\"  name=\"numeroTelf"+newRow+"\" value='"+numero+"'/>"+numero+"</td>"+
		"<td> <button onclick=\"eliminarRow('rowContacto"+newRow+"')\"  class=\"btn btn-danger eliminar-persona\"><span class=\"glyphicon glyphicon-remove\"></span></button></td>"+
		"</tr>")
		$("#numero").val('');
	     
	}
	
	
	
	
	



