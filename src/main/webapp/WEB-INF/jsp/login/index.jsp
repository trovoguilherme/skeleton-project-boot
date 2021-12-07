<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<head>
	<meta charset="UTF-8"/>
	<title>Bem vindo a Sloth</title>
	<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">

	<c:set value="${pageContext.request.contextPath}" var="contextPath" />
</head>
<body>
	<div class="container text-center">
		<h1>Bem vindo a Sloth</h1>
		<h3><a href="${contextPath}/users/${pageContext.request.userPrincipal.principal.username}">Lista de usu�rios</a></h3>
		<h3><a href="${contextPath}/register">Registrar</a></h3>
		<h3><a href="${contextPath}/login">Login</a></h3>
		<a href="https://api.whatsapp.com/send/?phone=11999181762&text&app_absent=0">Clica porara</a>
		<a href="${contextPath}/forgotpassword">Esqueceu a senha? Clique aqui</a>

	</div>
	
</body>
</html>