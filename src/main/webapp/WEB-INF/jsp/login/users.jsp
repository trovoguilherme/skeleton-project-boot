<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page session="true"%>

<!DOCTYPE html>
<head>
	<meta charset="ISO-8859-1">
	<title>Lista de usuários</title>

	<c:set value="${pageContext.request.contextPath}" var="contextPath" />
    <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div class="container text-center">
	<div>

	    Bem vindo <b>${pageContext.request.userPrincipal.principal.fullName}</b>

		<a href="${contextPath}/logout">Sair</a>

	</div>
	<div>
		<h1>List of Users</h1>
	</div>
	
	<div>
		<table class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>User ID</th>
					<th>E-mail</th>
					<th>Nome</th>
					<th>Sobrenome</th>
				</tr>
			</thead>
			<tbody>
			    <c:forEach items="${listUsers}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                    </tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>