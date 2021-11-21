<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title>Bem vindo a Sloth</title>
	<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">

	<c:set value="${pageContext.request.contextPath}" var="contextPath" />
</head>
<body>
	<div class="container text-center">
		<h1>Bem vindo a Sloth</h1>
		<h3><a href="${contextPath}/entrar/users">Lista de usuários</a></h3>
		<h3><a href="${contextPath}/entrar/register">Registrar</a></h3>
		<h3><a href="${contextPath}/login">Login</a></h3>
	</div>
	
</body>
</html>