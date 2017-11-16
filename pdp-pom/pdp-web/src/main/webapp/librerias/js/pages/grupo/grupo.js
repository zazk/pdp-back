
var table;

$(document)
.ready(
		function() {

//			var $form = $('#misTablasForm').configurarFormulario();
			$("#btnBuscarGrupoElemento").on("click",function (e){// TO-DO : NO ESTA ENVIANDO EL PARAMETRO ORDER
				table.ajax.reload();
			});	 
			
			
table=$('#grupoElementoGrid').DataTable( {
   		"processing": true,
        "serverSide": true,
        "ordering": false,
        "ajax": {
            "url": "grupo/listar", 
            "type": "GET",
            "data": function ( grupo ) {
            	grupo.nombre=$('#nombreBusq').val()
            } 
        },
         "columns": [
          
	            { data: "id" },
	            { data: "nombre" },
	            { data: "desAbreviacion" },
	            {
	                data: "id",
                    width: "60px",
                    mRender: function (id, e,record) {
                        var el = '<a class="btn btn-warning" href ="grupo/grupo_form?idGrupoElemento=' + id + '"><span class="glyphicon glyphicon-edit"></span></a> <button data-grupoid="' + id + '" class="btn btn-danger eliminar-grupo"><span class="glyphicon glyphicon-remove"></span></button>';
                        return el;
                    }    
	            },
	        ],
	        "drawCallback": function( settings ) {
                
                $('.eliminar-grupo').unbind('click');
                
                $('.eliminar-grupo').click(function(){
                    var id = $(this).attr('data-grupoid');
                    swal({
                         title: "Eliminar Grupo Elemento",
                         text:" Seguro de eliminar el grupo seleccionado?",
                         type: "info",
                         showCancelButton: true,
                         closeOnConfirm: false,
                         showLoaderOnConfirm: true,
                         confirmButtonText: "Si",
                         cancelButtonText: "No"
                     }, function () {

                     $.ajax({
                             method: "POST",
                             url: 'grupo/eliminar',
                             dataType: 'json',
                             data:{
                                 'id':id
                             }
                         })
                     .done(function (response) {
                        swal({ title: response.message},function(){
                            window.location = './grupo';
                        });

                     }).fail(function (jqXHR, textStatus) {
                          swal({ title:'Ha ocurrido un error inesperado'},function(){
                            window.location = './grupo';
                        });
                     });
                         
                         
                     });
                    
                });
                
             }
        
        ,
        "searching": false,
        "iDisplayLength": 10,
          "lengthMenu": [
       	 [ 10, 20 ],
        	[ '10', '20' ]
   		 ],
          "paging": true,
          "error": function (xhr, error, thrown) {
        	 
        	  }
    } );
		

    
});
