<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Cadastrado com sucesso</title>
        <c:set value="${pageContext.request.contextPath}" var="contextPath" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="jumbotron text-center">
                <h1 class="display-3">Obrigado por se cadastrar!</h1>
                <p class="lead">Clique aqui para ir para página de Login</p>
                <hr>
                <p class="lead">
                    <a class="btn btn-primary btn-sm" href="${contextPath}/login" role="button">Logar</a>
                </p>
            </div>
        </div>
    </body>
</html>