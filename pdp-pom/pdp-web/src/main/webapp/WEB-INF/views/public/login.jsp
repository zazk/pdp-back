<!DOCTYPE html>
<html lang="es">

<head>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Login</title>
    <!-- Favicon-->
    <link rel="icon" href="../../favicon.ico" type="image/x-icon">


    <jsp:include page="include/includescriptsLogin.jsp"></jsp:include>
</head>

<body class="login-page">
    <div class="login-box">
    
        <div align="center" style="margin: 4px; color: #fff; font-size:15px">
           <!--  <a href="javascript:void(0);">Admin-<b>Pata de Perro</b></a> -->
            <b>Administrador Pata de Perro</b>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in" method="POST" action="autenticar" onsubmit="cleanMessage();" id="validation-form">
          
		            <img width="340px" height="160px"  src="imagenes/pata de perro-02.jpg"/>
		            
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">Usuario</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="username" placeholder="usuario" required autofocus>
                        </div>
                        <c:if test="${mensajeError != null}">
                        	<label id="ususMensaje" class="error">${mensajeError}</label>
                        </c:if>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">Contraseña</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="password" placeholder="contraseña" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-8 p-t-5">
                           <!--  <input type="checkbox" name="rememberme" id="rememberme" class="filled-in chk-col-pink">
                            <label for="rememberme">Remember Me</label> -->
                        </div>
                        <div class="col-xs-4">
                            <button class="btn btn-block bg-indigo_celeste waves-effect" type="submit">Login</button>
                        </div>
                        <div id="fb-root"></div>
                        
                    </div>
                    <div class="row m-t-15 m-b--20">
                        <div class="col-xs-6">
                           <!--  <a href="sign-up.html">Registrar Ahora</a> -->
                        </div>
                        <div class="col-xs-6 align-right">
                            <a href="olvide">Me olvide contraseña</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

	<script type="text/javascript">
		if ('ontouchstart' in document.documentElement)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
		
		function cleanMessage() {
			if($('#ususMensaje')){
				$('#ususMensaje').html('');
			}
			
			
			
		}
		
		
		
	</script>

    <!-- Jquery Core Js -->
    <script src="plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="js/admin.js"></script>
    <script src="js/pages/examples/sign-in.js"></script>
</body>

</html>