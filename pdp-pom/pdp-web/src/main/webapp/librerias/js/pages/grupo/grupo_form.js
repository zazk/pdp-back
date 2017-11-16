$(document)
.ready(
		function() {


			/**Formulario Grupo Elemento - INICIO**/
			
			
	        var rules = {
		       		nombre: "required"
		       		
		            };
		            
		         var messages = {
		                nombre: "Ingrese el Nombre del Grupo"
		              
		            };
		         
		      
		       
		        $('#formGrupo_validation').validate({
		       	    rules: rules,
		       	    messages: messages,
		       	    submitHandler: function (form) {
		       	   
		       	        var listEmail=[];
		       	        var email=null
		       	        var grupoObj=new Object();
		       	       
		       	        grupoObj.nombre=$('#nombre').val();
		       	        grupoObj.desAbreviacion=$('#desAbreviacion').val();
				       	grupoObj.estado=1;
				       	grupoObj.id=$('#id').val();
		       	        
			       	  
				        console.log(grupoObj);
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
		       	            data: grupoObj,
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
		       	                            window.location = '../grupo';
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
			
			
			
			 var modelJson =$('#dataGrupoElemento').val();
	         
	            if(modelJson!=null && modelJson!=''){
	            	
	            	var data= parseJSON(modelJson);
	            	
	            	 var grupoObj=new Object();
		       	       
	            
	            	
	            	   $('#id').val(data.id);
	             	   $('#nombre').val(data.nombre);
	          		   $("label[for='nombre']").removeClass('form-label'); 
	          		 
	          		   $('#desAbreviacion').val(data.desAbreviacion);
	          		   $("label[for='desAbreviacion']").removeClass('form-label'); 
	            	
	            }else{
	            	
	            	
	            }
			
			
			


});