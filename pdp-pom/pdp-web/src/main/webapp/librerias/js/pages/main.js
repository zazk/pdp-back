
			

var Main = {
		goToComponent:function(action,nombreOpcion,idOpcion){
		
			if(action.length ==0){
				return;
			}
				 
//				 if(action.indexOf('?')>=0){
//					 action = action+'&idOpcion='+idOpcion;
//				 }else{
//					 action = action+'?idOpcion='+idOpcion;
//				 }
			
				 var h = $( window ).height()+800;
				 $('#div-content').html('');
				 //$('#tab-list').append($('<li><a href="#tab' + idOpcion + '" role="tab" data-toggle="tab">' + nombreOpcion + '<button class="close" type="button" title="Remove this page"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="font-size:10px;position:absolute;right:0px;top:0px;color:#000;"></span></button></a></li>'));
			    	 $('#div-content').append('<iframe src="/pdp/'+action+'" frameborder="0" width="100%" height="'+h+'" name="test_if" id="test_if" scrolling="no"></iframe></div>');	 
			    
				 
		
			 
//			 var tabSelected = $('#tab-list a[href="#tab'+idOpcion+'"]');
//			 tabSelected.tab('show');
			 
		}
		,
		redimensionar:function(h){
			
			$('#test_if').height(h+'px');
			
		}
		
};




