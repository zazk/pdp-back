$(document).ready(
	function() {

		console.log('ready!!!!!');

		$('#btn-guardar-rol-opcion')
			.click(
		function() {

			var tree = Ext.getCmp('tree');
			var records = tree.getView().getChecked();
			var param = new Object();
			param['id'] = $('#rolId').val();
			var c = 0;
			Ext.Array.each(records,
					function(rec, i) {

						if (rec.raw
								&& rec.raw.idOpcion) {
							param['opcionesPorRol['
									+ c
									+ '].opcionId'] = rec.raw.idOpcion;
							c++;
						}
					});

			console.log(param);
			
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
						type : 'POST',
						url : 'opcionrol/insert-opcion-rol',
						data : param,
						success : function(response) {

							if (response.success) {
								  swal.close();

		       	                    setTimeout(function () {

		       	                        swal({
		       	                            title: (response.success ? '<span class="text-success">Ok!</span>' : '<span class="text-danger">Error!</span>'),
		       	                            text: response.message,
		       	                            html: true
		       	                        },
		       	                        function(){
		       	                        	window.location = '../opcion_rol';
		       	                        });

		       	                    }, 200);
							} else {

								swal.close();

	       	                    setTimeout(function () {

	       	                        swal({
	       	                            title: '<span class="text-danger">Error!</span>',
	       	                            text: 'Ha ocurrido un error inesperado.',
	       	                            html: true
	       	                        });

	       	                    }, 200);

							}

						}

					});

		});
		
		

		var storetree = Ext.create('Ext.data.TreeStore', {
			autoLoad : true,
			proxy : {
				type : 'ajax',
				url : 'opcionrol/rolopciontree',
				extraParams : {
					idRol : -1
				}

			},
			sorters : [ {
				property : 'leaf',
				direction : 'ASC'
			}, {
				property : 'text',
				direction : 'ASC'
			} ]
		});

	Ext.create(
			'Ext.tree.Panel',
			{
				renderTo : 'jstree',
				store : storetree,
				rootVisible : false,
				width : 300,
				maxHeight : 500,
				border : false,
				buscarAllParents : function(parentNode,checked) {
					var me = this;
					parentNode.set('checked', checked);

					if (parentNode.parentNode) {
						me.buscarAllParents(parentNode.parentNode,checked);
					}

				},
				useArrows : true,
				id : 'tree',
				listeners : {
					'checkchange' : function(node,checked) {
						var me = this;
						var parentNode = node.parentNode;

						if (checked) {
							me.buscarAllParents(parentNode,checked);
						} else {
							// console.log(parentNode);
							if (parentNode) {
								// node.cascadeBy(function(n){n.set('checked',
								// checked);} );
								var c = 0;
								Ext.each(
										parentNode.childNodes,
										function(item) {
											if (item.data.checked) {
												c++;
											}
										});

								if (c == 0) {
									parentNode.set('checked',false);
								}

							}
							// me.buscarAllParents(parentNode,checked);
						}

						node.cascadeBy(function(n) {
							n.set('checked', checked);
						});
					}
				},
				dockedItems : [ {
					xtype : 'toolbar',

					items : [ {
						xtype : 'component',
						html : ''
								+ '<div style="width:100%;padding:0px;margin:0px 0px 4px 0px;">'
								+ '<select class="form-control show-tick" id="rolId" name="rolId">'
								+

								'</select>' + '</div>'
								+ '',
						listeners : {

							afterrender : function() {

								$('<option/>',
										{
											'value' : '-1',
											'text' : 'SELECCION EL ROL'
										}).appendTo(
										'#rolId');

								$.ajax({
										type : 'POST',
										url : 'rol/listar',
										data : {

										},
										success : function(response) {

											var dataRol = response.data;

											jQuery.each(
												dataRol,
												function() {
													$('<option/>',
															{
																'value' : this.id,
																'text' : this.nombre
															})
															.appendTo(
																	'#rolId');
												});

											$('#rolId').change(
												function() {

													var v = this.value;

													if (v) {

														$('#btn-guardar-rol-opcion')
															.removeClass('disabled');

														storetree.proxy.extraParams.idRol = v;
														storetree.load();
													}
													if (v == '-1') {
														$('#btn-guardar-rol-opcion')
															.addClass('disabled');
													}

												})

										}
										});
							}
						}
					}
					]
				 }
				]
			});

		});