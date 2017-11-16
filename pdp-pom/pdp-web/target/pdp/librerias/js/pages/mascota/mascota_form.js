$(document)
.ready(
		function() {
			
			jQuery.validator.addMethod('notEqualTo', function(value, element, param) {
			    return  (value!="0") &&  (value != jQuery(param).val());
			}, 'No debe ser igual {0}.' );
			
			var rules = {
					nombre: "required",
					raza: {
		       			 	required: true , 
		       			 	notEqualTo: "0" 
		       			 	},
		       		genero: {
		       			 	required: true , 
		       			 	notEqualTo: "0" 
		       			 	},
		       		tamanio: {
		       			 	required: true , 
		       			 	notEqualTo: "0" 
		       			 	},
	       			 color: {
		       			 	required: true , 
		       			 	notEqualTo: "0" 
		       			 	},	 	
		       			 
		        
		            };
		            
		         var messages = {
		        		 nombre: "Ingrese el nombre de la mascota",
		        		 raza:{
		                		notEqualTo : "Debe escoger una raza"
		                        },
		                 genero:{
	                		notEqualTo : "Debe escoger el genero"
	                        },
	                     tamanio:{
	                		notEqualTo : "Debe escoger un tamaño"
	                        },
	                    color:{
	                		notEqualTo : "Debe escoger un color"
	                        },          
	                        
		            };
		         
		         
		      
		       
		        $('#formMascota_validation').validate({
		       	    rules: rules,
		       	    messages: messages,
		       	    submitHandler: function (form) {
		       	    	
		       	    	var formData = new FormData($("#formMascota_validation")[0]);

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
		       	                            window.location = '../mascota';
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
			
			
			
			
			
			
			
			 var modelJson =$('#dataMascota').val();
	            
	            if(modelJson!=null && modelJson!=''){
	            	
	            	var data= parseJSON(modelJson);
	            	
	            	console.log(data);
	            	$('#id').val(data.id);
	            	$('#personaId').val(data.personaId);
	          		
	            	$('#search-box').val(data.persona.nombreCompleto);
	          		$('#caracteristica').val(data.caracteristica);
	          		$('#desComentario').val(data.desComentario);
	          		$('#nombre').val(data.nombre);
	          		$("label[for='nombre']").removeClass('form-label');
	          		
	          		$('#ubicacionCatastro').val(data.ubicacionCatastro);
	          		
	          		var indPrincipal=0;
	          		var count_fotoMascota=0;
	          		var html_li_fotoMascota='';
	          		var html_div_fotoMascota='';
	            	if(data.galeriaFotos!=null && data.galeriaFotos.length>0){
	            		for (var i = 0; i < data.galeriaFotos.length; i+=1) {
		          			
		          			if(data.galeriaFotos[i].indPrincipal==1){
		          				$('#verFoto').show();
			          			$('#fotoMascota').attr('src','/pdp/'+data.galeriaFotos[i].foto);
			          			indPrincipal++;
		          			}else{
		          			
		          				if(html_li_fotoMascota==''){
		          					html_li_fotoMascota+='<li data-target="#carousel-example-generic_2" data-slide-to="'+count_fotoMascota+'" class="active"></li>';	
		          					html_div_fotoMascota+='<div class="item active"><img src="/pdp/'+data.galeriaFotos[i].foto+'" /> </div>';
		          				
		          				}else{
		          					count_fotoMascota++;
		          					html_li_fotoMascota+='<li data-target="#carousel-example-generic_2" data-slide-to="'+count_fotoMascota+'"></li>';
		          					html_div_fotoMascota+='<div class="item" ><img src="/pdp/'+data.galeriaFotos[i].foto+'" /> </div>';
		          				}
		          				
		          			}
		          		}
	            		
	            		$('#ind_fotoMascota').html('');
	            		$('#ind_fotoMascota').html(html_li_fotoMascota);
	            		$('#listMascotaFoto').html('');
	            		$('#listMascotaFoto').html(html_div_fotoMascota);
	            		
	            	}
	          		
	          			if(indPrincipal==0){
	          				$('#verFoto').hide();
	          			}
	          		
	          			
	          		
	          		
	          		
	            	$.ajax({
	        			url : '../../catalogo/elemento/listar',
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
	        					$("#raza option[value='" + data.raza
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
	        					$('#genero').append("<option value=0>-- Seleccionar Genero--</option>");
	        					
	        					jQuery.each(dataElementos, function() {
	        						$('<option/>', {
	        							'value' : this.id,
	        							'text' : this.desAbreviacion
	        						}).appendTo('#genero');
	        					});
	        					$("#genero option[value='" + data.genero
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
	        					$("#tamanio option[value='" + data.tamanio
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
	        					$("#tipoDocumento option[value='" + data.genero
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
	        					$("#color option[value='" + data.color
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
    							
    							
    							if(data.distrito!=null){
    								$("#distrito option[value='" + data.distrito
    										+ "']")
    								.attr("selected", "selected");
    							}
    						
    				
    						}
    					}
    					});
	            	
	            	
	            	
	            }else{
	            	
	            	
	            	$.ajax({
	        			url : '../../catalogo/elemento/listar',
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
	        			url : '../../catalogo/elemento/listar',
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
	        			url : '../../catalogo/elemento/listar',
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
	        					$('#color').append("<option value=0>-- Seleccionar Color--</option>");
	        					
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
	            	
	            }
			
	           
	            	
	            
  
	            var html='';
	            
	            $("#search-box").keyup(function(){
	        		$.ajax({
	        		type: "POST",
	        		url: "../../persona/persona/listar",
	        		data:
	        			'nombreCompleto='+$(this).val(),
	        		beforeSend: function(){
	        			$("#search-box").css("background","#FFF url(/pdp/imagenes/LoaderIcon.gif) no-repeat 165px");
	        		},
	        		success: function(response){
	        			html='';
	        			$("#suggesstion-box").show();
	        			$("#suggesstion-box").html('');
	        			
	        			html+='<ul id="persona-list" class="dropdown-content ac-dropdown" style="width: 956px; position: absolute; top: 60px; left: 11.25px; opacity: 1; display: block;">';
	        			
	        			for (var i = 0; i < response.data.length; i+=1) {
	        		
	        				html+='<li class="ac-item" onclick="selectPersona(this);" data-id="'+response.data[i].id+'"  data-text="'+response.data[i].nombreCompleto+'">'+response.data[i].nombreCompleto+'</li>';
	        			
	        			}
	        			html+='</ul>';
	        			
	        			$("#suggesstion-box").html(html);
	        			$("#search-box").css("background","#FFF");
	        		}
	        		});
	        	});
	            
	           
	            
	         
	                
});




function selectPersona(obj){
	 var id = obj.dataset.id;
	 var text = obj.dataset.text;
	 $("#search-box").val(text);
 	$("#personaId").val(id)
 	$("#suggesstion-box").hide();
}
