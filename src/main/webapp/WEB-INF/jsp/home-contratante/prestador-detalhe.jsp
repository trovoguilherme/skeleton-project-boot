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
    <link href="${contextPath}/prestador-detalhe/css.css" rel="stylesheet">


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

    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-9">

                <!-- User profile -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">User profile</h4>
                    </div>
                    <div class="panel-body">
                        <div class="profile__avatar">
                            <img src="${contextPath}/imagens/${usuario.nomeImagem}" alt="...">
                        </div>
                        <div class="profile__header">
                            <h4>${usuario.firstName}<small>${usuario.lastName}</small></h4>
                            <p class="text-muted">
                                ${usuario.biografia}
                            </p>
                        </div>
                    </div>
                </div>

                <!-- User info -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Informações</h4>
                    </div>
                    <div class="panel-body">
                        <table class="table profile__table">
                            <tbody>
                            <tr>
                                <th><strong>Estado</strong></th>
                                <td>${usuario.estado}</td>
                            </tr>
                            <tr>
                                <th><strong>Tipo da conta</strong></th>
                                <td>${usuario.tipoDaConta}</td>
                            </tr>
                            <tr>
                                <th><strong>Position</strong></th>
                                <td>Front-end developer</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Comentários -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Comentários</h4>
                    </div>
                    <div class="panel-body">
                        <div class="profile__comments">
                            <c:forEach items="${comentarios}" var="comentario">
                                <div class="profile-comments__item">
                                    <div class="profile-comments__controls">
                                        <a href="#"><i class="fa fa-share-square-o"></i></a>
                                        <a href="#"><i class="fa fa-edit"></i></a>
                                        <a href="#"><i class="fa fa-trash-o"></i></a>
                                    </div>
                                    <div class="profile-comments__avatar">
                                        <img src="${contextPath}/imagens/${imagemDoComentario}" alt="...">
                                    </div>
                                    <div class="profile-comments__body">
                                        <h5 class="profile-comments__sender">
                                            ${comentario.nome} <small>2 horas atrás</small>
                                        </h5>
                                        <div class="profile-comments__content">
                                            ${comentario.mensagem}
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-xs-12 col-sm-3">

                <!-- Contact user -->
                <p>
                    <a href="https://api.whatsapp.com/send/?phone=${whatsapp}&text&app_absent=0" class="profile__contact-btn btn btn-lg btn-block btn-info" data-toggle="modal" data-target="#profile__contact-form">
                        Contatar
                    </a>
                </p>

                <hr class="profile__contact-hr">

                <!-- Contact info -->
                <div class="profile__contact-info">
                    <div class="profile__contact-info-item">
                        <div class="profile__contact-info-icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="profile__contact-info-body">
                            <h5 class="profile__contact-info-heading">Telefone</h5>
                            ${usuario.telefone}
                        </div>
                    </div>
                    <div class="profile__contact-info-item">
                        <div class="profile__contact-info-icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="profile__contact-info-body">
                            <h5 class="profile__contact-info-heading">Mobile number</h5>
                            (000)987-65-43
                        </div>
                    </div>
                    <div class="profile__contact-info-item">
                        <div class="profile__contact-info-icon">
                            <i class="fa fa-envelope-square"></i>
                        </div>
                        <div class="profile__contact-info-body">
                            <h5 class="profile__contact-info-heading">Email</h5>
                            <a href="mailto:admin@domain.com">${usuario.email}</a>
                        </div>
                    </div>
                    <div class="profile__contact-info-item">
                        <div class="profile__contact-info-icon">
                            <i class="fa fa-map-marker"></i>
                        </div>
                        <div class="profile__contact-info-body">
                            <h5 class="profile__contact-info-heading">Work address</h5>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="btn-group">
        <a href="${contextPath}/rank/${usuario.id}" class="btn btn-primary active" aria-current="page">Rank</a>
    </div>

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
            data-bs-whatever="@mdo">Comentar
    </button>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Novo comentário</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form:form modelAttribute="comentarioModel" action="${contextPath}/servico/comentario/${usuario.id}"
                               method="post">
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
            <a href="${contextPath}/servico/detalhe/${servico.id}/cadastrado"
               class="list-group-item list-group-item-action">
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