$(document)
.ready(
		function() {
        	
            
			 
		
			
	        //GUARDAR USUARIO
			jQuery.validator.addMethod('notEqualTo', function(value, element, param) {
			    return  (value!="0") &&  (value != jQuery(param).val());
			}, 'No debe ser igual {0}.' );
			
	        var rules = {
//	       		 nombre: "required",
//	       		tipo: {
//	       			 	required: true , 
//	       			 	notEqualTo: "0" 
//	       			 	}
	        
	            };
	            
	         var messages = {
//	                nombre: "Ingrese el rol",
//	                tipo:{
//	                		notEqualTo : "Debe escoger un medio"
//	                        }
	            };
	         
	         
	      
	       
	        $('#formUsuario_validation').validate({
	       	    rules: rules,
	       	    messages: messages,
	       	    submitHandler: function (form) {
	       	    	
	       	        var data = $(form).serializeArray();

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
	       	                            window.location = '../usuario';
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
			
			
			
			
			
			
			
			
			
			
			
			
			
			 var modelJson =$('#dataUsuario').val();
	            
	            if(modelJson!=null && modelJson!=''){
	            	
	            	var data= parseJSON(modelJson);
	            
	            	console.log(data);
	            	$('#id').val(data.id);
	            	$('#personaId').val(data.personaId);
	            	
	            	$('#search-box').val(data.persona.nombreCompleto);
	            	
	            	$('#usuario').val(data.usuario);
	          		$("label[for='usuario']").removeClass('form-label');
	          		
	          		$('#pass').val(data.pass);
	          		$("label[for='pass']").removeClass('form-label');
	          		
	          		$("#indAlerta option[value='" + data.indAlerta
							+ "']")
					.attr("selected", "selected");
	            	
	            	$.ajax({
	        			url : '../rol/listar',
	        			contentType: "application/json",	
	        			dataType: 'json',
	        			data : {
	        				
	        			},
	        			mimeType: 'application/json',
	        			success : function(response) {
	        				
	        				if(response.success){
	        					var dataElementos = response.data;
	        					$('#rolid').find('option').remove();
	        					$('#rolid').append("<option value=0>-- Seleccionar Rol --</option>");
	        					
	        					jQuery.each(dataElementos, function() {
	        						$('<option/>', {
	        							'value' : this.id,
	        							'text' : this.nombre
	        						}).appendTo('#rolid');
	        					});
	        					$("#rolid option[value='" + data.rol.id
										+ "']")
								.attr("selected", "selected");

	        				}
	        				
	        			}
	        		});
			
	            }else{
	            	
	            	
	            	$.ajax({
	        			url : '../rol/listar',
	        			contentType: "application/json",	
	        			dataType: 'json',
	        			mimeType: 'application/json',
	        			beforeSend: function() {
	        				//blockUI('','#FCFDFE',null); 
	        			  },
	        			success : function(response) {
	        				
	        				if(response.success){

	        					var dataRol = response.data;
	        					$('#rolid').find('option').remove();
	        					$('#rolid').append("<option value=0>-- Seleccionar Rol--</option>");
	        					
	        					jQuery.each(dataRol, function() {
	        						$('<option/>', {
	        							'value' : this.id,
	        							'text' : this.nombre
	        						}).appendTo('#rolid');
	        					});

	        				}else{
//	        					$.unblockUI();
//	        	            	 sweetAlert("",response.message, "error");
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