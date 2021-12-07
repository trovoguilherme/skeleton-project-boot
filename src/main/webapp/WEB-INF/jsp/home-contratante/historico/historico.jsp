<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

    <title>Produtos - Cadastro</title>

    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>

    <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
    <meta charset="utf-8">

</head>

<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
                            <li><a class="dropdown-item" href="${contextPath}/perfil">Perfil</a></li>
                            <li><a class="dropdown-item" href="${contextPath}/checkout">Pagar</a></li>
                            <li><a class="dropdown-item" href="${contextPath}/historico">Histórico de serviço</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="${contextPath}/logout">Sair</a></li>
                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
    <br>

    <h2>Serviços</h2>

    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${contextPath}/historico">Todos</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/historico/aberto">Abertos</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/historico/fazendo">Fazendo</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/historico/pausado">Pausado</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/historico/finalizado">Finalizado</a>
        </li>
    </ul>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Título</th>
            <th scope="col">Prestador</th>
            <th scope="col">Categoria</th>
            <th scope="col">Status</th>
            <th scope="col">Ações</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${servicos}" var="servico">
            <c:set var="st" value="${servico.status}" scope="page"/>
            <tr>
                <th scope="row">${servico.id}</th>
                <td>${servico.titulo}</td>
                <td>${servico.emailPrestador}</td>
                <td>${servico.categoria}</td>
                <c:if test="${st == 'aberto'}">
                    <td>
                        <div class="btn-group">
                            <button class="btn btn-info btn-sm" type="button">
                                ${servico.status}
                            </button>
                            <button type="button" class="btn btn-sm btn-info dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item"href="${contextPath}/historico/aberto/${servico.id}">Aberto</a></li>
                                <li><a class="dropdown-item"href="${contextPath}/historico/fazendo/${servico.id}">Fazendo</a></li>
                                <li><a class="dropdown-item"href="${contextPath}/historico/pausado/${servico.id}">Pausado</a></li>
                                <li><a class="dropdown-item" href="${contextPath}/historico/finalizado/${servico.id}">Finalizado</a></li>
                            </ul>
                        </div>
                    </td>
                </c:if>
                <c:if test="${st == 'fazendo'}">
                    <td>
                        <div class="btn-group">
                            <button class="btn btn-success btn-sm" type="button">
                                ${servico.status}
                            </button>
                            <button type="button" class="btn btn-sm btn-success dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item"href="${contextPath}/historico/aberto/${servico.id}">Aberto</a></li>
                                <li><a class="dropdown-item"href="${contextPath}/historico/fazendo/${servico.id}">Fazendo</a></li>
                                <li><a class="dropdown-item"href="${contextPath}/historico/pausado/${servico.id}">Pausado</a></li>
                                <li><a class="dropdown-item" href="${contextPath}/historico/finalizado/${servico.id}">Finalizado</a></li>
                            </ul>
                        </div>
                    </td>
                </c:if>
                <c:if test="${st == 'finalizado'}">
                    <td>
                        <div class="btn-group">
                            <button class="btn btn-secondary btn-sm" type="button">
                                ${servico.status}
                            </button>
                        </div>
                    </td>
                </c:if>
                <c:if test="${st == 'pausado'}">
                    <td>
                        <div class="btn-group">
                            <button class="btn btn-warning btn-sm" type="button">
                                ${servico.status}
                            </button>
                            <button type="button" class="btn btn-sm btn-warning dropdown-toggle dropdown-toggle-split"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item"href="${contextPath}/historico/aberto/${servico.id}">Aberto</a></li>
                                <li><a class="dropdown-item"href="${contextPath}/historico/fazendo/${servico.id}">Fazendo</a></li>
                                <li><a class="dropdown-item"href="${contextPath}/historico/pausado/${servico.id}">Pausado</a></li>
                                <li><a class="dropdown-item" href="${contextPath}/historico/finalizado/${servico.id}">Finalizado</a></li>
                            </ul>
                        </div>
                    </td>
                </c:if>
                <td>
                    <a class="btn btn-success btn-xs" href="${contextPath}/servico/detalhe/${servico.id}/cadastrado">Detalhes</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a class="btn btn-primary" href="${contextPath}/servico" role="button">Voltar</a>

</div>

<!-- Bootstrap Core JavaScript -->
<script src="${contextPath}/js/bootstrap.bundle.js"></script>

</body>

</html>