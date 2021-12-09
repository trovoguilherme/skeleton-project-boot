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
    <nav class="navbar fixed-top navbar-light" style="background-color: #e3f2fd;">
      <div class="container-md">
        <a class="navbar-brand" href="${contextPath}/servico">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
          <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
          </div>
          <div class="offcanvas-body">
            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/perfil">Perfil</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="offcanvasNavbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Dropdown
                </a>
                <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown">
                  <li><a class="dropdown-item" href="#">Action</a></li>
                  <li><a class="dropdown-item" href="#">Another action</a></li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>
                  <li><a class="dropdown-item" href="${contextPath}/logout">Sair</a></li>
                </ul>
              </li>
            </ul>
            <form class="d-flex">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
          </div>
        </div>
      </div>
    </nav>
    <br>
        <br>
        <br>
        <c:set var="auxServico" value="${aux}" scope="page"/>

        <c:if test="${auxServico == 'tem'}">
            <c:forEach items="${servicos}" var="servico">
                <div class="card border-success">
                  <h5 class="card-header border-success">${servico.status}</h5>
                  <div class="card-body">
                    <h5 class="card-title">${servico.titulo}</h5>
                    <p class="card-text">${servico.descricao}</p>
                    <a href="${contextPath}/servico/detalhe/${servico.id}/cadastrado" class="btn btn-primary">Detalhes</a>
                  </div>
                </div>
                <br>
            </c:forEach>
        </c:if>
        <c:if test="${auxServico == 'naoTem'}">
            <h1>Você ainda não tem serviços ativos</h1>
        </c:if>
    </div>




    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/js/bootstrap.bundle.js"></script>
</body>

</html>