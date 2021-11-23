<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>

    <title>Home</title>

    <c:set value="${pageContext.request.contextPath}" var="contextPath" />
    <link href="../home/css/estilo.css" rel="stylesheet" type="text/css"> 
    <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
    <meta charset="utf-8">

</head>

<body>
    <div class="container">
        <!-- Barra de navegação -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="${contextPath}/servico">Serviços</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <!-- Cadastrar -->
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                                href="${contextPath}/servico/form?page=servico-novo">Cadastrar serviço</a>
                        </li>
                        <!-- Ver serviços -->
                        <li class="nav-item">
                            <a class="nav-link" href="#">Serviços</a>
                        </li>
                        <!-- Dropdown -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${contextPath}/servico/perfil">Perfil</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <!-- ? -->
                        <li class="nav-item">
                            <a class="nav-link disabled"></a>
                        </li>
                    </ul>

                    <!-- Barra de pesquisa -->
                    <form:form class="d-flex" modelAttribute="procurarModel" action="${contextPath}/servico/procurar" method="post">
                        <form:input class="form-control me-2" type="text" path="nome" id="nome" placeholder="Pesquisar por categoria" aria-label="Search" />
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form:form>

                </div>
            </div>
        </nav>
        
        <!--Serviços cadastrados-->>
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
                                    <a href="${contextPath}/servico/detalhe/${servico.id}"
                                        class="card-link">Detalhes</a>
                                    <a href="#" class="card-link">Another link</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/js/bootstrap.bundle.js"></script>

</body>

</html>