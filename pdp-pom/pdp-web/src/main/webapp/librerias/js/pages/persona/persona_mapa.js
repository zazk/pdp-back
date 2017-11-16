
    //Panorama
//    var panorama = GMaps.createPanorama({
//        el: '#gmap_panorama',
//        lat: 42.3455,
//        lng: -71.0983
//    });
	   // This example adds a search box to a map, using the Google Place Autocomplete
    // feature. People can enter geographical searches. The search box will return a
    // pick list containing a mix of places and predicted search terms.

    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

  	 function initAutocomplete() {
  	             var map;
  	            var markersPointer = [];
  	            	


  	            	var myLatlngBase='';
		  	      	var ubicacion=$('#ubicacionCatastro').val();
		      		console.log(ubicacion);
			 	   	  if(ubicacion!=''){
			 	   	  	var res = ubicacion.split(" ");
			 	   	  		myLatlngBase= new google.maps.LatLng(parseFloat(res[0]),parseFloat(res[1]));
		          		}else{
		          			myLatlngBase= new google.maps.LatLng(parseFloat(-12.0453),parseFloat(-77.0311));
		          		}
				

	            	  var myOptions = {
	            		      zoom: 14,
	            		      center: myLatlngBase,
	            		      mapTypeId: google.maps.MapTypeId.ROADMAP
	            		    };
	            	
	            		
	            	
	            	
	                map = new google.maps.Map(document.getElementById('map'),myOptions);
	                 addMarker(myLatlngBase);
	          

	                // Create the search box and link it to the UI element.
	                var input = document.getElementById('pac-input');
	                var searchBox = new google.maps.places.SearchBox(input);
	                map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	                // Bias the SearchBox results towards current map's viewport.
	                map.addListener('bounds_changed', function() {
	                  searchBox.setBounds(map.getBounds());
	                });

	                var markers = [];
	                // Listen for the event fired when the user selects a prediction and retrieve
	                // more details for that place.
	                searchBox.addListener('places_changed', function() {
	                  var places = searchBox.getPlaces();

	                  if (places.length == 0) {
	                    return;
	                  }

	                  // Clear out the old markers.
	                  markers.forEach(function(marker) {
	                    marker.setMap(null);
	                  });
	                  markers = [];

	                  // For each place, get the icon, name and location.
	                  var bounds = new google.maps.LatLngBounds();
	                  places.forEach(function(place) {
	                    if (!place.geometry) {
	                      console.log("Returned place contains no geometry");
	                      return;
	                    }
	                    var icon = {
	                      url: place.icon,
	                      size: new google.maps.Size(71, 71),
	                      origin: new google.maps.Point(0, 0),
	                      anchor: new google.maps.Point(17, 34),
	                      scaledSize: new google.maps.Size(25, 25)
	                    };

	                    // Create a marker for each place.
	                    markers.push(new google.maps.Marker({
	                      map: map,
	                      icon: icon,
	                      title: place.name,
	                      position: place.geometry.location
	                    }));

	                    if (place.geometry.viewport) {
	                      // Only geocodes have viewport.
	                      bounds.union(place.geometry.viewport);
	                    } else {
	                      bounds.extend(place.geometry.location);
	                    }
	                  });
	                  map.fitBounds(bounds);
	                });
	                
		             
	 	            	 map.addListener('click', function(event) {
	 	            		 if(markersPointer.length==0){
	 	            			console.log('<div>'+'Longitute'+'<strong>' + event.latLng.lng() + '</strong><br>' +
	 	            		            'Latitude:'+'<strong>' + event.latLng.lat()+'</strong>'  + '</div>');
	 	            			$('#ubicacionCatastro').val(event.latLng.lat()+' '+event.latLng.lng());
	 	            			addMarker(event.latLng);
	 	            		   
	 	            		 }else{
	 	            			//
	 	            		 	clearMarkers();
	 	            			markersPointer=[];
	 	            			console.log('<div>'+'Longitute'+'<strong>' + event.latLng.lng() + '</strong><br>' +
	 	            		            'Latitude:'+'<strong>' + event.latLng.lat()+'</strong>'  + '</div>');
	 	            			$('#ubicacionCatastro').val(event.latLng.lat()+' '+event.latLng.lng());
	 	            			addMarker(event.latLng);
	 	            		 }
	 	                
	 	                 });
	 	   	            
	 	   	          function addMarker(location) {
	 	   	            var marker = new google.maps.Marker({
	 	   	              position: location,
	 	   	              map: map
	 	   	            });
	 	   	            markersPointer.push(marker);
	 	   	          }
	             
		 	   	      function showMarkers() {
		 	   	        setMapOnAll(map);
		 	   	      }
		 	   	      
			 	   	  function clearMarkers() {
			 	         setMapOnAll(null);
			 	       }
			 	   	  
			 	   	  function setMapOnAll(map) {
			 	         for (var i = 0; i < markersPointer.length; i++) {
			 	        	markersPointer[i].setMap(map);
			 	         }
			 	       }
  	           
			 	 
			 	   	  
  	            }
  	            
  	          //google.maps.event.addDomListener(window, 'load', initAutocomplete);
