<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

    <title>Perfil</title>

    <meta charset="utf-8">
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>

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
                                aria-label="Search"/>
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form:form>
            </div>
        </div>
    </nav>

    <h1>Nota: ${rank}</h1>

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

                <div class="form-group">
                    <label class="control-label" for="cpf">CPF:</label>
                    <label class="label label-default">${usuario.cpf}</label>
                </div>

                <div class="form-group">
                    <label class="control-label" for="tipoDaConta">Tipo da conta:</label>
                    <label class="label label-default">${usuario.tipoDaConta}</label>
                </div>

                <div class="form-group">
                    <label class="control-label" for="telefone">Telefone:</label>
                    <label class="label label-default">${usuario.telefone}</label>
                </div>

                <div class="form-group">
                    <label class="control-label" for="estado">Estado:</label>
                    <label class="label label-default">${usuario.estado}</label>
                </div>

                <div class="form-group">
                    <label class="control-label" for="biografia">Biografia:</label>
                    <label class="label label-default">${usuario.biografia}</label>
                </div>

                <hr>

                <a class="btn btn-default btn-lg" href="${contextPath}/servico">Voltar</a>

                <br>
                <br>

            </div>
        </div>
    </div>

    <div class="btn-group">
        <a href="${contextPath}/rank/${usuario.id}" class="btn btn-primary active" aria-current="page">Rank</a>
    </div>

    <h1>Entrar em contato</h1>

    <div class="btn-group">
        <a href="https://api.whatsapp.com/send/?phone=${whatsapp}&text&app_absent=0" target="_blank" class="btn btn-primary active" aria-current="page">Entrar em contato</a>
    </div>

    <h1>Comentários</h1>

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Comentar</button>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Novo comentário</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form:form modelAttribute="comentarioModel" action="${contextPath}/servico/comentario/${usuario.id}" method="post">
              <div class="mb-3">
                <label for="message-text" class="col-form-label">Message:</label>
                <form:textarea class="form-control" path="mensagem" id="message-text"/>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="submit" class="btn btn-primary">Comentar</button>
              </div>
            </form:form>
          </div>

        </div>
      </div>
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

    <h1>Lista de serviços</h1>
    <div class="btn-group">
            <a href="${contextPath}/servico/cadastrar/${usuario.id}" class="btn btn-primary active" aria-current="page">Contratar</a>
    </div>

    <div class="list-group">
      <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
        <div class="d-flex w-100 justify-content-between">
          <h5 class="mb-1">Lista de serviços</h5>
          <small>Status</small>
        </div>
        <p class="mb-1">Descrição do serviço.</p>
        <small>Categoria</small>
      </a>
      <c:forEach items="${servicos}" var="servico">
          <a href="${contextPath}/servico/detalhe/${servico.id}/cadastrado" class="list-group-item list-group-item-action">
            <div class="d-flex w-100 justify-content-between">
              <h5 class="mb-1">${servico.titulo}</h5>
              <small class="text-muted">${servico.status}</small>
            </div>
            <p class="mb-1">${servico.descricao}</p>
            <small class="text-muted">${servico.categoria}</small>
          </a>
          <br>
      </c:forEach>
    </div>

</div>

    <!-- jQuery -->
    <script src="${contextPath}/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${contextPath}/js/bootstrap.bundle.js"></script>

</body>

</html>