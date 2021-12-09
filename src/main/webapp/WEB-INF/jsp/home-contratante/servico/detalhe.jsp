<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
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
          <li class="nav-item" style=""><a href="${contextPath}/"><img class="img-fluid rounded-circle d-block d-inline-flex" src="${contextPath}/imagens/${usuario.nomeImagem}" style="max-height: 50px; max-width: 50px;"></a></li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="py-3" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="d-inline-flex px-3 text-dark" style=""><a href="${contextPath}/">Home</a></h3>
          <h3 class="d-inline-flex px-3 text-primary"><a href="${contextPath}/">Serviços</a></h3>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12 over the sky" style="">
          <div class="card d-inline-flex w-100">
            <c:set var="status" value="${servico.status}" scope="page"/>
            <c:set var="conta" value="${usuario.tipoDaConta}" scope="page"/>
            <div class="card-body" style="">
              <label>Prestador</label>
              <h4 class="card-title">Nome</h4>
              <div class="form-group"> <b><label>Título</label> </b></div>
              <h4 class="card-title">${servico.titulo}</h4>
              <div class="form-group"><b></b>
                <div class="form-group"> <b><label>Categoria</label>
                    <h4 class="card-title">${servico.categoria}</h4>
                  </b></div>
                <div class="form-group"> <b><label>Linguagem</label>
                    <h4 class="card-title">${servico.linguagem}</h4>
                  </b></div>
              </div>
              <div class="form-group"><b><label>Descrição</label>
                  <h4 class="card-title">${servico.descricao}</h4>
                </b></div>
              <div class="form-group"> <b><label>Valor</label>
                  <h5 style="	text-shadow: 1px 1px 2px black;">${servico.valor}</h5>
                </b></div>
              <div class="form-group"><label>STATUS</label>
                <b><label>Status</label>
                  <h4 class="card-title">${servico.status}</h4>
                </b>
              </div>
            </div>
                <c:if test="${conta == 'contratante'}">
                    <a class="btn px-3 mr-2 btn-danger" href="${contextPath}/historico/aberto">Voltar</a>
                </c:if>

                <c:if test="${conta == 'prestador'}">
                    <a class="btn px-3 mr-2 btn-danger" href="${contextPath}/servico">Voltar</a>
                </c:if>

                <c:if test="${status != 'finalizado'}">
                    <a class="btn px-3 mr-2 btn-primary" href="${contextPath}/historico/servico/editar/${servico.id}">Editar</a>
                </c:if>
                <c:if test="${conta == 'contratante'}">
                    <a class="btn px-3 mr-2 btn-primary" href="${contextPath}/checkout">Concluido</a>
                </c:if>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous" style=""></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>

</html>