<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>

    <title>Perfil</title>

    <meta charset="utf-8">
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>

    <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/css-cadastrar-conta/theme.css" type="text/css">

</head>

<body>

<nav class="navbar navbar-expand-md navbar-light">
    <div class="container"> <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse" data-target="#navbar6" style="">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar6"> <a class="navbar-brand text-primary d-none d-md-block" href="#">
          <img class="img-fluid d-block d-inline-flex w-25" src="${contextPath}/imagens/nav_logo.png">
          <b> Sirvice<br></b>
        </a>
        <ul class="navbar-nav mx-auto">
          <li class="nav-item"> <a class="nav-link" href="#">&nbsp;</a> </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item" style=""><a class="nav-link text-primary" href="${contextPath}/logout">logout</a></li>
          <li class="nav-item" style=""><a href="${contextPath}/perfil"><img class="img-fluid rounded-circle d-block d-inline-flex" style="max-height: 50px; max-width: 50px;" src="${contextPath}/imagens/${usuario.nomeImagem}"></a></li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="py-5" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="d-inline-flex active px-3" style=""><a href="${contextPath}/servico">Home</a></h3>
          <h3 class="d-inline-flex px-3" style=""><a href="${contextPath}/historico/aberto">Serviços</a></h3>
        </div>
      </div>
    </div>
  </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="well">

                <h2>Serviço</h2>
                <c:set var="status" value="${servico.status}" scope="page"/>
                <div class="form-group">
                    <label class="control-label" for="descricao">Título:</label>
                    <label class="label label-default">${servico.titulo}</label>
                </div>

                <div class="form-group">
                    <label class="control-label" for="titulo">Descrição:</label>
                    <b>${servico.descricao}</b>
                </div>

                <div class="form-group">
                    <label class="control-label" for="nome">Categoria:</label>
                    <label class="label label-default">${servico.categoria}</label>
                </div>

                <div class="form-group">
                    <label class="control-label" for="cpf">Linguagem:</label>
                    <label class="label label-default">${servico.linguagem}</label>
                </div>

                <div class="form-group">
                    <label class="control-label" for="tipoDaConta">Status:</label>
                    <label class="label label-default">${servico.status}</label>
                </div>

                <div class="form-group">
                    <label class="control-label" for="telefone">Criador:</label>
                    <label class="label label-default">${servico.emailContratante}</label>
                </div>
                <div class="form-group">
                    <label class="control-label" for="valor">Valor:</label>
                    <label class="label label-default">${servico.valor}</label>
                </div>
                <hr>

                <a class="btn btn-default btn-lg" href="${contextPath}/historico/aberto">Voltar</a>
                <c:if test="${status != 'finalizado'}">
                    <a class="btn btn-default btn-lg" href="${contextPath}/historico/servico/editar/${servico.id}">Editar</a>
                </c:if>
                <br>
                <br>

            </div>
        </div>
    </div>

</div>

<!-- Bootstrap Core JavaScript -->
<script src="${contextPath}/js/bootstrap.bundle.js"></script>

</body>

</html>