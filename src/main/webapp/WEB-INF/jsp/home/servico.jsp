<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>

    <title>Home</title>

    <c:set value="${pageContext.request.contextPath}" var="contextPath" />
    <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
    <meta charset="utf-8">

</head>

<body>
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="${contextPath}/servico">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                                href="${contextPath}/servico/form?page=servico-novo">Cadastrar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Serviços</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        
                    </ul>
                    <form:form class="d-flex" modelAttribute="procurarModel" action="${contextPath}/servico/procurar" method="post">
                        <form:input class="form-control me-2" type="text" path="nome" id="nome"
                            placeholder="Pesquisar por categoria" aria-label="Search" />
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form:form>
                </div>
            </div>
        </nav>

        <c:if test="${not empty messages}">
        <div class="alert alert-success d-flex align-items-center" role="alert">
          <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
          <div>
            ${messages}
          </div>
        </div>
        </c:if>

        <div class="container px-4">
            <div class="row gx-5">
                <c:forEach items="${servicos}" var="servico">
                    <div class="col">
                        <div class="p-3">
                            <div class="card" style="width: 18rem;">
                                <div class="card-body">
                                    <h5 class="card-title">${servico.titulo}</h5>
                                    <h6 class="card-subtitle mb-2 text-muted">${servico.categoria}</h6>
                                    <p class="card-text">${servico.descricao}</p>
                                    <form:form action="${contextPath}/servico/deletar/${servico.id}" method="delete">
                                        <a href="${contextPath}/servico/detalhe/${servico.id}" class="card-link">Detalhes</a>
                                        <a href="${contextPath}/servico/form?page=servico-editar&id=${servico.id}" class="card-link">Editar</a>
                                        <input type="submit" value="Excluir" class="btn btn-danger btn-xs">
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Bootstrap Core JavaScript -->
        <script src="${contextPath}/js/bootstrap.bundle.js"></script>

</body>

</html>