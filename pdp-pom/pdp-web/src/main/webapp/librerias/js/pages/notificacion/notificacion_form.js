$(document)
.ready(
		function() {
			
			
			  var rules = {
//						titulo: "required",
//						tipoAnuncio: {
//			       			 	required: true , 
//			       			 	notEqualTo: "0" 
//			       			 	}
			        
			            };
			            
			         var messages = {
//			        		 titulo: "Ingrese el Titulo del Anuncio",
//			        		 tipoAnuncio:{
//			                		notEqualTo : "Debe escoger un tipo negocio"
//			                        }
			            };
			         
			         
			      
			       
			        $('#formNotificacion_validation').validate({
			       	    rules: rules,
			       	    messages: messages,
			       	    submitHandler: function (form) {
			       	    	
			       	    	var formData = new FormData($("#formNotificacion_validation")[0]);

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
			       	                            window.location = '../notificacion';
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
				
			
			
			
			
			
			
			var modelJson =$('#dataNotificacion').val();
            
            if(modelJson!=null && modelJson!=''){
            	
            	var data= parseJSON(modelJson);
            	$('#id').val(data.id);
            	$('#ig_checkbox').prop({disabled: true})
            	$('#rolId').prop({disabled: true})
            	$("#fechaEmision").val(getFecha(data.fechaEmision));
            	$("#fechaRecepcion").val(getFecha(data.fechaRecepcion));
            	
        	 	$('#usuarioDestino').val(data.usuarioDestino)
        	 	$("#suggesstion-box").hide();
        	 	$('#usuarioDestino').prop({disabled: true})
            	$('#descripcion').val(data.descripcion)
            	
            	$.ajax({
					url : '../../catalogo/elemento/listar',
					contentType: "application/json",	
					dataType: 'json',
					data : {
						'grupoElementoId':4
					},
					mimeType: 'application/json',
					success : function(response) {
						
						if(response.success){

							var dataElementos = response.data;
							$('#tipoNotificacion').find('option').remove();
							$('#tipoNotificacion').append("<option value='0'>-- Seleccionar Tipo Notificaci&oacute;n --</option>");
							
							jQuery.each(dataElementos, function() {
								$('<option />', {
									'value' : this.id,
									'text' : this.desNombre
								}).appendTo('#tipoNotificacion');
							});
							
							$("#tipoNotificacion option[value='" + data.tipoNotificacion
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
						'grupoElementoId':5
					},
					mimeType: 'application/json',
					success : function(response) {
						
						if(response.success){

							var dataElementos = response.data;
							$('#tipoMedio').find('option').remove();
							$('#tipoMedio').append("<option value='0'>-- Seleccionar Medio --</option>");
							
							jQuery.each(dataElementos, function() {
								$('<option />', {
									'value' : this.id,
									'text' : this.desNombre
								}).appendTo('#tipoMedio');
							});
							
							$("#tipoMedio option[value='" + data.tipoMedio
									+ "']")
							.attr("selected", "selected");
				
						}
					}
				});
            	
            	
            	
            	$.ajax({
					url : '../../seguridad/rol/listar',
					contentType: "application/json",	
					dataType: 'json',
					data : {
						
					},
					mimeType: 'application/json',
					success : function(response) {
						
						if(response.success){

							var dataElementos = response.data;
							$('#rolId').find('option').remove();
							$('#rolId').append("<option value='0'>-- Seleccionar Rol --</option>");
							
							jQuery.each(dataElementos, function() {
								$('<option />', {
									'value' : this.id,
									'text' : this.nombre
								}).appendTo('#rolId');
							});
							

				
						}
					}
				});
            	
            	
            	
            }else{
            	
            	$.ajax({
					url : '../../catalogo/elemento/listar',
					contentType: "application/json",	
					dataType: 'json',
					data : {
						'grupoElementoId':4
					},
					mimeType: 'application/json',
					success : function(response) {
						
						if(response.success){

							var dataElementos = response.data;
							$('#tipoNotificacion').find('option').remove();
							$('#tipoNotificacion').append("<option value='0'>-- Seleccionar Tipo Notificaci&oacute;n --</option>");
							
							jQuery.each(dataElementos, function() {
								$('<option />', {
									'value' : this.id,
									'text' : this.desNombre
								}).appendTo('#tipoNotificacion');
							});
							
				
						}
					}
				});
            	
            	
            	$.ajax({
					url : '../../catalogo/elemento/listar',
					contentType: "application/json",	
					dataType: 'json',
					data : {
						'grupoElementoId':5
					},
					mimeType: 'application/json',
					success : function(response) {
						
						if(response.success){

							var dataElementos = response.data;
							$('#tipoMedio').find('option').remove();
							$('#tipoMedio').append("<option value='0'>-- Seleccionar Medio --</option>");
							
							jQuery.each(dataElementos, function() {
								$('<option />', {
									'value' : this.id,
									'text' : this.desNombre
								}).appendTo('#tipoMedio');
							});
							
						
				
						}
					}
				});
            	
            	
            	$.ajax({
					url : '../../seguridad/rol/listar',
					contentType: "application/json",	
					dataType: 'json',
					data : {
						
					},
					mimeType: 'application/json',
					success : function(response) {
						
						if(response.success){

							var dataElementos = response.data;
							$('#rolId').find('option').remove();
							$('#rolId').append("<option value='0'>-- Seleccionar Rol --</option>");
							
							jQuery.each(dataElementos, function() {
								$('<option />', {
									'value' : this.id,
									'text' : this.nombre
								}).appendTo('#rolId');
							});
							
							$('#rolId').prop({disabled: true})
						}
					}
				});
            	
            }
            
            
            
            var html='';
            
            $("#usuarioDestino").keyup(function(){
        		$.ajax({
        		type: "POST",
        		url: "../../seguridad/usuario/listar",
        		data:
        			'usuario='+$(this).val(),
        		beforeSend: function(){
        			$("#usuarioDestino").css("background","#FFF url(/pdp/imagenes/LoaderIcon.gif) no-repeat 165px");
        		},
        		success: function(response){
        			html='';
        			$("#suggesstion-box").show();
        			$("#suggesstion-box").html('');
        			
        			html+='<ul id="persona-list" class="dropdown-content ac-dropdown" style="width: 956px; position: absolute; top: 60px; left: 11.25px; opacity: 1; display: block;">';
        			
        			for (var i = 0; i < response.data.length; i+=1) {
        		
        				html+='<li class="ac-item" onclick="selectUsuario(this);" data-id="'+response.data[i].id+'"  data-text="'+response.data[i].usuario+'">'+response.data[i].usuario+'</li>';
        			
        			}
        			html+='</ul>';
        			
        			$("#suggesstion-box").html(html);
        			$("#usuarioDestino").css("background","#FFF");
        		}
        		});
        	});
            
            
            
            
            $('#fechaEmision').inputmask('dd/mm/yyyy', { placeholder: '__/__/____' });
            $('#fechaRecepcion').inputmask('dd/mm/yyyy', { placeholder: '__/__/____' });
            
});

function selectUsuario(obj){
	 var id = obj.dataset.id;
	 var text = obj.dataset.text;
	$("#usuarioDestino").val(text);
	$("#usuarioDestinoId").val(id)
	$("#suggesstion-box").hide();
}


function changeDestino(obj){
	
	 if (jQuery("#ig_checkbox").prop("checked")){
	 	$('#usuarioDestino').val('')
	 	$("#suggesstion-box").hide();
	 	$('#usuarioDestino').prop({disabled: true})
	 	$('#rolId').prop({disabled: false})
	} else{
	 	$('#usuarioDestino').prop({disabled: false})
		$("#rolId option[value='0']")
					.attr("selected", "selected");
	 	$('#rolId').prop({disabled: true})
	}
}