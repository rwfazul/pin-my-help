<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Pin My Help | Login</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/css/mdb.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet">
</head>
<body>

    <div class="container">
    <div class="col-md-6 center-block" style="margin: 0 auto; margin-top: 10%">
        <section class="form-elegant">
        <section class="form-light">
            <div class="card">
            <div class="card-body mx-4">
                <form action="#" name="send_login">
                    <div class="text-center">
                        <h3 class="pink-text mb-5">
                            <strong>Pin My Help</strong>
                        </h3>
                    </div>
                    <div class="md-form">
                        <input type="text" id="Form-email2" class="form-control" name="email">
                        <label for="Form-email2">Seu e-mail</label>
                    </div>
                    <div class="md-form pb-3">
                        <input type="password" id="Form-pass2" class="form-control" name="password">
                        <label for="Form-pass2">Senha</label>
                        <div class="form-check"></div>
                        <p class="font-small grey-text d-flex justify-content-end">
                            <a href="#" class="font-weight-light ml-1">
                                Esqueceu a senha?
                            </a>
                        </p>
                    </div>
                    <div class="row d-flex align-items-center mb-4">
                        <div class="col-md-3 col-md-12 text-center">
                            <a href="${pageContext.request.contextPath}/dashboard" type="button"
                                    class="btn btn-pink btn-block btn-rounded z-depth-1 waves-effect waves-light">
                                Entrar
                            </a>
                        </div>
                        <div class="clearfix"></div>
                        <br/>
                        <div class="col-md-12 mt-4">
                            <p class="font-small grey-text d-flex justify-content-center">Ainda não tem conta?
                                <a href="${pageContext.request.contextPath}/account/register" class="font-weight-light ml-1"> Fazer Cadastro</a>
                            </p>
                        </div>
                    </div>
                </form>
            </div> <!-- ./card-body -->
            </div> <!-- ./card -->
        </section> <!-- ./form-light -->
        </section> <!-- ./form-elegant -->
    </div> <!-- ./col -->
    </div> <!-- ./container -->
                                                                                       
   
</body>
</html>