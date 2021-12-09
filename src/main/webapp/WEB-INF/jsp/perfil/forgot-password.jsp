<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
    <link rel="stylesheet" href="${contextPath}/css-cadastrar-conta/theme.css" type="text/css">
</head>

<body style="">
<nav class="navbar navbar-expand-md navbar-light">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse"
                data-target="#navbar6">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar6"><a class="navbar-brand text-primary d-none d-md-block" href="${contextPath}/">
            <img class="img-fluid d-block d-inline-flex w-25" src="${contextPath}/imagens/nav_log.png">
            <b> Sirvice<br></b>
        </a>
            <ul class="navbar-nav mx-auto">
                <li class="nav-item"><a class="nav-link" href="#">&nbsp;</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="${contextPath}/login">Log in</a></li>
                <li class="nav-item"><a class="nav-link text-primary" href="${contextPath}/registrar">Registrar<br></a>
                </li>
                <li class="nav-item" style=""><a class="nav-link text-primary" href="${contextPath}/esqueci/senha">Esqueci
                    minha senha</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>Esqueci minha senha</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form:form modelAttribute="userModel" action="${contextPath}/esqueci/senha" method="post" class="py-4"
                           style="">
                    <div class="form-floating mb-3 py-0" style="">
                        <label for="floatingInput" class="text-body">Email</label>
                        <form:input type="email" path="email" class="form-control text-body" id="floatingInput" placeholder="nome@exemplo.com.br" style="" required="required"/>
                    </div>
                    <div class="form-floating mb-3">
                        <div class="form-group"><label>Senha<br></label>
                            <form:input type="password" path="password" class="form-control text-body" id="floatingInput" placeholder="Digite sua nova senha" style="" required="required"/>
                        </div>
                    </div>
                    <a class="btn btn-default btn-lg btn-danger" href="${contextPath}/">Voltar</a>
                    <button type="submit" class="btn btn-primary btn-lg">Confirmar</button>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>