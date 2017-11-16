<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Recuperar Contraseña | Administrador de PataPerro</title>
    <jsp:include page="include/includescriptsLogin.jsp"></jsp:include>
</head>

<body class="fp-page">
    <div class="fp-box">
         <div align="center" style="margin: 4px; color: #fff; font-size:15px">
           <!--  <a href="javascript:void(0);">Admin-<b>Pata de Perro</b></a> -->
            <b>Administrador Pata de Perro</b>
        </div>
        <div class="card">
            <div class="body">
                <form id="forgot_password" method="POST" action="olvidecontrasena">
                    <div class="msg">
                        Ingresa tu email para poder recuperar la contraseña.
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">Email</i>
                        </span>
                      
                        <div class="form-line">
                            <input type="email" class="form-control" name="emailTo" placeholder="Email" required autofocus>
                        </div>
                        
                    </div>
                      <c:if test="${mensajeError != null}">
                        	<label id="ususMensajeError" class="Success">${mensajeError}</label>
                        </c:if>
                          <c:if test="${mensajeSuccess != null}">
                        	<label id="ususMensajeSucess" class="Success">${mensajeSuccess}</label>
                       </c:if>

                    <button class="btn btn-block btn-lg bg-indigo_celeste waves-effect" type="submit">RECUPERAR CONTRASEÑA</button>

                    <div class="row m-t-20 m-b--5 align-center">
                        <a href="login">LOGIN!</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

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
    <script src="js/pages/login/forgot-password.js"></script>
</body>

</html>