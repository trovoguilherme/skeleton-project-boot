<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="${contextPath}/css-cadastrar-conta/theme.css" type="text/css">
</head>

<body>

  <nav class="navbar navbar-expand-md navbar-light">
    <div class="container"> <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse" data-target="#navbar6" style="">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar6"> <a class="navbar-brand text-primary d-none d-md-block" href="${contextPath}/servico">
          <img class="img-fluid d-block d-inline-flex w-25" src="${contextPath}/imagens/nav_logo.png">
          <b> Sirvice<br></b>
        </a>
        <ul class="navbar-nav mx-auto">
          <li class="nav-item"> <a class="nav-link" href="${contextPath}/servico">&nbsp;</a> </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item" style=""> <a class="nav-link text-primary" href="${contextPath}/logout">logout</a> </li>
          <li class="nav-item" style=""> <img class="img-fluid d-block d-inline-flex w-75" src="${contextPath}/perfil"> </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="py-3" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="d-inline-flex px-3" style=""><a href="${contextPath}/servico">Home</a></h3>
          <h3 class="d-inline-flex px-3" style=""><a href="${contextPath}/historico">Serviços</a></h3>
        </div>
      </div>
    </div>
  </div>
  <div class="" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
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
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <c:forEach items="${servicos}" var="servico">
          <div class="col-md-6 over the sky" style="">
            <div class="card d-inline-flex w-100">
              <div class="card-body" style="">
                <h4 class="card-title">${servico.titulo}</h4>
                <b>
                  <p class="card-text">${servico.emailPrestador}</p>
                </b>
                <p class="card-text">${servico.descricao}</p>
                <h5 style="	text-shadow: 1px 1px 2px black;">${servico.valor}0</h5>
                <h5 style="	text-shadow: 1px 1px 2px black;" class="text-primary">${servico.categoria}</h5>
                <a class="btn btn-warning" href="${contextPath}/historico/servico/detalhe/${servico.id}">Detalhes</a>
              </div>
            </div>
          </div>
      </c:forEach>

      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>

</html></html>