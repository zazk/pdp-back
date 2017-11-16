$(document)
.ready(
		function() {

		
			jQuery.validator.addMethod('notEqualTo', function(value, element, param) {
			    return  (value!="0") &&  (value != jQuery(param).val());
			}, 'No debe ser igual {0}.' );
			
				var rules = {
					titulo: "required"
		       		
				};
		         var messages = {
		        		 titulo: "Ingrese el nombre del Negocio"
		               
		            };
		         
		         
		      
		       
		        $('#formNegocio_validation').validate({
		       	    rules: rules,
		       	    messages: messages,
		       	    submitHandler: function (form) {
		       	    	
		       	    	var formData = new FormData($("#formNegocio_validation")[0]);

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
		       	                            window.location = '../negocio';
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
			
			
			
			 var modelJson =$('#dataNegocio').val();
	            
	            if(modelJson!=null && modelJson!=''){
	            	
	            	var data= parseJSON(modelJson);
	            	
	            	$('#descripcion').val(data.descripcion); 
	            	$('#id').val(data.id);
	          		$('#titulo').val(data.titulo);
	          		$("label[for='titulo']").removeClass('form-label'); 
	          		$("#estado option[value='" + data.estado
							+ "']")
					.attr("selected", "selected");
	            	
	          		if(data.foto && data.foto!=''){
	          			$('#verFoto').show();
	          			$('#fotoNegocio').attr('src','/pdp/'+data.foto);	
	          		}else{
	          			$('#verFoto').hide();
	          		}
	          		
	          		
	          		$('#ubicacionCatastro').val(data.ubicacionCatastro);
	          		
	          		
	            	$.ajax({
    					url : '../../catalogo/elemento/listar',
    					contentType: "application/json",	
    					dataType: 'json',
    					data : {
    						'grupoElementoId':9
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){

    							var dataElementos = response.data;
    							$('#tipo_negocio').html('');
    							
    							
    							var html='<div class=\"header\">Tipo Negocio (Categorias)</div>';
    							
    							var cantidad=dataElementos.length;
    							
    							if(cantidad<=4){
    								
    								html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
    								html+='<div class=\"input-group input-group-lg\">';
    	    					  	
    								for (var valor = 0; valor < dataElementos.length; valor++) {
    								  html+='<span class=\"input-group-addon\">';
    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"idTipoNegocio\" id=\"ig_checkbox'+dataElementos[valor].id+'\" value="'+dataElementos[valor].id+'" >';
    								  html+='<label for=\"ig_checkbox'+dataElementos[valor].id+'\">'+dataElementos[valor].desNombre+'</label></span>';
        							}
    								
    								html+='</div></div></div>';
    							}else{
    								if(cantidad>4 && cantidad<=8){
    									html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
        								html+='<div class=\"input-group input-group-lg\">';
        	    					  	
    									for (var valor = 0; valor < dataElementos.length-3; valor++) {
    										
    										 html+='<span class=\"input-group-addon\">';
    	    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+dataElementos[valor].id+'\" value="'+dataElementos[valor].id+'" >';
    	    								  html+='<label for=\"ig_checkbox'+dataElementos[valor].id+'\">'+dataElementos[valor].desNombre+'</label></span>';
            							}
    									html+='</div></div></div>';
    									
    									html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
        								html+='<div class=\"input-group input-group-lg\">';
        	    					  	
    									for (var valor = 4; valor < dataElementos.length; valor++) {
   										  html+='<span class=\"input-group-addon\">';
	    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+dataElementos[valor].id+'\" value="'+dataElementos[valor].id+'" >';
	    								  html+='<label for=\"ig_checkbox'+dataElementos[valor].id+'\">'+dataElementos[valor].desNombre+'</label></span>';
            							}
    									html+='</div></div></div>';
    									
    									
    								}
    								
    								if(cantidad>9){
    									html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
        								html+='<div class=\"input-group input-group-lg\">';
        	    					  	
    									for (var valor = 0; valor < 4; valor++) {
    										
    										 html+='<span class=\"input-group-addon\">';
    	    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+dataElementos[valor].id+'\" value="'+dataElementos[valor].id+'" >';
    	    								  html+='<label for=\"ig_checkbox'+valor+'\">'+dataElementos[valor].desNombre+'</label></span>';
            							}
    									html+='</div></div></div>';
    									
    									html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
        								html+='<div class=\"input-group input-group-lg\">';
        	    					  	
    									for (var valor = 4; valor <8; valor++) {
   										  html+='<span class=\"input-group-addon\">';
	    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+dataElementos[valor].id+'\" value="'+dataElementos[valor].id+'" >';
	    								  html+='<label for=\"ig_checkbox'+dataElementos[valor].id+'\">'+dataElementos[valor].desNombre+'</label></span>';
            							}
    									html+='</div></div></div>';
    									
    									
    									
    									html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
        								html+='<div class=\"input-group input-group-lg\">';
        	    					  	
    									for (var valor =8 ; valor < 12; valor++) {
   										  html+='<span class=\"input-group-addon\">';
	    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+dataElementos[valor].id+'\" value="'+dataElementos[valor].id+'" >';
	    								  html+='<label for=\"ig_checkbox'+dataElementos[valor].id+'\">'+dataElementos[valor].desNombre+'</label></span>';
            							}
    									html+='</div></div></div>';
        								
    								}
    							}
    							
    							$('#tipo_negocio').html(html);
    							
    							for (var int = 0; int < data.listCategoriasNegocio.length; int++) {
    								var x ='#ig_checkbox'+data.listCategoriasNegocio[int].categoriaId+'';
    								console.log(x);
        							$('#ig_checkbox'+data.listCategoriasNegocio[int].categoriaId+'').attr('checked',true);

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
    						'grupoElementoId':9
    					},
    					mimeType: 'application/json',
    					success : function(response) {
    						
    						if(response.success){

    							var dataElementos = response.data;
    							$('#tipo_negocio').html('');
    							
    							
    							var html='<div class=\"header\">Tipo Negocio (Categorias)</div>';
    							
    							var cantidad=dataElementos.length;
    							
    							if(cantidad<=4){
    								
    								html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
    								html+='<div class=\"input-group input-group-lg\">';
    	    					  	
    								for (var int = 0; int < dataElementos.length; int++) {
    								  html+='<span class=\"input-group-addon\">';
    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+int+'\" value="'+dataElementos[int].id+'" >';
    								  html+='<label for=\"ig_checkbox'+int+'\">'+dataElementos[int].desNombre+'</label></span>';
        							}
    								
    								html+='</div></div></div>';
    							}else{
    								if(cantidad>4 && cantidad<=8){
    									html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
        								html+='<div class=\"input-group input-group-lg\">';
        	    					  	
    									for (var valor = 0; valor < dataElementos.length-3; valor++) {
    										
    										 html+='<span class=\"input-group-addon\">';
    	    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+valor+'\" value="'+dataElementos[valor].id+'" >';
    	    								  html+='<label for=\"ig_checkbox'+valor+'\">'+dataElementos[valor].desNombre+'</label></span>';
            							}
    									html+='</div></div></div>';
    									
    									html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
        								html+='<div class=\"input-group input-group-lg\">';
        	    					  	
    									for (var valor = 4; valor < dataElementos.length; valor++) {
   										  html+='<span class=\"input-group-addon\">';
	    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+valor+'\" value="'+dataElementos[valor].id+'" >';
	    								  html+='<label for=\"ig_checkbox'+valor+'\">'+dataElementos[valor].desNombre+'</label></span>';
            							}
    									html+='</div></div></div>';
    									
    									
    								}
    								
    								if(cantidad>9){
    									html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
        								html+='<div class=\"input-group input-group-lg\">';
        	    					  	
    									for (var valor = 0; valor < 4; valor++) {
    										
    										 html+='<span class=\"input-group-addon\">';
    	    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+valor+'\" value="'+dataElementos[valor].id+'" >';
    	    								  html+='<label for=\"ig_checkbox'+valor+'\">'+dataElementos[valor].desNombre+'</label></span>';
            							}
    									html+='</div></div></div>';
    									
    									html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
        								html+='<div class=\"input-group input-group-lg\">';
        	    					  	
    									for (var valor = 4; valor <8; valor++) {
   										  html+='<span class=\"input-group-addon\">';
	    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+valor+'\" value="'+dataElementos[valor].id+'" >';
	    								  html+='<label for=\"ig_checkbox'+valor+'\">'+dataElementos[valor].desNombre+'</label></span>';
            							}
    									html+='</div></div></div>';
    									
    									
    									
    									html+='<div class=\"row clearfix\">	<div class=\"col-lg-12 col-lg-12 col-sm-12\" >';
        								html+='<div class=\"input-group input-group-lg\">';
        	    					  	
    									for (var valor =8 ; valor < 12; valor++) {
   										  html+='<span class=\"input-group-addon\">';
	    								  html+='<input type=\"checkbox\" class=\"filled-in\" name=\"listNegociaCate\" id=\"ig_checkbox'+valor+'\" value="'+dataElementos[valor].id+'" >';
	    								  html+='<label for=\"ig_checkbox'+valor+'\">'+dataElementos[valor].desNombre+'</label></span>';
            							}
    									html+='</div></div></div>';
        								
    								}
    							}
    							
    							$('#tipo_negocio').html(html);
    							
    							
    						}
    					}
    				});
	            }

});










