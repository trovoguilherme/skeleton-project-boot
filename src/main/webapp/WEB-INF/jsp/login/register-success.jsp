<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<head>
	<meta charset="ISO-8859-1">
	<title>Resgistrado com sucesso</title>
	<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<c:set value="${pageContext.request.contextPath}" var="contextPath" />
</head>
<body>
	<div class="container text-center">
		<h3>Voc� se cadastrou com sucesso!</h3>
		<h4><a href="${contextPath}/login">Clique aqui para ir para p�gina de Login</a></h4>
	</div>
	
</body>
</html>