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
		         
		         
		      
		       
		        $('#formBusquedaMascota_validation').validate({
		       	    rules: rules,
		       	    messages: messages,
		       	    submitHandler: function (form) {
		       	    	
		       	    		       	    		
		       	    	var formData = new FormData($("#formBusquedaMascota_validation")[0]);
		       	    	if($('#mascotaId').val()==0 && $('#indMascotaPropia').val()==2){
		       	    		
		       	    		formData.append('mascota.nombre',$('#nombre').val());
		      	    		formData.append('mascota.desComentario',$('#comentarioAdicional').val());
		       	    		formData.append('mascota.caracteristica',$('#descripcion').val());
		       	    		formData.append('mascota.estado',1);
		       	    		formData.append('mascota.distrito',$('#distrito').val());
		       	    		formData.append('mascota.tamanio',$('#tamanio').val());
			       	    	formData.append('mascota.genero',$('#genero').val());
			       	    	formData.append('mascota.raza',$('#raza').val());
			       	    	formData.append('mascota.color',$('#color').val());
			       	    	if($('#mascotaId').val()!=0){
			       	    		formData.append('mascota.id',$('#idMascota').val());
			       	    	}
			       	    	
		       	    		
		       	    	}else{
		       	    		
		       	    		formData.append('mascota.id',$('#mascotaId').val());
		       	    		formData.append('mascota.tamanio',$('#tamanio').val());
			       	    	formData.append('mascota.genero',$('#genero').val());
			       	    	formData.append('mascota.raza',$('#raza').val());
			       	    	formData.append('mascota.color',$('#color').val());
		     
		       	    	}

		       	    	
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
		       	            data: formData,
		       	            async : true,
							cache : false,
							contentType : false,
							processData : false,
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
		       	                            window.location = '../mascota_busqueda';
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
			
			
			
			
			
			
			
			 var modelJson =$('#dataBusquedaMascota').val();
	            
	            if(modelJson!=null && modelJson!=''){
	            	
	            	var data= parseJSON(modelJson);
	            	
	            
	            	$('#id').val(data.id);
	            	$("#pdfMascotaBusqueda").prop("href", "/pdp/descargarPosterpdfBusqueda?id="+data.id);
	            	
	            	if(data.persona!=null && data.persona.id!=null){
	            		$('#search-box').val(data.persona.nombreCompleto);
	            		$('#personaId').val(data.persona.id);
	            		$("#indMascotaPropia option[value='1']")
						.attr("selected", "selected");
	            		
	            	 	$.ajax({
	            			url : '../mascota/listarByPersona',
	            			contentType: "application/json",	
	            			dataType: 'json',
	            			data : {
	            				'personaId':data.persona.id
	            			},
	            			mimeType: 'application/json',
	            			success : function(response) {
	            				
	            				if(response.success){

	            					var dataElementos = response.data;
	            					$('#mascotaId').find('option').remove();
	            					$('#mascotaId').append("<option value='0'>-- Seleccionar Mascota --</option>");
	            					
	            					jQuery.each(dataElementos, function() {
	            						$('<option />', {
	            							'value' : this.id,
	            							'text' : this.nombre
	            						}).appendTo('#mascotaId');
	            					});
	            					
	            					$("#mascotaId option[value='" + data.mascota.id
	            							+ "']")
	            					.attr("selected", "selected");
	            		
	            				}
	            			}
	            		});
	            	 	$('#search-box').prop({disabled: true})
	            	}else{
	            		$("#indMascotaPropia option[value='2']")
						.attr("selected", "selected");
	            		$('#idMascota').val(data.mascota.id);
	                	$('#mascotaId').prop({disabled: true})
		            	$('#search-box').prop({disabled: true})
	            	}
	            	
	            	$('#indMascotaPropia').prop({disabled: true})
	            	$('#fechaPerdida').val(getFecha(data.fechaPerdida));
	          		$('#descripcion').val(data.descripcion);
	          		$('#comentarioAdicional').val(data.comentarioAdicional);
	          		$('#desComentario').val(data.desComentario);
	          		$('#nombre').val(data.mascota.nombre);
	          		$("label[for='nombre']").removeClass('form-label');
	          		
	          		$('#ubicacionCatastro').val(data.ubicacionCatastro);
	          		
	          		$('#montoRecompensa').val(data.montoRecompensa);
	        		$("label[for='montoRecompensa']").removeClass('form-label');
	        		
	          		$("#indRecompensa option[value='" + data.indRecompensa
										+ "']")
					.attr("selected", "selected");
	          		
	          		
	          		$('#generarPdf').show();
	          		if(data.fotoQr!=null && data.fotoQr!=''){
	          			$('#verQr').show();
	          			$('#imgqr').attr('src','/pdp/'+data.fotoQr);

	          		}
	          
	          		var indPrincipal=0;
	          		var count_fotoMascota=0;
	          		var html_li_fotoMascota='';
	          		var html_div_fotoMascota='';
	            	if(data.busquedaMascotaFotos!=null && data.busquedaMascotaFotos.length>0){
	            		for (var i = 0; i < data.busquedaMascotaFotos.length; i+=1) {
		          			
//		          			if(data.galeriaFotos[i].indPrincipal==1){
		          				$('#verFoto').show();
			          			$('#fotoMascota').attr('src','/pdp/'+data.busquedaMascotaFotos[i].foto);
			          			indPrincipal++;
//		          			}else{
//		          			
//		          				if(html_li_fotoMascota==''){
//		          					html_li_fotoMascota+='<li data-target="#carousel-example-generic_2" data-slide-to="'+count_fotoMascota+'" class="active"></li>';	
//		          					html_div_fotoMascota+='<div class="item active"><img src="/pdp/'+data.galeriaFotos[i].foto+'" /> </div>';
//		          				
//		          				}else{
//		          					count_fotoMascota++;
//		          					html_li_fotoMascota+='<li data-target="#carousel-example-generic_2" data-slide-to="'+count_fotoMascota+'"></li>';
//		          					html_div_fotoMascota+='<div class="item" ><img src="/pdp/'+data.galeriaFotos[i].foto+'" /> </div>';
//		          				}
//		          				
//		          			}
		          		}
	            		
//	            		$('#ind_fotoMascota').html('');
//	            		$('#ind_fotoMascota').html(html_li_fotoMascota);
//	            		$('#listMascotaFoto').html('');
//	            		$('#listMascotaFoto').html(html_div_fotoMascota);
	            		
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
	        					$("#raza option[value='" + data.mascota.raza
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
	        					$("#genero option[value='" + data.mascota.genero
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
	        					$("#tamanio option[value='" + data.mascota.tamanio
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
	        					$("#tipoDocumento option[value='" + data.mascota.genero
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
	        					$("#color option[value='" + data.mascota.color
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
	            
	           
	            $('#mascotaId').change(function() {
	            	
	            	var mascotaId=$('#mascotaId').val();
	            	if(mascotaId!=null && mascotaId!=0){
	            		
	            		$.ajax({
		            		url : '../mascota/obtenerByIdMascota',
		            		contentType: "application/json",	
		            		dataType: 'json',
		            		data : {
		            			'idMascota':$('#mascotaId').val()
		            		},
		            		mimeType: 'application/json',
		            		success : function(response) {
		            			
		            			if(response.success){
		            				var data=response.data;
		            				
		            				
		            				$("#raza option[value='" + data.raza
		            						+ "']")
		            				.attr("selected", "selected");
		            				
		            				$("#tamanio option[value='" + data.tamanio
		            						+ "']")
		            				.attr("selected", "selected");
		            				
		            				$("#color option[value='" + data.color
		            						+ "']")
		            				.attr("selected", "selected");
		            				
		            				$("#genero option[value='" + data.genero
		            						+ "']")
		            				.attr("selected", "selected");
		            				
		            				 $("#distrito option[value='" + data.distrito
			            						+ "']")
			            			.attr("selected", "selected");			
		            				
		            				 $("#nombre").val(data.nombre);
		            				 $("label[for='nombre']").removeClass('form-label');
		            				
		            				 $('#caracteristica').val(data.caracteristica);
		            				 
		            			}
		            		}
		            	});
	            	}else{
	            		
	            	}
	            	
	            	
	            	
	            });
	            $('#fechaPerdida').inputmask('dd/mm/yyyy', { placeholder: '__/__/____' });
	                
});


function activarIndPropio(obj){
	 var id = obj.value;
	if(id==1){
		$('#search-box').prop({disabled: false})
		$('#mascotaId').prop({disabled: false})
		$('#nombre').prop({disabled: true})
	}else{
		$('#search-box').prop({disabled: true})
		$('#mascotaId').prop({disabled: true})
		$('#nombre').prop({disabled: false})
		
	}
	
	$('#nombre').val('')
	$('#search-box').val('')
	$('#ubicacionCatastro').val('')
	$('#id').val('')
	
	$("#mascotaId").find("option:selected").removeAttr("selected");
	$("#mascotaId option[value='0']")
	.attr("selected", "selected");

	
	$("#raza").find("option:selected").removeAttr("selected");
	$("#raza option[value='0']")
	.attr("selected", "selected");
	
	
	$("#tamanio").find("option:selected").removeAttr("selected");
	$("#tamanio option[value='0']")
	.attr("selected", "selected");

	$("#color").find("option:selected").removeAttr("selected");
	//$("#color").removeAttr("selected");
	$("#color option[value='0']")
	.attr("selected", "selected");

	$("#genero").find("option:selected").removeAttr("selected");
	$("#genero option[value='0']")
	.attr("selected", "selected");

	$("#distrito").find("option:selected").removeAttr("selected");
	
	$('#caracteristica').val('');

}

function selectPersona(obj){
	 var id = obj.dataset.id;
	 var text = obj.dataset.text;
	 $("#search-box").val(text);
 	 $("#personaId").val(id)
 	 $("#suggesstion-box").hide();
 	 
 	$.ajax({
		url : '../mascota/listarByPersona',
		contentType: "application/json",	
		dataType: 'json',
		data : {
			'personaId':id
		},
		mimeType: 'application/json',
		success : function(response) {
			
			if(response.success){

				var dataElementos = response.data;
				$('#mascotaId').find('option').remove();
				$('#mascotaId').append("<option value='0'>-- Seleccionar Mascota --</option>");
				
				jQuery.each(dataElementos, function() {
					$('<option />', {
						'value' : this.id,
						'text' : this.nombre
					}).appendTo('#mascotaId');
				});
				
//				$("#mascotaId option[value='" + data.tipoAnuncio
//						+ "']")
//				.attr("selected", "selected");
	
			}
		}
	});
 	 
 	 
 	 
 	 
}
