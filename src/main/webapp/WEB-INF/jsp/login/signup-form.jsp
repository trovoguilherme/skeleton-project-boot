<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<head>
	<meta charset="ISO-8859-1">
	<title>Sign Up - CodeJava</title>
	<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
	<c:set value="${pageContext.request.contextPath}" var="contextPath" />
</head>
<body>
	<div class="container text-center">
		<div>
			<h1>Cadastrar - Sign Up</h1>
		</div>

		<form:form modelAttribute="userModel" action="${contextPath}/entrar/process-register" method="post">

                    <spring:hasBindErrors name="userModel">
                        <div class="alert alert-danger" role="alert">
                            <form:errors path="*" class="has-error" />
                        </div>
                    </spring:hasBindErrors>

                    <div class="form-group">
                        <label class="control-label" for="email">Email:</label>
                        <form:input type="text" path="email" id="email" class="form-control" maxlength="50" size="50" />
                        <font color="red">
                            <form:errors path="email" />
                        </font><br />
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="password">Senha:</label>
                        <form:input type="text" path="password" id="password" class="form-control" maxlength="50" size="50" />
                        <font color="red">
                            <form:errors path="password" />
                        </font><br />
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="firstName">Primeiro Nome:</label>
                        <form:textarea class="form-control" path="firstName" rows="4" cols="100" />
                        <font color="red">
                            <form:errors path="firstName" />
                        </font><br />
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="lastName">último Nome:</label>
                        <form:textarea class="form-control" path="lastName" rows="4" cols="100" />
                        <font color="red">
                            <form:errors path="lastName" />
                        </font><br />
                    </div>

                    <hr>

                    <a class="btn btn-default btn-lg" href="${contextPath}/servico">Cancelar</a>
                    <button type="submit" class="btn btn-primary btn-lg">Gravar</button>

                    <br>
                    <br>
                </form:form>


	</div>
</body>
</html>