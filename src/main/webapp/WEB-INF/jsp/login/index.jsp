<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<head>
	<meta charset="UTF-8"/>
	<title>Bem-vindo a Sloth</title>
	<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">

	<c:set value="${pageContext.request.contextPath}" var="contextPath" />
</head>
<body>
	<div style="position: relative; text-align: center;">
		<h1>Bem vindo a Sloth</h1>
		<hr>
		<div style="border:1px solid #2c3034; border-radius: 5px; position: relative; left: 1105px;width: 315px;">
			<h3>
				<a href="${contextPath}/users/${pageContext.request.userPrincipal.principal.username}">Lista de usuários</a>
			</h3>
		</div>
		<br>
		<div style="border:1px solid #2c3034; border-radius: 5px; position: relative; left: 1105px;width: 315px;">
			<h3>
				<a href="${contextPath}/register"/>
				Cadastre-se
			</h3>
		</div>
		<br>
		<div style="border:1px solid #2c3034; border-radius: 5px; position: relative; left: 1105px;width: 315px;">
			<h3>
				<a href="${contextPath}/login">Logar</a>
			</h3>
		</div>
		<a href="https://api.whatsapp.com/send/?phone=11999181762&text&app_absent=0">Clica porara</a>
	</div>
	
</body>
</html>