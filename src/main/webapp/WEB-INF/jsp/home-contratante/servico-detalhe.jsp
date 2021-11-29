<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>

    <title>Perfil</title>

    <meta charset="utf-8">
    <c:set value="${pageContext.request.contextPath}" var="contextPath" />

    <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">


</head>

<body>
    <div class="container">
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
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                                href="${contextPath}/servico/form?page=servico-novo">Cadastrar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${contextPath}/perfil/editar">Editar</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled">Disabled</a>
                        </li>
                    </ul>
                    <form:form class="d-flex" modelAttribute="procurarModel" action="${contextPath}/servico/procurar"
                        method="post">
                        <form:input class="form-control me-2" type="text" path="nome" id="nome" placeholder="Search"
                            aria-label="Search" />
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form:form>
                </div>
            </div>
        </nav>


        <div class="row">
            <div class="col-lg-12">
                <div class="well">

                    <h2>Perfil</h2>

                    <div class="form-group">
                        <label class="control-label" for="descricao">Email:</label>
                        <label class="label label-default">${usuario.email}</label>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="titulo">Nome:</label>
                        <b>${usuario.firstName}</b>
                    </div>

                    <div class="form-group">
                        <label class="control-label" for="nome">Sobrenome:</label>
                        <label class="label label-default">${usuario.lastName}</label>
                    </div>

                    <hr>

                    <a class="btn btn-default btn-lg" href="${contextPath}/servico">Voltar</a>

                    <br>
                    <br>

                </div>
            </div>
        </div>


    <h1>Comentários</h1>

    <div class="btn-group">
      <a href="${contextPath}/servico/comentario/${usuario.id}" class="btn btn-primary active" aria-current="page">Comentar</a>
    </div>

    <ol class="list-group list-group-numbered">
      <c:forEach items="${comentarios}" var="comentario">
          <li class="list-group-item d-flex justify-content-between align-items-start">
            <div class="ms-2 me-auto">
              <div class="fw-bold">${comentario.nome}</div>
              ${comentario.mensagem}
            </div>
            <span class="badge bg-primary rounded-pill">14</span>
          </li>
      </c:forEach>
    </ol>
    </div>

    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/js/bootstrap.bundle.js"></script>

</body>

</html>