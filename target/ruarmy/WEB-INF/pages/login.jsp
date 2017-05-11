<%--
  Created by IntelliJ IDEA.
  User: skyplane
  Date: 04.05.17
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Авторизация</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="../scripts/login-assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../scripts/login-assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="../scripts/login-assets/css/form-elements.css">
        <link rel="stylesheet" href="../scripts/login-assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="../scripts/login-assets/ico/logo.ico">

</head>
<body onload='document.loginForm.username.focus();'>

<!-- Top content -->
<div class="top-content">
    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong></strong> Личный кабинет</h1>
                    <div class="description">
                        <p>
                            Добро пожаловать в Личный кабинет
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>Авторизация</h3>
                            <p>Введите Ваш логин и пароль для входа:</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form action="<c:url value='/login'></c:url>" name="loginForm" method="post" role="form">
                            <div class="form-group">
                                <label class="sr-only">Логин</label>
                                <input type="text" name="username" placeholder="Логин..." class="form-username form-control" id="username">
                            </div>
                            <div class="form-group">
                                <label class="sr-only">Пароль</label>
                                <input type="password" name="password" placeholder="Пароль..." class="form-password form-control" id="password">
                            </div>
                            <button type="submit" class="btn">Войти</button>

                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Javascript -->
<script src="../scripts/login-assets/js/jquery-1.11.1.min.js"></script>
<script src="../scripts/login-assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../scripts/login-assets/js/jquery.backstretch.min.js"></script>
<script src="../scripts/login-assets/js/scripts.js"></script>

<!--[if lt IE 10]>
<script src="../scripts/login-assets/js/placeholder.js"></script>
<![endif]-->

</body>
</html>
